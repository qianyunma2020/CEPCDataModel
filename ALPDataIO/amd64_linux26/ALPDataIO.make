#-- start of make_header -----------------

#====================================
#  Library ALPDataIO
#
#   Generated Sun Oct  4 00:09:47 2020  by root
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_ALPDataIO_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ALPDataIO_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ALPDataIO

ALPDataIO_tag = $(tag)

#cmt_local_tagfile_ALPDataIO = $(ALPDataIO_tag)_ALPDataIO.make
cmt_local_tagfile_ALPDataIO = $(bin)$(ALPDataIO_tag)_ALPDataIO.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ALPDataIO_tag = $(tag)

#cmt_local_tagfile_ALPDataIO = $(ALPDataIO_tag).make
cmt_local_tagfile_ALPDataIO = $(bin)$(ALPDataIO_tag).make

endif

include $(cmt_local_tagfile_ALPDataIO)
#-include $(cmt_local_tagfile_ALPDataIO)

ifdef cmt_ALPDataIO_has_target_tag

cmt_final_setup_ALPDataIO = $(bin)setup_ALPDataIO.make
cmt_dependencies_in_ALPDataIO = $(bin)dependencies_ALPDataIO.in
#cmt_final_setup_ALPDataIO = $(bin)ALPDataIO_ALPDataIOsetup.make
cmt_local_ALPDataIO_makefile = $(bin)ALPDataIO.make

else

cmt_final_setup_ALPDataIO = $(bin)setup.make
cmt_dependencies_in_ALPDataIO = $(bin)dependencies.in
#cmt_final_setup_ALPDataIO = $(bin)ALPDataIOsetup.make
cmt_local_ALPDataIO_makefile = $(bin)ALPDataIO.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ALPDataIOsetup.make

#ALPDataIO :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ALPDataIO'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ALPDataIO/
#ALPDataIO::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

ALPDataIOlibname   = $(bin)$(library_prefix)ALPDataIO$(library_suffix)
ALPDataIOlib       = $(ALPDataIOlibname).a
ALPDataIOstamp     = $(bin)ALPDataIO.stamp
ALPDataIOshstamp   = $(bin)ALPDataIO.shstamp

ALPDataIO :: dirs  ALPDataIOLIB
	$(echo) "ALPDataIO ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

ALPDataIOLIB :: $(ALPDataIOlib) $(ALPDataIOshstamp)
	$(echo) "ALPDataIO : library ok"

