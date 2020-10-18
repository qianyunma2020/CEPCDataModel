/**
 *  @file   PandoraPFANew/FineGranularityContent/include/Monitoring/CaloHitMonitoringAlgorithm.h
 * 
 *  @brief  Header file for the calo hit monitoring algorithm class.
 * 
 *  $Log: $
 */
#ifndef CALO_HIT_MONITORING_ALGORITHM_H
#define CALO_HIT_MONITORING_ALGORITHM_H 1

#include <time.h>
#include "CommonAlgTool.h"
#include "SniperKernel/ALPAlgBase.h"

/**
 *  @brief  CaloHitMonitoringAlgorithm class
 */
class Alg2 : public ALPAlgBase 
{
public:
    Alg2(const std::string& name) : ALPAlgBase(name) {}
    ~Alg2() { }
    bool execute(void* eventPtr) {
        srand(time(NULL));
        const unsigned long max=2100000;
        const unsigned long min=1900000;
        unsigned long count= (rand()%(max-min+1))+min;

        computing(10000); 
        return true;
    } 

    bool initialize() { return true; }
    bool finalize()   { return true; }




private:

    std::string     m_monitoringFileName;       ///< The name of the file in which to save the monitoring histograms
};

//------------------------------------------------------------------------------------------------------------------------------------------


#endif // #ifndef CALO_HIT_MONITORING_ALGORITHM_H
