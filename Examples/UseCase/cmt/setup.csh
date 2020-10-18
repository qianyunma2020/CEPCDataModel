# echo "setup UseCase v0 in /data/BOSSParallel/CEPCDataModel/Examples"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtUseCasetempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtUseCasetempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=UseCase -version=v0 -path=/data/BOSSParallel/CEPCDataModel/Examples  -no_cleanup $* >${cmtUseCasetempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=UseCase -version=v0 -path=/data/BOSSParallel/CEPCDataModel/Examples  -no_cleanup $* >${cmtUseCasetempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtUseCasetempfile}
  unset cmtUseCasetempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtUseCasetempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtUseCasetempfile}
unset cmtUseCasetempfile
exit $cmtsetupstatus

