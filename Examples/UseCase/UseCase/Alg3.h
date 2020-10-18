/**
 *  @file   PandoraPFANew/FineGranularityContent/include/Monitoring/VisualMonitoringAlgorithm.h
 * 
 *  @brief  Header file for the visual monitoring algorithm class
 * 
 *  $Log: $
 */
#ifndef VISUAL_MONITORING_ALGORITHM_H
#define VISUAL_MONITORING_ALGORITHM_H 1

#include <time.h>
#include <map>
#include "CommonAlgTool.h"
#include "SniperKernel/ALPAlgBase.h"


/**
 *  @brief VisualMonitoringAlgorithm class
 */
class Alg3 : public ALPAlgBase
{
public:
    Alg3(const std::string& name) : ALPAlgBase(name) {}
    ~Alg3() { }
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
    typedef std::map<int, float> PdgCodeToEnergyMap;
    bool                    m_showCurrentMCParticles;   ///< Whether to show current mc particles
    bool                    m_showCurrentCaloHits;      ///< Whether to show current calohitlist
    bool                    m_showCurrentTracks;        ///< Whether to show current tracks
    bool                    m_showCurrentClusters;      ///< Whether to show current clusters
    bool                    m_showCurrentPfos;          ///< Whether to show current particle flow object list
    bool                    m_showOnlyAvailable;        ///< Whether to show only available  (i.e. non-clustered) calohits and tracks
    bool                    m_displayEvent;             ///< Whether to display the event
    bool                    m_blackBackground;          ///< Whether to use a black background color, rather than white
    bool                    m_showDetector;             ///< Whether to display the detector geometry
    std::string             m_hitColors;                ///< Define the hit coloring scheme (default: pfo, choices: pfo, particleid)
    float                   m_thresholdEnergy;          ///< Cell energy threshold for display (em scale)
    float                   m_transparencyThresholdE;   ///< Cell energy for which transparency is saturated (0%, fully opaque)
    float                   m_energyScaleThresholdE;    ///< Cell energy for which color is at top end of continous color palette

    PdgCodeToEnergyMap      m_particleSuppressionMap;   ///< Map from pdg-codes to energy for suppression of particles types below specific energies
};



#endif // #ifndef VISUAL_MONITORING_ALGORITHM_H
