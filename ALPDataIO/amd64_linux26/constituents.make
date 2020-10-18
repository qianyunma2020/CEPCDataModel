
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

ALPDataIO_tag = $(tag)

#cmt_local_tagfile = $(ALPDataIO_tag).make
cmt_local_tagfile = $(bin)$(ALPDataIO_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)ALPDataIOsetup.make
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

cmt_ALPDataIO_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ALPDataIO_has_target_tag

#cmt_local_tagfile_ALPDataIO = $(ALPDataIO_tag)_ALPDataIO.make
cmt_local_tagfile_ALPDataIO = $(bin)$(ALPDataIO_tag)_ALPDataIO.make
cmt_local_setup_ALPDataIO = $(bin)setup_ALPDataIO$$$$.make
cmt_final_setup_ALPDataIO = $(bin)setup_ALPDataIO.make
#cmt_final_setup_ALPDataIO = $(bin)ALPDataIO_ALPDataIOsetup.make
cmt_local_ALPDataIO_makefile = $(bin)ALPDataIO.make

ALPDataIO_extratags = -tag_add=target_ALPDataIO

#$(cmt_local_tagfile_ALPDataIO) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_ALPDataIO) ::
else
$(cmt_local_tagfile_ALPDataIO) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_ALPDataIO); then /bin/rm -f $(cmt_local_tagfile_ALPDataIO); fi ; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_extratags) build tag_makefile >>$(cmt_local_tagfile_ALPDataIO)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_ALPDataIO)"; \
	  test ! -f $(cmt_local_setup_ALPDataIO) || \rm -f $(cmt_local_setup_ALPDataIO); \
	  trap '\rm -f $(cmt_local_setup_ALPDataIO)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_extratags) show setup >$(cmt_local_setup_ALPDataIO) && \
	  if [ -f $(cmt_final_setup_ALPDataIO) ] && \
	    \cmp -s $(cmt_final_setup_ALPDataIO) $(cmt_local_setup_ALPDataIO); then \
	    \rm $(cmt_local_setup_ALPDataIO); else \
	    \mv -f $(cmt_local_setup_ALPDataIO) $(cmt_final_setup_ALPDataIO); fi

else

#cmt_local_tagfile_ALPDataIO = $(ALPDataIO_tag).make
cmt_local_tagfile_ALPDataIO = $(bin)$(ALPDataIO_tag).make
cmt_final_setup_ALPDataIO = $(bin)setup.make
#cmt_final_setup_ALPDataIO = $(bin)ALPDataIOsetup.make
cmt_local_ALPDataIO_makefile = $(bin)ALPDataIO.make

endif

not_ALPDataIO_dependencies = { n=0; for p in $?; do m=0; for d in $(ALPDataIO_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
ALPDataIOdirs :
	@if test ! -d $(bin)ALPDataIO; then $(mkdir) -p $(bin)ALPDataIO; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)ALPDataIO
else
ALPDataIOdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# ALPDataIOdirs ::
#	@if test ! -d $(bin)ALPDataIO; then $(mkdir) -p $(bin)ALPDataIO; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)ALPDataIO
#
#$(cmt_local_ALPDataIO_makefile) :: $(ALPDataIO_dependencies) $(cmt_local_tagfile_ALPDataIO) build_library_links dirs ALPDataIOdirs
#else
#$(cmt_local_ALPDataIO_makefile) :: $(ALPDataIO_dependencies) $(cmt_local_tagfile_ALPDataIO) build_library_links dirs
#endif
#else
#$(cmt_local_ALPDataIO_makefile) :: $(cmt_local_tagfile_ALPDataIO)
#endif

ifdef cmt_ALPDataIO_has_target_tag

ifndef QUICK
$(cmt_local_ALPDataIO_makefile) : $(ALPDataIO_dependencies) build_library_links
	$(echo) "(constituents.make) Building ALPDataIO.make"; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_extratags) build constituent_config -out=$(cmt_local_ALPDataIO_makefile) ALPDataIO
