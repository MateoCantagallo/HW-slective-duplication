#
# SimpleScalar(TM) Tool Suite
# Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
# All Rights Reserved. 
# 
#
#
# MODIFIED BY: JOSEPH SHARKEY - SEPTEMBER 2005
#
#
#
# THIS IS A LEGAL DOCUMENT, BY USING SIMPLESCALAR,
# YOU ARE AGREEING TO THESE TERMS AND CONDITIONS.
# 
# No portion of this work may be used by any commercial entity, or for any
# commercial purpose, without the prior, written permission of SimpleScalar,
# LLC (info@simplescalar.com). Nonprofit and noncommercial use is permitted
# as described below.
# 
# 1. SimpleScalar is provided AS IS, with no warranty of any kind, express
# or implied. The user of the program accepts full responsibility for the
# application of the program and the use of any results.
# 
# 2. Nonprofit and noncommercial use is encouraged. SimpleScalar may be
# downloaded, compiled, executed, copied, and modified solely for nonprofit,
# educational, noncommercial research, and noncommercial scholarship
# purposes provided that this notice in its entirety accompanies all copies.
# Copies of the modified software can be delivered to persons who use it
# solely for nonprofit, educational, noncommercial research, and
# noncommercial scholarship purposes provided that this notice in its
# entirety accompanies all copies.
# 
# 3. ALL COMMERCIAL USE, AND ALL USE BY FOR PROFIT ENTITIES, IS EXPRESSLY
# PROHIBITED WITHOUT A LICENSE FROM SIMPLESCALAR, LLC (info@simplescalar.com).
# 
# 4. No nonprofit user may place any restrictions on the use of this software,
# including as modified by the user, by any other authorized user.
# 
# 5. Noncommercial and nonprofit users may distribute copies of SimpleScalar
# in compiled or executable form as set forth in Section 2, provided that
# either: (A) it is accompanied by the corresponding machine-readable source
# code, or (B) it is accompanied by a written offer, with no time limit, to
# give anyone a machine-readable copy of the corresponding source code in
# return for reimbursement of the cost of distribution. This written offer
# must permit verbatim duplication by anyone, or (C) it is distributed by
# someone who received only the executable form, and is accompanied by a
# copy of the written offer of source code.
# 
# 6. SimpleScalar was developed by Todd M. Austin, Ph.D. The tool suite is
# currently maintained by SimpleScalar LLC (info@simplescalar.com). US Mail:
# 2395 Timbercrest Court, Ann Arbor, MI 48105.
# 
# Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
#


##################################################################
#
# Modify the following definitions to suit your build environment,
# NOTE: most platforms should not require any changes
#
##################################################################

#
# Define below C compiler and flags, machine-specific flags and libraries,
# build tools and file extensions, these are specific to a host environment,
# pre-tested environments follow...
#

##
## vanilla Unix, GCC build
##
## NOTE: the SimpleScalar simulators must be compiled with an ANSI C
## compatible compiler.
##
## tested hosts:
##
##	Slackware Linux version 2.0.33, GNU GCC version 2.7.2.2
##	FreeBSD version 3.0-current, GNU egcs version 2.91.50
##	Alpha OSF1 version 4.0, GNU GCC version 2.7.2
##	PA-RISC HPUX version B.10.01, GNU GCC version 2.7-96q3
##	SPARC SunOS version 5.5.1, GNU egcs-2.90.29
##	RS/6000 AIX Unix version 4, GNU GCC version cygnus-2.7-96q4
##	Windows NT version 4.0, Cygnus CygWin/32 beta 19
##
CC = gcc
OFLAGS = -O0 -g -Wall
MFLAGS = `./sysprobe -flags`
MLIBS  = `./sysprobe -libs` -lm
ENDIAN = `./sysprobe -s`
MAKE = make
AR = ar qcv
AROPT =
RANLIB = ranlib
RM = rm -f
RMDIR = rm -f
LN = ln -s
LNDIR = ln -s
DIFF = diff
OEXT = o
LEXT = a
EEXT =
CS = ;
X=/

