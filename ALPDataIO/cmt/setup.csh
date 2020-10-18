# echo "setup ALPDataIO v0 in /data/BOSSParallel/CEPCDataModel"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtALPDataIOtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtALPDataIOtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=ALPDataIO -version=v0 -path=/data/BOSSParallel/CEPCDataModel  -no_cleanup $* >${cmtALPDataIOtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=ALPDataIO -version=v0 -path=/data/BOSSParallel/CEPCDataModel  -no_cleanup $* >${cmtALPDataIOtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtALPDataIOtempfile}
  unset cmtALPDataIOtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtALPDataIOtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtALPDataIOtempfile}
unset cmtALPDataIOtempfile
exit $cmtsetupstatus
