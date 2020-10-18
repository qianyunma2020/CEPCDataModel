#!/usr/bin/env python
# -*- coding:utf-8 -*-
  
import Sniper
import sys
op = "/publicfs/cms/user/xinxia/wk/lodestar-dev/offline/Examples/XYZtoXJpsiAlg/cmt"
jn = "999"
if (len(sys.argv)>1):
    jn = sys.argv[1]
if (len(sys.argv)==3):
    op = sys.argv[2]
    
      
task = Sniper.Task("task")
task.asTop()
task.setLogLevel(5)

Sniper.loadDll("libRootEventData.so")  ## necessary!!

import XYZtoXJpsi
alg = task.createAlg("PiPiJpsi/hAlg")
alg.property("IfDebug").set(False)
alg.property("GammaAngleCut").set(20)
alg.property("JobName").set(jn)
alg.property("OutPath").set(op)
#alg.property("fname").set("/publicfs/cms/user/xinxia/wk/data/run_0044091_All_file011_SFO-1.dst")

import DataStoreMgr
task.createSvc("DataStoreMgr")

import AbsCor 
abscor = alg.createTool("AbsCor/abscor")
abscor.property("Usetof").set(1)
abscor.property("Dodatacor").set(1)
abscor.property("Edgecor").set(0)
abscor.property("MCuseTof").set(1)


#inputFile= open("/publicfs/cms/user/xinxia/wk/lodestar-dev/offline/Examples/ReBuildDST/share/new.lst")
#inputFile= open("/publicfs/cms/user/xinxia/wk/lodestar-dev/offline/Examples/XYZtoXJpsiAlg/jobs/file"+jn+".list")
inputFile= open("new.lst")

filelist = inputFile.readline()[:-1]
for it in inputFile.readlines():
    filelist += ", "
    filelist += it[:-1]

import RootIOSvc
oSvc = task.createSvc("RootInputSvc/InputSvc")
#oSvc.property("InputStream").set({"/Event" : "/publicfs/cms/user/xinxia/wk/lodestar-dev/offline/Examples/ReBuildDST/share/new_run_0044281_All_file001_SFO-1.dst"})
oSvc.property("InputStream").set({"/Event" : filelist})

task.setEvtMax(-1)
task.show()
task.run()
