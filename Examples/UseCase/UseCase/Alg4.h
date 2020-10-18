/**
 *  @file   PandoraPFANew/FineGranularityContent/include/TrackClusterAssociation/TrackRecoveryAlgorithm.h
 * 
 *  @brief  Header file for the track recovery algorithm class.
 * 
 *  $Log: $
 */
#ifndef TRACK_RECOVERY_ALGORITHM_H
#define TRACK_RECOVERY_ALGORITHM_H 1

#include <time.h>
#include "CommonAlgTool.h"
#include "SniperKernel/ALPAlgBase.h"


/**
 *  @brief  TrackRecoveryAlgorithm class
 */
class Alg4 : public ALPAlgBase
{
public:
    Alg4(const std::string& name) : ALPAlgBase(name) {}
    ~Alg4() { }

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

    float           m_maxTrackZStart;                   ///< Max track start z coordinate for track without parent to be considered
    float           m_maxAbsoluteTrackClusterChi;       ///< Max absolute value of track-cluster consistency chi for non-leaving cluster

    float           m_endCapMaxTrackClusterDistance1;   ///< Max track-cluster distance to allow association of endcap-reaching track
    float           m_endCapMaxTrackClusterDistance2;   ///< Max distance for association of endcap-reaching track with a cluster of lower energy
    float           m_barrelMaxTrackClusterDistance;    ///< Max track-cluster distance to allow association of barrel-reaching track

    unsigned int    m_maxSearchLayer;                   ///< Max pseudo layer to examine when calculating track-cluster distance
    float           m_parallelDistanceCut;              ///< Max allowed projection of track-hit separation along track direction
};


#endif // #ifndef TRACK_RECOVERY_ALGORITHM_H
