
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

UseCase_tag = $(tag)

#cmt_local_tagfile = $(UseCase_tag).make
cmt_local_tagfile = $(bin)$(UseCase_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)UseCasesetup.make
cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)$(package)setup.make

cmt_build_library_linksstamp = $(bin)cmt_build_library_links.stamp
#--------------------------------------------------------

#cmt_lock_setup = /tmp/lock$(cmt_lock_pid).make
#cmt_temp_tag = /tmp/tag$(cmt_lock_pid).make

#first :: $(cmt_local_tagfile)
#	@echo $(cmt_local_tagfile) ok
#ifndef QUICK
#first :: $(cmt_final_setup) ;
#else
#first :: ;
#endif

##	@bin=`$(cmtexe) show macro_value bin`

#$(cmt_local_tagfile) : $(cmt_lock_setup)
#	@echo "#CMT> Error: $@: No such file" >&2; exit 1
#$(cmt_local_tagfile) :
#	@echo "#CMT> Warning: $@: No such file" >&2; exit
#	@echo "#CMT> Info: $@: No need to rebuild file" >&2; exit

#$(cmt_final_setup) : $(cmt_local_tagfile) 
#	$(echo) "(constituents.make) Rebuilding $@"
#	@if test ! -d $(@D); then $(mkdir) -p $(@D); fi; \
#	  if test -f $(cmt_local_setup); then /bin/rm -f $(cmt_local_setup); fi; \
#	  trap '/bin/rm -f $(cmt_local_setup)' 0 1 2 15; \
#	  $(cmtexe) -tag=$(tags) show setup >>$(cmt_local_setup); \
#	  if test ! -f $@; then \
#	    mv $(cmt_local_setup) $@; \
#	  else \
#	    if /usr/bin/diff $(cmt_local_setup) $@ >/dev/null ; then \
#	      : ; \
#	    else \
#	      mv $(cmt_local_setup) $@; \
#	    fi; \
#	  fi

#	@/bin/echo $@ ok   

#config :: checkuses
#	@exit 0
#checkuses : ;

env.make ::
	printenv >env.make.tmp; $(cmtexe) check files env.make.tmp env.make

ifndef QUICK
all :: build_library_links ;
else
all :: $(cmt_build_library_linksstamp) ;
endif

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

dirs :: requirements
	@if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi
#	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
#	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

#requirements :
#	@if test ! -r requirements ; then echo "No requirements file" ; fi

build_library_links : dirs
	$(echo) "(constituents.make) Rebuilding library links"; \
	 $(build_library_links)
#	if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi; \
#	$(build_library_links)

$(cmt_build_library_linksstamp) : $(cmt_final_setup) $(cmt_local_tagfile) $(bin)library_links.in
	$(echo) "(constituents.make) Rebuilding library links"; \
	 $(build_library_links) -f=$(bin)library_links.in -without_cmt
	$(silent) \touch $@

ifndef PEDANTIC
.DEFAULT ::
#.DEFAULT :
	$(echo) "(constituents.make) $@: No rule for such target" >&2
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of constituents_header ------
#-- start of group ------

all_groups :: all

all :: $(all_dependencies)  $(all_pre_constituents) $(all_constituents)  $(all_post_constituents)
	$(echo) "all ok."

#	@/bin/echo " all ok."

clean :: allclean

allclean ::  $(all_constituentsclean)
	$(echo) $(all_constituentsclean)
	$(echo) "allclean ok."

#	@echo $(all_constituentsclean)
#	@/bin/echo " allclean ok."

#-- end of group ------
#-- start of group ------

all_groups :: cmt_actions

cmt_actions :: $(cmt_actions_dependencies)  $(cmt_actions_pre_constituents) $(cmt_actions_constituents)  $(cmt_actions_post_constituents)
	$(echo) "cmt_actions ok."

#	@/bin/echo " cmt_actions ok."

clean :: allclean

cmt_actionsclean ::  $(cmt_actions_constituentsclean)
	$(echo) $(cmt_actions_constituentsclean)
	$(echo) "cmt_actionsclean ok."

