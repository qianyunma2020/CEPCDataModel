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

//IO����ָ��
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
	static ALPFileInputFunctionPtr m_FileInput_Function;               //ÿ���ļ������̶߳�Ӧ�Ĺ��ܺ���ָ��
	static std::vector<std::string>   m_InputFilesNameVector;          //�����ļ������б�
	static GBSemaphore m_InputFilesNameVector_Lock;                    //�����ļ������б�İ�ȫ�������ܴ��ڶ���ļ������߳�
	static std::vector<std::string> m_CollectionNamesFilterVector;     //�û�ָ����Collection�������ַ�����������

private:
	ALPEventPool* m_EventPool;                  //ָ�������ص�ָ��
	unsigned long m_InputThreadsCount;           //�����߳���Ŀ��Ĭ��Ϊ1   
	std::vector<pthread_t> m_InputThreadsID;    //�����߳�ID����

	std::string m_InputFilesNameString;            //�����ļ����Ƽ����ַ���
	std::string m_CollectionNamesFilterString;     //�û�ָ����Collection���Ϲ������ַ���

};

#endif // !SNIPER_ALP_FILE_INPUTSVC_H

