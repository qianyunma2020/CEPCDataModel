#include "ALPDataIO/ALPFileInputSvc.h"
#include "ALPDataIO/ALPCommonUtil.h"


DECLARE_SERVICE(ALPFileInputSvc);

std::vector<std::string>  ALPFileInputSvc::m_InputFilesNameVector;           //输入文件名称列表
GBSemaphore ALPFileInputSvc::m_InputFilesNameVector_Lock;                    //输入文件名称列表的安全锁，可能存在多个文件输入线程
std::vector<std::string>  ALPFileInputSvc::m_CollectionNamesFilterVector;    //用户指定的Collection过滤器字符串名称数组

ALPFileInputSvc::ALPFileInputSvc(const std::string& name) : ALPFileIOSvc(name)
{
	//更新安全锁
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
	//如果输入文件名称字符串集合为空
	LogDebug <<"Function ALPFileInputSvc::initialize() says hello. m_InputFilesNameString="<<m_InputFilesNameString<< std::endl;
	if (!m_InputFilesNameString.size())
	{
		LogInfo << "Function ALPFileInputSvc::initialize()  does not have input files!" << std::endl;
		return false;
	}
	//获得文件名称列表vector
	std::vector<std::string> fileList = getSepedFileList(m_InputFilesNameString);
	m_InputFilesNameVector.assign(fileList.begin(), fileList.end());
	//倒置文件名称数组中的元素，这样等从vector尾端弹出文件名称时，可保持原始文件名称排列顺序
	std::reverse(m_InputFilesNameVector.begin(), m_InputFilesNameVector.end());

	//获得collection名称列表vector
	std::vector<std::string> collectionList = getSepedFileList(m_CollectionNamesFilterString);
	m_CollectionNamesFilterVector.assign(collectionList.begin(), collectionList.end());


	//创建用户指定书目的输入线程
	for (unsigned count = 0; count < m_InputThreadsCount; count++) {
		pthread_t tmpInputThreadID;
		//创建输入线程
		if (pthread_create(&tmpInputThreadID, NULL, m_FileInput_Function, (void*)this) != 0)
		{
			LogError << "Function warning:Input thread create error!" << std::endl; return false;
		}
		//将子线程与主线程分离，子线程结束后会自动释放相应资源
		pthread_detach(tmpInputThreadID);
		m_InputThreadsID.push_back(tmpInputThreadID);
		
	}
}

bool ALPFileInputSvc::finalize() {

}

