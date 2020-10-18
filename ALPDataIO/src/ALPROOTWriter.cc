#include "ALPDataIO/ALPROOTWriter.h"
// ROOT specifc includes
#include "TFile.h"
#include "TTree.h"
// podio specific includes
#include "podio/CollectionBase.h"


ALPROOTWriter::ALPROOTWriter() 
{

}

ALPROOTWriter::~ALPROOTWriter() {
    delete m_file;
}

void ALPROOTWriter::createCurrentFile(const std::string& filename) {
    m_filename = filename;
    m_file = new TFile(filename.c_str(), "RECREATE", "data file");
    m_datatree = new TTree("events", "Events tree");
    m_metadatatree = new TTree("metadata", "Metadata tree");
}


void ALPROOTWriter::setCurrentFile(const std::string& filename) {
    m_filename = filename;
    m_file = new TFile(filename.c_str(), "UPDATE", "data file");
    m_datatree = new TTree("events", "Events tree");
    m_metadatatree = new TTree("metadata", "Metadata tree");
}

void ALPROOTWriter::unsetCurrentFile() {
    delete m_metadatatree;
    delete m_datatree;
    delete m_file;
}

void ALPROOTWriter::setCurrentEvent(ALPEventDataModel* event) {
    m_Event = event;
}

void ALPROOTWriter::writeEvent() {
    for (auto& coll : m_storedCollections) {
        coll->prepareForWrite();
    }
    m_datatree->Fill();
}


void ALPROOTWriter::clearEvent() {
    m_storedCollections.clear();
}

void ALPROOTWriter::finish() {
    // now we want to safe the metadata
    m_metadatatree->Branch("CollectionIDs", m_Event->getCollectionIDTable());
    m_metadatatree->Fill();
    m_file->Write();
    m_file->Close();
}

void ALPROOTWriter::registerForWrite(const std::string& name) {
    const podio::CollectionBase* tmp_coll(nullptr);
    m_Event->get(name, tmp_coll);

    podio::CollectionBase* coll = const_cast<podio::CollectionBase*>(tmp_coll);
    std::string className(coll->getValueTypeName());
    std::string collClassName = "vector<" + className + "Data>";

    if (coll == nullptr) {
        std::cerr << "no such collection to write, throw exception." << std::endl;
    }
    else {
        m_datatree->Branch(name.c_str(), collClassName.c_str(), coll->getBufferAddress());
        auto colls = coll->referenceCollections();
        if (colls != nullptr) {
            int i = 0;
            for (auto& c : (*colls)) {
                m_datatree->Branch((name + "#" + std::to_string(i)).c_str(), c);
                ++i;
            }
        }
        // ---- vector members
        auto vminfo = coll->vectorMembers();
        if (vminfo != nullptr) {
            int i = 0;
            for (auto& c : (*vminfo)) {
                std::string typeName = "vector<" + c.first + ">";
                void* add = c.second;
                m_datatree->Branch((name + "_" + std::to_string(i)).c_str(), typeName.c_str(), add);
                ++i;
            }
        }
        m_storedCollections.emplace_back(coll);
    }
}

