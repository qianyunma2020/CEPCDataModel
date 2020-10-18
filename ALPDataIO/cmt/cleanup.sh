# echo "cleanup ALPDataIO v0 in /data/BOSSParallel/CEPCDataModel"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtALPDataIOtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtALPDataIOtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=ALPDataIO -version=v0 -path=/data/BOSSParallel/CEPCDataModel  $* >${cmtALPDataIOtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=ALPDataIO -version=v0 -path=/data/BOSSParallel/CEPCDataModel  $* >${cmtALPDataIOtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtALPDataIOtempfile}
  unset cmtALPDataIOtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtALPDataIOtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtALPDataIOtempfile}
unset cmtALPDataIOtempfile
return $cmtcleanupstatus

