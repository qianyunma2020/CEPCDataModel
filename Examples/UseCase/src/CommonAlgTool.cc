#include "UseCase/CommonAlgTool.h"

void computing(unsigned long max){
   for(unsigned long count=0; count<max; count++){
       double temp=99999.99*99999.99;
   }
}

void seedcomputing(unsigned long max){
   std::srand(time(0));
   const unsigned long bound=std::rand()%max;
   for(unsigned long count=0; count<bound; count++){
       double temp=99999.99*99999.99;
   }
}

void seedcomputingAboveHalf(unsigned long max){
   std::srand(time(0));
   const unsigned long lbound=max/2;
   unsigned long rbound=max-lbound;
   rbound=std::rand()%rbound+lbound;
   for(unsigned long count=0; count<rbound; count++){
       double temp=99999.99*99999.99;
   }
}

void seedcomputingAboveOneThirds(unsigned long max){
   std::srand(time(0));
   const unsigned long lbound=max/3;
   unsigned long rbound=max-lbound;
   rbound=std::rand()%rbound+lbound;
   for(unsigned long count=0; count<rbound; count++){
       double temp=99999.99*99999.99;
   }
}

