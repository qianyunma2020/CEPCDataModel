----------> uses
# use SniperKernel v*  (no_version_directory)
#   use SniperPolicy v*  (no_version_directory)
#   use Boost v* Externals (no_version_directory)
#     use Python v* Externals (no_version_directory)
# use AlgLevelParallel v* /data/BOSSParallel/sniper/ParaPack (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use Boost v* Externals (no_version_directory)
#   use tbb v* Externals (no_version_directory)
#   use jsoncpp v* Externals (no_version_directory)
# use ROOT v* Externals (no_version_directory)
# use ALPDataIO v* /data/BOSSParallel/CEPCDataModel (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use ROOT v* Externals (no_version_directory)
#   use PODIO v* Externals (no_version_directory)
#
# Selection :
use CMT v1r25 (/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib)
use PODIO v0 Externals (/data/BOSSParallel/ExternalInterface)
use ROOT v0 Externals (/data/BOSSParallel/ExternalInterface)
use jsoncpp v0 Externals (/data/BOSSParallel/ExternalInterface)
use tbb v0 Externals (/data/BOSSParallel/ExternalInterface)
use Python v0 Externals (/data/BOSSParallel/ExternalInterface)
use Boost v0 Externals (/data/BOSSParallel/ExternalInterface)
use SniperPolicy v0  (/data/BOSSParallel/sniper)
use SniperKernel v2  (/data/BOSSParallel/sniper)
use ALPDataIO v0 (/data/BOSSParallel/CEPCDataModel)
use AlgLevelParallel v0 (/data/BOSSParallel/sniper/ParaPack)
----------> tags
CMTv1 (from CMTVERSION)
CMTr25 (from CMTVERSION)
CMTp0 (from CMTVERSION)
Linux (from uname) package [CMT] implies [Unix]
amd64_linux26 (from CMTCONFIG)
CEPCDataModel_no_config (from PROJECT) excludes [CEPCDataModel_config]
CEPCDataModel_root (from PROJECT) excludes [CEPCDataModel_no_root]
CEPCDataModel_cleanup (from PROJECT) excludes [CEPCDataModel_no_cleanup]
CEPCDataModel_scripts (from PROJECT) excludes [CEPCDataModel_no_scripts]
CEPCDataModel_prototypes (from PROJECT) excludes [CEPCDataModel_no_prototypes]
CEPCDataModel_with_installarea (from PROJECT) excludes [CEPCDataModel_without_installarea]
CEPCDataModel_without_version_directory (from PROJECT) excludes [CEPCDataModel_with_version_directory]
sniper_no_config (from PROJECT) excludes [sniper_config]
sniper_root (from PROJECT) excludes [sniper_no_root]
sniper_cleanup (from PROJECT) excludes [sniper_no_cleanup]
sniper_scripts (from PROJECT) excludes [sniper_no_scripts]
sniper_prototypes (from PROJECT) excludes [sniper_no_prototypes]
sniper_with_installarea (from PROJECT) excludes [sniper_without_installarea]
sniper_without_version_directory (from PROJECT) excludes [sniper_with_version_directory]
ExternalInterface_no_config (from PROJECT) excludes [ExternalInterface_config]
ExternalInterface_no_root (from PROJECT) excludes [ExternalInterface_root]
ExternalInterface_cleanup (from PROJECT) excludes [ExternalInterface_no_cleanup]
ExternalInterface_scripts (from PROJECT) excludes [ExternalInterface_no_scripts]
ExternalInterface_prototypes (from PROJECT) excludes [ExternalInterface_no_prototypes]
ExternalInterface_without_installarea (from PROJECT) excludes [ExternalInterface_with_installarea]
ExternalInterface_without_version_directory (from PROJECT) excludes [ExternalInterface_with_version_directory]
CEPCDataModel (from PROJECT)
x86_64 (from package CMT)
sl65 (from package CMT)
gcc830 (from package CMT)
Unix (from package CMT) excludes [WIN32 Win32]
----------> CMTPATH
# Add path /data/BOSSParallel/CEPCDataModel from initialization
# Add path /data/BOSSParallel/sniper from ProjectPath
# Add path /data/BOSSParallel/ExternalInterface from ProjectPath
