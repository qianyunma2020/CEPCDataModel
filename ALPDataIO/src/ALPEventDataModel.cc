#include "ALPDataIO/ALPEventDataModel.h"
#include "SniperKernel/SniperLog.h"


ALPEventDataModel::ALPEventDataModel() {
	//调整缓存到足够的大小
	m_cachedCollections.resize(128);
	m_reader = nullptr;
	m_table = new podio::CollectionIDTable();
        m_collections.clear();
}

ALPEventDataModel::~ALPEventDataModel() {
	for (auto& coll : m_collections) {
		delete coll.second;
	}
	for (auto& coll : m_failedRetrieves) {
		delete coll;
	}
}

//通过ID访问Collection,如果成功则返回true.
bool ALPEventDataModel::get(int id, podio::CollectionBase*& collection) const {
	if (nullptr != (collection = getFast(id)))
		return true;

	auto val = m_retrievedIDs.insert(id);
	bool success = false;
	if (true == val.second) {
		//collection尚未检索到
		auto name = m_table->name(id);
		success = doGet(name, collection, true);
		if (nullptr != collection) {
			if (m_cachedCollections.size() < id + 1)
				m_cachedCollections.resize(id + 1);
			m_cachedCollections[id] = collection;
		}
	}else {
	    //collection已经requested
		auto name = m_table->name(id);
		success = doGet(name, collection, false);
	}
	return success;
}
 
//注册已经存在的Collection
void ALPEventDataModel::registerCollection(const std::string& name, podio::CollectionBase* coll) {
        //LogDebug<<"Class ALPEventDataModel function registerCollection says hello.name="<<name<<std::endl;
	m_collections.push_back({ name,coll });
        //LogDebug<<"Class ALPEventDataModel function registerCollection step1."<<std::endl;
	auto id = m_table->add(name);
        //LogDebug<<"Class ALPEventDataModel function registerCollection step2."<<std::endl; 
	coll->setID(id);
        //LogDebug<<"Class ALPEventDataModel function registerCollection says byebye."<<std::endl;
}

//
bool ALPEventDataModel::isValid() const {
	return m_reader->isValid();
}

//通过名称获取Collection,如果成功则返回true
bool ALPEventDataModel::doGet(const std::string& name, podio::CollectionBase*& collection, bool setReferences) const {
	auto result = std::find_if(begin(m_collections), end(m_collections), 
	                            [name](const CollPair& item)->bool {return name == item.first; }
								);
	if (result != end(m_collections)) {
		auto tmp = result->second;
		if (nullptr != tmp) {
			collection = tmp;
			return true;
		}
	}else if (nullptr != m_reader) {
		auto tmp = m_reader->readCollection(name);
		if (true == setReferences) {
			if (nullptr != tmp) {
				tmp->setReferences(this);
				//检查collection是否已经存在
				if (false == collectionRegistered(name)) {
					m_collections.emplace_back(std::make_pair(name, tmp));
				}
			}
		}
		collection = tmp;
		if (nullptr != tmp) return true;
	}
	else {
		return false;
	}
	return false;
}

//检查特定name的collection是否存在
bool ALPEventDataModel::collectionRegistered(const std::string& name) const {
	auto result = std::find_if(begin(m_collections), end(m_collections), 
	                           [name](const CollPair& item)->bool {return name == item.first; });
	return (result != end(m_collections));
}

//设置reader
void ALPEventDataModel::setReader(podio::IReader* reader) {
	m_reader = reader;
	setCollectionIDTable(reader->getCollectionIDTable());
} 


void ALPEventDataModel::clearCollections() {
    for (auto& coll : m_collections){
      coll.second->clear();
    }
}