else
$(cmt_local_ALPDataIO_makefile) : $(ALPDataIO_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_ALPDataIO) ] || \
	  [ ! -f $(cmt_final_setup_ALPDataIO) ] || \
	  $(not_ALPDataIO_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building ALPDataIO.make"; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_extratags) build constituent_config -out=$(cmt_local_ALPDataIO_makefile) ALPDataIO; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_ALPDataIO_makefile) : $(ALPDataIO_dependencies) build_library_links
	$(echo) "(constituents.make) Building ALPDataIO.make"; \
	  $(cmtexe) -f=$(bin)ALPDataIO.in -tag=$(tags) $(ALPDataIO_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_ALPDataIO_makefile) ALPDataIO
else
$(cmt_local_ALPDataIO_makefile) : $(ALPDataIO_dependencies) $(cmt_build_library_linksstamp) $(bin)ALPDataIO.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_ALPDataIO) ] || \
	  [ ! -f $(cmt_final_setup_ALPDataIO) ] || \
	  $(not_ALPDataIO_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building ALPDataIO.make"; \
	  $(cmtexe) -f=$(bin)ALPDataIO.in -tag=$(tags) $(ALPDataIO_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_ALPDataIO_makefile) ALPDataIO; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(ALPDataIO_extratags) build constituent_makefile -out=$(cmt_local_ALPDataIO_makefile) ALPDataIO

ALPDataIO :: $(ALPDataIO_dependencies) $(cmt_local_ALPDataIO_makefile) dirs ALPDataIOdirs
	$(echo) "(constituents.make) Starting ALPDataIO"
	@if test -f $(cmt_local_ALPDataIO_makefile); then \
	  $(MAKE) -f $(cmt_local_ALPDataIO_makefile) ALPDataIO; \
	  fi
#	@$(MAKE) -f $(cmt_local_ALPDataIO_makefile) ALPDataIO
	$(echo) "(constituents.make) ALPDataIO done"

clean :: ALPDataIOclean

ALPDataIOclean :: $(ALPDataIOclean_dependencies) ##$(cmt_local_ALPDataIO_makefile)
	$(echo) "(constituents.make) Starting ALPDataIOclean"
	@-if test -f $(cmt_local_ALPDataIO_makefile); then \
	  $(MAKE) -f $(cmt_local_ALPDataIO_makefile) ALPDataIOclean; \
	fi
	$(echo) "(constituents.make) ALPDataIOclean done"
#	@-$(MAKE) -f $(cmt_local_ALPDataIO_makefile) ALPDataIOclean

##	  /bin/rm -f $(cmt_local_ALPDataIO_makefile) $(bin)ALPDataIO_dependencies.make

install :: ALPDataIOinstall

ALPDataIOinstall :: $(ALPDataIO_dependencies) $(cmt_local_ALPDataIO_makefile)
	$(echo) "(constituents.make) Starting install ALPDataIO"
	@-$(MAKE) -f $(cmt_local_ALPDataIO_makefile) install
	$(echo) "(constituents.make) install ALPDataIO done"

uninstall : ALPDataIOuninstall

$(foreach d,$(ALPDataIO_dependencies),$(eval $(d)uninstall_dependencies += ALPDataIOuninstall))

ALPDataIOuninstall : $(ALPDataIOuninstall_dependencies) ##$(cmt_local_ALPDataIO_makefile)
	$(echo) "(constituents.make) Starting uninstall ALPDataIO"
	@if test -f $(cmt_local_ALPDataIO_makefile); then \
	  $(MAKE) -f $(cmt_local_ALPDataIO_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_ALPDataIO_makefile) uninstall
	$(echo) "(constituents.make) uninstall ALPDataIO done"

remove_library_links :: ALPDataIOuninstall

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ ALPDataIO"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ ALPDataIO done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_ALPDataIO_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ALPDataIO_python_has_target_tag

#cmt_local_tagfile_ALPDataIO_python = $(ALPDataIO_tag)_ALPDataIO_python.make
cmt_local_tagfile_ALPDataIO_python = $(bin)$(ALPDataIO_tag)_ALPDataIO_python.make
cmt_local_setup_ALPDataIO_python = $(bin)setup_ALPDataIO_python$$$$.make
cmt_final_setup_ALPDataIO_python = $(bin)setup_ALPDataIO_python.make
#cmt_final_setup_ALPDataIO_python = $(bin)ALPDataIO_ALPDataIO_pythonsetup.make
cmt_local_ALPDataIO_python_makefile = $(bin)ALPDataIO_python.make

ALPDataIO_python_extratags = -tag_add=target_ALPDataIO_python

#$(cmt_local_tagfile_ALPDataIO_python) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_ALPDataIO_python) ::
else
$(cmt_local_tagfile_ALPDataIO_python) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_ALPDataIO_python); then /bin/rm -f $(cmt_local_tagfile_ALPDataIO_python); fi ; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_python_extratags) build tag_makefile >>$(cmt_local_tagfile_ALPDataIO_python)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_ALPDataIO_python)"; \
	  test ! -f $(cmt_local_setup_ALPDataIO_python) || \rm -f $(cmt_local_setup_ALPDataIO_python); \
	  trap '\rm -f $(cmt_local_setup_ALPDataIO_python)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_python_extratags) show setup >$(cmt_local_setup_ALPDataIO_python) && \
	  if [ -f $(cmt_final_setup_ALPDataIO_python) ] && \
	    \cmp -s $(cmt_final_setup_ALPDataIO_python) $(cmt_local_setup_ALPDataIO_python); then \
	    \rm $(cmt_local_setup_ALPDataIO_python); else \
	    \mv -f $(cmt_local_setup_ALPDataIO_python) $(cmt_final_setup_ALPDataIO_python); fi

