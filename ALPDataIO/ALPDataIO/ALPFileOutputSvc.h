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

//IO����ָ��
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
	//���ڲ��Թ��ܵ���������
	void registerForWriteAllCollections(ALPROOTWriter* tmpRootWriter);  //дTree֮ǰ��Branchע��
	void fillEventData(ALPEventDataModel* tmp_EventPtr, ALPROOTWriter* tmpRootWriter);                //���������������д���ļ�

public:
	static ALPFileOutputFunctionPtr m_FileOutput_Function;               //ÿ���ļ�����̶߳�Ӧ�Ĺ��ܺ���ָ��
	static std::vector<std::string>   m_InputFilesNameVector;          //�����ļ������б�
	static std::vector<std::string>   m_OutputFilesNameVector;          //����ļ������б�
	static std::unordered_map<std::string, bool> m_OutputFilesUpdateFlag;  //false to create, true to update
        static GBSemaphore m_OutputFilesNameVector_Lock;                    //����ļ������б�İ�ȫ�������ܴ��ڶ���ļ�����߳�
	static std::vector<std::string> m_CollectionNamesFilterVector;      //�û�ָ����Collection�������ַ�����������
	static std::map<std::string, ALPROOTWriter*> m_FileNameToWriter_MapTable;    //����ļ����Ƶ�Writer��ӳ���
	static GBSemaphore m_FileNameToWriter_MapTable_Lock;         //����ļ����Ƶ�Writer��ӳ���İ�ȫ��������ܴ��ڶ������߳�


private:
	ALPEventPool* m_EventPool;                   //ָ�������ص�ָ��
	unsigned long m_OutputThreadsCount;           //����߳���Ŀ��Ĭ��Ϊ1   
	pthread_t m_OutputThreadID;    //ID of out put thread

	std::string m_InputFilesNameString;            //�����ļ����Ƽ����ַ���
	std::string m_OutputFilesNameString;         //����ļ������б�
	std::string m_CollectionNamesFilterString;   //�û�ָ����Collection���Ϲ������ַ���

};


#endif