$(ALPDataIOlib) :: $(bin)ExampleForCyclicDependency2Collection.o $(bin)ExampleForCyclicDependency1Const.o $(bin)EventInfoConst.o $(bin)ExampleWithComponentObj.o $(bin)ExampleWithOneRelationCollection.o $(bin)ExampleMCCollection.o $(bin)ExampleForCyclicDependency1.o $(bin)EventInfoCollection.o $(bin)ExampleForCyclicDependency1Collection.o $(bin)ExampleClusterObj.o $(bin)ExampleWithNamespace.o $(bin)ALPROOTWriter.o $(bin)ExampleWithArray.o $(bin)ALPFileOutputSvc.o $(bin)ExampleWithNamespaceCollection.o $(bin)ExampleWithARelationConst.o $(bin)ExampleWithARelation.o $(bin)ExampleWithVectorMemberConst.o $(bin)ExampleMCObj.o $(bin)ExampleWithNamespaceObj.o $(bin)ExampleReferencingTypeConst.o $(bin)EventInfoObj.o $(bin)ExampleWithOneRelationObj.o $(bin)ALPEventDataModel.o $(bin)ExampleWithComponentCollection.o $(bin)ExampleWithARelationObj.o $(bin)ExampleReferencingTypeObj.o $(bin)ExampleMC.o $(bin)ExampleWithArrayObj.o $(bin)ExampleWithArrayCollection.o $(bin)ExampleReferencingTypeCollection.o $(bin)ExampleHitObj.o $(bin)ExampleWithVectorMember.o $(bin)ALPFileInputSvc.o $(bin)ALPCommonUtil.o $(bin)ExampleWithString.o $(bin)ExampleWithVectorMemberCollection.o $(bin)ExampleWithNamespaceConst.o $(bin)ExampleWithARelationCollection.o $(bin)ExampleWithOneRelationConst.o $(bin)EventInfo.o $(bin)ExampleReferencingType.o $(bin)ExampleWithArrayConst.o $(bin)ExampleCluster.o $(bin)ExampleWithOneRelation.o $(bin)ExampleForCyclicDependency2.o $(bin)ExampleWithStringCollection.o $(bin)ExampleHitConst.o $(bin)ExampleForCyclicDependency2Const.o $(bin)ExampleForCyclicDependency2Obj.o $(bin)ExampleForCyclicDependency1Obj.o $(bin)ExampleHit.o $(bin)ExampleWithStringObj.o $(bin)ExampleMCConst.o $(bin)ExampleWithComponentConst.o $(bin)ExampleHitCollection.o $(bin)ExampleWithVectorMemberObj.o $(bin)ExampleWithStringConst.o $(bin)ExampleClusterCollection.o $(bin)ExampleClusterConst.o $(bin)ExampleWithComponent.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(ALPDataIOlib) $(bin)ExampleForCyclicDependency2Collection.o $(bin)ExampleForCyclicDependency1Const.o $(bin)EventInfoConst.o $(bin)ExampleWithComponentObj.o $(bin)ExampleWithOneRelationCollection.o $(bin)ExampleMCCollection.o $(bin)ExampleForCyclicDependency1.o $(bin)EventInfoCollection.o $(bin)ExampleForCyclicDependency1Collection.o $(bin)ExampleClusterObj.o $(bin)ExampleWithNamespace.o $(bin)ALPROOTWriter.o $(bin)ExampleWithArray.o $(bin)ALPFileOutputSvc.o $(bin)ExampleWithNamespaceCollection.o $(bin)ExampleWithARelationConst.o $(bin)ExampleWithARelation.o $(bin)ExampleWithVectorMemberConst.o $(bin)ExampleMCObj.o $(bin)ExampleWithNamespaceObj.o $(bin)ExampleReferencingTypeConst.o $(bin)EventInfoObj.o $(bin)ExampleWithOneRelationObj.o $(bin)ALPEventDataModel.o $(bin)ExampleWithComponentCollection.o $(bin)ExampleWithARelationObj.o $(bin)ExampleReferencingTypeObj.o $(bin)ExampleMC.o $(bin)ExampleWithArrayObj.o $(bin)ExampleWithArrayCollection.o $(bin)ExampleReferencingTypeCollection.o $(bin)ExampleHitObj.o $(bin)ExampleWithVectorMember.o $(bin)ALPFileInputSvc.o $(bin)ALPCommonUtil.o $(bin)ExampleWithString.o $(bin)ExampleWithVectorMemberCollection.o $(bin)ExampleWithNamespaceConst.o $(bin)ExampleWithARelationCollection.o $(bin)ExampleWithOneRelationConst.o $(bin)EventInfo.o $(bin)ExampleReferencingType.o $(bin)ExampleWithArrayConst.o $(bin)ExampleCluster.o $(bin)ExampleWithOneRelation.o $(bin)ExampleForCyclicDependency2.o $(bin)ExampleWithStringCollection.o $(bin)ExampleHitConst.o $(bin)ExampleForCyclicDependency2Const.o $(bin)ExampleForCyclicDependency2Obj.o $(bin)ExampleForCyclicDependency1Obj.o $(bin)ExampleHit.o $(bin)ExampleWithStringObj.o $(bin)ExampleMCConst.o $(bin)ExampleWithComponentConst.o $(bin)ExampleHitCollection.o $(bin)ExampleWithVectorMemberObj.o $(bin)ExampleWithStringConst.o $(bin)ExampleClusterCollection.o $(bin)ExampleClusterConst.o $(bin)ExampleWithComponent.o
	$(lib_silent) $(ranlib) $(ALPDataIOlib)
	$(lib_silent) cat /dev/null >$(ALPDataIOstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(ALPDataIOlibname).$(shlibsuffix) :: $(ALPDataIOlib) requirements $(use_requirements) $(ALPDataIOstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" ALPDataIO $(ALPDataIO_shlibflags)

$(ALPDataIOshstamp) :: $(ALPDataIOlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(ALPDataIOlibname).$(shlibsuffix) ; then cat /dev/null >$(ALPDataIOshstamp) ; fi

ALPDataIOclean ::
	$(cleanup_echo) objects ALPDataIO
	$(cleanup_silent) /bin/rm -f $(bin)ExampleForCyclicDependency2Collection.o $(bin)ExampleForCyclicDependency1Const.o $(bin)EventInfoConst.o $(bin)ExampleWithComponentObj.o $(bin)ExampleWithOneRelationCollection.o $(bin)ExampleMCCollection.o $(bin)ExampleForCyclicDependency1.o $(bin)EventInfoCollection.o $(bin)ExampleForCyclicDependency1Collection.o $(bin)ExampleClusterObj.o $(bin)ExampleWithNamespace.o $(bin)ALPROOTWriter.o $(bin)ExampleWithArray.o $(bin)ALPFileOutputSvc.o $(bin)ExampleWithNamespaceCollection.o $(bin)ExampleWithARelationConst.o $(bin)ExampleWithARelation.o $(bin)ExampleWithVectorMemberConst.o $(bin)ExampleMCObj.o $(bin)ExampleWithNamespaceObj.o $(bin)ExampleReferencingTypeConst.o $(bin)EventInfoObj.o $(bin)ExampleWithOneRelationObj.o $(bin)ALPEventDataModel.o $(bin)ExampleWithComponentCollection.o $(bin)ExampleWithARelationObj.o $(bin)ExampleReferencingTypeObj.o $(bin)ExampleMC.o $(bin)ExampleWithArrayObj.o $(bin)ExampleWithArrayCollection.o $(bin)ExampleReferencingTypeCollection.o $(bin)ExampleHitObj.o $(bin)ExampleWithVectorMember.o $(bin)ALPFileInputSvc.o $(bin)ALPCommonUtil.o $(bin)ExampleWithString.o $(bin)ExampleWithVectorMemberCollection.o $(bin)ExampleWithNamespaceConst.o $(bin)ExampleWithARelationCollection.o $(bin)ExampleWithOneRelationConst.o $(bin)EventInfo.o $(bin)ExampleReferencingType.o $(bin)ExampleWithArrayConst.o $(bin)ExampleCluster.o $(bin)ExampleWithOneRelation.o $(bin)ExampleForCyclicDependency2.o $(bin)ExampleWithStringCollection.o $(bin)ExampleHitConst.o $(bin)ExampleForCyclicDependency2Const.o $(bin)ExampleForCyclicDependency2Obj.o $(bin)ExampleForCyclicDependency1Obj.o $(bin)ExampleHit.o $(bin)ExampleWithStringObj.o $(bin)ExampleMCConst.o $(bin)ExampleWithComponentConst.o $(bin)ExampleHitCollection.o $(bin)ExampleWithVectorMemberObj.o $(bin)ExampleWithStringConst.o $(bin)ExampleClusterCollection.o $(bin)ExampleClusterConst.o $(bin)ExampleWithComponent.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)ExampleForCyclicDependency2Collection.o $(bin)ExampleForCyclicDependency1Const.o $(bin)EventInfoConst.o $(bin)ExampleWithComponentObj.o $(bin)ExampleWithOneRelationCollection.o $(bin)ExampleMCCollection.o $(bin)ExampleForCyclicDependency1.o $(bin)EventInfoCollection.o $(bin)ExampleForCyclicDependency1Collection.o $(bin)ExampleClusterObj.o $(bin)ExampleWithNamespace.o $(bin)ALPROOTWriter.o $(bin)ExampleWithArray.o $(bin)ALPFileOutputSvc.o $(bin)ExampleWithNamespaceCollection.o $(bin)ExampleWithARelationConst.o $(bin)ExampleWithARelation.o $(bin)ExampleWithVectorMemberConst.o $(bin)ExampleMCObj.o $(bin)ExampleWithNamespaceObj.o $(bin)ExampleReferencingTypeConst.o $(bin)EventInfoObj.o $(bin)ExampleWithOneRelationObj.o $(bin)ALPEventDataModel.o $(bin)ExampleWithComponentCollection.o $(bin)ExampleWithARelationObj.o $(bin)ExampleReferencingTypeObj.o $(bin)ExampleMC.o $(bin)ExampleWithArrayObj.o $(bin)ExampleWithArrayCollection.o $(bin)ExampleReferencingTypeCollection.o $(bin)ExampleHitObj.o $(bin)ExampleWithVectorMember.o $(bin)ALPFileInputSvc.o $(bin)ALPCommonUtil.o $(bin)ExampleWithString.o $(bin)ExampleWithVectorMemberCollection.o $(bin)ExampleWithNamespaceConst.o $(bin)ExampleWithARelationCollection.o $(bin)ExampleWithOneRelationConst.o $(bin)EventInfo.o $(bin)ExampleReferencingType.o $(bin)ExampleWithArrayConst.o $(bin)ExampleCluster.o $(bin)ExampleWithOneRelation.o $(bin)ExampleForCyclicDependency2.o $(bin)ExampleWithStringCollection.o $(bin)ExampleHitConst.o $(bin)ExampleForCyclicDependency2Const.o $(bin)ExampleForCyclicDependency2Obj.o $(bin)ExampleForCyclicDependency1Obj.o $(bin)ExampleHit.o $(bin)ExampleWithStringObj.o $(bin)ExampleMCConst.o $(bin)ExampleWithComponentConst.o $(bin)ExampleHitCollection.o $(bin)ExampleWithVectorMemberObj.o $(bin)ExampleWithStringConst.o $(bin)ExampleClusterCollection.o $(bin)ExampleClusterConst.o $(bin)ExampleWithComponent.o) $(patsubst %.o,%.dep,$(bin)ExampleForCyclicDependency2Collection.o $(bin)ExampleForCyclicDependency1Const.o $(bin)EventInfoConst.o $(bin)ExampleWithComponentObj.o $(bin)ExampleWithOneRelationCollection.o $(bin)ExampleMCCollection.o $(bin)ExampleForCyclicDependency1.o $(bin)EventInfoCollection.o $(bin)ExampleForCyclicDependency1Collection.o $(bin)ExampleClusterObj.o $(bin)ExampleWithNamespace.o $(bin)ALPROOTWriter.o $(bin)ExampleWithArray.o $(bin)ALPFileOutputSvc.o $(bin)ExampleWithNamespaceCollection.o $(bin)ExampleWithARelationConst.o $(bin)ExampleWithARelation.o $(bin)ExampleWithVectorMemberConst.o $(bin)ExampleMCObj.o $(bin)ExampleWithNamespaceObj.o $(bin)ExampleReferencingTypeConst.o $(bin)EventInfoObj.o $(bin)ExampleWithOneRelationObj.o $(bin)ALPEventDataModel.o $(bin)ExampleWithComponentCollection.o $(bin)ExampleWithARelationObj.o $(bin)ExampleReferencingTypeObj.o $(bin)ExampleMC.o $(bin)ExampleWithArrayObj.o $(bin)ExampleWithArrayCollection.o $(bin)ExampleReferencingTypeCollection.o $(bin)ExampleHitObj.o $(bin)ExampleWithVectorMember.o $(bin)ALPFileInputSvc.o $(bin)ALPCommonUtil.o $(bin)ExampleWithString.o $(bin)ExampleWithVectorMemberCollection.o $(bin)ExampleWithNamespaceConst.o $(bin)ExampleWithARelationCollection.o $(bin)ExampleWithOneRelationConst.o $(bin)EventInfo.o $(bin)ExampleReferencingType.o $(bin)ExampleWithArrayConst.o $(bin)ExampleCluster.o $(bin)ExampleWithOneRelation.o $(bin)ExampleForCyclicDependency2.o $(bin)ExampleWithStringCollection.o $(bin)ExampleHitConst.o $(bin)ExampleForCyclicDependency2Const.o $(bin)ExampleForCyclicDependency2Obj.o $(bin)ExampleForCyclicDependency1Obj.o $(bin)ExampleHit.o $(bin)ExampleWithStringObj.o $(bin)ExampleMCConst.o $(bin)ExampleWithComponentConst.o $(bin)ExampleHitCollection.o $(bin)ExampleWithVectorMemberObj.o $(bin)ExampleWithStringConst.o $(bin)ExampleClusterCollection.o $(bin)ExampleClusterConst.o $(bin)ExampleWithComponent.o) $(patsubst %.o,%.d.stamp,$(bin)ExampleForCyclicDependency2Collection.o $(bin)ExampleForCyclicDependency1Const.o $(bin)EventInfoConst.o $(bin)ExampleWithComponentObj.o $(bin)ExampleWithOneRelationCollection.o $(bin)ExampleMCCollection.o $(bin)ExampleForCyclicDependency1.o $(bin)EventInfoCollection.o $(bin)ExampleForCyclicDependency1Collection.o $(bin)ExampleClusterObj.o $(bin)ExampleWithNamespace.o $(bin)ALPROOTWriter.o $(bin)ExampleWithArray.o $(bin)ALPFileOutputSvc.o $(bin)ExampleWithNamespaceCollection.o $(bin)ExampleWithARelationConst.o $(bin)ExampleWithARelation.o $(bin)ExampleWithVectorMemberConst.o $(bin)ExampleMCObj.o $(bin)ExampleWithNamespaceObj.o $(bin)ExampleReferencingTypeConst.o $(bin)EventInfoObj.o $(bin)ExampleWithOneRelationObj.o $(bin)ALPEventDataModel.o $(bin)ExampleWithComponentCollection.o $(bin)ExampleWithARelationObj.o $(bin)ExampleReferencingTypeObj.o $(bin)ExampleMC.o $(bin)ExampleWithArrayObj.o $(bin)ExampleWithArrayCollection.o $(bin)ExampleReferencingTypeCollection.o $(bin)ExampleHitObj.o $(bin)ExampleWithVectorMember.o $(bin)ALPFileInputSvc.o $(bin)ALPCommonUtil.o $(bin)ExampleWithString.o $(bin)ExampleWithVectorMemberCollection.o $(bin)ExampleWithNamespaceConst.o $(bin)ExampleWithARelationCollection.o $(bin)ExampleWithOneRelationConst.o $(bin)EventInfo.o $(bin)ExampleReferencingType.o $(bin)ExampleWithArrayConst.o $(bin)ExampleCluster.o $(bin)ExampleWithOneRelation.o $(bin)ExampleForCyclicDependency2.o $(bin)ExampleWithStringCollection.o $(bin)ExampleHitConst.o $(bin)ExampleForCyclicDependency2Const.o $(bin)ExampleForCyclicDependency2Obj.o $(bin)ExampleForCyclicDependency1Obj.o $(bin)ExampleHit.o $(bin)ExampleWithStringObj.o $(bin)ExampleMCConst.o $(bin)ExampleWithComponentConst.o $(bin)ExampleHitCollection.o $(bin)ExampleWithVectorMemberObj.o $(bin)ExampleWithStringConst.o $(bin)ExampleClusterCollection.o $(bin)ExampleClusterConst.o $(bin)ExampleWithComponent.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf ALPDataIO_deps ALPDataIO_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
ALPDataIOinstallname = $(library_prefix)ALPDataIO$(library_suffix).$(shlibsuffix)

ALPDataIO :: ALPDataIOinstall ;

install :: ALPDataIOinstall ;

ALPDataIOinstall :: $(install_dir)/$(ALPDataIOinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(ALPDataIOinstallname) :: $(bin)$(ALPDataIOinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(ALPDataIOinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##ALPDataIOclean :: ALPDataIOuninstall

uninstall :: ALPDataIOuninstall ;

ALPDataIOuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(ALPDataIOinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)

$(bin)ALPDataIO_dependencies.make : $(use_requirements) $(cmt_final_setup_ALPDataIO)
	$(echo) "(ALPDataIO.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)ExampleForCyclicDependency2Collection.cc $(src)ExampleForCyclicDependency1Const.cc $(src)EventInfoConst.cc $(src)ExampleWithComponentObj.cc $(src)ExampleWithOneRelationCollection.cc $(src)ExampleMCCollection.cc $(src)ExampleForCyclicDependency1.cc $(src)EventInfoCollection.cc $(src)ExampleForCyclicDependency1Collection.cc $(src)ExampleClusterObj.cc $(src)ExampleWithNamespace.cc $(src)ALPROOTWriter.cc $(src)ExampleWithArray.cc $(src)ALPFileOutputSvc.cc $(src)ExampleWithNamespaceCollection.cc $(src)ExampleWithARelationConst.cc $(src)ExampleWithARelation.cc $(src)ExampleWithVectorMemberConst.cc $(src)ExampleMCObj.cc $(src)ExampleWithNamespaceObj.cc $(src)ExampleReferencingTypeConst.cc $(src)EventInfoObj.cc $(src)ExampleWithOneRelationObj.cc $(src)ALPEventDataModel.cc $(src)ExampleWithComponentCollection.cc $(src)ExampleWithARelationObj.cc $(src)ExampleReferencingTypeObj.cc $(src)ExampleMC.cc $(src)ExampleWithArrayObj.cc $(src)ExampleWithArrayCollection.cc $(src)ExampleReferencingTypeCollection.cc $(src)ExampleHitObj.cc $(src)ExampleWithVectorMember.cc $(src)ALPFileInputSvc.cc $(src)ALPCommonUtil.cc $(src)ExampleWithString.cc $(src)ExampleWithVectorMemberCollection.cc $(src)ExampleWithNamespaceConst.cc $(src)ExampleWithARelationCollection.cc $(src)ExampleWithOneRelationConst.cc $(src)EventInfo.cc $(src)ExampleReferencingType.cc $(src)ExampleWithArrayConst.cc $(src)ExampleCluster.cc $(src)ExampleWithOneRelation.cc $(src)ExampleForCyclicDependency2.cc $(src)ExampleWithStringCollection.cc $(src)ExampleHitConst.cc $(src)ExampleForCyclicDependency2Const.cc $(src)ExampleForCyclicDependency2Obj.cc $(src)ExampleForCyclicDependency1Obj.cc $(src)ExampleHit.cc $(src)ExampleWithStringObj.cc $(src)ExampleMCConst.cc $(src)ExampleWithComponentConst.cc $(src)ExampleHitCollection.cc $(src)ExampleWithVectorMemberObj.cc $(src)ExampleWithStringConst.cc $(src)ExampleClusterCollection.cc $(src)ExampleClusterConst.cc $(src)ExampleWithComponent.cc -end_all $(includes) $(app_ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) -name=ALPDataIO $? -f=$(cmt_dependencies_in_ALPDataIO) -without_cmt

-include $(bin)ALPDataIO_dependencies.make

endif
endif

ALPDataIOclean ::
	$(cleanup_silent) \rm -rf $(bin)ALPDataIO_deps $(bin)ALPDataIO_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency2Collection.d

$(bin)$(binobj)ExampleForCyclicDependency2Collection.d :

$(bin)$(binobj)ExampleForCyclicDependency2Collection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency2Collection.o : $(src)ExampleForCyclicDependency2Collection.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency2Collection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2Collection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2Collection_cppflags) $(ExampleForCyclicDependency2Collection_cc_cppflags)  $(src)ExampleForCyclicDependency2Collection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency2Collection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency2Collection.cc

$(bin)$(binobj)ExampleForCyclicDependency2Collection.o : $(ExampleForCyclicDependency2Collection_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency2Collection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2Collection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2Collection_cppflags) $(ExampleForCyclicDependency2Collection_cc_cppflags)  $(src)ExampleForCyclicDependency2Collection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency1Const.d

$(bin)$(binobj)ExampleForCyclicDependency1Const.d :

$(bin)$(binobj)ExampleForCyclicDependency1Const.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency1Const.o : $(src)ExampleForCyclicDependency1Const.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency1Const.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1Const_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1Const_cppflags) $(ExampleForCyclicDependency1Const_cc_cppflags)  $(src)ExampleForCyclicDependency1Const.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency1Const_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency1Const.cc

$(bin)$(binobj)ExampleForCyclicDependency1Const.o : $(ExampleForCyclicDependency1Const_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency1Const.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1Const_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1Const_cppflags) $(ExampleForCyclicDependency1Const_cc_cppflags)  $(src)ExampleForCyclicDependency1Const.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventInfoConst.d

$(bin)$(binobj)EventInfoConst.d :

$(bin)$(binobj)EventInfoConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)EventInfoConst.o : $(src)EventInfoConst.cc
	$(cpp_echo) $(src)EventInfoConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfoConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfoConst_cppflags) $(EventInfoConst_cc_cppflags)  $(src)EventInfoConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(EventInfoConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)EventInfoConst.cc

$(bin)$(binobj)EventInfoConst.o : $(EventInfoConst_cc_dependencies)
	$(cpp_echo) $(src)EventInfoConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfoConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfoConst_cppflags) $(EventInfoConst_cc_cppflags)  $(src)EventInfoConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithComponentObj.d