##
## Solaris 2.6, GNU GCC version 2.7.2.3
##
#CC = gcc # /s/gcc-2.7.2.3/bin/gcc
#OFLAGS = -O0 -g -Wall
#MFLAGS = `./sysprobe -flags`
#MLIBS  = `./sysprobe -libs` -lm -lsocket -lnsl
#ENDIAN = `./sysprobe -s`
#MAKE = make
#AR = ar qcv
#AROPT =
#RANLIB = ranlib
#RM = rm -f
#RMDIR = rm -f
#LN = ln -s
#LNDIR = ln -s
#DIFF = diff
#OEXT = o
#LEXT = a
#EEXT =
#CS = ;
#X=/

##
## Alpha OSF1 version 4.0, DEC C compiler version V5.2-036
##
#CC = cc -std
#OFLAGS = -O0 -g -w
#MFLAGS = `./sysprobe -flags`
#MLIBS  = `./sysprobe -libs` -lm
#ENDIAN = `./sysprobe -s`
#MAKE = make
#AR = ar qcv
#AROPT =
#RANLIB = ranlib
#RM = rm -f
#RMDIR = rm -f
#LN = ln -s
#LNDIR = ln -s
#DIFF = diff
#OEXT = o
#LEXT = a
#EEXT =
#CS = ;
#X=/

##
## PA-RISC HPUX version B.10.01, c89 HP C compiler version A.10.31.02
##
#CC = c89 +e -D__CC_C89
#OFLAGS = -g
#MFLAGS = `./sysprobe -flags`
#MLIBS  = `./sysprobe -libs` -lm
#ENDIAN = `./sysprobe -s`
#MAKE = make
#AR = ar qcv
#AROPT =
#RANLIB = ranlib
#RM = rm -f
#RMDIR = rm -f
#LN = ln -s
#LNDIR = ln -s
#DIFF = diff
#OEXT = o
#LEXT = a
#EEXT =
#CS = ;
#X=/

##
## SPARC SunOS version 5.5.1, Sun WorkShop C Compiler (acc) version 4.2
##
#CC = /opt/SUNWspro/SC4.2/bin/acc
#OFLAGS = -O0 -g
#MFLAGS = `./sysprobe -flags`
#MLIBS  = `./sysprobe -libs` -lm
#ENDIAN = `./sysprobe -s`
#MAKE = make
#AR = ar qcv
#AROPT =
#RANLIB = ranlib
#RM = rm -f
#RMDIR = rm -f
#LN = ln -s
#LNDIR = ln -s
#DIFF = diff
#OEXT = o
#LEXT = a
#EEXT =
#CS = ;
#X=/

##
## RS/6000 AIX Unix version 4, xlc compiler build
##
#CC = xlc -D__CC_XLC
#OFLAGS = -g
#MFLAGS = `./sysprobe -flags`
#MLIBS  = `./sysprobe -libs` -lm
#ENDIAN = `./sysprobe -s`
#MAKE = make
#AR = ar qcv
#AROPT =
#RANLIB = ranlib
#RM = rm -f
#RMDIR = rm -f
#LN = ln -s
#LNDIR = ln -s
#DIFF = diff
#OEXT = o
#LEXT = a
#EEXT =
#CS = ;
#X=/

##
## WinNT, MS VC++ build
##
## NOTE: requires MS VC++ version 5.0 + service pack 3 or later
## NOTE1: before configuring the simulator, delete the symbolic link "tests/"
##
#CC = cl /Za /nologo
#OFLAGS = /W3 /Zi
#MFLAGS = -DBYTES_LITTLE_ENDIAN -DWORDS_LITTLE_ENDIAN -DFAST_SRL -DFAST_SRA
#MLIBS  =
#ENDIAN = little
#MAKE = nmake /nologo
#AR = lib
#AROPT = -out:
#RANLIB = dir
#RM = del/f/q
#RMDIR = del/s/f/q
#LN = copy
#LNDIR = xcopy/s/e/i
#DIFF = dir
#OEXT = obj
#LEXT = lib
#EEXT = .exe
#CS = &&
#X=\\\\