#	@echo $(cmt_actions_constituentsclean)
#	@/bin/echo " cmt_actionsclean ok."

#-- end of group ------
#-- start of constituent ------

cmt_UseCase_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_UseCase_has_target_tag

#cmt_local_tagfile_UseCase = $(UseCase_tag)_UseCase.make
cmt_local_tagfile_UseCase = $(bin)$(UseCase_tag)_UseCase.make
cmt_local_setup_UseCase = $(bin)setup_UseCase$$$$.make
cmt_final_setup_UseCase = $(bin)setup_UseCase.make
#cmt_final_setup_UseCase = $(bin)UseCase_UseCasesetup.make
cmt_local_UseCase_makefile = $(bin)UseCase.make

UseCase_extratags = -tag_add=target_UseCase

#$(cmt_local_tagfile_UseCase) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_UseCase) ::
else
$(cmt_local_tagfile_UseCase) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_UseCase); then /bin/rm -f $(cmt_local_tagfile_UseCase); fi ; \
	  $(cmtexe) -tag=$(tags) $(UseCase_extratags) build tag_makefile >>$(cmt_local_tagfile_UseCase)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_UseCase)"; \
	  test ! -f $(cmt_local_setup_UseCase) || \rm -f $(cmt_local_setup_UseCase); \
	  trap '\rm -f $(cmt_local_setup_UseCase)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(UseCase_extratags) show setup >$(cmt_local_setup_UseCase) && \
	  if [ -f $(cmt_final_setup_UseCase) ] && \
	    \cmp -s $(cmt_final_setup_UseCase) $(cmt_local_setup_UseCase); then \
	    \rm $(cmt_local_setup_UseCase); else \
	    \mv -f $(cmt_local_setup_UseCase) $(cmt_final_setup_UseCase); fi

else

#cmt_local_tagfile_UseCase = $(UseCase_tag).make
cmt_local_tagfile_UseCase = $(bin)$(UseCase_tag).make
cmt_final_setup_UseCase = $(bin)setup.make
#cmt_final_setup_UseCase = $(bin)UseCasesetup.make
cmt_local_UseCase_makefile = $(bin)UseCase.make

endif