$(bin)$(binobj)ExampleWithComponentObj.d :

$(bin)$(binobj)ExampleWithComponentObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithComponentObj.o : $(src)ExampleWithComponentObj.cc
	$(cpp_echo) $(src)ExampleWithComponentObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponentObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponentObj_cppflags) $(ExampleWithComponentObj_cc_cppflags)  $(src)ExampleWithComponentObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithComponentObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithComponentObj.cc

$(bin)$(binobj)ExampleWithComponentObj.o : $(ExampleWithComponentObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithComponentObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponentObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponentObj_cppflags) $(ExampleWithComponentObj_cc_cppflags)  $(src)ExampleWithComponentObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithOneRelationCollection.d

$(bin)$(binobj)ExampleWithOneRelationCollection.d :

$(bin)$(binobj)ExampleWithOneRelationCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithOneRelationCollection.o : $(src)ExampleWithOneRelationCollection.cc
	$(cpp_echo) $(src)ExampleWithOneRelationCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelationCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelationCollection_cppflags) $(ExampleWithOneRelationCollection_cc_cppflags)  $(src)ExampleWithOneRelationCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithOneRelationCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithOneRelationCollection.cc

$(bin)$(binobj)ExampleWithOneRelationCollection.o : $(ExampleWithOneRelationCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithOneRelationCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelationCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelationCollection_cppflags) $(ExampleWithOneRelationCollection_cc_cppflags)  $(src)ExampleWithOneRelationCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleMCCollection.d

