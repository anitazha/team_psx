ABSTRACT: PSX DIRECTORY				11/05/96


This directory is the main development structure containing
the latest library, version 3.6 along with corresponding 
samples and utilities.  

For installation instructions please refer to the technical
note on installation, in the Programmer Tools CD, "2000.doc"
and "2500.doc" at the root level.

Please refer to the below documents for detailed information
on the changes that have occured between 3.5 and 3.6 of the 
library and for a brief descriptions of the corresponding
samples.

	Library changes from 3.5 to 3.6     -	change.(txt/pdf)
    	Sample Descriptions	            -   sample.(txt/pdf)

BIN
	Utility to load a raw 	   	   0.92	BLOAD25.EXE
	  bin file to target ram	
   	Program to convert *.cpe to *.exe  1.5 	cpe2x.exe
	An internal file that is kept		DECICONS.HIS
	  by decicons.
   	Program to set GTE inline macros   3.01	dmpsx.exe
  NEW!  SCE utility to initialize H2500  	FLASH.BAT
	  for use with the H25DRV.EXE 
	  program
  NEW!  SCE beta utility to initialize 		FLASHB8.BAT
	  DTL-H2550 for use with the 
	  H25DRV.EXE program

  NEW!	SCE utility for loading to	   2.10 FLOAD.EXE
	 the DTL-H2550	
  NEW!	SCE utility for resetting	   2.10 FRESET.EXE
	 the DTL-H2550	 
  NEW!	SCE utility for ceasing	   	   2.10 FQUIT.EXE
	 loading to the DTL-H2550
	  
  NEW!  SCE driver for H2500 board	   1.6	H25DRV.EXE
  NEW!  H2500 initialization file		H25.INI
  NEW!  Internal file (holds memory image 	H2500.img  
	  of the flash bios of the H2500 
          board)
  NEW!  Internal file (holds beta memory 	H2500B8.IMG 
	  image  of the flash bios of the 
	  H2500 board. Used by 
	  \psx\bin\flashb8.bat

	Batch file to execute noprint       -   noprint.bat
	Suppress print message		    -   noprint.cpe
	Batch file to execute patchj	    -   patchj.bat
	Japan Developer's version of ROM    -   patchj.cpe
	patch
	Batch file to execute patchw	    -   patchw.bat
	US/Europe version of ROM patch	    -   patchw.cpe 
        (SEE NOTE1)
	Console program for DTL-H2000 	    -   psxcons.exe
	  board
  NEW!  Modifies the address of the PCI 	Realloc.exe
	 board (see the DTL-2500 installation 
	 manual for details)
  NEW!  An NTSC version of "resetps"	   0.92	RESET25N.EXE	
	  that should be used with  
	  h25DRV.exe. 
  NEW!  A PAL version of "resetps" that    0.92	RESET25P.EXE	
	  should be used with h25DRV.exe	
  NEW!  Runs your programs, should be 	   0.92	RUN25.EXE	
	  used only with H25DRV.EXE





INCLUDE
	Library 3.6 header files.  

KANJI
	This directory contains files for KANJI font support.
	Please refer to the "Readme.(txt/pdf)" document 
	in the KANJI directory for detailed information.

LIB
	Library 3.6

SAMPLE
	Samples corresponding to the library release 3.6.  Please
	refer to the document [cdrom]:\psx\sample.(txt/pdf) 
        for additional information.

UTILITY
	This directory contains sources to utilities.  

	Start-up utility from CDROM/Emulator-   Cdexec
	Sample program viewer	  	    -   Menu
	Frame buffer viewer                 -   Screen
	
	

NOTE 1:
We have moved all of the GNU tools that had been contained in 
the "psyq" directory into a "GNU" directory.  You should place

NOTE 2:
All documentation (except for the "readme.txt" and "readme_e.txt"
for sample code) have been moved to the Documentation CD-ROM.
The amount of information, source, and libraries can no longer 
fit on a single CD.

We have provided some of the documents in both plain text
and Adobe Acrobat PDF format.   Please use an Acrobat reader to view 
the PDF documents. 




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