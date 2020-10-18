#-- start of make_header -----------------

#====================================
#  Library UseCase
#
#   Generated Sat Oct 17 11:57:45 2020  by root
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_UseCase_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_UseCase_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_UseCase

UseCase_tag = $(tag)

#cmt_local_tagfile_UseCase = $(UseCase_tag)_UseCase.make
cmt_local_tagfile_UseCase = $(bin)$(UseCase_tag)_UseCase.make

else

tags      = $(tag),$(CMTEXTRATAGS)

UseCase_tag = $(tag)

#cmt_local_tagfile_UseCase = $(UseCase_tag).make
cmt_local_tagfile_UseCase = $(bin)$(UseCase_tag).make

endif

include $(cmt_local_tagfile_UseCase)
#-include $(cmt_local_tagfile_UseCase)

ifdef cmt_UseCase_has_target_tag

cmt_final_setup_UseCase = $(bin)setup_UseCase.make
cmt_dependencies_in_UseCase = $(bin)dependencies_UseCase.in
#cmt_final_setup_UseCase = $(bin)UseCase_UseCasesetup.make
cmt_local_UseCase_makefile = $(bin)UseCase.make

else

cmt_final_setup_UseCase = $(bin)setup.make
cmt_dependencies_in_UseCase = $(bin)dependencies.in
#cmt_final_setup_UseCase = $(bin)UseCasesetup.make
cmt_local_UseCase_makefile = $(bin)UseCase.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)UseCasesetup.make

#UseCase :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'UseCase'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = UseCase/
#UseCase::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

UseCaselibname   = $(bin)$(library_prefix)UseCase$(library_suffix)
UseCaselib       = $(UseCaselibname).a
UseCasestamp     = $(bin)UseCase.stamp
UseCaseshstamp   = $(bin)UseCase.shstamp

UseCase :: dirs  UseCaseLIB
	$(echo) "UseCase ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

UseCaseLIB :: $(UseCaselib) $(UseCaseshstamp)
	$(echo) "UseCase : library ok"

$(UseCaselib) :: $(bin)Alg6.o $(bin)CommonAlgTool.o $(bin)Alg3.o $(bin)Alg5.o $(bin)Alg4.o $(bin)Alg1.o $(bin)Alg2.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(UseCaselib) $(bin)Alg6.o $(bin)CommonAlgTool.o $(bin)Alg3.o $(bin)Alg5.o $(bin)Alg4.o $(bin)Alg1.o $(bin)Alg2.o
	$(lib_silent) $(ranlib) $(UseCaselib)
	$(lib_silent) cat /dev/null >$(UseCasestamp)

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

$(UseCaselibname).$(shlibsuffix) :: $(UseCaselib) requirements $(use_requirements) $(UseCasestamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" UseCase $(UseCase_shlibflags)

$(UseCaseshstamp) :: $(UseCaselibname).$(shlibsuffix)
	$(lib_silent) if test -f $(UseCaselibname).$(shlibsuffix) ; then cat /dev/null >$(UseCaseshstamp) ; fi

UseCaseclean ::
	$(cleanup_echo) objects UseCase
	$(cleanup_silent) /bin/rm -f $(bin)Alg6.o $(bin)CommonAlgTool.o $(bin)Alg3.o $(bin)Alg5.o $(bin)Alg4.o $(bin)Alg1.o $(bin)Alg2.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)Alg6.o $(bin)CommonAlgTool.o $(bin)Alg3.o $(bin)Alg5.o $(bin)Alg4.o $(bin)Alg1.o $(bin)Alg2.o) $(patsubst %.o,%.dep,$(bin)Alg6.o $(bin)CommonAlgTool.o $(bin)Alg3.o $(bin)Alg5.o $(bin)Alg4.o $(bin)Alg1.o $(bin)Alg2.o) $(patsubst %.o,%.d.stamp,$(bin)Alg6.o $(bin)CommonAlgTool.o $(bin)Alg3.o $(bin)Alg5.o $(bin)Alg4.o $(bin)Alg1.o $(bin)Alg2.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf UseCase_deps UseCase_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
UseCaseinstallname = $(library_prefix)UseCase$(library_suffix).$(shlibsuffix)

UseCase :: UseCaseinstall ;

install :: UseCaseinstall ;

UseCaseinstall :: $(install_dir)/$(UseCaseinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(UseCaseinstallname) :: $(bin)$(UseCaseinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(UseCaseinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##UseCaseclean :: UseCaseuninstall

uninstall :: UseCaseuninstall ;

UseCaseuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(UseCaseinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)

$(bin)UseCase_dependencies.make : $(use_requirements) $(cmt_final_setup_UseCase)
	$(echo) "(UseCase.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)Alg6.cc $(src)CommonAlgTool.cc $(src)Alg3.cc $(src)Alg5.cc $(src)Alg4.cc $(src)Alg1.cc $(src)Alg2.cc -end_all $(includes) $(app_UseCase_cppflags) $(lib_UseCase_cppflags) -name=UseCase $? -f=$(cmt_dependencies_in_UseCase) -without_cmt

-include $(bin)UseCase_dependencies.make

endif
endif

UseCaseclean ::
	$(cleanup_silent) \rm -rf $(bin)UseCase_deps $(bin)UseCase_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Alg6.d

$(bin)$(binobj)Alg6.d :

$(bin)$(binobj)Alg6.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)Alg6.o : $(src)Alg6.cc
	$(cpp_echo) $(src)Alg6.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg6_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg6_cppflags) $(Alg6_cc_cppflags)  $(src)Alg6.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(Alg6_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)Alg6.cc

$(bin)$(binobj)Alg6.o : $(Alg6_cc_dependencies)
	$(cpp_echo) $(src)Alg6.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg6_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg6_cppflags) $(Alg6_cc_cppflags)  $(src)Alg6.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)CommonAlgTool.d