$(bin)$(binobj)ExampleMCCollection.d :

$(bin)$(binobj)ExampleMCCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleMCCollection.o : $(src)ExampleMCCollection.cc
	$(cpp_echo) $(src)ExampleMCCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMCCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMCCollection_cppflags) $(ExampleMCCollection_cc_cppflags)  $(src)ExampleMCCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleMCCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleMCCollection.cc

$(bin)$(binobj)ExampleMCCollection.o : $(ExampleMCCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleMCCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMCCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMCCollection_cppflags) $(ExampleMCCollection_cc_cppflags)  $(src)ExampleMCCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency1.d

$(bin)$(binobj)ExampleForCyclicDependency1.d :

$(bin)$(binobj)ExampleForCyclicDependency1.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency1.o : $(src)ExampleForCyclicDependency1.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency1.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1_cppflags) $(ExampleForCyclicDependency1_cc_cppflags)  $(src)ExampleForCyclicDependency1.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency1_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency1.cc

$(bin)$(binobj)ExampleForCyclicDependency1.o : $(ExampleForCyclicDependency1_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency1.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1_cppflags) $(ExampleForCyclicDependency1_cc_cppflags)  $(src)ExampleForCyclicDependency1.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventInfoCollection.d

$(bin)$(binobj)EventInfoCollection.d :

$(bin)$(binobj)EventInfoCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)EventInfoCollection.o : $(src)EventInfoCollection.cc
	$(cpp_echo) $(src)EventInfoCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfoCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfoCollection_cppflags) $(EventInfoCollection_cc_cppflags)  $(src)EventInfoCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(EventInfoCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)EventInfoCollection.cc

$(bin)$(binobj)EventInfoCollection.o : $(EventInfoCollection_cc_dependencies)
	$(cpp_echo) $(src)EventInfoCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfoCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfoCollection_cppflags) $(EventInfoCollection_cc_cppflags)  $(src)EventInfoCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency1Collection.d

$(bin)$(binobj)ExampleForCyclicDependency1Collection.d :

$(bin)$(binobj)ExampleForCyclicDependency1Collection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency1Collection.o : $(src)ExampleForCyclicDependency1Collection.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency1Collection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1Collection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1Collection_cppflags) $(ExampleForCyclicDependency1Collection_cc_cppflags)  $(src)ExampleForCyclicDependency1Collection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency1Collection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency1Collection.cc

$(bin)$(binobj)ExampleForCyclicDependency1Collection.o : $(ExampleForCyclicDependency1Collection_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency1Collection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1Collection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1Collection_cppflags) $(ExampleForCyclicDependency1Collection_cc_cppflags)  $(src)ExampleForCyclicDependency1Collection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleClusterObj.d

$(bin)$(binobj)ExampleClusterObj.d :

$(bin)$(binobj)ExampleClusterObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleClusterObj.o : $(src)ExampleClusterObj.cc
	$(cpp_echo) $(src)ExampleClusterObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleClusterObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleClusterObj_cppflags) $(ExampleClusterObj_cc_cppflags)  $(src)ExampleClusterObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleClusterObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleClusterObj.cc

$(bin)$(binobj)ExampleClusterObj.o : $(ExampleClusterObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleClusterObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleClusterObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleClusterObj_cppflags) $(ExampleClusterObj_cc_cppflags)  $(src)ExampleClusterObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithNamespace.d

$(bin)$(binobj)ExampleWithNamespace.d :

$(bin)$(binobj)ExampleWithNamespace.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithNamespace.o : $(src)ExampleWithNamespace.cc
	$(cpp_echo) $(src)ExampleWithNamespace.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespace_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespace_cppflags) $(ExampleWithNamespace_cc_cppflags)  $(src)ExampleWithNamespace.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithNamespace_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithNamespace.cc

$(bin)$(binobj)ExampleWithNamespace.o : $(ExampleWithNamespace_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithNamespace.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespace_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespace_cppflags) $(ExampleWithNamespace_cc_cppflags)  $(src)ExampleWithNamespace.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ALPROOTWriter.d

$(bin)$(binobj)ALPROOTWriter.d :

$(bin)$(binobj)ALPROOTWriter.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ALPROOTWriter.o : $(src)ALPROOTWriter.cc
	$(cpp_echo) $(src)ALPROOTWriter.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPROOTWriter_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPROOTWriter_cppflags) $(ALPROOTWriter_cc_cppflags)  $(src)ALPROOTWriter.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ALPROOTWriter_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ALPROOTWriter.cc

$(bin)$(binobj)ALPROOTWriter.o : $(ALPROOTWriter_cc_dependencies)
	$(cpp_echo) $(src)ALPROOTWriter.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPROOTWriter_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPROOTWriter_cppflags) $(ALPROOTWriter_cc_cppflags)  $(src)ALPROOTWriter.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithArray.d

$(bin)$(binobj)ExampleWithArray.d :

$(bin)$(binobj)ExampleWithArray.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithArray.o : $(src)ExampleWithArray.cc
	$(cpp_echo) $(src)ExampleWithArray.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArray_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArray_cppflags) $(ExampleWithArray_cc_cppflags)  $(src)ExampleWithArray.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithArray_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithArray.cc

$(bin)$(binobj)ExampleWithArray.o : $(ExampleWithArray_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithArray.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArray_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArray_cppflags) $(ExampleWithArray_cc_cppflags)  $(src)ExampleWithArray.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ALPFileOutputSvc.d

$(bin)$(binobj)ALPFileOutputSvc.d :

$(bin)$(binobj)ALPFileOutputSvc.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ALPFileOutputSvc.o : $(src)ALPFileOutputSvc.cc
	$(cpp_echo) $(src)ALPFileOutputSvc.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPFileOutputSvc_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPFileOutputSvc_cppflags) $(ALPFileOutputSvc_cc_cppflags)  $(src)ALPFileOutputSvc.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ALPFileOutputSvc_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ALPFileOutputSvc.cc

$(bin)$(binobj)ALPFileOutputSvc.o : $(ALPFileOutputSvc_cc_dependencies)
	$(cpp_echo) $(src)ALPFileOutputSvc.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPFileOutputSvc_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPFileOutputSvc_cppflags) $(ALPFileOutputSvc_cc_cppflags)  $(src)ALPFileOutputSvc.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithNamespaceCollection.d

$(bin)$(binobj)ExampleWithNamespaceCollection.d :

$(bin)$(binobj)ExampleWithNamespaceCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithNamespaceCollection.o : $(src)ExampleWithNamespaceCollection.cc
	$(cpp_echo) $(src)ExampleWithNamespaceCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespaceCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespaceCollection_cppflags) $(ExampleWithNamespaceCollection_cc_cppflags)  $(src)ExampleWithNamespaceCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithNamespaceCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithNamespaceCollection.cc

$(bin)$(binobj)ExampleWithNamespaceCollection.o : $(ExampleWithNamespaceCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithNamespaceCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespaceCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespaceCollection_cppflags) $(ExampleWithNamespaceCollection_cc_cppflags)  $(src)ExampleWithNamespaceCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithARelationConst.d

$(bin)$(binobj)ExampleWithARelationConst.d :

