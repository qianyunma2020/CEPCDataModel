# echo "setup UseCase v0 in /data/BOSSParallel/CEPCDataModel/Examples"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtUseCasetempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtUseCasetempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=UseCase -version=v0 -path=/data/BOSSParallel/CEPCDataModel/Examples  -no_cleanup $* >${cmtUseCasetempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=UseCase -version=v0 -path=/data/BOSSParallel/CEPCDataModel/Examples  -no_cleanup $* >${cmtUseCasetempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtUseCasetempfile}
  unset cmtUseCasetempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtUseCasetempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtUseCasetempfile}
unset cmtUseCasetempfile
return $cmtsetupstatus

