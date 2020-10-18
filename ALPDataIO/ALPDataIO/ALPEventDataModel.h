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
	//�����µ�Collection
	template<typename T>
	T& create(const std::string& name);
	//ע���Ѿ����ڵ�Collection
	void registerCollection(const std::string& name, podio::CollectionBase* coll);
	//ͨ��name����Collection������ɹ��򷵻�true
	template<typename T>
	bool get(const std::string& name, const T*& collection);
	//���ٷ��ʻ����е�Collection
	podio::CollectionBase* getFast(int id) const {
		return (m_cachedCollections.size() > id ? m_cachedCollections[id] : nullptr);
	}
	//ͨ��ID����Collection,����ɹ��򷵻�true.
	bool get(int id, podio::CollectionBase*& coll) const;
	//ͨ��name����Collection
	template<typename T>
	const T& get(const std::string& name);
        //Base virtual class version get
        template<typename T>
        const void getBaseClassVersion(const std::string& name);

	//���Collections
	void clearCollections();
	//����reader
	void setReader(podio::IReader* reader);
	//��ȡCollectionIDTable
	podio::CollectionIDTable* getCollectionIDTable() const { return m_table; }
	//
	virtual bool isValid() const final;

private:
	//ͨ�����ƻ�ȡCollection,����ɹ��򷵻�true
	bool doGet(const std::string& name, podio::CollectionBase*& collection, bool setReferences = true) const;
	//����ض�name��collection�Ƿ����
	bool collectionRegistered(const std::string& name) const;
	void setCollectionIDTable(podio::CollectionIDTable* table) {
		if (m_table != nullptr) delete m_table;
		m_table = table;
	}

public:
	//Collection entry.ÿ��Collection��һ��name��ʶ
	typedef std::pair<std::string, podio::CollectionBase*> CollPair;
	typedef std::vector<CollPair> CollContainer;
private:
	mutable std::set<int> m_retrievedIDs;        //�Ѿ���ȡ��ID����
	mutable CollContainer m_collections;         //��֪��collection�б�
	mutable std::vector<const podio::CollectionBase*> m_failedRetrieves;  //��ȡʧ�ܵ�CollectionBaseָ�뼯��
	mutable std::vector<podio::CollectionBase*> m_cachedCollections;      //�����е�CollectionBaseָ�뼯��
	podio::IReader* m_reader;                           //�ļ�������
	podio::CollectionIDTable* m_table;                  //collection������IDӳ���
};


//�����µ�Collection
template<typename T>
T& ALPEventDataModel::create(const std::string& name) {
	static_assert(std::is_base_of<podio::CollectionBase, T>::value, "DataStore only accepts types inheriting from CollectionBase");
	T* coll = new T();
	registerCollection(name, coll);
	return *coll;
}

//ͨ��name����Collection������ɹ��򷵻�true
template<typename T>
bool ALPEventDataModel::get(const std::string& name, const T*& collection) {
	podio::CollectionBase* tmp(0);
	doGet(name, tmp);
	collection = static_cast<T*>(tmp);
	if (collection != nullptr) { return true; }
	return false;
}

//ͨ��name����Collection
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