$(bin)$(binobj)ExampleWithARelationConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithARelationConst.o : $(src)ExampleWithARelationConst.cc
	$(cpp_echo) $(src)ExampleWithARelationConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelationConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelationConst_cppflags) $(ExampleWithARelationConst_cc_cppflags)  $(src)ExampleWithARelationConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithARelationConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithARelationConst.cc

$(bin)$(binobj)ExampleWithARelationConst.o : $(ExampleWithARelationConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithARelationConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelationConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelationConst_cppflags) $(ExampleWithARelationConst_cc_cppflags)  $(src)ExampleWithARelationConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithARelation.d

$(bin)$(binobj)ExampleWithARelation.d :

$(bin)$(binobj)ExampleWithARelation.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithARelation.o : $(src)ExampleWithARelation.cc
	$(cpp_echo) $(src)ExampleWithARelation.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelation_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelation_cppflags) $(ExampleWithARelation_cc_cppflags)  $(src)ExampleWithARelation.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithARelation_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithARelation.cc

$(bin)$(binobj)ExampleWithARelation.o : $(ExampleWithARelation_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithARelation.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelation_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelation_cppflags) $(ExampleWithARelation_cc_cppflags)  $(src)ExampleWithARelation.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithVectorMemberConst.d

$(bin)$(binobj)ExampleWithVectorMemberConst.d :

$(bin)$(binobj)ExampleWithVectorMemberConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithVectorMemberConst.o : $(src)ExampleWithVectorMemberConst.cc
	$(cpp_echo) $(src)ExampleWithVectorMemberConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMemberConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMemberConst_cppflags) $(ExampleWithVectorMemberConst_cc_cppflags)  $(src)ExampleWithVectorMemberConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithVectorMemberConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithVectorMemberConst.cc

$(bin)$(binobj)ExampleWithVectorMemberConst.o : $(ExampleWithVectorMemberConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithVectorMemberConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMemberConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMemberConst_cppflags) $(ExampleWithVectorMemberConst_cc_cppflags)  $(src)ExampleWithVectorMemberConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleMCObj.d

$(bin)$(binobj)ExampleMCObj.d :

$(bin)$(binobj)ExampleMCObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleMCObj.o : $(src)ExampleMCObj.cc
	$(cpp_echo) $(src)ExampleMCObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMCObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMCObj_cppflags) $(ExampleMCObj_cc_cppflags)  $(src)ExampleMCObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleMCObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleMCObj.cc

$(bin)$(binobj)ExampleMCObj.o : $(ExampleMCObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleMCObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMCObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMCObj_cppflags) $(ExampleMCObj_cc_cppflags)  $(src)ExampleMCObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithNamespaceObj.d

$(bin)$(binobj)ExampleWithNamespaceObj.d :

$(bin)$(binobj)ExampleWithNamespaceObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithNamespaceObj.o : $(src)ExampleWithNamespaceObj.cc
	$(cpp_echo) $(src)ExampleWithNamespaceObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespaceObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespaceObj_cppflags) $(ExampleWithNamespaceObj_cc_cppflags)  $(src)ExampleWithNamespaceObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithNamespaceObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithNamespaceObj.cc

$(bin)$(binobj)ExampleWithNamespaceObj.o : $(ExampleWithNamespaceObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithNamespaceObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespaceObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespaceObj_cppflags) $(ExampleWithNamespaceObj_cc_cppflags)  $(src)ExampleWithNamespaceObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleReferencingTypeConst.d

$(bin)$(binobj)ExampleReferencingTypeConst.d :

$(bin)$(binobj)ExampleReferencingTypeConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleReferencingTypeConst.o : $(src)ExampleReferencingTypeConst.cc
	$(cpp_echo) $(src)ExampleReferencingTypeConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingTypeConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingTypeConst_cppflags) $(ExampleReferencingTypeConst_cc_cppflags)  $(src)ExampleReferencingTypeConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleReferencingTypeConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleReferencingTypeConst.cc

$(bin)$(binobj)ExampleReferencingTypeConst.o : $(ExampleReferencingTypeConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleReferencingTypeConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingTypeConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingTypeConst_cppflags) $(ExampleReferencingTypeConst_cc_cppflags)  $(src)ExampleReferencingTypeConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventInfoObj.d

$(bin)$(binobj)EventInfoObj.d :

$(bin)$(binobj)EventInfoObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)EventInfoObj.o : $(src)EventInfoObj.cc
	$(cpp_echo) $(src)EventInfoObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfoObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfoObj_cppflags) $(EventInfoObj_cc_cppflags)  $(src)EventInfoObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(EventInfoObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)EventInfoObj.cc

$(bin)$(binobj)EventInfoObj.o : $(EventInfoObj_cc_dependencies)
	$(cpp_echo) $(src)EventInfoObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfoObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfoObj_cppflags) $(EventInfoObj_cc_cppflags)  $(src)EventInfoObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithOneRelationObj.d

$(bin)$(binobj)ExampleWithOneRelationObj.d :

$(bin)$(binobj)ExampleWithOneRelationObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithOneRelationObj.o : $(src)ExampleWithOneRelationObj.cc
	$(cpp_echo) $(src)ExampleWithOneRelationObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelationObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelationObj_cppflags) $(ExampleWithOneRelationObj_cc_cppflags)  $(src)ExampleWithOneRelationObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithOneRelationObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithOneRelationObj.cc

$(bin)$(binobj)ExampleWithOneRelationObj.o : $(ExampleWithOneRelationObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithOneRelationObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelationObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelationObj_cppflags) $(ExampleWithOneRelationObj_cc_cppflags)  $(src)ExampleWithOneRelationObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ALPEventDataModel.d

$(bin)$(binobj)ALPEventDataModel.d :

$(bin)$(binobj)ALPEventDataModel.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ALPEventDataModel.o : $(src)ALPEventDataModel.cc
	$(cpp_echo) $(src)ALPEventDataModel.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPEventDataModel_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPEventDataModel_cppflags) $(ALPEventDataModel_cc_cppflags)  $(src)ALPEventDataModel.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ALPEventDataModel_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ALPEventDataModel.cc

$(bin)$(binobj)ALPEventDataModel.o : $(ALPEventDataModel_cc_dependencies)
	$(cpp_echo) $(src)ALPEventDataModel.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPEventDataModel_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPEventDataModel_cppflags) $(ALPEventDataModel_cc_cppflags)  $(src)ALPEventDataModel.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithComponentCollection.d

$(bin)$(binobj)ExampleWithComponentCollection.d :

$(bin)$(binobj)ExampleWithComponentCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithComponentCollection.o : $(src)ExampleWithComponentCollection.cc
	$(cpp_echo) $(src)ExampleWithComponentCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponentCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponentCollection_cppflags) $(ExampleWithComponentCollection_cc_cppflags)  $(src)ExampleWithComponentCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithComponentCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithComponentCollection.cc

$(bin)$(binobj)ExampleWithComponentCollection.o : $(ExampleWithComponentCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithComponentCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponentCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponentCollection_cppflags) $(ExampleWithComponentCollection_cc_cppflags)  $(src)ExampleWithComponentCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithARelationObj.d

$(bin)$(binobj)ExampleWithARelationObj.d :

$(bin)$(binobj)ExampleWithARelationObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithARelationObj.o : $(src)ExampleWithARelationObj.cc
	$(cpp_echo) $(src)ExampleWithARelationObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelationObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelationObj_cppflags) $(ExampleWithARelationObj_cc_cppflags)  $(src)ExampleWithARelationObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithARelationObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithARelationObj.cc

$(bin)$(binobj)ExampleWithARelationObj.o : $(ExampleWithARelationObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithARelationObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelationObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelationObj_cppflags) $(ExampleWithARelationObj_cc_cppflags)  $(src)ExampleWithARelationObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleReferencingTypeObj.d

$(bin)$(binobj)ExampleReferencingTypeObj.d :

$(bin)$(binobj)ExampleReferencingTypeObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleReferencingTypeObj.o : $(src)ExampleReferencingTypeObj.cc
	$(cpp_echo) $(src)ExampleReferencingTypeObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingTypeObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingTypeObj_cppflags) $(ExampleReferencingTypeObj_cc_cppflags)  $(src)ExampleReferencingTypeObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleReferencingTypeObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleReferencingTypeObj.cc

$(bin)$(binobj)ExampleReferencingTypeObj.o : $(ExampleReferencingTypeObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleReferencingTypeObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingTypeObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingTypeObj_cppflags) $(ExampleReferencingTypeObj_cc_cppflags)  $(src)ExampleReferencingTypeObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleMC.d

