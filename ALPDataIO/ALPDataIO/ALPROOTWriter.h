#ifndef SNIPER_ALP_ROOT_WRITER_H
#define SNIPER_ALP_ROOT_WRITER_Hs

#include <string>
#include <vector>
#include <iostream>
// ROOT specific includes
#include "TTree.h"

#include "podio/CollectionBase.h"
#include "ALPEventDataModel.h"
#include "SniperKernel/SniperLog.h"



// forward declarations
class TFile;
class Registry;

class ALPROOTWriter 
{
public:
    ALPROOTWriter();
    ~ALPROOTWriter();

    void createCurrentFile(const std::string& filename);
    void setCurrentFile(const std::string& filename);
    void setCurrentEvent(ALPEventDataModel* event);
    void registerForWrite(const std::string& name);
    void writeEvent();
    void clearEvent();
    void finish();

private:
     void unsetCurrentFile();

private:
    // members
    std::string m_filename;
    ALPEventDataModel* m_Event;
    TFile* m_file;
    TTree* m_datatree;
    TTree* m_metadatatree;
    std::vector<podio::CollectionBase*> m_storedCollections;

};


#endif
