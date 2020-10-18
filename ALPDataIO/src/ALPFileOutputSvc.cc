#include "SniperKernel/SvcFactory.h"
#include "ALPDataIO/ALPFileOutputSvc.h"
#include "ALPDataIO/ALPCommonUtil.h"

#include "ALPDataIO/datamodel/EventInfoCollection.h"
#include "ALPDataIO/datamodel/ExampleMCCollection.h"
#include "ALPDataIO/datamodel/ExampleHitCollection.h"
#include "ALPDataIO/datamodel/ExampleClusterCollection.h"
#include "ALPDataIO/datamodel/ExampleReferencingTypeCollection.h"
#include "ALPDataIO/datamodel/ExampleWithOneRelationCollection.h"
#include "ALPDataIO/datamodel/ExampleWithVectorMemberCollection.h"
#include "ALPDataIO/datamodel/ExampleWithComponentCollection.h"
#include "ALPDataIO/datamodel/ExampleWithNamespaceCollection.h"
#include "ALPDataIO/datamodel/ExampleWithARelationCollection.h"
#include "ALPDataIO/datamodel/ExampleWithStringCollection.h"
#include "ALPDataIO/datamodel/ExampleWithArrayCollection.h"


DECLARE_SERVICE(ALPFileOutputSvc);

std::vector<std::string>  ALPFileOutputSvc::m_InputFilesNameVector;            //�����ļ������б�
std::vector<std::string>  ALPFileOutputSvc::m_OutputFilesNameVector;           //����ļ������б�
GBSemaphore ALPFileOutputSvc::m_OutputFilesNameVector_Lock;                    //����ļ������б�İ�ȫ�������ܴ��ڶ���ļ�����߳�
std::unordered_map<std::string, bool>  ALPFileOutputSvc::m_OutputFilesUpdateFlag;  //false to create, true to update

std::vector<std::string>  ALPFileOutputSvc::m_CollectionNamesFilterVector;     //�û�ָ����Collection�������ַ�����������
std::map<std::string, ALPROOTWriter*> ALPFileOutputSvc::m_FileNameToWriter_MapTable;    //����ļ����Ƶ�Writer��ӳ���
GBSemaphore ALPFileOutputSvc::m_FileNameToWriter_MapTable_Lock;         //����ļ����Ƶ�Writer��ӳ���İ�ȫ��������ܴ��ڶ������߳�




ALPFileOutputSvc::ALPFileOutputSvc(const std::string& name) : ALPFileIOSvc(name)
{
	//���°�ȫ��
	m_OutputFilesNameVector_Lock.notify();
	m_FileNameToWriter_MapTable_Lock.notify();
}

ALPFileOutputSvc::~ALPFileOutputSvc()
{
	for (auto tmpPtr : m_FileNameToWriter_MapTable) {
		delete tmpPtr.second;
	}
	m_FileNameToWriter_MapTable.clear();
}

void ALPFileOutputSvc::SetEventPool(ALPEventPool* eventpool) {
	m_EventPool = eventpool;
}

void ALPFileOutputSvc::SetInputThreadsCount(const unsigned int count) {

}

void ALPFileOutputSvc::SetOutputThreadsCount(const unsigned int count) {
	m_OutputThreadsCount = count;
}

void ALPFileOutputSvc::SetInputFilesNameString(const std::string names) {
	m_InputFilesNameString = names;
}

void ALPFileOutputSvc::SetOutputFilesNameString(const std::string names) {
	m_OutputFilesNameString = names;
}

void ALPFileOutputSvc::SetCollectionNamesFilterString(const std::string filter) {
	m_CollectionNamesFilterString = filter;
}