#
# Compilation-specific feature flags
#
# -DDEBUG	- turns on debugging features
# -DBFD_LOADER	- use libbfd.a to load programs (also required BINUTILS_INC
#		  and BINUTILS_LIB to be defined, see below)
# -DGZIP_PATH	- specifies path to GZIP executable, only needed if SYSPROBE
#		  cannot locate binary
# -DSLOW_SHIFTS	- emulate all shift operations, only used for testing as
#		  sysprobe will auto-detect if host can use fast shifts
#
FFLAGS = -DDEBUG

#
# Point the Makefile to your Simplescalar-based bunutils, these definitions
# should indicate where the include and library directories reside.
# NOTE: these definitions are only required if BFD_LOADER is defined.
#
#BINUTILS_INC = -I../include
#BINUTILS_LIB = -L../lib

#
#


##################################################################
#
# YOU SHOULD NOT NEED TO MODIFY ANYTHING BELOW THIS COMMENT
#
##################################################################

#
# complete flags
#
CFLAGS = $(MFLAGS) $(FFLAGS) $(OFLAGS) $(BINUTILS_INC) $(BINUTILS_LIB)

#
# all the sources
#
SRCS =	main.c sim-outorder.c sim-outordersel.c sim-outorder-none.c \
	memory.c regs.c cache.c bpred.c ptrace.c eventq.c \
	resource.c endian.c dlite.c symbol.c eval.c options.c range.c \
	eio.c stats.c endian.c misc.c smt.c power.c\
	target-alpha/alpha.c target-alpha/loader.c target-alpha/syscall.c \
	target-alpha/symbol.c

HDRS =	syscall.h memory.h regs.h sim.h loader.h cache.h bpred.h ptrace.h \
	eventq.h resource.h endian.h dlite.h symbol.h eval.h bitmap.h \
	eio.h range.h version.h endian.h misc.h smt.h power.h\
	target-alpha/alpha.h target-alpha/alpha.def target-alpha/ecoff.h

#
# common objects
#
OBJS =	main.$(OEXT) syscall.$(OEXT) memory.$(OEXT) regs.$(OEXT) \
	loader.$(OEXT) endian.$(OEXT) dlite.$(OEXT) symbol.$(OEXT) \
	eval.$(OEXT) options.$(OEXT) stats.$(OEXT) eio.$(OEXT)\
	range.$(OEXT) misc.$(OEXT) machine.$(OEXT) power.$(OEXT)

#
# all targets, NOTE: library ordering is important...
#
all: sim-outorder sim-outordersel sim-outorder-none
	@echo "my work is done here..."

config-alpha:
	-$(RM) config.h machine.h machine.c machine.def loader.c symbol.c syscall.c
	$(LN) target-alpha$(X)config.h config.h
	$(LN) target-alpha$(X)alpha.h machine.h
	$(LN) target-alpha$(X)alpha.c machine.c
	$(LN) target-alpha$(X)alpha.def machine.def
	$(LN) target-alpha$(X)loader.c loader.c
	$(LN) target-alpha$(X)symbol.c symbol.c
	$(LN) target-alpha$(X)syscall.c syscall.c
	-$(RMDIR) tests
	$(LNDIR) tests-alpha tests

sysprobe$(EEXT):	sysprobe.c
	$(CC) $(FFLAGS) -o sysprobe$(EEXT) sysprobe.c
	@echo endian probe results: $(ENDIAN)
	@echo probe flags: $(MFLAGS)
	@echo probe libs: $(MLIBS)

wattch-interact$(EEXT): sysprobe$(EEXT) eval.o misc.o stats.o power.o wattch-interact.o cacti/libcacti.$(LEXT)
	$(CC) eval.o misc.o stats.o power.o wattch-interact.o cacti/libcacti.$(LEXT) $(CFLAGS) -lc -lm -o wattch-interact

power$(EEXT):           power.c
	$(CC) $(SAFECFLAGS) -c power.c

