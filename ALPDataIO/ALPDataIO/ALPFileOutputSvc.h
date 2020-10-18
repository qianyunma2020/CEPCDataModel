#ifndef SNIPER_ALP_FILE_OUTPUTSVC_H
#define SNIPER_ALP_FILE_OUTPUTSVC_H

#include <pthread.h>
#include <string>
#include <algorithm>
#include <vector>
#include <map>
#include <unordered_map>
//#include "SniperKernel/gbmacrovar.h"
#include "SniperKernel/ALPFileIOSvc.h"
#include "SniperKernel/ALPEventPool.h"
#include "SniperKernel/SniperLog.h"
#include "podio/ROOTWriter.h"
#include "ALPEventDataModel.h"
#include "ALPROOTWriter.h"

//IO函数指针
typedef void* (*ALPFileOutputFunctionPtr)(void*);

class ALPFileOutputSvc : public ALPFileIOSvc
{
public:
	ALPFileOutputSvc(const std::string& name);
	~ALPFileOutputSvc();
	ALPEventPool* GetEventPool() { return m_EventPool; }
        void SetEventPool(ALPEventPool* eventpool);
        void SetInputThreadsCount(const unsigned int count = 1);
        void SetOutputThreadsCount(const unsigned int count = 1);
        void SetInputFilesNameString(const std::string names);
        void SetOutputFilesNameString(const std::string names);
        void SetCollectionNamesFilterString(const std::string filter);
        bool initialize(); 
        bool finalize();

public:
	//用于测试功能的内联函数
	void registerForWriteAllCollections(ALPROOTWriter* tmpRootWriter);  //写Tree之前的Branch注册
	void fillEventData(ALPEventDataModel* tmp_EventPtr, ALPROOTWriter* tmpRootWriter);                //将具体的事例数据写入文件

public:
	static ALPFileOutputFunctionPtr m_FileOutput_Function;               //每个文件输出线程对应的功能函数指针
	static std::vector<std::string>   m_InputFilesNameVector;          //输入文件名称列表
	static std::vector<std::string>   m_OutputFilesNameVector;          //输出文件名称列表
	static std::unordered_map<std::string, bool> m_OutputFilesUpdateFlag;  //false to create, true to update
        static GBSemaphore m_OutputFilesNameVector_Lock;                    //输出文件名称列表的安全锁，可能存在多个文件输出线程
	static std::vector<std::string> m_CollectionNamesFilterVector;      //用户指定的Collection过滤器字符串名称数组
	static std::map<std::string, ALPROOTWriter*> m_FileNameToWriter_MapTable;    //输出文件名称到Writer的映射表
	static GBSemaphore m_FileNameToWriter_MapTable_Lock;         //输出文件名称到Writer的映射表的安全锁，因可能存在多个输出线程


private:
	ALPEventPool* m_EventPool;                   //指向事例池的指针
	unsigned long m_OutputThreadsCount;           //输出线程数目，默认为1   
	pthread_t m_OutputThreadID;    //ID of out put thread

	std::string m_InputFilesNameString;            //输入文件名称集合字符串
	std::string m_OutputFilesNameString;         //输出文件名称列表
	std::string m_CollectionNamesFilterString;   //用户指定的Collection集合过滤器字符串

};


#endif
