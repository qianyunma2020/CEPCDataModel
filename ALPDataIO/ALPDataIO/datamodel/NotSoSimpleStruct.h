#ifndef DATAMODEL_NotSoSimpleStruct_H
#define DATAMODEL_NotSoSimpleStruct_H
#include "ALPDataIO/datamodel/SimpleStruct.h"

#include <iostream>


class NotSoSimpleStruct {
public:
  SimpleStruct data;


};

inline std::ostream& operator<<( std::ostream& o,const NotSoSimpleStruct& value ){ 
  o << value.data << " " ;
  return o ;
}




#endif