sim-outorder$(EEXT):	sysprobe$(EEXT) sim-outorder.$(OEXT) cache.$(OEXT) bpred.$(OEXT) resource.$(OEXT) ptrace.$(OEXT) $(OBJS) libexo/libexo.$(LEXT) cacti/libcacti.$(LEXT)
	$(CC) -o sim-outorder$(EEXT) $(CFLAGS) sim-outorder.$(OEXT) cache.$(OEXT) bpred.$(OEXT) resource.$(OEXT) ptrace.$(OEXT) $(OBJS) libexo/libexo.$(LEXT) cacti/libcacti.$(LEXT) $(MLIBS)

sim-outordersel$(EEXT):	sysprobe$(EEXT) sim-outordersel.$(OEXT) cache.$(OEXT) bpred.$(OEXT) resource.$(OEXT) ptrace.$(OEXT) $(OBJS) libexo/libexo.$(LEXT) cacti/libcacti.$(LEXT)
	$(CC) -o sim-outordersel$(EEXT) $(CFLAGS) sim-outordersel.$(OEXT) cache.$(OEXT) bpred.$(OEXT) resource.$(OEXT) ptrace.$(OEXT) $(OBJS) libexo/libexo.$(LEXT) cacti/libcacti.$(LEXT) $(MLIBS)

sim-outorder-none$(EEXT):	sysprobe$(EEXT) sim-outorder-none.$(OEXT) cache.$(OEXT) bpred.$(OEXT) resource.$(OEXT) ptrace.$(OEXT) $(OBJS) libexo/libexo.$(LEXT) cacti/libcacti.$(LEXT)
	$(CC) -o sim-outorder-none$(EEXT) $(CFLAGS) sim-outorder-none.$(OEXT) cache.$(OEXT) bpred.$(OEXT) resource.$(OEXT) ptrace.$(OEXT) $(OBJS) libexo/libexo.$(LEXT) cacti/libcacti.$(LEXT) $(MLIBS)

exo libexo/libexo.$(LEXT): sysprobe$(EEXT)
	cd libexo $(CS) \
	$(MAKE) "MAKE=$(MAKE)" "CC=$(CC)" "AR=$(AR)" "AROPT=$(AROPT)" "RANLIB=$(RANLIB)" "CFLAGS=$(MFLAGS) $(FFLAGS) $(OFLAGS)" "OEXT=$(OEXT)" "LEXT=$(LEXT)" "EEXT=$(EEXT)" "X=$(X)" "RM=$(RM)" libexo.$(LEXT)

cacti cacti/libcacti.$(LEXT): sysprobe$(EEXT)
	cd cacti $(CS) \
	$(MAKE) "MAKE=$(MAKE)" "CC=$(CC)" "AR=$(AR)" "AROPT=$(AROPT)" "RANLIB=$(RANLIB)" "CFLAGS=$(MFLAGS) $(FFLAGS) $(SAFEOFLAGS)" "OEXT=$(OEXT)" "LEXT=$(LEXT)" "EEXT=$(EEXT)" "X=$(X)" "RM=$(RM)" libcacti.$(LEXT)


.c.$(OEXT):
	$(CC) $(CFLAGS) -c $*.c > error.log 2>&1

filelist:
	@echo $(SRCS) $(HDRS) Makefile

