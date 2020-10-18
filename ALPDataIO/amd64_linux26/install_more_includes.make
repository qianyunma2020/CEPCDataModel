#-- start of make_header -----------------

#====================================
#  Document install_more_includes
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

cmt_install_more_includes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_more_includes_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_more_includes

ALPDataIO_tag = $(tag)

#cmt_local_tagfile_install_more_includes = $(ALPDataIO_tag)_install_more_includes.make
cmt_local_tagfile_install_more_includes = $(bin)$(ALPDataIO_tag)_install_more_includes.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ALPDataIO_tag = $(tag)

#cmt_local_tagfile_install_more_includes = $(ALPDataIO_tag).make
cmt_local_tagfile_install_more_includes = $(bin)$(ALPDataIO_tag).make

endif

include $(cmt_local_tagfile_install_more_includes)
#-include $(cmt_local_tagfile_install_more_includes)

ifdef cmt_install_more_includes_has_target_tag

cmt_final_setup_install_more_includes = $(bin)setup_install_more_includes.make
cmt_dependencies_in_install_more_includes = $(bin)dependencies_install_more_includes.in
#cmt_final_setup_install_more_includes = $(bin)ALPDataIO_install_more_includessetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

else

cmt_final_setup_install_more_includes = $(bin)setup.make
cmt_dependencies_in_install_more_includes = $(bin)dependencies.in
#cmt_final_setup_install_more_includes = $(bin)ALPDataIOsetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ALPDataIOsetup.make

#install_more_includes :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_more_includes'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_more_includes/
#install_more_includes::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of install_more_includes_header ------

#
#  We want to install all header files that follow the standard convention
#
#    ../<more>
#
#  This document generator needs no parameterization, since it simply expects
#  the standard convention.
#

installarea = ${CMTINSTALLAREA}
install_include_dir = $(installarea)/include

install_more_includes :: install_more_includesinstall

install :: install_more_includesinstall

install_more_includesinstall :: $(install_include_dir)
	@if test ! "$(installarea)" = ""; then\
	  echo "installation done"; \
	fi

$(install_include_dir) ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot install header files, no installation directory specified"; \
	else \
	  if test ! "" = "";then \
	    if test -d ../; then \
	       echo "Installing files from offset ../ to $(install_include_dir)"; \
	       if test ! -d $(install_include_dir) ; then mkdir -p $(install_include_dir); fi; \
	       if test ! -d $(install_include_dir)/; then mkdir -p $(install_include_dir)/; fi;\
	       $(install_command) ../ $(install_include_dir);\
	    else \
	       echo "no offset   include directory"; \
	    fi; \
	  fi; \
	  if test ! "ALPDataIO" = ""; then \
	    if test -d ../ALPDataIO; then \
	      echo "Installing files from more ../ALPDataIO to $(install_include_dir)"; \
	      if test ! -d $(install_include_dir) ; then mkdir -p $(install_include_dir); fi; \
	      if test ! -d $(install_include_dir)/ALPDataIO; then mkdir -p $(install_include_dir)/ALPDataIO; fi;\
	        $(install_command) ../ALPDataIO $(install_include_dir);\
	    else \
	      echo "No more ALPDataIO include directory"; \
	    fi; \
          fi; \
	fi

install_more_includesclean :: install_more_includesuninstall

uninstall :: install_more_includesuninstall

install_more_includesuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation directory specified"; \
	else \
	  echo "Uninstalling files from $(install_include_dir)/ALPDataIO"; \
	  $(uninstall_command) "$(install_include_dir)/ALPDataIO/*" ; \
	  if test -f $(install_include_dir)/ALPDataIO.cmtref ; then \
	    echo "Removing $(install_include_dir)/ALPDataIO.cmtref"; \
	    eval rm -f $(install_include_dir)/ALPDataIO.cmtref ; \
	  fi; \
	fi


#-- end of install_more_includes_header ------
#-- start of cleanup_header --------------

clean :: install_more_includesclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_more_includes.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_more_includesclean ::
#-- end of cleanup_header ---------------