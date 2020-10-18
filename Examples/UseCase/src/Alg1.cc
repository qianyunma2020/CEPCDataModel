#include "SniperKernel/AlgFactory.h"
#include "UseCase/Alg1.h"

DECLARE_ALGORITHM(Alg1);

Alg1::Alg1(const std::string& name) : ALPAlgBase(name) 
{
}

Alg1::~Alg1() 
{ 
}

bool Alg1::execute(void* eventPtr) {
    srand(time(NULL));
    const unsigned long max=2100000;
    const unsigned long min=1900000;
    unsigned long count= (rand()%(max-min+1))+min;
 
    //LogDebug<<"Class Alg1 function execute(void) says hello."<<std::endl;
    computing(10000); 
    //LogDebug<<"Class Alg1 function execute(void) says byebye."<<std::endl;
    return true;
}
