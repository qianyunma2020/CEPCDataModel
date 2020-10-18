# echo "cleanup UseCase v0 in /data/BOSSParallel/CEPCDataModel/Examples"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtUseCasetempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtUseCasetempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=UseCase -version=v0 -path=/data/BOSSParallel/CEPCDataModel/Examples  $* >${cmtUseCasetempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=UseCase -version=v0 -path=/data/BOSSParallel/CEPCDataModel/Examples  $* >${cmtUseCasetempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtUseCasetempfile}
  unset cmtUseCasetempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtUseCasetempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtUseCasetempfile}
unset cmtUseCasetempfile
exit $cmtcleanupstatus