not_UseCase_dependencies = { n=0; for p in $?; do m=0; for d in $(UseCase_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
UseCasedirs :
	@if test ! -d $(bin)UseCase; then $(mkdir) -p $(bin)UseCase; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)UseCase
else
UseCasedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# UseCasedirs ::
#	@if test ! -d $(bin)UseCase; then $(mkdir) -p $(bin)UseCase; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)UseCase
#
#$(cmt_local_UseCase_makefile) :: $(UseCase_dependencies) $(cmt_local_tagfile_UseCase) build_library_links dirs UseCasedirs
#else
#$(cmt_local_UseCase_makefile) :: $(UseCase_dependencies) $(cmt_local_tagfile_UseCase) build_library_links dirs
#endif
#else
#$(cmt_local_UseCase_makefile) :: $(cmt_local_tagfile_UseCase)
#endif

ifdef cmt_UseCase_has_target_tag

ifndef QUICK
$(cmt_local_UseCase_makefile) : $(UseCase_dependencies) build_library_links
	$(echo) "(constituents.make) Building UseCase.make"; \
	  $(cmtexe) -tag=$(tags) $(UseCase_extratags) build constituent_config -out=$(cmt_local_UseCase_makefile) UseCase
else
$(cmt_local_UseCase_makefile) : $(UseCase_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_UseCase) ] || \
	  [ ! -f $(cmt_final_setup_UseCase) ] || \
	  $(not_UseCase_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building UseCase.make"; \
	  $(cmtexe) -tag=$(tags) $(UseCase_extratags) build constituent_config -out=$(cmt_local_UseCase_makefile) UseCase; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_UseCase_makefile) : $(UseCase_dependencies) build_library_links
	$(echo) "(constituents.make) Building UseCase.make"; \
	  $(cmtexe) -f=$(bin)UseCase.in -tag=$(tags) $(UseCase_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_UseCase_makefile) UseCase
else
$(cmt_local_UseCase_makefile) : $(UseCase_dependencies) $(cmt_build_library_linksstamp) $(bin)UseCase.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_UseCase) ] || \
	  [ ! -f $(cmt_final_setup_UseCase) ] || \
	  $(not_UseCase_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building UseCase.make"; \
	  $(cmtexe) -f=$(bin)UseCase.in -tag=$(tags) $(UseCase_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_UseCase_makefile) UseCase; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(UseCase_extratags) build constituent_makefile -out=$(cmt_local_UseCase_makefile) UseCase

UseCase :: $(UseCase_dependencies) $(cmt_local_UseCase_makefile) dirs UseCasedirs
	$(echo) "(constituents.make) Starting UseCase"
	@if test -f $(cmt_local_UseCase_makefile); then \
	  $(MAKE) -f $(cmt_local_UseCase_makefile) UseCase; \
	  fi
#	@$(MAKE) -f $(cmt_local_UseCase_makefile) UseCase
	$(echo) "(constituents.make) UseCase done"

clean :: UseCaseclean

UseCaseclean :: $(UseCaseclean_dependencies) ##$(cmt_local_UseCase_makefile)
	$(echo) "(constituents.make) Starting UseCaseclean"
	@-if test -f $(cmt_local_UseCase_makefile); then \
	  $(MAKE) -f $(cmt_local_UseCase_makefile) UseCaseclean; \
	fi
	$(echo) "(constituents.make) UseCaseclean done"
#	@-$(MAKE) -f $(cmt_local_UseCase_makefile) UseCaseclean

##	  /bin/rm -f $(cmt_local_UseCase_makefile) $(bin)UseCase_dependencies.make

install :: UseCaseinstall

UseCaseinstall :: $(UseCase_dependencies) $(cmt_local_UseCase_makefile)
	$(echo) "(constituents.make) Starting install UseCase"
	@-$(MAKE) -f $(cmt_local_UseCase_makefile) install
	$(echo) "(constituents.make) install UseCase done"

uninstall : UseCaseuninstall

$(foreach d,$(UseCase_dependencies),$(eval $(d)uninstall_dependencies += UseCaseuninstall))

UseCaseuninstall : $(UseCaseuninstall_dependencies) ##$(cmt_local_UseCase_makefile)
	$(echo) "(constituents.make) Starting uninstall UseCase"
	@if test -f $(cmt_local_UseCase_makefile); then \
	  $(MAKE) -f $(cmt_local_UseCase_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_UseCase_makefile) uninstall
	$(echo) "(constituents.make) uninstall UseCase done"

remove_library_links :: UseCaseuninstall

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ UseCase"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ UseCase done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_UseCase_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_UseCase_python_has_target_tag

#cmt_local_tagfile_UseCase_python = $(UseCase_tag)_UseCase_python.make
cmt_local_tagfile_UseCase_python = $(bin)$(UseCase_tag)_UseCase_python.make
cmt_local_setup_UseCase_python = $(bin)setup_UseCase_python$$$$.make
cmt_final_setup_UseCase_python = $(bin)setup_UseCase_python.make
#cmt_final_setup_UseCase_python = $(bin)UseCase_UseCase_pythonsetup.make
cmt_local_UseCase_python_makefile = $(bin)UseCase_python.make

UseCase_python_extratags = -tag_add=target_UseCase_python

#$(cmt_local_tagfile_UseCase_python) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_UseCase_python) ::
else
$(cmt_local_tagfile_UseCase_python) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_UseCase_python); then /bin/rm -f $(cmt_local_tagfile_UseCase_python); fi ; \
	  $(cmtexe) -tag=$(tags) $(UseCase_python_extratags) build tag_makefile >>$(cmt_local_tagfile_UseCase_python)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_UseCase_python)"; \
	  test ! -f $(cmt_local_setup_UseCase_python) || \rm -f $(cmt_local_setup_UseCase_python); \
	  trap '\rm -f $(cmt_local_setup_UseCase_python)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(UseCase_python_extratags) show setup >$(cmt_local_setup_UseCase_python) && \
	  if [ -f $(cmt_final_setup_UseCase_python) ] && \
	    \cmp -s $(cmt_final_setup_UseCase_python) $(cmt_local_setup_UseCase_python); then \
	    \rm $(cmt_local_setup_UseCase_python); else \
	    \mv -f $(cmt_local_setup_UseCase_python) $(cmt_final_setup_UseCase_python); fi