$(bin)$(binobj)CommonAlgTool.d :

$(bin)$(binobj)CommonAlgTool.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)CommonAlgTool.o : $(src)CommonAlgTool.cc
	$(cpp_echo) $(src)CommonAlgTool.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(CommonAlgTool_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(CommonAlgTool_cppflags) $(CommonAlgTool_cc_cppflags)  $(src)CommonAlgTool.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(CommonAlgTool_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)CommonAlgTool.cc

$(bin)$(binobj)CommonAlgTool.o : $(CommonAlgTool_cc_dependencies)
	$(cpp_echo) $(src)CommonAlgTool.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(CommonAlgTool_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(CommonAlgTool_cppflags) $(CommonAlgTool_cc_cppflags)  $(src)CommonAlgTool.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Alg3.d

$(bin)$(binobj)Alg3.d :

$(bin)$(binobj)Alg3.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)Alg3.o : $(src)Alg3.cc
	$(cpp_echo) $(src)Alg3.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg3_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg3_cppflags) $(Alg3_cc_cppflags)  $(src)Alg3.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(Alg3_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)Alg3.cc

$(bin)$(binobj)Alg3.o : $(Alg3_cc_dependencies)
	$(cpp_echo) $(src)Alg3.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg3_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg3_cppflags) $(Alg3_cc_cppflags)  $(src)Alg3.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Alg5.d

$(bin)$(binobj)Alg5.d :

$(bin)$(binobj)Alg5.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)Alg5.o : $(src)Alg5.cc
	$(cpp_echo) $(src)Alg5.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg5_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg5_cppflags) $(Alg5_cc_cppflags)  $(src)Alg5.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(Alg5_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)Alg5.cc

$(bin)$(binobj)Alg5.o : $(Alg5_cc_dependencies)
	$(cpp_echo) $(src)Alg5.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg5_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg5_cppflags) $(Alg5_cc_cppflags)  $(src)Alg5.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Alg4.d

$(bin)$(binobj)Alg4.d :

$(bin)$(binobj)Alg4.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)Alg4.o : $(src)Alg4.cc
	$(cpp_echo) $(src)Alg4.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg4_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg4_cppflags) $(Alg4_cc_cppflags)  $(src)Alg4.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(Alg4_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)Alg4.cc

$(bin)$(binobj)Alg4.o : $(Alg4_cc_dependencies)
	$(cpp_echo) $(src)Alg4.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg4_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg4_cppflags) $(Alg4_cc_cppflags)  $(src)Alg4.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Alg1.d

$(bin)$(binobj)Alg1.d :

$(bin)$(binobj)Alg1.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)Alg1.o : $(src)Alg1.cc
	$(cpp_echo) $(src)Alg1.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg1_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg1_cppflags) $(Alg1_cc_cppflags)  $(src)Alg1.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(Alg1_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)Alg1.cc

$(bin)$(binobj)Alg1.o : $(Alg1_cc_dependencies)
	$(cpp_echo) $(src)Alg1.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg1_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg1_cppflags) $(Alg1_cc_cppflags)  $(src)Alg1.cc

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),UseCaseclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Alg2.d

$(bin)$(binobj)Alg2.d :

$(bin)$(binobj)Alg2.o : $(cmt_final_setup_UseCase)

$(bin)$(binobj)Alg2.o : $(src)Alg2.cc
	$(cpp_echo) $(src)Alg2.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg2_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg2_cppflags) $(Alg2_cc_cppflags)  $(src)Alg2.cc
endif
endif

else
$(bin)UseCase_dependencies.make : $(Alg2_cc_dependencies)

$(bin)UseCase_dependencies.make : $(src)Alg2.cc

$(bin)$(binobj)Alg2.o : $(Alg2_cc_dependencies)
	$(cpp_echo) $(src)Alg2.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(UseCase_pp_cppflags) $(lib_UseCase_pp_cppflags) $(Alg2_pp_cppflags) $(use_cppflags) $(UseCase_cppflags) $(lib_UseCase_cppflags) $(Alg2_cppflags) $(Alg2_cc_cppflags)  $(src)Alg2.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: UseCaseclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(UseCase.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

UseCaseclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library UseCase
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)UseCase$(library_suffix).a $(library_prefix)UseCase$(library_suffix).s? UseCase.stamp UseCase.shstamp
#-- end of cleanup_library ---------------
