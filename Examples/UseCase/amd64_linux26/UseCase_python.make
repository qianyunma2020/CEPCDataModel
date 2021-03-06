#-- start of make_header -----------------

#====================================
#  Document UseCase_python
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

cmt_UseCase_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_UseCase_python_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_UseCase_python

UseCase_tag = $(tag)

#cmt_local_tagfile_UseCase_python = $(UseCase_tag)_UseCase_python.make
cmt_local_tagfile_UseCase_python = $(bin)$(UseCase_tag)_UseCase_python.make

else

tags      = $(tag),$(CMTEXTRATAGS)

UseCase_tag = $(tag)

#cmt_local_tagfile_UseCase_python = $(UseCase_tag).make
cmt_local_tagfile_UseCase_python = $(bin)$(UseCase_tag).make

endif

include $(cmt_local_tagfile_UseCase_python)
#-include $(cmt_local_tagfile_UseCase_python)

ifdef cmt_UseCase_python_has_target_tag

cmt_final_setup_UseCase_python = $(bin)setup_UseCase_python.make
cmt_dependencies_in_UseCase_python = $(bin)dependencies_UseCase_python.in
#cmt_final_setup_UseCase_python = $(bin)UseCase_UseCase_pythonsetup.make
cmt_local_UseCase_python_makefile = $(bin)UseCase_python.make

else

cmt_final_setup_UseCase_python = $(bin)setup.make
cmt_dependencies_in_UseCase_python = $(bin)dependencies.in
#cmt_final_setup_UseCase_python = $(bin)UseCasesetup.make
cmt_local_UseCase_python_makefile = $(bin)UseCase_python.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)UseCasesetup.make

#UseCase_python :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'UseCase_python'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = UseCase_python/
#UseCase_python::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of install_python_header ------


installarea = ${CMTINSTALLAREA}
install_python_dir = $(installarea)

ifneq ($(strip "$(source)"),"")
src = ../$(source)
dest = $(install_python_dir)/python
else
src = ../python
dest = $(install_python_dir)
endif

ifneq ($(strip "$(offset)"),"")
dest = $(install_python_dir)/python
endif

UseCase_python :: UseCase_pythoninstall

install :: UseCase_pythoninstall

UseCase_pythoninstall :: $(install_python_dir)
	@if [ ! "$(installarea)" = "" ] ; then\
	  echo "installation done"; \
	fi

$(install_python_dir) ::
	@if [ "$(installarea)" = "" ] ; then \
	  echo "Cannot install header files, no installation source specified"; \
	else \
	  if [ -d $(src) ] ; then \
	    echo "Installing files from $(src) to $(dest)" ; \
	    if [ "$(offset)" = "" ] ; then \
	      $(install_command) --exclude="*.py?" $(src) $(dest) ; \
	    else \
	      $(install_command) --exclude="*.py?" $(src) $(dest) --destname $(offset); \
	    fi ; \
	  else \
	    echo "no source  $(src)"; \
	  fi; \
	fi

UseCase_pythonclean :: UseCase_pythonuninstall

uninstall :: UseCase_pythonuninstall

UseCase_pythonuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation source specified"; \
	else \
	  echo "Uninstalling files from $(dest)"; \
	  $(uninstall_command) "$(dest)" ; \
	fi


#-- end of install_python_header ------
#-- start of cleanup_header --------------

clean :: UseCase_pythonclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(UseCase_python.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

UseCase_pythonclean ::
#-- end of cleanup_header ---------------