else

#cmt_local_tagfile_UseCase_python = $(UseCase_tag).make
cmt_local_tagfile_UseCase_python = $(bin)$(UseCase_tag).make
cmt_final_setup_UseCase_python = $(bin)setup.make
#cmt_final_setup_UseCase_python = $(bin)UseCasesetup.make
cmt_local_UseCase_python_makefile = $(bin)UseCase_python.make

endif

not_UseCase_python_dependencies = { n=0; for p in $?; do m=0; for d in $(UseCase_python_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
UseCase_pythondirs :
	@if test ! -d $(bin)UseCase_python; then $(mkdir) -p $(bin)UseCase_python; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)UseCase_python
else
UseCase_pythondirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# UseCase_pythondirs ::
#	@if test ! -d $(bin)UseCase_python; then $(mkdir) -p $(bin)UseCase_python; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)UseCase_python
#
#$(cmt_local_UseCase_python_makefile) :: $(UseCase_python_dependencies) $(cmt_local_tagfile_UseCase_python) build_library_links dirs UseCase_pythondirs
#else
#$(cmt_local_UseCase_python_makefile) :: $(UseCase_python_dependencies) $(cmt_local_tagfile_UseCase_python) build_library_links dirs
#endif
#else
#$(cmt_local_UseCase_python_makefile) :: $(cmt_local_tagfile_UseCase_python)
#endif

ifdef cmt_UseCase_python_has_target_tag

ifndef QUICK
$(cmt_local_UseCase_python_makefile) : $(UseCase_python_dependencies) build_library_links
	$(echo) "(constituents.make) Building UseCase_python.make"; \
	  $(cmtexe) -tag=$(tags) $(UseCase_python_extratags) build constituent_config -out=$(cmt_local_UseCase_python_makefile) UseCase_python
else
$(cmt_local_UseCase_python_makefile) : $(UseCase_python_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_UseCase_python) ] || \
	  [ ! -f $(cmt_final_setup_UseCase_python) ] || \
	  $(not_UseCase_python_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building UseCase_python.make"; \
	  $(cmtexe) -tag=$(tags) $(UseCase_python_extratags) build constituent_config -out=$(cmt_local_UseCase_python_makefile) UseCase_python; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_UseCase_python_makefile) : $(UseCase_python_dependencies) build_library_links
	$(echo) "(constituents.make) Building UseCase_python.make"; \
	  $(cmtexe) -f=$(bin)UseCase_python.in -tag=$(tags) $(UseCase_python_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_UseCase_python_makefile) UseCase_python
else
$(cmt_local_UseCase_python_makefile) : $(UseCase_python_dependencies) $(cmt_build_library_linksstamp) $(bin)UseCase_python.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_UseCase_python) ] || \
	  [ ! -f $(cmt_final_setup_UseCase_python) ] || \
	  $(not_UseCase_python_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building UseCase_python.make"; \
	  $(cmtexe) -f=$(bin)UseCase_python.in -tag=$(tags) $(UseCase_python_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_UseCase_python_makefile) UseCase_python; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(UseCase_python_extratags) build constituent_makefile -out=$(cmt_local_UseCase_python_makefile) UseCase_python

UseCase_python :: $(UseCase_python_dependencies) $(cmt_local_UseCase_python_makefile) dirs UseCase_pythondirs
	$(echo) "(constituents.make) Starting UseCase_python"
	@if test -f $(cmt_local_UseCase_python_makefile); then \
	  $(MAKE) -f $(cmt_local_UseCase_python_makefile) UseCase_python; \
	  fi
#	@$(MAKE) -f $(cmt_local_UseCase_python_makefile) UseCase_python
	$(echo) "(constituents.make) UseCase_python done"

clean :: UseCase_pythonclean

UseCase_pythonclean :: $(UseCase_pythonclean_dependencies) ##$(cmt_local_UseCase_python_makefile)
	$(echo) "(constituents.make) Starting UseCase_pythonclean"
	@-if test -f $(cmt_local_UseCase_python_makefile); then \
	  $(MAKE) -f $(cmt_local_UseCase_python_makefile) UseCase_pythonclean; \
	fi
	$(echo) "(constituents.make) UseCase_pythonclean done"
#	@-$(MAKE) -f $(cmt_local_UseCase_python_makefile) UseCase_pythonclean

##	  /bin/rm -f $(cmt_local_UseCase_python_makefile) $(bin)UseCase_python_dependencies.make

install :: UseCase_pythoninstall

UseCase_pythoninstall :: $(UseCase_python_dependencies) $(cmt_local_UseCase_python_makefile)
	$(echo) "(constituents.make) Starting install UseCase_python"
	@-$(MAKE) -f $(cmt_local_UseCase_python_makefile) install
	$(echo) "(constituents.make) install UseCase_python done"

uninstall : UseCase_pythonuninstall

$(foreach d,$(UseCase_python_dependencies),$(eval $(d)uninstall_dependencies += UseCase_pythonuninstall))

UseCase_pythonuninstall : $(UseCase_pythonuninstall_dependencies) ##$(cmt_local_UseCase_python_makefile)
	$(echo) "(constituents.make) Starting uninstall UseCase_python"
	@if test -f $(cmt_local_UseCase_python_makefile); then \
	  $(MAKE) -f $(cmt_local_UseCase_python_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_UseCase_python_makefile) uninstall
	$(echo) "(constituents.make) uninstall UseCase_python done"

remove_library_links :: UseCase_pythonuninstall

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ UseCase_python"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ UseCase_python done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_more_includes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_more_includes_has_target_tag

#cmt_local_tagfile_install_more_includes = $(UseCase_tag)_install_more_includes.make
cmt_local_tagfile_install_more_includes = $(bin)$(UseCase_tag)_install_more_includes.make
cmt_local_setup_install_more_includes = $(bin)setup_install_more_includes$$$$.make
cmt_final_setup_install_more_includes = $(bin)setup_install_more_includes.make
#cmt_final_setup_install_more_includes = $(bin)UseCase_install_more_includessetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

install_more_includes_extratags = -tag_add=target_install_more_includes

#$(cmt_local_tagfile_install_more_includes) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_install_more_includes) ::
else
$(cmt_local_tagfile_install_more_includes) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_install_more_includes); then /bin/rm -f $(cmt_local_tagfile_install_more_includes); fi ; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) build tag_makefile >>$(cmt_local_tagfile_install_more_includes)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_install_more_includes)"; \
	  test ! -f $(cmt_local_setup_install_more_includes) || \rm -f $(cmt_local_setup_install_more_includes); \
	  trap '\rm -f $(cmt_local_setup_install_more_includes)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) show setup >$(cmt_local_setup_install_more_includes) && \
	  if [ -f $(cmt_final_setup_install_more_includes) ] && \
	    \cmp -s $(cmt_final_setup_install_more_includes) $(cmt_local_setup_install_more_includes); then \
	    \rm $(cmt_local_setup_install_more_includes); else \
	    \mv -f $(cmt_local_setup_install_more_includes) $(cmt_final_setup_install_more_includes); fi