$(bin)$(binobj)ExampleMC.d :

$(bin)$(binobj)ExampleMC.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleMC.o : $(src)ExampleMC.cc
	$(cpp_echo) $(src)ExampleMC.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMC_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMC_cppflags) $(ExampleMC_cc_cppflags)  $(src)ExampleMC.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleMC_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleMC.cc

$(bin)$(binobj)ExampleMC.o : $(ExampleMC_cc_dependencies)
	$(cpp_echo) $(src)ExampleMC.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMC_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMC_cppflags) $(ExampleMC_cc_cppflags)  $(src)ExampleMC.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithArrayObj.d

$(bin)$(binobj)ExampleWithArrayObj.d :

$(bin)$(binobj)ExampleWithArrayObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithArrayObj.o : $(src)ExampleWithArrayObj.cc
	$(cpp_echo) $(src)ExampleWithArrayObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArrayObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArrayObj_cppflags) $(ExampleWithArrayObj_cc_cppflags)  $(src)ExampleWithArrayObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithArrayObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithArrayObj.cc

$(bin)$(binobj)ExampleWithArrayObj.o : $(ExampleWithArrayObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithArrayObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArrayObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArrayObj_cppflags) $(ExampleWithArrayObj_cc_cppflags)  $(src)ExampleWithArrayObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithArrayCollection.d

$(bin)$(binobj)ExampleWithArrayCollection.d :

$(bin)$(binobj)ExampleWithArrayCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithArrayCollection.o : $(src)ExampleWithArrayCollection.cc
	$(cpp_echo) $(src)ExampleWithArrayCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArrayCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArrayCollection_cppflags) $(ExampleWithArrayCollection_cc_cppflags)  $(src)ExampleWithArrayCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithArrayCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithArrayCollection.cc

$(bin)$(binobj)ExampleWithArrayCollection.o : $(ExampleWithArrayCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithArrayCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArrayCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArrayCollection_cppflags) $(ExampleWithArrayCollection_cc_cppflags)  $(src)ExampleWithArrayCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleReferencingTypeCollection.d

$(bin)$(binobj)ExampleReferencingTypeCollection.d :

$(bin)$(binobj)ExampleReferencingTypeCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleReferencingTypeCollection.o : $(src)ExampleReferencingTypeCollection.cc
	$(cpp_echo) $(src)ExampleReferencingTypeCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingTypeCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingTypeCollection_cppflags) $(ExampleReferencingTypeCollection_cc_cppflags)  $(src)ExampleReferencingTypeCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleReferencingTypeCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleReferencingTypeCollection.cc

$(bin)$(binobj)ExampleReferencingTypeCollection.o : $(ExampleReferencingTypeCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleReferencingTypeCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingTypeCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingTypeCollection_cppflags) $(ExampleReferencingTypeCollection_cc_cppflags)  $(src)ExampleReferencingTypeCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleHitObj.d

$(bin)$(binobj)ExampleHitObj.d :

$(bin)$(binobj)ExampleHitObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleHitObj.o : $(src)ExampleHitObj.cc
	$(cpp_echo) $(src)ExampleHitObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHitObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHitObj_cppflags) $(ExampleHitObj_cc_cppflags)  $(src)ExampleHitObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleHitObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleHitObj.cc

$(bin)$(binobj)ExampleHitObj.o : $(ExampleHitObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleHitObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHitObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHitObj_cppflags) $(ExampleHitObj_cc_cppflags)  $(src)ExampleHitObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithVectorMember.d

$(bin)$(binobj)ExampleWithVectorMember.d :

$(bin)$(binobj)ExampleWithVectorMember.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithVectorMember.o : $(src)ExampleWithVectorMember.cc
	$(cpp_echo) $(src)ExampleWithVectorMember.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMember_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMember_cppflags) $(ExampleWithVectorMember_cc_cppflags)  $(src)ExampleWithVectorMember.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithVectorMember_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithVectorMember.cc

$(bin)$(binobj)ExampleWithVectorMember.o : $(ExampleWithVectorMember_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithVectorMember.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMember_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMember_cppflags) $(ExampleWithVectorMember_cc_cppflags)  $(src)ExampleWithVectorMember.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ALPFileInputSvc.d

$(bin)$(binobj)ALPFileInputSvc.d :

$(bin)$(binobj)ALPFileInputSvc.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ALPFileInputSvc.o : $(src)ALPFileInputSvc.cc
	$(cpp_echo) $(src)ALPFileInputSvc.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPFileInputSvc_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPFileInputSvc_cppflags) $(ALPFileInputSvc_cc_cppflags)  $(src)ALPFileInputSvc.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ALPFileInputSvc_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ALPFileInputSvc.cc

$(bin)$(binobj)ALPFileInputSvc.o : $(ALPFileInputSvc_cc_dependencies)
	$(cpp_echo) $(src)ALPFileInputSvc.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPFileInputSvc_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPFileInputSvc_cppflags) $(ALPFileInputSvc_cc_cppflags)  $(src)ALPFileInputSvc.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ALPCommonUtil.d

$(bin)$(binobj)ALPCommonUtil.d :

$(bin)$(binobj)ALPCommonUtil.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ALPCommonUtil.o : $(src)ALPCommonUtil.cc
	$(cpp_echo) $(src)ALPCommonUtil.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPCommonUtil_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPCommonUtil_cppflags) $(ALPCommonUtil_cc_cppflags)  $(src)ALPCommonUtil.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ALPCommonUtil_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ALPCommonUtil.cc

$(bin)$(binobj)ALPCommonUtil.o : $(ALPCommonUtil_cc_dependencies)
	$(cpp_echo) $(src)ALPCommonUtil.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ALPCommonUtil_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ALPCommonUtil_cppflags) $(ALPCommonUtil_cc_cppflags)  $(src)ALPCommonUtil.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithString.d

$(bin)$(binobj)ExampleWithString.d :

$(bin)$(binobj)ExampleWithString.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithString.o : $(src)ExampleWithString.cc
	$(cpp_echo) $(src)ExampleWithString.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithString_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithString_cppflags) $(ExampleWithString_cc_cppflags)  $(src)ExampleWithString.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithString_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithString.cc

$(bin)$(binobj)ExampleWithString.o : $(ExampleWithString_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithString.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithString_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithString_cppflags) $(ExampleWithString_cc_cppflags)  $(src)ExampleWithString.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithVectorMemberCollection.d

$(bin)$(binobj)ExampleWithVectorMemberCollection.d :

$(bin)$(binobj)ExampleWithVectorMemberCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithVectorMemberCollection.o : $(src)ExampleWithVectorMemberCollection.cc
	$(cpp_echo) $(src)ExampleWithVectorMemberCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMemberCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMemberCollection_cppflags) $(ExampleWithVectorMemberCollection_cc_cppflags)  $(src)ExampleWithVectorMemberCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithVectorMemberCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithVectorMemberCollection.cc

$(bin)$(binobj)ExampleWithVectorMemberCollection.o : $(ExampleWithVectorMemberCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithVectorMemberCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMemberCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMemberCollection_cppflags) $(ExampleWithVectorMemberCollection_cc_cppflags)  $(src)ExampleWithVectorMemberCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithNamespaceConst.d

$(bin)$(binobj)ExampleWithNamespaceConst.d :

$(bin)$(binobj)ExampleWithNamespaceConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithNamespaceConst.o : $(src)ExampleWithNamespaceConst.cc
	$(cpp_echo) $(src)ExampleWithNamespaceConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespaceConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespaceConst_cppflags) $(ExampleWithNamespaceConst_cc_cppflags)  $(src)ExampleWithNamespaceConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithNamespaceConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithNamespaceConst.cc

$(bin)$(binobj)ExampleWithNamespaceConst.o : $(ExampleWithNamespaceConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithNamespaceConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithNamespaceConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithNamespaceConst_cppflags) $(ExampleWithNamespaceConst_cc_cppflags)  $(src)ExampleWithNamespaceConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithARelationCollection.d

$(bin)$(binobj)ExampleWithARelationCollection.d :

$(bin)$(binobj)ExampleWithARelationCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithARelationCollection.o : $(src)ExampleWithARelationCollection.cc
	$(cpp_echo) $(src)ExampleWithARelationCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelationCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelationCollection_cppflags) $(ExampleWithARelationCollection_cc_cppflags)  $(src)ExampleWithARelationCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithARelationCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithARelationCollection.cc