diffs:
	-rcsdiff RCS/*
	-cd config; rcsdiff RCS/*
	-cd libexo; rcsdiff RCS/*
	-cd target-alpha; rcsdiff RCS/*

clean:
	-$(RM) *.o *.obj *.exe core *~ MAKE.log Makefile.bak sysprobe$(EEXT) sim-outorder sim-outordersel sim-outorder-none
	cd libexo $(CS) $(MAKE) "RM=$(RM)" "CS=$(CS)" clean $(CS) cd ..
	cd cacti $(CS) $(MAKE) "RM=$(RM)" "CS=$(CS)" clean $(CS) cd ..

depend:
	makedepend.local -n -x $(BINUTILS_INC) $(SRCS)


# DO NOT DELETE THIS LINE -- make depend depends on it.

main.$(OEXT): host.h misc.h machine.h machine.def endian.h version.h dlite.h
main.$(OEXT): regs.h memory.h options.h stats.h eval.h loader.h sim.h smt.h
sim-outorder.$(OEXT): host.h misc.h machine.h machine.def regs.h memory.h
sim-outorder.$(OEXT): options.h stats.h eval.h cache.h loader.h syscall.h
sim-outorder.$(OEXT): bpred.h resource.h bitmap.h ptrace.h range.h dlite.h
sim-outorder.$(OEXT): sim.h smt.h
memory.$(OEXT): host.h misc.h machine.h machine.def options.h stats.h eval.h
memory.$(OEXT): memory.h
regs.$(OEXT): host.h misc.h machine.h machine.def loader.h regs.h memory.h
regs.$(OEXT): options.h stats.h eval.h
cache.$(OEXT): host.h misc.h machine.h machine.def cache.h memory.h options.h
cache.$(OEXT): stats.h eval.h
bpred.$(OEXT): host.h misc.h machine.h machine.def bpred.h stats.h eval.h
ptrace.$(OEXT): host.h misc.h machine.h machine.def range.h ptrace.h
eventq.$(OEXT): host.h misc.h machine.h machine.def eventq.h bitmap.h
resource.$(OEXT): host.h misc.h resource.h
endian.$(OEXT): endian.h loader.h host.h misc.h machine.h machine.def regs.h
endian.$(OEXT): memory.h options.h stats.h eval.h
dlite.$(OEXT): host.h misc.h machine.h machine.def version.h eval.h regs.h
dlite.$(OEXT): memory.h options.h stats.h sim.h symbol.h loader.h range.h
dlite.$(OEXT): dlite.h
symbol.$(OEXT): host.h misc.h target-alpha/ecoff.h loader.h machine.h
symbol.$(OEXT): machine.def regs.h memory.h options.h stats.h eval.h symbol.h
eval.$(OEXT): host.h misc.h eval.h machine.h machine.def
options.$(OEXT): host.h misc.h options.h
range.$(OEXT): host.h misc.h machine.h machine.def symbol.h loader.h regs.h
range.$(OEXT): memory.h options.h stats.h eval.h range.h
eio.$(OEXT): host.h misc.h machine.h machine.def regs.h memory.h options.h
eio.$(OEXT): stats.h eval.h loader.h libexo/libexo.h host.h misc.h machine.h
eio.$(OEXT): syscall.h sim.h endian.h eio.h
stats.$(OEXT): host.h misc.h machine.h machine.def eval.h stats.h
endian.$(OEXT): endian.h loader.h host.h misc.h machine.h machine.def regs.h
endian.$(OEXT): memory.h options.h stats.h eval.h
misc.$(OEXT): host.h misc.h machine.h machine.def
power.$(OEXT): host.h misc.h machine.h machine.def cache.h memory.h options.h
power.$(OEXT): stats.h eval.h power.h
loader.$(OEXT): host.h misc.h machine.h machine.def endian.h regs.h memory.h
loader.$(OEXT): options.h stats.h eval.h sim.h eio.h loader.h
loader.$(OEXT): target-alpha/ecoff.h
syscall.$(OEXT): host.h misc.h machine.h machine.def regs.h memory.h
syscall.$(OEXT): options.h stats.h eval.h loader.h sim.h eio.h endian.h
syscall.$(OEXT): syscall.h smt.h
symbol.$(OEXT): host.h misc.h target-alpha/ecoff.h loader.h machine.h
symbol.$(OEXT): machine.def regs.h memory.h options.h stats.h eval.h symbol.h
alpha.$(OEXT): host.h misc.h machine.h machine.def eval.h regs.h
loader.$(OEXT): host.h misc.h machine.h machine.def endian.h regs.h memory.h
loader.$(OEXT): options.h stats.h eval.h sim.h eio.h loader.h
loader.$(OEXT): target-alpha/ecoff.h target-alpha/alpha.h
syscall.$(OEXT): host.h misc.h machine.h machine.def regs.h memory.h
syscall.$(OEXT): options.h stats.h eval.h loader.h sim.h eio.h endian.h
syscall.$(OEXT): syscall.h
symbol.$(OEXT): host.h misc.h loader.h machine.h machine.def regs.h memory.h
symbol.$(OEXT): options.h stats.h eval.h symbol.h target-alpha/ecoff.h
symbol.$(OEXT): target-alpha/alpha.h