else

#cmt_local_tagfile_install_more_includes = $(UseCase_tag).make
cmt_local_tagfile_install_more_includes = $(bin)$(UseCase_tag).make
cmt_final_setup_install_more_includes = $(bin)setup.make
#cmt_final_setup_install_more_includes = $(bin)UseCasesetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

endif

not_install_more_includes_dependencies = { n=0; for p in $?; do m=0; for d in $(install_more_includes_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_more_includesdirs :
	@if test ! -d $(bin)install_more_includes; then $(mkdir) -p $(bin)install_more_includes; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_more_includes
else
install_more_includesdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# install_more_includesdirs ::
#	@if test ! -d $(bin)install_more_includes; then $(mkdir) -p $(bin)install_more_includes; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)install_more_includes
#
#$(cmt_local_install_more_includes_makefile) :: $(install_more_includes_dependencies) $(cmt_local_tagfile_install_more_includes) build_library_links dirs install_more_includesdirs
#else
#$(cmt_local_install_more_includes_makefile) :: $(install_more_includes_dependencies) $(cmt_local_tagfile_install_more_includes) build_library_links dirs
#endif
#else
#$(cmt_local_install_more_includes_makefile) :: $(cmt_local_tagfile_install_more_includes)
#endif

ifdef cmt_install_more_includes_has_target_tag

ifndef QUICK
$(cmt_local_install_more_includes_makefile) : $(install_more_includes_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_more_includes.make"; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) build constituent_config -out=$(cmt_local_install_more_includes_makefile) install_more_includes
else
$(cmt_local_install_more_includes_makefile) : $(install_more_includes_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_more_includes) ] || \
	  [ ! -f $(cmt_final_setup_install_more_includes) ] || \
	  $(not_install_more_includes_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_more_includes.make"; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) build constituent_config -out=$(cmt_local_install_more_includes_makefile) install_more_includes; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_more_includes_makefile) : $(install_more_includes_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_more_includes.make"; \
	  $(cmtexe) -f=$(bin)install_more_includes.in -tag=$(tags) $(install_more_includes_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_more_includes_makefile) install_more_includes
else
$(cmt_local_install_more_includes_makefile) : $(install_more_includes_dependencies) $(cmt_build_library_linksstamp) $(bin)install_more_includes.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_more_includes) ] || \
	  [ ! -f $(cmt_final_setup_install_more_includes) ] || \
	  $(not_install_more_includes_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_more_includes.make"; \
	  $(cmtexe) -f=$(bin)install_more_includes.in -tag=$(tags) $(install_more_includes_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_more_includes_makefile) install_more_includes; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) build constituent_makefile -out=$(cmt_local_install_more_includes_makefile) install_more_includes

install_more_includes :: $(install_more_includes_dependencies) $(cmt_local_install_more_includes_makefile) dirs install_more_includesdirs
	$(echo) "(constituents.make) Starting install_more_includes"
	@if test -f $(cmt_local_install_more_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includes; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includes
	$(echo) "(constituents.make) install_more_includes done"

clean :: install_more_includesclean

install_more_includesclean :: $(install_more_includesclean_dependencies) ##$(cmt_local_install_more_includes_makefile)
	$(echo) "(constituents.make) Starting install_more_includesclean"
	@-if test -f $(cmt_local_install_more_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includesclean; \
	fi
	$(echo) "(constituents.make) install_more_includesclean done"
#	@-$(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includesclean

##	  /bin/rm -f $(cmt_local_install_more_includes_makefile) $(bin)install_more_includes_dependencies.make

install :: install_more_includesinstall

install_more_includesinstall :: $(install_more_includes_dependencies) $(cmt_local_install_more_includes_makefile)
	$(echo) "(constituents.make) Starting install install_more_includes"
	@-$(MAKE) -f $(cmt_local_install_more_includes_makefile) install
	$(echo) "(constituents.make) install install_more_includes done"

uninstall : install_more_includesuninstall

$(foreach d,$(install_more_includes_dependencies),$(eval $(d)uninstall_dependencies += install_more_includesuninstall))

install_more_includesuninstall : $(install_more_includesuninstall_dependencies) ##$(cmt_local_install_more_includes_makefile)
	$(echo) "(constituents.make) Starting uninstall install_more_includes"
	@if test -f $(cmt_local_install_more_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_more_includes_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_more_includes_makefile) uninstall
	$(echo) "(constituents.make) uninstall install_more_includes done"

remove_library_links :: install_more_includesuninstall

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_more_includes"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_more_includes done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_make_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(UseCase_tag)_make.make
cmt_local_tagfile_make = $(bin)$(UseCase_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)UseCase_makesetup.make
cmt_local_make_makefile = $(bin)make.make

make_extratags = -tag_add=target_make

#$(cmt_local_tagfile_make) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_make) ::
else
$(cmt_local_tagfile_make) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_make); then /bin/rm -f $(cmt_local_tagfile_make); fi ; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build tag_makefile >>$(cmt_local_tagfile_make)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_make)"; \
	  test ! -f $(cmt_local_setup_make) || \rm -f $(cmt_local_setup_make); \
	  trap '\rm -f $(cmt_local_setup_make)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) show setup >$(cmt_local_setup_make) && \
	  if [ -f $(cmt_final_setup_make) ] && \
	    \cmp -s $(cmt_final_setup_make) $(cmt_local_setup_make); then \
	    \rm $(cmt_local_setup_make); else \
	    \mv -f $(cmt_local_setup_make) $(cmt_final_setup_make); fi

else

#cmt_local_tagfile_make = $(UseCase_tag).make
cmt_local_tagfile_make = $(bin)$(UseCase_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)UseCasesetup.make
cmt_local_make_makefile = $(bin)make.make

endif

not_make_dependencies = { n=0; for p in $?; do m=0; for d in $(make_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
makedirs :
	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)make
else
makedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# makedirs ::
#	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)make
#
#$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs makedirs
#else
#$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs
#endif
#else
#$(cmt_local_make_makefile) :: $(cmt_local_tagfile_make)
#endif

ifdef cmt_make_has_target_tag

ifndef QUICK
$(cmt_local_make_makefile) : $(make_dependencies) build_library_links
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_config -out=$(cmt_local_make_makefile) make
else
$(cmt_local_make_makefile) : $(make_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_make) ] || \
	  [ ! -f $(cmt_final_setup_make) ] || \
	  $(not_make_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_config -out=$(cmt_local_make_makefile) make; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_make_makefile) : $(make_dependencies) build_library_links
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -f=$(bin)make.in -tag=$(tags) $(make_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_make_makefile) make
else
$(cmt_local_make_makefile) : $(make_dependencies) $(cmt_build_library_linksstamp) $(bin)make.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_make) ] || \
	  [ ! -f $(cmt_final_setup_make) ] || \
	  $(not_make_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building make.make"; \
	  $(cmtexe) -f=$(bin)make.in -tag=$(tags) $(make_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_make_makefile) make; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_makefile -out=$(cmt_local_make_makefile) make

make :: $(make_dependencies) $(cmt_local_make_makefile) dirs makedirs
	$(echo) "(constituents.make) Starting make"
	@if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) make; \
	  fi