$(bin)$(binobj)ExampleWithARelationCollection.o : $(ExampleWithARelationCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithARelationCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithARelationCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithARelationCollection_cppflags) $(ExampleWithARelationCollection_cc_cppflags)  $(src)ExampleWithARelationCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithOneRelationConst.d

$(bin)$(binobj)ExampleWithOneRelationConst.d :

$(bin)$(binobj)ExampleWithOneRelationConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithOneRelationConst.o : $(src)ExampleWithOneRelationConst.cc
	$(cpp_echo) $(src)ExampleWithOneRelationConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelationConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelationConst_cppflags) $(ExampleWithOneRelationConst_cc_cppflags)  $(src)ExampleWithOneRelationConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithOneRelationConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithOneRelationConst.cc

$(bin)$(binobj)ExampleWithOneRelationConst.o : $(ExampleWithOneRelationConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithOneRelationConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelationConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelationConst_cppflags) $(ExampleWithOneRelationConst_cc_cppflags)  $(src)ExampleWithOneRelationConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventInfo.d

$(bin)$(binobj)EventInfo.d :

$(bin)$(binobj)EventInfo.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)EventInfo.o : $(src)EventInfo.cc
	$(cpp_echo) $(src)EventInfo.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfo_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfo_cppflags) $(EventInfo_cc_cppflags)  $(src)EventInfo.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(EventInfo_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)EventInfo.cc

$(bin)$(binobj)EventInfo.o : $(EventInfo_cc_dependencies)
	$(cpp_echo) $(src)EventInfo.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(EventInfo_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(EventInfo_cppflags) $(EventInfo_cc_cppflags)  $(src)EventInfo.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleReferencingType.d

$(bin)$(binobj)ExampleReferencingType.d :

$(bin)$(binobj)ExampleReferencingType.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleReferencingType.o : $(src)ExampleReferencingType.cc
	$(cpp_echo) $(src)ExampleReferencingType.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingType_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingType_cppflags) $(ExampleReferencingType_cc_cppflags)  $(src)ExampleReferencingType.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleReferencingType_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleReferencingType.cc

$(bin)$(binobj)ExampleReferencingType.o : $(ExampleReferencingType_cc_dependencies)
	$(cpp_echo) $(src)ExampleReferencingType.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleReferencingType_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleReferencingType_cppflags) $(ExampleReferencingType_cc_cppflags)  $(src)ExampleReferencingType.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithArrayConst.d

$(bin)$(binobj)ExampleWithArrayConst.d :

$(bin)$(binobj)ExampleWithArrayConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithArrayConst.o : $(src)ExampleWithArrayConst.cc
	$(cpp_echo) $(src)ExampleWithArrayConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArrayConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArrayConst_cppflags) $(ExampleWithArrayConst_cc_cppflags)  $(src)ExampleWithArrayConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithArrayConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithArrayConst.cc

$(bin)$(binobj)ExampleWithArrayConst.o : $(ExampleWithArrayConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithArrayConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithArrayConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithArrayConst_cppflags) $(ExampleWithArrayConst_cc_cppflags)  $(src)ExampleWithArrayConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleCluster.d

$(bin)$(binobj)ExampleCluster.d :

$(bin)$(binobj)ExampleCluster.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleCluster.o : $(src)ExampleCluster.cc
	$(cpp_echo) $(src)ExampleCluster.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleCluster_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleCluster_cppflags) $(ExampleCluster_cc_cppflags)  $(src)ExampleCluster.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleCluster_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleCluster.cc

$(bin)$(binobj)ExampleCluster.o : $(ExampleCluster_cc_dependencies)
	$(cpp_echo) $(src)ExampleCluster.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleCluster_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleCluster_cppflags) $(ExampleCluster_cc_cppflags)  $(src)ExampleCluster.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithOneRelation.d

$(bin)$(binobj)ExampleWithOneRelation.d :

$(bin)$(binobj)ExampleWithOneRelation.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithOneRelation.o : $(src)ExampleWithOneRelation.cc
	$(cpp_echo) $(src)ExampleWithOneRelation.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelation_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelation_cppflags) $(ExampleWithOneRelation_cc_cppflags)  $(src)ExampleWithOneRelation.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithOneRelation_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithOneRelation.cc

$(bin)$(binobj)ExampleWithOneRelation.o : $(ExampleWithOneRelation_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithOneRelation.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithOneRelation_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithOneRelation_cppflags) $(ExampleWithOneRelation_cc_cppflags)  $(src)ExampleWithOneRelation.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency2.d

$(bin)$(binobj)ExampleForCyclicDependency2.d :

$(bin)$(binobj)ExampleForCyclicDependency2.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency2.o : $(src)ExampleForCyclicDependency2.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency2.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2_cppflags) $(ExampleForCyclicDependency2_cc_cppflags)  $(src)ExampleForCyclicDependency2.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency2_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency2.cc

$(bin)$(binobj)ExampleForCyclicDependency2.o : $(ExampleForCyclicDependency2_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency2.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2_cppflags) $(ExampleForCyclicDependency2_cc_cppflags)  $(src)ExampleForCyclicDependency2.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithStringCollection.d

$(bin)$(binobj)ExampleWithStringCollection.d :

$(bin)$(binobj)ExampleWithStringCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithStringCollection.o : $(src)ExampleWithStringCollection.cc
	$(cpp_echo) $(src)ExampleWithStringCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithStringCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithStringCollection_cppflags) $(ExampleWithStringCollection_cc_cppflags)  $(src)ExampleWithStringCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithStringCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithStringCollection.cc

$(bin)$(binobj)ExampleWithStringCollection.o : $(ExampleWithStringCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithStringCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithStringCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithStringCollection_cppflags) $(ExampleWithStringCollection_cc_cppflags)  $(src)ExampleWithStringCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleHitConst.d

$(bin)$(binobj)ExampleHitConst.d :

$(bin)$(binobj)ExampleHitConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleHitConst.o : $(src)ExampleHitConst.cc
	$(cpp_echo) $(src)ExampleHitConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHitConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHitConst_cppflags) $(ExampleHitConst_cc_cppflags)  $(src)ExampleHitConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleHitConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleHitConst.cc

$(bin)$(binobj)ExampleHitConst.o : $(ExampleHitConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleHitConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHitConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHitConst_cppflags) $(ExampleHitConst_cc_cppflags)  $(src)ExampleHitConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency2Const.d

$(bin)$(binobj)ExampleForCyclicDependency2Const.d :

$(bin)$(binobj)ExampleForCyclicDependency2Const.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency2Const.o : $(src)ExampleForCyclicDependency2Const.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency2Const.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2Const_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2Const_cppflags) $(ExampleForCyclicDependency2Const_cc_cppflags)  $(src)ExampleForCyclicDependency2Const.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency2Const_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency2Const.cc

$(bin)$(binobj)ExampleForCyclicDependency2Const.o : $(ExampleForCyclicDependency2Const_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency2Const.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2Const_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2Const_cppflags) $(ExampleForCyclicDependency2Const_cc_cppflags)  $(src)ExampleForCyclicDependency2Const.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency2Obj.d

$(bin)$(binobj)ExampleForCyclicDependency2Obj.d :

$(bin)$(binobj)ExampleForCyclicDependency2Obj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency2Obj.o : $(src)ExampleForCyclicDependency2Obj.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency2Obj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2Obj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2Obj_cppflags) $(ExampleForCyclicDependency2Obj_cc_cppflags)  $(src)ExampleForCyclicDependency2Obj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency2Obj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency2Obj.cc

$(bin)$(binobj)ExampleForCyclicDependency2Obj.o : $(ExampleForCyclicDependency2Obj_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency2Obj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency2Obj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency2Obj_cppflags) $(ExampleForCyclicDependency2Obj_cc_cppflags)  $(src)ExampleForCyclicDependency2Obj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleForCyclicDependency1Obj.d

$(bin)$(binobj)ExampleForCyclicDependency1Obj.d :

$(bin)$(binobj)ExampleForCyclicDependency1Obj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleForCyclicDependency1Obj.o : $(src)ExampleForCyclicDependency1Obj.cc
	$(cpp_echo) $(src)ExampleForCyclicDependency1Obj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1Obj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1Obj_cppflags) $(ExampleForCyclicDependency1Obj_cc_cppflags)  $(src)ExampleForCyclicDependency1Obj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleForCyclicDependency1Obj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleForCyclicDependency1Obj.cc