bool ALPFileOutputSvc::initialize() {
	//��������ļ������ַ�������Ϊ��
	LogDebug<<"Function ALPFileOutputSvc::initialize() says hello: m_InputFilesNameString="<<m_InputFilesNameString<<",  m_OutputFilesNameString="<<m_OutputFilesNameString<<std::endl;
	if (!m_InputFilesNameString.size())
	{
		LogInfo << "Function ALPFileInputSvc::initialize()  does not have input files!" << std::endl;
		return false;
	}
	//�������ļ������ַ�������Ϊ��
	if (!m_OutputFilesNameString.size())
	{
		LogInfo << "Function ALPFileOutputSvc::initialize()  does not get out file name!" << std::endl;
		return false;
	}

	
	//����ļ������б�vector
	std::vector<std::string> infileList = getSepedFileList(m_InputFilesNameString);
	m_InputFilesNameVector.assign(infileList.begin(), infileList.end());
	//�����ļ����������е�Ԫ�أ������ȴ�vectorβ�˵����ļ�����ʱ���ɱ���ԭʼ�ļ���������˳��
	std::reverse(m_InputFilesNameVector.begin(), m_InputFilesNameVector.end());
	//�������ļ������б�vector
	std::vector<std::string> fileList = getSepedFileList(m_OutputFilesNameString);
	m_OutputFilesNameVector.assign(fileList.begin(), fileList.end());
	//��������ļ����������е�Ԫ�أ������ȴ�vectorβ�˵����ļ�����ʱ���ɱ���ԭʼ�ļ���������˳��
	std::reverse(m_OutputFilesNameVector.begin(), m_OutputFilesNameVector.end());

	//���collection�����б�vector
	std::vector<std::string> collectionList = getSepedFileList(m_CollectionNamesFilterString);
	m_CollectionNamesFilterVector.assign(collectionList.begin(), collectionList.end());

	//��������߳�
	if (pthread_create(&m_OutputThreadID, NULL, m_FileOutput_Function, (void*)this) != 0)
	{
	    LogError << "Function warning:Output thread create error!" << std::endl; return false;
	}
	//�����߳������̷߳��룬���߳̽�������Զ��ͷ���Ӧ��Դ
	pthread_detach(m_OutputThreadID);

        //init file update flag
        for (unsigned int fileNameIndex=0; fileNameIndex < ALPFileOutputSvc::m_OutputFilesNameVector.size(); fileNameIndex++)
        {
             m_OutputFilesUpdateFlag[m_OutputFilesNameVector[fileNameIndex]] = false;
        }

}

bool ALPFileOutputSvc::finalize() {
	//�������е��ļ��������������
	for (auto tmpPtr : m_FileNameToWriter_MapTable) {
		tmpPtr.second->finish();
	}
}