#	@$(MAKE) -f $(cmt_local_make_makefile) make
	$(echo) "(constituents.make) make done"

clean :: makeclean

makeclean :: $(makeclean_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting makeclean"
	@-if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) makeclean; \
	fi
	$(echo) "(constituents.make) makeclean done"
#	@-$(MAKE) -f $(cmt_local_make_makefile) makeclean

##	  /bin/rm -f $(cmt_local_make_makefile) $(bin)make_dependencies.make

install :: makeinstall

makeinstall :: $(make_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting install make"
	@-$(MAKE) -f $(cmt_local_make_makefile) install
	$(echo) "(constituents.make) install make done"

uninstall : makeuninstall

$(foreach d,$(make_dependencies),$(eval $(d)uninstall_dependencies += makeuninstall))

makeuninstall : $(makeuninstall_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting uninstall make"
	@if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_make_makefile) uninstall
	$(echo) "(constituents.make) uninstall make done"

remove_library_links :: makeuninstall

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ make"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ make done"
endif

#-- end of constituent ------
#-- start of constituents_trailer ------

uninstall : remove_library_links ;
clean ::
	$(cleanup_echo) $(cmt_build_library_linksstamp)
	-$(cleanup_silent) \rm -f $(cmt_build_library_linksstamp)
#clean :: remove_library_links

remove_library_links ::
ifndef QUICK
	$(echo) "(constituents.make) Removing library links"; \
	  $(remove_library_links)
else
	$(echo) "(constituents.make) Removing library links"; \
	  $(remove_library_links) -f=$(bin)library_links.in -without_cmt
endif

#-- end of constituents_trailer ------
