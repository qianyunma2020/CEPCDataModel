#ifndef SNIPER_ALP_FILE_INPUTSVC_H
#define SNIPER_ALP_FILE_INPUTSVC_H

#include <pthread.h>
#include <vector>
#include <string>
#include <algorithm>
#include "SniperKernel/SvcFactory.h"
#include "SniperKernel/ALPFileIOSvc.h"
#include "SniperKernel/ALPEventPool.h"
#include "SniperKernel/SniperLog.h"
#include "podio/ROOTReader.h"
#include "ALPEventDataModel.h"

//IO函数指针
typedef void* (*ALPFileInputFunctionPtr)(void*);

class ALPFileInputSvc : public ALPFileIOSvc
{
public:
	ALPFileInputSvc(const std::string& name);
	~ALPFileInputSvc();

	ALPEventPool* GetEventPool() { return m_EventPool;}
        void SetEventPool(ALPEventPool* eventpool);
        void SetInputThreadsCount(const unsigned int count = 1);
        void SetOutputThreadsCount(const unsigned int count = 1);
        void SetInputFilesNameString(const std::string names);
        void SetOutputFilesNameString(const std::string names);
        void SetCollectionNamesFilterString(const std::string filter);
        bool initialize();
        bool finalize();


public:
	static ALPFileInputFunctionPtr m_FileInput_Function;               //每个文件输入线程对应的功能函数指针
	static std::vector<std::string>   m_InputFilesNameVector;          //输入文件名称列表
	static GBSemaphore m_InputFilesNameVector_Lock;                    //输入文件名称列表的安全锁，可能存在多个文件输入线程
	static std::vector<std::string> m_CollectionNamesFilterVector;     //用户指定的Collection过滤器字符串名称数组

private:
	ALPEventPool* m_EventPool;                  //指向事例池的指针
	unsigned long m_InputThreadsCount;           //输入线程数目，默认为1   
	std::vector<pthread_t> m_InputThreadsID;    //输入线程ID集合

	std::string m_InputFilesNameString;            //输入文件名称集合字符串
	std::string m_CollectionNamesFilterString;     //用户指定的Collection集合过滤器字符串

};

#endif // !SNIPER_ALP_FILE_INPUTSVC_H