void* OutputEventPoolDataToFile(void* arg)     //�ļ������̶߳�Ӧ�Ĺ��ܺ���
{
        LogDebug<<"Global function OutputEventPoolDataToFile says hello."<<std::endl;
	//�Ƿ���������Ҫ���
	bool moreDataFlag = true;
	//��ǰ�������Ӧ�������ļ���������ļ���,�Լ���Ӧ�����������е�����λ��
	std::string inFileName = ALPFileOutputSvc::m_InputFilesNameVector.back();
	unsigned int fileNameIndex = 0;
	//��ȡ��ǰ������ָ��
	ALPEventPool* tmp_EventPool = ((ALPFileOutputSvc*)arg)->GetEventPool();
	//ָ��ǰ����������������ָ��
	ALPEventGroup* tmp_GroupPtr = nullptr;
     
        LogDebug<<"Global function OutputEventPoolDataToFile step1.inFileName="<<inFileName<<std::endl;

	while (moreDataFlag) {
		//��ȡ����Processed״̬��������
		tmp_GroupPtr = tmp_EventPool->AllocateProcessedEventGroupFromBuffer(inFileName);
                LogDebug<<"Global function OutputEventPoolDataToFile step1.5."<<std::endl;

		//������е����������Ѿ�ȫ��������ļ��������ѭ����׼���˳�
		if (NULL == tmp_GroupPtr) {
			moreDataFlag = false;
                        LogDebug<<"Global function OutputEventPoolDataToFile says no more data now."<<std::endl;
		}else {
			//���ݵ�ǰ������������ļ����Ʋ�������ļ�����
		    for (fileNameIndex = 0; fileNameIndex < ALPFileOutputSvc::m_InputFilesNameVector.size(); fileNameIndex++)
		    {
			if (inFileName == ALPFileOutputSvc::m_InputFilesNameVector[fileNameIndex])
			    break;
		    }
                    //set file name, writer ptr, event data ptr
                    ALPEventDataModel* tmp_DataModelPtr = new  ALPEventDataModel();
                    ALPROOTWriter*     tmp_RootWriterPtr = new ALPROOTWriter();
                    if(ALPFileOutputSvc::m_OutputFilesUpdateFlag[ALPFileOutputSvc::m_OutputFilesNameVector[fileNameIndex]]) 
                    {
                        tmp_RootWriterPtr->setCurrentFile(ALPFileOutputSvc::m_OutputFilesNameVector[fileNameIndex]);
                        LogDebug<<"Global function OutputEventPoolDataToFilestep2."<<std::endl;
                    }else {
                        tmp_RootWriterPtr->createCurrentFile(ALPFileOutputSvc::m_OutputFilesNameVector[fileNameIndex]);
                        ALPFileOutputSvc::m_OutputFilesUpdateFlag[ALPFileOutputSvc::m_OutputFilesNameVector[fileNameIndex]]=true;
                        LogDebug<<"Global function OutputEventPoolDataToFilestep3."<<std::endl;
                    }

                    auto& info = tmp_DataModelPtr->create<EventInfoCollection>("info");
                    auto& mcps = tmp_DataModelPtr->create<ExampleMCCollection>("mcparticles");
                    auto& hits = tmp_DataModelPtr->create<ExampleHitCollection>("hits");
                    auto& clusters = tmp_DataModelPtr->create<ExampleClusterCollection>("clusters");
                    auto& refs = tmp_DataModelPtr->create<ExampleReferencingTypeCollection>("refs");
                    auto& refs2 = tmp_DataModelPtr->create<ExampleReferencingTypeCollection>("refs2");
                    auto& comps = tmp_DataModelPtr->create<ExampleWithComponentCollection>("Component");
                    auto& oneRels = tmp_DataModelPtr->create<ExampleWithOneRelationCollection>("OneRelation");
                    auto& vecs = tmp_DataModelPtr->create<ExampleWithVectorMemberCollection>("WithVectorMember");
                    auto& namesps = tmp_DataModelPtr->create<ex42::ExampleWithNamespaceCollection>("WithNamespaceMember");
                    auto& namesprels =tmp_DataModelPtr->create<ex42::ExampleWithARelationCollection>("WithNamespaceRelation");
                    auto& cpytest = tmp_DataModelPtr->create<ex42::ExampleWithARelationCollection>("WithNamespaceRelationCopy");
                    auto& strings = tmp_DataModelPtr->create<ExampleWithStringCollection>("strings");
                    auto& arrays = tmp_DataModelPtr->create<ExampleWithArrayCollection>("arrays");
                    LogDebug<<"Global function OutputEventPoolDataToFile step4."<<std::endl;

                    tmp_RootWriterPtr->setCurrentEvent(tmp_DataModelPtr);
                    tmp_RootWriterPtr->registerForWrite("info");
                    tmp_RootWriterPtr->registerForWrite("mcparticles");
                    tmp_RootWriterPtr->registerForWrite("hits");
                    tmp_RootWriterPtr->registerForWrite("clusters");
                    tmp_RootWriterPtr->registerForWrite("refs");
                    tmp_RootWriterPtr->registerForWrite("refs2");
                    tmp_RootWriterPtr->registerForWrite("Component");
                    tmp_RootWriterPtr->registerForWrite("OneRelation");
                    tmp_RootWriterPtr->registerForWrite("WithVectorMember");
                    tmp_RootWriterPtr->registerForWrite("WithNamespaceMember");
                    tmp_RootWriterPtr->registerForWrite("WithNamespaceRelation");
                    tmp_RootWriterPtr->registerForWrite("WithNamespaceRelationCopy");
                    tmp_RootWriterPtr->registerForWrite("strings");
                    tmp_RootWriterPtr->registerForWrite("arrays");
                    LogDebug<<"Global function OutputEventPoolDataToFile step5."<<std::endl;
                 


                    //��ȡ��ǰ�������׸�����
		    ALPEventUnit* tmp_EventUnitPtr = tmp_GroupPtr->EventToOutput();
                    ALPEventDataModel* tmp_EventDataPtr = nullptr;
                    if(nullptr !=  tmp_EventUnitPtr) 
                    {
                        tmp_EventDataPtr = static_cast<ALPEventDataModel*>(tmp_EventUnitPtr->GetEventDataPtr());
                    }
                    LogDebug<<"Global function OutputEventPoolDataToFile step6."<<std::endl;


                    //����ǰ�������ȫ����������д����������ļ�
		    while (nullptr != tmp_EventDataPtr) {
			//����������������ļ�
		    	//LogDebug<<"Global function OutputEventPoolDataToFilestep7."<<std::endl;

                        auto hit1 = ExampleHit( 0xbad, 0.,0.,0.,23.);
                        auto hit2 = ExampleHit( 0xcaffee,1.,0.,0.,12.);

                        hits.push_back(hit1);
                        hits.push_back(hit2);

                        // ---- add some MC particles ---- 
                        auto mcp0 = ExampleMC();
                        auto mcp1 = ExampleMC();
                        auto mcp2 = ExampleMC();
                        auto mcp3 = ExampleMC();
                        auto mcp4 = ExampleMC();
                        auto mcp5 = ExampleMC();
                        auto mcp6 = ExampleMC();
                        auto mcp7 = ExampleMC();
                        auto mcp8 = ExampleMC();
                        auto mcp9 = ExampleMC();

                        mcps.push_back( mcp0 ) ;
                        mcps.push_back( mcp1 ) ;
                        mcps.push_back( mcp2 ) ;
                        mcps.push_back( mcp3 ) ;
                        mcps.push_back( mcp4 ) ;
                        mcps.push_back( mcp5 ) ;
                        mcps.push_back( mcp6 ) ;
                        mcps.push_back( mcp7 ) ;
                        mcps.push_back( mcp8 ) ;
                        mcps.push_back( mcp9 ) ; 
                     

                        // --- add some daughter relations
                        auto p = ExampleMC();
                        auto d = ExampleMC();

                        p = mcps[0] ;
                        p.adddaughters( mcps[2] ) ;
                        p.adddaughters( mcps[3] ) ;
                        p.adddaughters( mcps[4] ) ;
                        p.adddaughters( mcps[5] ) ;
                        p = mcps[1] ;
                        p.adddaughters( mcps[2] ) ;
                        p.adddaughters( mcps[3] ) ;
                        p.adddaughters( mcps[4] ) ;
                        p.adddaughters( mcps[5] ) ;
                        p = mcps[2] ;
                        p.adddaughters( mcps[6] ) ;
                        p.adddaughters( mcps[7] ) ;
                        p.adddaughters( mcps[8] ) ;
                        p.adddaughters( mcps[9] ) ;
                        p = mcps[3] ;
                        p.adddaughters( mcps[6] ) ;
                        p.adddaughters( mcps[7] ) ;
                        p.adddaughters( mcps[8] ) ;
                        p.adddaughters( mcps[9] ) ;
                        
                        //--- now fix the parent relations
                        for( unsigned j=0,N=mcps.size();j<N;++j)
                        {
                            p = mcps[j] ;
                            for(auto it = p.daughters_begin(), end = p.daughters_end() ; it!=end ; ++it )
                            {
                                int dIndex = it->getObjectID().index ;
                                d = mcps[ dIndex ] ;
                                d.addparents( p ) ;
                            }
                        } 

                        //-------- print relations for debugging:
                      /*  for( auto p : mcps )
                        {
                            std::cout << " particle " << p.getObjectID().index << " has daughters: " ;
                            for(auto it = p.daughters_begin(), end = p.daughters_end() ; it!=end ; ++it )
                            {
                                std::cout << " " << it->getObjectID().index ;
                            }
                            std::cout << "  and parents: " ;
                            for(auto it = p.parents_begin(), end = p.parents_end() ; it!=end ; ++it )
                            {
                                std::cout << " " << it->getObjectID().index ;
                            } 
                            std::cout << std::endl ;
                        } 
                        */

                       //------------------------------- 
                       auto cluster  = ExampleCluster();
                       auto clu0  = ExampleCluster();
                       auto clu1  = ExampleCluster();

                       clu0.addHits(hit1);
                       clu0.energy(hit1.energy());
                       clu1.addHits(hit2);
                       clu1.energy(hit2.energy());
                       cluster.addHits(hit1);
                       cluster.addHits(hit2);
                       cluster.energy(hit1.energy()+hit2.energy());
                       cluster.addClusters( clu0 ) ;
                       cluster.addClusters( clu1 ) ;

                       clusters.push_back(clu0);
                       clusters.push_back(clu1);
                       clusters.push_back(cluster);

                       auto ref = ExampleReferencingType();
                       refs.push_back(ref);

                       auto ref2 = ExampleReferencingType();
                       refs2.push_back(ref2);

                       ref.addClusters(cluster);
                       ref.addRefs(ref2);

                       auto comp = ExampleWithComponent();
                       comp.component().data.x = 0;
                       comp.component().data.y = 1;
                       comp.component().data.z = 2;
                       comps.push_back(comp);

                       auto cyclic = ExampleReferencingType();
                       cyclic.addRefs(cyclic);
                       refs.push_back(cyclic);

                       auto oneRel = ExampleWithOneRelation();
                       oneRel.cluster(cluster);
                       oneRels.push_back(oneRel); 
                         
                       // write non-filled relation
                       auto oneRelEmpty = ExampleWithOneRelation();
                       oneRels.push_back(oneRelEmpty);

                       auto vec = ExampleWithVectorMember();
                       vec.addcount(1);
                       vec.addcount(10);
                       vecs.push_back(vec);
                       auto vec1 = ExampleWithVectorMember();
                       vec1.addcount(1);
                       vec1.addcount(11);
                       vecs.push_back(vec1); 
                       
                       for (int j = 0; j < 5; j++) {
                           auto rel = ex42::ExampleWithARelation();
                           rel.number(0.5*j);
                           auto exWithNamesp = ex42::ExampleWithNamespace();
                           exWithNamesp.data().x = 2;
                           exWithNamesp.data().y = 1000;
                           namesps.push_back(exWithNamesp);
                           if (j != 3) { // also check for empty relations
                               rel.ref(exWithNamesp);
                               for (int k = 0; k < 5; k++) {
                                   auto namesp = ex42::ExampleWithNamespace();
                                   namesp.x(3*k);
                                   namesp.data().y = k;
                                   namesps.push_back(namesp);
                                   rel.addrefs(namesp);
                               }
                           } 
                           namesprels.push_back(rel);
                       }
                       for (int j = 0; j < namesprels.size(); ++j) {
                           cpytest.push_back(namesprels.at(j).clone());
                       }

                       auto string = ExampleWithString("SomeString");
                       strings.push_back(string);

                       std::array<int, 4> arrayTest = {0, 0, 2, 3};
                       std::array<int, 4> arrayTest2 = {4, 4, 2 * static_cast<int>(3)};
                       NotSoSimpleStruct a;
                       a.data.p = arrayTest2;
                       ex2::NamespaceStruct nstruct;
                       nstruct.x = 1;
                       std::array<ex2::NamespaceStruct, 4> structArrayTest = {nstruct, nstruct, nstruct, nstruct};
                       auto array = ExampleWithArray(a, arrayTest, arrayTest, arrayTest, arrayTest, structArrayTest);
                       array.myArray(1, 3);
                       array.arrayStruct(a);
                       arrays.push_back(array); 
                       
                       //write current event and ready for next event
                       tmp_RootWriterPtr->writeEvent();
                       tmp_DataModelPtr->clearCollections();


                       //LogDebug<<"Global function OutputEventPoolDataToFilestep8."<<std::endl;
                       //��ȡ��ǰ�������¸�����
		       tmp_EventUnitPtr = tmp_GroupPtr->EventToOutput();
                       if(nullptr !=  tmp_EventUnitPtr) 
                       {
		           tmp_EventDataPtr = static_cast<ALPEventDataModel*>(tmp_EventUnitPtr->GetEventDataPtr());
                       }
                       else
                       {
                           tmp_EventDataPtr = nullptr;   
                       }
                       //LogDebug<<"Global function OutputEventPoolDataToFilestep9."<<std::endl;
		   }

		   //���µ�ǰ�������״̬
	           tmp_GroupPtr->SetGroupState(EventIOQueueStream_GroupState_Release);
		   //�ͷŵ�ǰ�����飬��������ڴ�ռ�;���ݵĲ����������ļ�����
		   tmp_EventPool->RecycleFrontEventGroupFromBuffer(inFileName);
		   LogDebug<<"Global function OutputEventPoolDataToFile step10."<<std::endl;
                   
                   //update for next event group
                   tmp_RootWriterPtr->finish();
                   delete tmp_DataModelPtr;
                   delete tmp_RootWriterPtr; 

	       }//finish current event group

	}
        //notify ALPManagerTask, all data is outputted, the job run over
        global_ALPManagerTask_JobRunOver_Semaphore.notify();	
        LogDebug<<"Global function OutputEventPoolDataToFile says byebye."<<std::endl;
}

//ָ���ļ����빦�ܺ�����ָ�� 
ALPFileOutputFunctionPtr ALPFileOutputSvc::m_FileOutput_Function = OutputEventPoolDataToFile;


