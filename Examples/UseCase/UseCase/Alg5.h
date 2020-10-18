/**
 *  @file   PandoraPFANew/FineGranularityContent/include/Reclustering/SplitMergedClustersAlg.h
 * 
 *  @brief  Header file for the split merged clusters algorithm class.
 * 
 *  $Log: $
 */
#ifndef SPLIT_MERGED_CLUSTERS_ALGORITHM_H
#define SPLIT_MERGED_CLUSTERS_ALGORITHM_H 1

#include <time.h>
#include "CommonAlgTool.h"
#include "SniperKernel/ALPAlgBase.h"

class Alg5 : public ALPAlgBase
{
public:
   
    Alg5(const std::string& name) : ALPAlgBase(name) {}
    ~Alg5() { }
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

    std::string             m_associationAlgorithmName;             ///< The name of the topological association algorithm to run
    std::string             m_trackClusterAssociationAlgName;       ///< The name of the track-cluster association algorithm to run

    unsigned int            m_minTrackAssociations;                 ///< The min number of associated tracks required to start reclustering
    unsigned int            m_maxTrackAssociations;                 ///< The max number of associated tracks required to start reclustering
    float                   m_chiToAttemptReclustering;             ///< The min track/cluster chi value required to start reclustering
    float                   m_chiToForceReclustering;               ///< The max track/cluster chi value before reclustering is forced
    float                   m_minChi2Improvement;                   ///< The min improvement in chi2 required to use reclustering results

    float                   m_minClusterEnergyForTrackAssociation;  ///< Energy threshold for recluster candidates with track associations
    float                   m_chi2ForAutomaticClusterSelection;     ///< Chi2 below which recluster candidates are automatically selected

    bool                    m_usingOrderedAlgorithms;               ///< Whether the clustering algorithms are used in a specified order
    float                   m_bestChi2ForReclusterHalt;             ///< If using ordered algorithms, halt if best chi2 below this value
    float                   m_currentChi2ForReclusterHalt;          ///< If using ordered algorithms, halt if current chi2 above this value

    bool                    m_shouldUseForcedClustering;            ///< Whether to use a forced clustering algorithm if all else fails
    std::string             m_forcedClusteringAlgorithmName;        ///< The name of the forced clustering algorithm to run

    float                   m_minChiForForcedClustering;            ///< The min chi value required to use forced clustering
    float                   m_minForcedChi2Improvement;             ///< The min improvement in chi2 required to use forced clustering
    float                   m_maxForcedChi2;                        ///< The max allowed chi2 value to use forced clustering
};


#endif // #ifndef SPLIT_MERGED_CLUSTERS_ALGORITHM_H
