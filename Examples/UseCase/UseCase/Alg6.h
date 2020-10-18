/**
 *  @file   PandoraPFANew/FineGranularityContent/include/TopologicalAssociation/ShowerMipMergingAlgorithm.h
 * 
 *  @brief  Header file for the shower mip merging algorithm class.
 * 
 *  $Log: $
 */
#ifndef SHOWER_MIP_MERGING_ALGORITHM_H
#define SHOWER_MIP_MERGING_ALGORITHM_H 1

#include <time.h>
#include "CommonAlgTool.h"
#include "SniperKernel/ALPAlgBase.h"

/**
 *  @brief  ShowerMipMergingAlgorithm class
 */
class Alg6 : public ALPAlgBase
{

public:
    Alg6(const std::string& name) : ALPAlgBase(name) {}
    ~Alg6() { }
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

    float           m_canMergeMinMipFraction;           ///< The min mip fraction for clusters (flagged as photons) to be merged
    float           m_canMergeMaxRms;                   ///< The max all hit fit rms for clusters (flagged as photons) to be merged

    unsigned int    m_minHitsInCluster;                 ///< Min number of calo hits in cluster
    unsigned int    m_minOccupiedLayersInCluster;       ///< Min number of occupied layers in cluster

    unsigned int    m_nPointsToFit;                     ///< The number of occupied pseudolayers to use in fit to the end of the cluster

    float           m_mipFractionCut;                   ///< The min mip fraction required to identify a cluster as mip-like
    float           m_fitToAllHitsRmsCut;               ///< The max rms value (for the fit to all hits) to identify a cluster as mip-like

    float           m_maxCentroidDifference;            ///< The max difference (for merging) between cluster outer and inner centroids

    unsigned int    m_nFitProjectionLayers;             ///< The number of layers to project cluster fit for comparison with second cluster
    float           m_maxDistanceToClosestHit;          ///< The max distance between projected cluster fit and hits in second cluster
    float           m_maxDistanceToClosestCentroid;     ///< The max distance between projected cluster fit and second cluster centroid
};


#endif // #ifndef SHOWER_MIP_MERGING_ALGORITHM_H