$(bin)$(binobj)ExampleForCyclicDependency1Obj.o : $(ExampleForCyclicDependency1Obj_cc_dependencies)
	$(cpp_echo) $(src)ExampleForCyclicDependency1Obj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleForCyclicDependency1Obj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleForCyclicDependency1Obj_cppflags) $(ExampleForCyclicDependency1Obj_cc_cppflags)  $(src)ExampleForCyclicDependency1Obj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleHit.d

$(bin)$(binobj)ExampleHit.d :

$(bin)$(binobj)ExampleHit.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleHit.o : $(src)ExampleHit.cc
	$(cpp_echo) $(src)ExampleHit.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHit_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHit_cppflags) $(ExampleHit_cc_cppflags)  $(src)ExampleHit.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleHit_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleHit.cc

$(bin)$(binobj)ExampleHit.o : $(ExampleHit_cc_dependencies)
	$(cpp_echo) $(src)ExampleHit.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHit_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHit_cppflags) $(ExampleHit_cc_cppflags)  $(src)ExampleHit.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithStringObj.d

$(bin)$(binobj)ExampleWithStringObj.d :

$(bin)$(binobj)ExampleWithStringObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithStringObj.o : $(src)ExampleWithStringObj.cc
	$(cpp_echo) $(src)ExampleWithStringObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithStringObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithStringObj_cppflags) $(ExampleWithStringObj_cc_cppflags)  $(src)ExampleWithStringObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithStringObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithStringObj.cc

$(bin)$(binobj)ExampleWithStringObj.o : $(ExampleWithStringObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithStringObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithStringObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithStringObj_cppflags) $(ExampleWithStringObj_cc_cppflags)  $(src)ExampleWithStringObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleMCConst.d

$(bin)$(binobj)ExampleMCConst.d :

$(bin)$(binobj)ExampleMCConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleMCConst.o : $(src)ExampleMCConst.cc
	$(cpp_echo) $(src)ExampleMCConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMCConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMCConst_cppflags) $(ExampleMCConst_cc_cppflags)  $(src)ExampleMCConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleMCConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleMCConst.cc

$(bin)$(binobj)ExampleMCConst.o : $(ExampleMCConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleMCConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleMCConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleMCConst_cppflags) $(ExampleMCConst_cc_cppflags)  $(src)ExampleMCConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithComponentConst.d

$(bin)$(binobj)ExampleWithComponentConst.d :

$(bin)$(binobj)ExampleWithComponentConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithComponentConst.o : $(src)ExampleWithComponentConst.cc
	$(cpp_echo) $(src)ExampleWithComponentConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponentConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponentConst_cppflags) $(ExampleWithComponentConst_cc_cppflags)  $(src)ExampleWithComponentConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithComponentConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithComponentConst.cc

$(bin)$(binobj)ExampleWithComponentConst.o : $(ExampleWithComponentConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithComponentConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponentConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponentConst_cppflags) $(ExampleWithComponentConst_cc_cppflags)  $(src)ExampleWithComponentConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleHitCollection.d

$(bin)$(binobj)ExampleHitCollection.d :

$(bin)$(binobj)ExampleHitCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleHitCollection.o : $(src)ExampleHitCollection.cc
	$(cpp_echo) $(src)ExampleHitCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHitCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHitCollection_cppflags) $(ExampleHitCollection_cc_cppflags)  $(src)ExampleHitCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleHitCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleHitCollection.cc

$(bin)$(binobj)ExampleHitCollection.o : $(ExampleHitCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleHitCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleHitCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleHitCollection_cppflags) $(ExampleHitCollection_cc_cppflags)  $(src)ExampleHitCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithVectorMemberObj.d

$(bin)$(binobj)ExampleWithVectorMemberObj.d :

$(bin)$(binobj)ExampleWithVectorMemberObj.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithVectorMemberObj.o : $(src)ExampleWithVectorMemberObj.cc
	$(cpp_echo) $(src)ExampleWithVectorMemberObj.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMemberObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMemberObj_cppflags) $(ExampleWithVectorMemberObj_cc_cppflags)  $(src)ExampleWithVectorMemberObj.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithVectorMemberObj_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithVectorMemberObj.cc

$(bin)$(binobj)ExampleWithVectorMemberObj.o : $(ExampleWithVectorMemberObj_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithVectorMemberObj.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithVectorMemberObj_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithVectorMemberObj_cppflags) $(ExampleWithVectorMemberObj_cc_cppflags)  $(src)ExampleWithVectorMemberObj.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithStringConst.d

$(bin)$(binobj)ExampleWithStringConst.d :

$(bin)$(binobj)ExampleWithStringConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithStringConst.o : $(src)ExampleWithStringConst.cc
	$(cpp_echo) $(src)ExampleWithStringConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithStringConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithStringConst_cppflags) $(ExampleWithStringConst_cc_cppflags)  $(src)ExampleWithStringConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithStringConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithStringConst.cc

$(bin)$(binobj)ExampleWithStringConst.o : $(ExampleWithStringConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithStringConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithStringConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithStringConst_cppflags) $(ExampleWithStringConst_cc_cppflags)  $(src)ExampleWithStringConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleClusterCollection.d

$(bin)$(binobj)ExampleClusterCollection.d :

$(bin)$(binobj)ExampleClusterCollection.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleClusterCollection.o : $(src)ExampleClusterCollection.cc
	$(cpp_echo) $(src)ExampleClusterCollection.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleClusterCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleClusterCollection_cppflags) $(ExampleClusterCollection_cc_cppflags)  $(src)ExampleClusterCollection.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleClusterCollection_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleClusterCollection.cc

$(bin)$(binobj)ExampleClusterCollection.o : $(ExampleClusterCollection_cc_dependencies)
	$(cpp_echo) $(src)ExampleClusterCollection.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleClusterCollection_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleClusterCollection_cppflags) $(ExampleClusterCollection_cc_cppflags)  $(src)ExampleClusterCollection.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleClusterConst.d

$(bin)$(binobj)ExampleClusterConst.d :

$(bin)$(binobj)ExampleClusterConst.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleClusterConst.o : $(src)ExampleClusterConst.cc
	$(cpp_echo) $(src)ExampleClusterConst.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleClusterConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleClusterConst_cppflags) $(ExampleClusterConst_cc_cppflags)  $(src)ExampleClusterConst.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleClusterConst_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleClusterConst.cc

$(bin)$(binobj)ExampleClusterConst.o : $(ExampleClusterConst_cc_dependencies)
	$(cpp_echo) $(src)ExampleClusterConst.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleClusterConst_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleClusterConst_cppflags) $(ExampleClusterConst_cc_cppflags)  $(src)ExampleClusterConst.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),ALPDataIOclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ExampleWithComponent.d

$(bin)$(binobj)ExampleWithComponent.d :

$(bin)$(binobj)ExampleWithComponent.o : $(cmt_final_setup_ALPDataIO)

$(bin)$(binobj)ExampleWithComponent.o : $(src)ExampleWithComponent.cc
	$(cpp_echo) $(src)ExampleWithComponent.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponent_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponent_cppflags) $(ExampleWithComponent_cc_cppflags)  $(src)ExampleWithComponent.cc
endif
endif

else
$(bin)ALPDataIO_dependencies.make : $(ExampleWithComponent_cc_dependencies)

$(bin)ALPDataIO_dependencies.make : $(src)ExampleWithComponent.cc

$(bin)$(binobj)ExampleWithComponent.o : $(ExampleWithComponent_cc_dependencies)
	$(cpp_echo) $(src)ExampleWithComponent.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ALPDataIO_pp_cppflags) $(lib_ALPDataIO_pp_cppflags) $(ExampleWithComponent_pp_cppflags) $(use_cppflags) $(ALPDataIO_cppflags) $(lib_ALPDataIO_cppflags) $(ExampleWithComponent_cppflags) $(ExampleWithComponent_cc_cppflags)  $(src)ExampleWithComponent.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: ALPDataIOclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ALPDataIO.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ALPDataIOclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library ALPDataIO
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)ALPDataIO$(library_suffix).a $(library_prefix)ALPDataIO$(library_suffix).s? ALPDataIO.stamp ALPDataIO.shstamp
#-- end of cleanup_library ---------------
