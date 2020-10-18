#ifndef DATAMODEL_ExampleHitOBJ_H
#define DATAMODEL_ExampleHitOBJ_H

// std includes
#include <atomic>
#include <iostream>

// data model specific includes
#include "podio/ObjBase.h"
#include "ALPDataIO/datamodel/ExampleHitData.h"



// forward declarations




class ExampleHit;
class ConstExampleHit;


class ExampleHitObj : public podio::ObjBase {
public:
  /// constructor
  ExampleHitObj();
  /// copy constructor (does a deep-copy of relation containers)
  ExampleHitObj(const ExampleHitObj&);
  /// constructor from ObjectID and ExampleHitData
  /// does not initialize the internal relation containers
  ExampleHitObj(const podio::ObjectID id, ExampleHitData data);
  virtual ~ExampleHitObj();

public:
  ExampleHitData data;


};



#endif