void* InputFileDataToEventPool(void* arg)     //文件输入线程对应的功能函数
{
        LogDebug << "Function InputFileDataToEventPool(void* arg) says hello." << std::endl;
	//创建ROOTReader
	//auto reader = podio::ROOTReader();
	//输入文件中的事例是否输入完成
	bool eventInputtingFlag = true;
	std::string filename = "";
	//获取当前事例池指针
	ALPEventPool* tmp_EventPool = ((ALPFileInputSvc*)arg)->GetEventPool();
	//指向当前正在输入的事例组的指针
	ALPEventGroup* tmp_GroupPtr = nullptr;
        LogDebug << "Function InputFileDataToEventPool(void* arg) step1." << std::endl;

	while (eventInputtingFlag)
	{
		//分配要输入的文件名称
		LogDebug << "Function InputFileDataToEventPool(void* arg) step2." << std::endl;		
		ALPFileInputSvc::m_InputFilesNameVector_Lock.wait();
		if (ALPFileInputSvc::m_InputFilesNameVector.empty()) {//所有文件已经输入或正在由其他线程输入中
			eventInputtingFlag = false;
		}
		else {//存在尚未输入的文件
			filename = ALPFileInputSvc::m_InputFilesNameVector.back();
			ALPFileInputSvc::m_InputFilesNameVector.pop_back();
		}
		ALPFileInputSvc::m_InputFilesNameVector_Lock.notify();
                LogDebug << "Function InputFileDataToEventPool(void* arg) step3." << std::endl;
		//根据文件名称输入文件
		if (eventInputtingFlag) {
                        //创建ROOTReader
                        auto reader = podio::ROOTReader();

			//打开文件
			//LogDebug << "Function InputFileDataToEventPool(void* arg) step4." << std::endl;
			reader.openFile(filename);
			unsigned int nEvents = reader.getEntries();
			//Collection筛选数组为空，则默认设置为所有的Collection名字集合
			std::vector<std::string> collectionList;
			if (ALPFileInputSvc::m_CollectionNamesFilterVector.empty()) {
				std::vector<std::string> collectionList = reader.getCollectionIDTable()->names();
			}else{
				collectionList.assign(ALPFileInputSvc::m_CollectionNamesFilterVector.begin(), ALPFileInputSvc::m_CollectionNamesFilterVector.end());
			}
                        LogDebug << "Function InputFileDataToEventPool(void* arg) step  new file "<<filename<<" input begin." << std::endl;
                        
			//输入所有的事例
			for (unsigned count = 0; count < nEvents; count++)
			{
                                //LogDebug << "Function InputFileDataToEventPool(void* arg) step5." << std::endl;
				ALPEventDataModel* tmp_EventPtr = new ALPEventDataModel();
				tmp_EventPtr->setReader(&reader);
                                //LogDebug << "Function InputFileDataToEventPool(void* arg) step6." << std::endl;
				//遍历过滤器中的collection集合,将事例数据读入内存
				for (auto name : collectionList) {
                                        tmp_EventPtr->getBaseClassVersion<podio::CollectionBase>(name);
				}
				//LogDebug << "Function InputFileDataToEventPool(void* arg) step7." << std::endl;
				//获取空闲事例组,设置事例组文件名称
				if (NULL == tmp_GroupPtr) {
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step8." << std::endl;
					tmp_GroupPtr = tmp_EventPool->AllocateEmptyEventGroup(filename);
					tmp_GroupPtr->SetCurrentFileName(filename);
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step9." << std::endl;
				}
				//往事例组中输入数据,若事例组已经输入完成，则更新事例组状态后，申请新的事例组
				if (!tmp_GroupPtr->EventToInput(tmp_EventPtr)) {
                                        LogDebug<<"Function InputFileDataToEventPool implys current group is full!"<<std::endl;
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step10." << std::endl;
					//更新事例组状态为ready
					tmp_GroupPtr->SetGroupState(EventIOQueueStream_GroupState_Ready);
					//更新事例池中Ready状态事例组计数的信号量
					tmp_EventPool->PushReadyEventGroupSemaphore();
					//获取空闲事例组,设置事例组文件名称
					tmp_GroupPtr = tmp_EventPool->AllocateEmptyEventGroup(filename);
					tmp_GroupPtr->SetCurrentFileName(filename);
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step11." << std::endl;
					//重新往事例组中输入数据,若依旧输入失败则报错
					if (!tmp_GroupPtr->EventToInput(tmp_EventPtr)) {
						LogError << "Function InputFileDataToEventPool(void* arg)  in file ALPFileInputSvc.cc Error: cant't input event data to group, chekc if event group size is set to zero!" << std::endl;
						return NULL;
					}
                                        //LogDebug << "Function InputFileDataToEventPool(void* arg) step12." << std::endl;
				}

				//更新状态,做好输入下一个事例的准备
				reader.endOfEvent();
                                //LogDebug << "Function InputFileDataToEventPool(void* arg) step13." << std::endl;
			}

                        // process the last group 
                        if(0 != tmp_GroupPtr->GetGroupSize()) {
                             //更新事例组状态为ready
                             tmp_GroupPtr->SetGroupState(EventIOQueueStream_GroupState_Ready);
                             //更新事例池中Ready状态事例组计数的信号量
                             tmp_EventPool->PushReadyEventGroupSemaphore();
                        }

                        LogDebug << "Function InputFileDataToEventPool(void* arg) new file "<<filename<<" input ends." << std::endl;
			//关闭文件
			reader.closeFile();
			//重置指针
			tmp_GroupPtr = NULL;
		}
		//清空文件名称
		filename.clear();
	}

}


//指向文件输入功能函数的指针 
ALPFileInputFunctionPtr ALPFileInputSvc::m_FileInput_Function = InputFileDataToEventPool;
