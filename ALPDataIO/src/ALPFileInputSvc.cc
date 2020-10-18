#include "ALPDataIO/ALPFileInputSvc.h"
#include "ALPDataIO/ALPCommonUtil.h"


DECLARE_SERVICE(ALPFileInputSvc);

std::vector<std::string>  ALPFileInputSvc::m_InputFilesNameVector;           //�����ļ������б�
GBSemaphore ALPFileInputSvc::m_InputFilesNameVector_Lock;                    //�����ļ������б�İ�ȫ�������ܴ��ڶ���ļ������߳�
std::vector<std::string>  ALPFileInputSvc::m_CollectionNamesFilterVector;    //�û�ָ����Collection�������ַ�����������

ALPFileInputSvc::ALPFileInputSvc(const std::string& name) : ALPFileIOSvc(name)
{
	//���°�ȫ��
	m_InputFilesNameVector_Lock.notify();

}

ALPFileInputSvc::~ALPFileInputSvc()
{
}

void ALPFileInputSvc::SetEventPool(ALPEventPool* eventpool) {
	m_EventPool = eventpool;
}

void ALPFileInputSvc::SetInputThreadsCount(const unsigned int count) {
	m_InputThreadsCount = count;
}

void ALPFileInputSvc::SetOutputThreadsCount(const unsigned int count) {

}

void ALPFileInputSvc::SetInputFilesNameString(const std::string names) {
	m_InputFilesNameString = names;
}

void ALPFileInputSvc::SetOutputFilesNameString(const std::string names) {

}

void ALPFileInputSvc::SetCollectionNamesFilterString(const std::string filter) {
	m_CollectionNamesFilterString = filter;
}



// pure virtual interfaces
bool ALPFileInputSvc::initialize() {
	//��������ļ������ַ�������Ϊ��
	LogDebug <<"Function ALPFileInputSvc::initialize() says hello. m_InputFilesNameString="<<m_InputFilesNameString<< std::endl;
	if (!m_InputFilesNameString.size())
	{
		LogInfo << "Function ALPFileInputSvc::initialize()  does not have input files!" << std::endl;
		return false;
	}
	//����ļ������б�vector
	std::vector<std::string> fileList = getSepedFileList(m_InputFilesNameString);
	m_InputFilesNameVector.assign(fileList.begin(), fileList.end());
	//�����ļ����������е�Ԫ�أ������ȴ�vectorβ�˵����ļ�����ʱ���ɱ���ԭʼ�ļ���������˳��
	std::reverse(m_InputFilesNameVector.begin(), m_InputFilesNameVector.end());

	//���collection�����б�vector
	std::vector<std::string> collectionList = getSepedFileList(m_CollectionNamesFilterString);
	m_CollectionNamesFilterVector.assign(collectionList.begin(), collectionList.end());


	//�����û�ָ����Ŀ�������߳�
	for (unsigned count = 0; count < m_InputThreadsCount; count++) {
		pthread_t tmpInputThreadID;
		//���������߳�
		if (pthread_create(&tmpInputThreadID, NULL, m_FileInput_Function, (void*)this) != 0)
		{
			LogError << "Function warning:Input thread create error!" << std::endl; return false;
		}
		//�����߳������̷߳��룬���߳̽�������Զ��ͷ���Ӧ��Դ
		pthread_detach(tmpInputThreadID);
		m_InputThreadsID.push_back(tmpInputThreadID);
		
	}
}

bool ALPFileInputSvc::finalize() {

}