else

#cmt_local_tagfile_ALPDataIO_python = $(ALPDataIO_tag).make
cmt_local_tagfile_ALPDataIO_python = $(bin)$(ALPDataIO_tag).make
cmt_final_setup_ALPDataIO_python = $(bin)setup.make
#cmt_final_setup_ALPDataIO_python = $(bin)ALPDataIOsetup.make
cmt_local_ALPDataIO_python_makefile = $(bin)ALPDataIO_python.make

endif

not_ALPDataIO_python_dependencies = { n=0; for p in $?; do m=0; for d in $(ALPDataIO_python_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
ALPDataIO_pythondirs :
	@if test ! -d $(bin)ALPDataIO_python; then $(mkdir) -p $(bin)ALPDataIO_python; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)ALPDataIO_python
else
ALPDataIO_pythondirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# ALPDataIO_pythondirs ::
#	@if test ! -d $(bin)ALPDataIO_python; then $(mkdir) -p $(bin)ALPDataIO_python; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)ALPDataIO_python
#
#$(cmt_local_ALPDataIO_python_makefile) :: $(ALPDataIO_python_dependencies) $(cmt_local_tagfile_ALPDataIO_python) build_library_links dirs ALPDataIO_pythondirs
#else
#$(cmt_local_ALPDataIO_python_makefile) :: $(ALPDataIO_python_dependencies) $(cmt_local_tagfile_ALPDataIO_python) build_library_links dirs
#endif
#else
#$(cmt_local_ALPDataIO_python_makefile) :: $(cmt_local_tagfile_ALPDataIO_python)
#endif

ifdef cmt_ALPDataIO_python_has_target_tag

ifndef QUICK
$(cmt_local_ALPDataIO_python_makefile) : $(ALPDataIO_python_dependencies) build_library_links
	$(echo) "(constituents.make) Building ALPDataIO_python.make"; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_python_extratags) build constituent_config -out=$(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python
else
$(cmt_local_ALPDataIO_python_makefile) : $(ALPDataIO_python_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_ALPDataIO_python) ] || \
	  [ ! -f $(cmt_final_setup_ALPDataIO_python) ] || \
	  $(not_ALPDataIO_python_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building ALPDataIO_python.make"; \
	  $(cmtexe) -tag=$(tags) $(ALPDataIO_python_extratags) build constituent_config -out=$(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_ALPDataIO_python_makefile) : $(ALPDataIO_python_dependencies) build_library_links
	$(echo) "(constituents.make) Building ALPDataIO_python.make"; \
	  $(cmtexe) -f=$(bin)ALPDataIO_python.in -tag=$(tags) $(ALPDataIO_python_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python
else
$(cmt_local_ALPDataIO_python_makefile) : $(ALPDataIO_python_dependencies) $(cmt_build_library_linksstamp) $(bin)ALPDataIO_python.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_ALPDataIO_python) ] || \
	  [ ! -f $(cmt_final_setup_ALPDataIO_python) ] || \
	  $(not_ALPDataIO_python_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building ALPDataIO_python.make"; \
	  $(cmtexe) -f=$(bin)ALPDataIO_python.in -tag=$(tags) $(ALPDataIO_python_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(ALPDataIO_python_extratags) build constituent_makefile -out=$(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python

ALPDataIO_python :: $(ALPDataIO_python_dependencies) $(cmt_local_ALPDataIO_python_makefile) dirs ALPDataIO_pythondirs
	$(echo) "(constituents.make) Starting ALPDataIO_python"
	@if test -f $(cmt_local_ALPDataIO_python_makefile); then \
	  $(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python; \
	  fi
#	@$(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) ALPDataIO_python
	$(echo) "(constituents.make) ALPDataIO_python done"

clean :: ALPDataIO_pythonclean

ALPDataIO_pythonclean :: $(ALPDataIO_pythonclean_dependencies) ##$(cmt_local_ALPDataIO_python_makefile)
	$(echo) "(constituents.make) Starting ALPDataIO_pythonclean"
	@-if test -f $(cmt_local_ALPDataIO_python_makefile); then \
	  $(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) ALPDataIO_pythonclean; \
	fi
	$(echo) "(constituents.make) ALPDataIO_pythonclean done"
#	@-$(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) ALPDataIO_pythonclean

##	  /bin/rm -f $(cmt_local_ALPDataIO_python_makefile) $(bin)ALPDataIO_python_dependencies.make

install :: ALPDataIO_pythoninstall

ALPDataIO_pythoninstall :: $(ALPDataIO_python_dependencies) $(cmt_local_ALPDataIO_python_makefile)
	$(echo) "(constituents.make) Starting install ALPDataIO_python"
	@-$(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) install
	$(echo) "(constituents.make) install ALPDataIO_python done"

uninstall : ALPDataIO_pythonuninstall

$(foreach d,$(ALPDataIO_python_dependencies),$(eval $(d)uninstall_dependencies += ALPDataIO_pythonuninstall))

ALPDataIO_pythonuninstall : $(ALPDataIO_pythonuninstall_dependencies) ##$(cmt_local_ALPDataIO_python_makefile)
	$(echo) "(constituents.make) Starting uninstall ALPDataIO_python"
	@if test -f $(cmt_local_ALPDataIO_python_makefile); then \
	  $(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_ALPDataIO_python_makefile) uninstall
	$(echo) "(constituents.make) uninstall ALPDataIO_python done"

remove_library_links :: ALPDataIO_pythonuninstall

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ ALPDataIO_python"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ ALPDataIO_python done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_more_includes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_more_includes_has_target_tag

#cmt_local_tagfile_install_more_includes = $(ALPDataIO_tag)_install_more_includes.make
cmt_local_tagfile_install_more_includes = $(bin)$(ALPDataIO_tag)_install_more_includes.make
cmt_local_setup_install_more_includes = $(bin)setup_install_more_includes$$$$.make
cmt_final_setup_install_more_includes = $(bin)setup_install_more_includes.make
#cmt_final_setup_install_more_includes = $(bin)ALPDataIO_install_more_includessetup.make
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

#cmt_local_tagfile_install_more_includes = $(ALPDataIO_tag).make
cmt_local_tagfile_install_more_includes = $(bin)$(ALPDataIO_tag).make
cmt_final_setup_install_more_includes = $(bin)setup.make
#cmt_final_setup_install_more_includes = $(bin)ALPDataIOsetup.make
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

#cmt_local_tagfile_make = $(ALPDataIO_tag)_make.make
cmt_local_tagfile_make = $(bin)$(ALPDataIO_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)ALPDataIO_makesetup.make
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

#cmt_local_tagfile_make = $(ALPDataIO_tag).make
cmt_local_tagfile_make = $(bin)$(ALPDataIO_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)ALPDataIOsetup.make
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
