ABSTRACT: PSYQ DIRECTORY			11/08/96


This directory contains the PSYQ development tools such as
the compiler, debugger and many other useful utilities for
PlayStation development.

For installation instructions please refer to the technical
note on installation, [cdrom]:\docs\technote\install.(doc/pdf)

The programs/utilities marked "NEW!" are new releases since the
last release.  


Files marked by "In GNU directory" in the list below 
reside in the "GNU" directory at the root level of the Programmer 
Tools CD.  You should move the contents of that folder into
the "\psyq" directory only if you agree to the terms of the 
GNU license in the "GNU.txt" file (located at the root level
of the Programmer Tools CD).


BIN
        COMPILER & LINKER
  NEW! -Assembler                          2.25 asmpsx.exe
       -Assembler for C compiler output    2.34 aspsx.exe
       -Performs the C++ Compiler main      -   cc1plpsx.exe  (In GNU directory)   
        pass.                               -   cc1psx.exe    (In GNU directory) 
  NEW! - Auxilary file used to clear the 	Cleanmem
         flash memory of the H2500     
       -PsyQ Compiler                      1.18 ccpsx.exe     (In GNU directory)                  
       -C++ Compiler                       1.12 cpluspsx.exe  (In GNU directory) 
       -                                    -   cpppsx.exe    (In GNU directory) 
       -PsyQ Librarian utility             2.04 psylib.exe
  NEW! -PsyQ Linker                        2.42 psylink.exe   
       -PsyQ Make utility                  1.12 psymake.exe
       -PsyQ initializaton file.            -   psyq.ini
       -Brief macros source		    -   psyq.cb
       -Brief macros (compiled)		    -   psyq.cm

  New! -DMPI DOS extender.If running from   -   cwsdpmi.exe
 	DOS, then you must put cwsdpmi.exe
	on the PCs executable path. Under 
	Windows '95, the DPMI DOS extender 
	will already  be setup, so this 
	shouldn't be needed.


        DEBUGGER
  NEW! -PlayStation Development debugger   4.95  dbugpsx.exe       
  NEW! -Message handler TSR (for debugger  1.03 mess1.com 
        output)
       -Message handler TSR (for RS232     3.01 mess3.com
        output)
       -PC message test program             -   testmess.com
	Run this program after you
	run your *.cpe file.  This
	program will dump out the 
	printf's.
       -Simple message-stream terminal 		TESTMESS.C (see h25bios.doc)						
	program  				TESTMESS.COM
 						TESTMESS.CPE
 						TESTMESS.SYM

        DEVELOPMENT BOARD UTILITIES
       -Program for delay in batch files.   -   delay.com
       -PsyQ bios extensions for the       1.23 dexbios.com
        DTL-H2000 board.      
       -Utility to load a COFF file to      -   pqaload.com
        target RAM.        
       -Utility to load a raw bin file to   -   pqbload.com
        target RAM.
       -Utility to execute from address     -   pqgopsx.com
 NEW!  -Utility to reset DTL-H2000 board   1.06 resetps.exe
	and the DTL-H2500 board.
       -PsyQ executable for downloading    2.33 run.exe
        program/runner.
       -Batch file for resetps and patch    -   rp.bat

        PlayStation executables needed to run emulation
        sessions and also to switch between the emulation
        session and the CD-R session.

       -Utility to start the program from   -   cdexec.cpe
        the CD-ROM/Emulator.
       -Command switch to select use of     -   selcd.cpe
        CD-R (DTL-2010)       
       -Command switch to select use of     -   selemu.cpe
        CD emulator drive.  
       -Batch file for cdexec               -   runcdex.bat
       -Batch file for selcd                -   runselcd.bat
       -Batch file for selemu               -   runselem.bat                              

        SN SYSTEMS FILES
       -SN Original patch ROM utility       -   snpatch.cpe
       -File to emulate the floating-point  -	Emu387
	  coprocessor (in the even that you
	  don't have one).

        UTILITIES
       -Utility to view more lines in a     -   bv.exe
        ms-dos window.
       -Utility to dump contents of a      2.0  dumpcpe.exe
        *.cpe file.  
       -Utility to dump contents of a      1.0  dumpexe.exe
        *.exe file.
       -Utility to dump contents of a      2.0  dumpobj.exe
        *.obj file.
       -Utility to dump contents of a       -   dumpsym.exe 
        *.sym file.
       -Kanji Utility                       -   Kanji.com
       -Utility to view the version         -   version.com
        number of a *.exe file.
  NEW! -DOS extender                       1.97 dos4gw.exe
  NEW! -Symbol file compaction utility     1.3  symmunge.exe
	 -Brief macros source			  -   psyq.cb
	 -Compiled brief macros			  -   psyq.cm

DTL-H2500 utilities
  NEW!  -Internal program used by  	   2.10	FLOAD.EXE (see flashbat.doc)
	 flash.bat
  NEW!  -Internal program used by  	   2.10	FQUIT.EXE (see flashbat.doc)
	 flash.bat
  NEW!  -Internal program used by 	   2.10	FRESET.EXE (see flashbat.doc)
	 flash.bat
  NEW!  -Psy-Q Driver for H2500 PCI card  1.41  H25bios.com (see h25bios.doc) 
  NEW!  -Internal file used by pflash.bat	kernel.bin
  NEW!  -Internal file used by pflash.bat	kromdat.bin
  NEW!  -Internal file used by pflash.bat	kromgdat.bin
  NEW!  -H2500	specific library		LIBDECI.LIB 
         Replaces functions in libsn 
	 specific to H2000. You must link 
	 with this file to use the PCFS. 
	 Add it to your link file BEFORE 
	 libsn.lib. These changes work on 
	 the H2000 as well as the H2500.   
	 (see \psx\sample\pcfs for an 
	  example)
  NEW!  -Program for initializing the  	 	PFLASH.BAT
          H2500 board for use with the 
          h25BIOS.com program
  NEW!  -File used by "PFLASH.BAT"		PFLASH
  
  NEW!  -Internal stub used by pflash.bat.	SN.BIN
         Allows messages (such as printf) to
         be function.		


SAMPLE    
        This directory contains samples released by SN for 
        use with particular tools.

        Samples for debugger (overlay)      -   Debugger

SRC
        This directory contains source for SN's library,
        libsn and the utility  symmunge.

        Source code for libsn.lib           -   Sn
        Sounce code for utility symmunge    -   symmunge.


WINDEBUG (NEW!)
	Contains the Psy-Q Windows 	    1.5	
	Debugger.  Please copy the 
	contents of "disk 1" to a blank 
	disk, and copy the contents of 
	"disk2" to anoter blank disk. Then 
	pkunzip the files.  (Note: This 
	ONLY works for owners of the DTL-H2000).



We have provided some of the documents in both plain text
and Adobe Acrobat PDF format.  All the documents have been
incorporated into the CD search index. Please use an Acrobat 
reader to view the PDF documents. 


=======================================================================

Copyright (C) 1994 - 1996 Sony Computer Entertainment Inc.
			              All Rights Reserved.

PlayStation and PlayStation logos are trademarks of Sony Computer
Entertainment Inc. All other trademarks are property of their 
respective owners and/or their licensors.


SONY COMPUTER ENTERTAINMENT AMERICA
919 East Hillsdale Blvd, 2nd Floor
Foster City CA 94404
415-655-8000    
E-mail: DevTech_Support@interactive.sony.com
Developer Support BBS:     415-655-8119
Developer Support Hotline: 415-655-8181    

SONY COMPUTER ENTERTAINMENT EUROPE
Waverley House
7-12 Noel Street
London W1V 4HH
E-mail: dev_support@interactive.sony.com
WWW: http://www.scee.sony.co.uk
                      FAX:  +44 (0) 171 390 4324
Developer Support Hotline:  +44 (0) 171 390 1680

========================================================================