void* InputFileDataToEventPool(void* arg)     //�ļ������̶߳�Ӧ�Ĺ��ܺ���
{
        LogDebug << "Function InputFileDataToEventPool(void* arg) says hello." << std::endl;
	//����ROOTReader
	//auto reader = podio::ROOTReader();
	//�����ļ��е������Ƿ��������
	bool eventInputtingFlag = true;
	std::string filename = "";
	//��ȡ��ǰ������ָ��
	ALPEventPool* tmp_EventPool = ((ALPFileInputSvc*)arg)->GetEventPool();
	//ָ��ǰ����������������ָ��
	ALPEventGroup* tmp_GroupPtr = nullptr;
        LogDebug << "Function InputFileDataToEventPool(void* arg) step1." << std::endl;

	while (eventInputtingFlag)
	{
		//����Ҫ������ļ�����
		LogDebug << "Function InputFileDataToEventPool(void* arg) step2." << std::endl;		
		ALPFileInputSvc::m_InputFilesNameVector_Lock.wait();
		if (ALPFileInputSvc::m_InputFilesNameVector.empty()) {//�����ļ��Ѿ�����������������߳�������
			eventInputtingFlag = false;
		}
		else {//������δ������ļ�
			filename = ALPFileInputSvc::m_InputFilesNameVector.back();
			ALPFileInputSvc::m_InputFilesNameVector.pop_back();
		}
		ALPFileInputSvc::m_InputFilesNameVector_Lock.notify();
                LogDebug << "Function InputFileDataToEventPool(void* arg) step3." << std::endl;
		//�����ļ����������ļ�
		if (eventInputtingFlag) {
                        //����ROOTReader
                        auto reader = podio::ROOTReader();

			//���ļ�
			//LogDebug << "Function InputFileDataToEventPool(void* arg) step4." << std::endl;
			reader.openFile(filename);
			unsigned int nEvents = reader.getEntries();
			//Collectionɸѡ����Ϊ�գ���Ĭ������Ϊ���е�Collection���ּ���
			std::vector<std::string> collectionList;
			if (ALPFileInputSvc::m_CollectionNamesFilterVector.empty()) {
				std::vector<std::string> collectionList = reader.getCollectionIDTable()->names();
			}else{
				collectionList.assign(ALPFileInputSvc::m_CollectionNamesFilterVector.begin(), ALPFileInputSvc::m_CollectionNamesFilterVector.end());
			}
                        LogDebug << "Function InputFileDataToEventPool(void* arg) step  new file "<<filename<<" input begin." << std::endl;
                        
			//�������е�����
			for (unsigned count = 0; count < nEvents; count++)
			{
                                //LogDebug << "Function InputFileDataToEventPool(void* arg) step5." << std::endl;
				ALPEventDataModel* tmp_EventPtr = new ALPEventDataModel();
				tmp_EventPtr->setReader(&reader);
                                //LogDebug << "Function InputFileDataToEventPool(void* arg) step6." << std::endl;
				//�����������е�collection����,���������ݶ����ڴ�
				for (auto name : collectionList) {
                                        tmp_EventPtr->getBaseClassVersion<podio::CollectionBase>(name);
				}
				//LogDebug << "Function InputFileDataToEventPool(void* arg) step7." << std::endl;
				//��ȡ����������,�����������ļ�����
				if (NULL == tmp_GroupPtr) {
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step8." << std::endl;
					tmp_GroupPtr = tmp_EventPool->AllocateEmptyEventGroup(filename);
					tmp_GroupPtr->SetCurrentFileName(filename);
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step9." << std::endl;
				}
				//������������������,���������Ѿ�������ɣ������������״̬�������µ�������
				if (!tmp_GroupPtr->EventToInput(tmp_EventPtr)) {
                                        LogDebug<<"Function InputFileDataToEventPool implys current group is full!"<<std::endl;
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step10." << std::endl;
					//����������״̬Ϊready
					tmp_GroupPtr->SetGroupState(EventIOQueueStream_GroupState_Ready);
					//������������Ready״̬������������ź���
					tmp_EventPool->PushReadyEventGroupSemaphore();
					//��ȡ����������,�����������ļ�����
					tmp_GroupPtr = tmp_EventPool->AllocateEmptyEventGroup(filename);
					tmp_GroupPtr->SetCurrentFileName(filename);
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step11." << std::endl;
					//����������������������,����������ʧ���򱨴�
					if (!tmp_GroupPtr->EventToInput(tmp_EventPtr)) {
						LogError << "Function InputFileDataToEventPool(void* arg)  in file ALPFileInputSvc.cc Error: cant't input event data to group, chekc if event group size is set to zero!" << std::endl;
						return NULL;
					}
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step12." << std::endl;
				}

				//����״̬,����������һ��������׼��
				reader.endOfEvent();
                                //LogDebug << "Function InputFileDataToEventPool(void* arg) step13." << std::endl;
			}

                        // process the last group 
                        if(0 != tmp_GroupPtr->GetGroupSize()) {
                             //����������״̬Ϊready
                             tmp_GroupPtr->SetGroupState(EventIOQueueStream_GroupState_Ready);
                             //������������Ready״̬������������ź���
                             tmp_EventPool->PushReadyEventGroupSemaphore();
                        }

                        LogDebug << "Function InputFileDataToEventPool(void* arg) new file "<<filename<<" input ends." << std::endl;
			//�ر��ļ�
			reader.closeFile();
			//����ָ��
			tmp_GroupPtr = NULL;
		}
		//����ļ�����
		filename.clear();
	}

}


//ָ���ļ����빦�ܺ�����ָ�� 
ALPFileInputFunctionPtr ALPFileInputSvc::m_FileInput_Function = InputFileDataToEventPool;
