#ifndef DATAMODEL_ExampleReferencingTypeOBJ_H
#define DATAMODEL_ExampleReferencingTypeOBJ_H

// std includes
#include <atomic>
#include <iostream>

// data model specific includes
#include "podio/ObjBase.h"
#include "ALPDataIO/datamodel/ExampleReferencingTypeData.h"
#include "ALPDataIO/datamodel/ExampleCluster.h"
#include <vector>

// forward declarations




class ExampleReferencingType;
class ConstExampleReferencingType;


class ExampleReferencingTypeObj : public podio::ObjBase {
public:
  /// constructor
  ExampleReferencingTypeObj();
  /// copy constructor (does a deep-copy of relation containers)
  ExampleReferencingTypeObj(const ExampleReferencingTypeObj&);
  /// constructor from ObjectID and ExampleReferencingTypeData
  /// does not initialize the internal relation containers
  ExampleReferencingTypeObj(const podio::ObjectID id, ExampleReferencingTypeData data);
  virtual ~ExampleReferencingTypeObj();

public:
  ExampleReferencingTypeData data;
  std::vector<ConstExampleCluster>* m_Clusters;
  std::vector<ConstExampleReferencingType>* m_Refs;


};



#endif
