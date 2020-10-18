#ifndef DATAMODEL_SimpleStruct_H
#define DATAMODEL_SimpleStruct_H

#include <array>

#include <iostream>


class SimpleStruct {
public:
  int x;
  int y;
  int z;
 ::std::array<int, 4> p;

 SimpleStruct() : x(0),y(0),z(0) {} SimpleStruct( const int* v) : x(v[0]),y(v[1]),z(v[2]) {} 
};

inline std::ostream& operator<<( std::ostream& o,const SimpleStruct& value ){ 
  o << value.x << " " ;
  o << value.y << " " ;
  o << value.z << " " ;
  for(int i=0,N= 4;i<N;++i)
      o << value.p[i] << "|" ;
  o << "  " ;
  return o ;
}




#endif
