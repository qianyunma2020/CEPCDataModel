#ifndef SNIPER_ALP_EVENT_DATAMODEL_H
#define SNIPER_ALP_EVENT_DATAMODEL_H

#include <vector>
#include <set>
#include "podio/CollectionIDTable.h"
#include "podio/ICollectionProvider.h"
#include "podio/CollectionBase.h"
#include "podio/IReader.h"


class ALPEventDataModel : public podio::ICollectionProvider {
public:
	ALPEventDataModel();
	~ALPEventDataModel();

public:
	//创建新的Collection
	template<typename T>
	T& create(const std::string& name);
	//注册已经存在的Collection
	void registerCollection(const std::string& name, podio::CollectionBase* coll);
	//通过name访问Collection，如果成功则返回true
	template<typename T>
	bool get(const std::string& name, const T*& collection);
	//快速访问缓存中的Collection
	podio::CollectionBase* getFast(int id) const {
		return (m_cachedCollections.size() > id ? m_cachedCollections[id] : nullptr);
	}
	//通过ID访问Collection,如果成功则返回true.
	bool get(int id, podio::CollectionBase*& coll) const;
	//通过name访问Collection
	template<typename T>
	const T& get(const std::string& name);
        //Base virtual class version get
        template<typename T>
        const void getBaseClassVersion(const std::string& name);

	//清空Collections
	void clearCollections();
	//设置reader
	void setReader(podio::IReader* reader);
	//获取CollectionIDTable
	podio::CollectionIDTable* getCollectionIDTable() const { return m_table; }
	//
	virtual bool isValid() const final;

private:
	//通过名称获取Collection,如果成功则返回true
	bool doGet(const std::string& name, podio::CollectionBase*& collection, bool setReferences = true) const;
	//检查特定name的collection是否存在
	bool collectionRegistered(const std::string& name) const;
	void setCollectionIDTable(podio::CollectionIDTable* table) {
		if (m_table != nullptr) delete m_table;
		m_table = table;
	}

public:
	//Collection entry.每个Collection被一个name标识
	typedef std::pair<std::string, podio::CollectionBase*> CollPair;
	typedef std::vector<CollPair> CollContainer;
private:
	mutable std::set<int> m_retrievedIDs;        //已经获取的ID集合
	mutable CollContainer m_collections;         //已知的collection列表
	mutable std::vector<const podio::CollectionBase*> m_failedRetrieves;  //获取失败的CollectionBase指针集合
	mutable std::vector<podio::CollectionBase*> m_cachedCollections;      //缓存中的CollectionBase指针集合
	podio::IReader* m_reader;                           //文件输入器
	podio::CollectionIDTable* m_table;                  //collection名称与ID映射表
};


//创建新的Collection
template<typename T>
T& ALPEventDataModel::create(const std::string& name) {
	static_assert(std::is_base_of<podio::CollectionBase, T>::value, "DataStore only accepts types inheriting from CollectionBase");
	T* coll = new T();
	registerCollection(name, coll);
	return *coll;
}

//通过name访问Collection，如果成功则返回true
template<typename T>
bool ALPEventDataModel::get(const std::string& name, const T*& collection) {
	podio::CollectionBase* tmp(0);
	doGet(name, tmp);
	collection = static_cast<T*>(tmp);
	if (collection != nullptr) { return true; }
	return false;
}

//通过name访问Collection
template<typename T>
const T& ALPEventDataModel::get(const std::string& name) {
	const T* tmp(0);
	auto success = this->get(name, tmp);
	if (true == success) {
		return *tmp;
	}
	else {
		tmp = new T();
		m_failedRetrieves.push_back(tmp);
		return *tmp;
	}
}


//Base virtual class version get
template<typename T>
const void ALPEventDataModel::getBaseClassVersion(const std::string& name) {
    const T* tmp(0);
    auto success = this->get(name, tmp);
}




#endif
