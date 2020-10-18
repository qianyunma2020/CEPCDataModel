import Sniper
import sys
op = "."
jn = ""
if (len(sys.argv)>1):
    jn = sys.argv[1]
if (len(sys.argv)==3):
    op = sys.argv[2]

Sniper.setLogLevel(2)


treefilterFile= open("treefilter.list")
treefilterfilelist = treefilterFile.readline()[:-1]
for it in treefilterFile.readlines():
    treefilterfilelist += ", "
    treefilterfilelist += it[:-1]
print (treefilterfilelist)
treefilterFile.close()


import AlgLevelParallel
toptask = AlgLevelParallel.ALPManagerTask("ALPManagerTask")
toptask.setLogLevel(2)
customsvc = toptask.createSvc("ALPCustomParameterSvc")
customsvc.property("EventPoolInputFilesNameList").set("edm4hep_events-12w.root")
customsvc.property("EventPoolOutputFilesNameList").set("outfile.root") 
customsvc.property("EventPoolCollectionNamesFilterList").set(treefilterfilelist)
customsvc.property("EventPoolInputThreadsCount").set(1)
customsvc.property("ThreadPoolThreadsCount").set(12) 
customsvc.property("EventPoolGroupCount").set(1000)
customsvc.property("AlgsPropertyFieName").set("algsProperty.json")
customsvc.property("DAGTunnelsCount").set(5)    

import ALPDataIO
import UseCase
toptask.createSvc("ALPFileInputSvc")
toptask.createSvc("ALPFileOutputSvc")
toptask.run()



