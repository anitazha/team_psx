ABSTRACT: PROGRAMMER TOOLS DTL-S2002 CD			11/26/96

Introduction:

This document contains information on how to install the contents of 
the CD and a listing of the directories.


--------------------
Installation: 

If you are new to PlayStation programming, and are installing either 
the DTL-H2000 or DTL-H2500, then read either the "2000.doc" or the "2500.doc"
included on this CD-ROM.  If you do not have a Word-compatible reader, then
you can install Adobe Acrobat from the Technical Reference CD, and read the
"2000.pdf" or the "2500.pdf" manuals.  

If you are just upgrading your PlayStation development software, you can
drag the files and folders directly from the CD-ROM as usual.  WARNING:
BE SURE TO COPY THE [cdrom]:\GNU FOLDER CONTENTS TO THE [cdrom]:\psyq\bin 
DIRECTORY.

If you are running Windows 3.1, follow the instructions in the "2000.doc"
or the "2500.doc", in the sections on Installing Software.  Again, be 
sure to copy the contents of the [cd-rom]:\gnu directory into the 
[cd-rom]:\psyq\bin directory.

However, if you have Windows 95, you can also run the "install.bat" 
program located in the root directory of the Programmer Tools CD-ROM.
The installation will create a batch file, \psx\bin\psexec.bat, which will set up
your environment variables.  Based on the packages select,
"Install.bat" will create the folders "psx", "psxgraph", and "psyq" under
the root directory that you choose(default is "ps\").  For instance, by default, 
if you allow the installation to put folders in to the "C:\ps" directory, then 
files will be placed in the
			C:\ps\psx
			C:\ps\psxgraph
			C:\ps\psyq

folders.



------------------
CD-ROM Contents

This CD contains PlayStation Development Library 3.6 and the 
latest software tools and utilities. The documentation has been moved
to the Technical Reference CD (DTL-S2003), where you will find Adobe Acrobat 
and all of the documentation.  Included on that CD are PowerPoint slides from
past SCEA and SCEE seminars, and a comprehensive text-search engine that can 
locate every document on every topic you can think of.

Please read the file "psx\sample.txt", located on the Programmer Tools CD-ROM,
for a full listing of the samples and brief descriptions of what they do.

The changes to the library from version 3.5 to 3.6.1 are documented in the file
"psx\change.txt" on the Programmer Tools CD-ROM.


---------------------
Documentation

The Technical Reference CD contains the full set of reference
documentation for the PlayStation libraries, including the
Run-Time Library Reference, the Library Overviews, hardware
manuals, FAQs, and Tech Notes.  Adobe Acrobat is also included
in the Technical Reference CD, and features a comprehensive 
search engine which will allows you to search every topic imaginable.


-------------------------------------
New to PlayStation programming?

If you didn't install the hardware, and you are new to PlayStation 
programming, you should read the Word documents "2000.doc" or 
"2500.doc" (or their PDF equivalents) to learn how to run the 
example programs.  In addition, read the excellent introduction
written by members of SCEE (Europe) in the Technical Refrence CD,
under "technote\devguide.pdf".  Read the "sample.txt" file
in the Programmer Tools CD in the \psx\ directory for instructions on running 
the sample programs.

 



---------------------
Version Numbers

If you are contacting technical support with a question about one of the 
programs included in this distribution, please include the version number
of the executable in your query. (Be aware that not all executables have version
numbers.) Version numbers of binary executables can be  found in one of four ways:

	1. For MS-DOS command-line programs, type the 
	   name of the program.  For example, type

		<parent-dir>\psyq\bin\testmess.com

	   and a version number will appear for testmess.com.
 
	2. For binary executables appearing the "Psyq" folder, do the following:

		a. Type
			cd <parent-dir>\psyq\bin

		b. Type
			version

		c. An output of version numbers will appear.

	3. For Windows applications, run the program.  Then select
	   the menu item "Help: About..."  The splash screen that
	   subsequently follows should contain the version number.


	4. All version numbers of the executables can be found in the following
	   documents:

		<parent-dir>\psx\readme.txt
		<parent-dir>\psyq\readme.txt


-----------------------------------------------------------------
CD-ROM CONTENTS - HIGHLIGHTS
==============================

==>.\3rdParty Includes plug-ins for Alias\Wavefront and Lightwave 3D. 
		Also includes Metrowerks CodeWarrior for PlayStation 
		supplementary files.

==>.\3rdParty\3DS   (3D Studio Plug-in)

    3dsinfo.txt	- Release information.
    3dstod_e.txt  - Installation instructions
    tod_i.kxp     - Plug-in module.
    tod.ini       - Configuration file sample.
    todview5.c    - TOD previewer source code

 
    Note: The following 3DS-related binaries are located in 
	  in the "\psxgraph\bin" directory of the Programmer Tools CD:

	    todvj.bat     ... TOD previewer batch file (Japanese version)
    	    todvw.bat     ... TOD previewer batch file (non-Japanese version)
    	    todview5.exe  ... TOD previewer


==>3rdparty\Aliaswav
  
  *Alias.lzh	   -	 LZH compressed file for Alias\Wavefront plug-in
  *GET_DOC.pdf      -	 Installation instructions.
  *PlayStation_GET.lzh	 LZH compressed file for Alias\Wavefront plug-in




==>.\3rdParty\Lightwav 

	This directory contains conversion 
	utilities for Lightwave users.  Refer to the 
	readme.(txt/pdf) for more details.



==>.\3rdParty\Metrowerks 

	This directory contains ECOFF libraries 
	for Metrowerks users.  Refer to the 
	readme.(txt/pdf) for more details.



==>.\3rdParty\SGI 
   
        This directory contains conversion
        utilities ported to the SGI platform.  Please refer
        to the readme.(txt/pdf) in the directory for more
        details.

	New files are as follows:

		 mvcnvSGI2tar.z
		 ver11.Z
		 rlnk_tar.z 3.7.2

.\BETA   Beta versions of applications currently in progress.

.\CDGEN\LCSNSFILE   License files that need to be put on PlayStation
		   CDROMs in order to run on commercial PlayStations
		   (non-debugging units)

	Licensea.dat	- 	North America license file
	Licensee.dat	-	European license file
	Licensej.dat	-	Japanese license file

.\DA    Digital audio tracks for use with the samples in
        the "\psx\sample\cd" directory.  The Programmer Tools CD
	must be placed in the DTL-H2010 or the DTL-H2510
	CD-ROM drives that are used with the PlayStation development
	boards (DTL-H2000 or DTL-H2500). 
	

.\DATA      Streaming data for use with the sample in
            the "\psx\sample\cd" directory.  The Programmer Tools CD
	    must be placed in the DTL-H2010 or the DTL-H2510
	    CD-ROM drives that are used with the PlayStation development
	    boards (DTL-H2000 or DTL-H2500). 

.\EXECMENU    Modules for use in the "\psx\sample\cd" directory.  
	      The Programmer Tools CD must be placed in the DTL-H2010 or the DTL-H2510
	      CD-ROM drives that are used with the PlayStation development
	      boards (DTL-H2000 or DTL-H2500).   

.\GNU	    GNU libraries and materials, provided by Psy-Q.
	    These files should be put in the directory "\psyq", but
	    if, and only if, you choose to abide by the GNU 
	    license found in  "GNU.txt".

.\OLD_LIBS  Previous release of Library 3.5.

.\OVERMENU  Modules for use in the "\psx\sample\cd" directory.  
	    The Programmer Tools CD must be placed in the DTL-H2010 or the DTL-H2510
	    CD-ROM drives that are used with the PlayStation development
	    boards (DTL-H2000 or DTL-H2500).   
 
.\PSX	    Development libraries and file conversion utilities.
	    Contains the "lib" and  "include" directories for compiling
	    code, "sample" which contains sample code, and "bin", which
	    contains device drivers for the DTL-H2000 and DTL-H2500 boards.

.\PSX\CHANGE.TXT  Summary of the changes between Library 3.5 (the previous
		  CD release) and Library 3.6 (the current CD release)


.\PSX\README.TXT  Summary of the contents of the sub-directories within
		  the "\psx" directory.  

.\PSX\SAMPLE.TXT  Summary of all of the sample programs in the "\psx\sample" directory.
		  Also includes a tutorial on how to run the sample programs.

.\PSXGRAPH  File conversion utilities related to graphics and sound.
 
.\PSYQ	    PSY-Q development libraries.  Requires the contents of
	    the ".\GNU" directory -- read about ".\GNU" above
	    for more details.

.\SETUP     Contains executables for installation, only for
	    Windows 95 users.

2000.doc    Installation materials for DTL-H2000 (ISA board) users.
	    Contains examples about how to run samples.
2000.pdf    Installation materials for DTL-H2000 (ISA board) users. (Adobe Acrobat format)
	    Contains examples about how to run samples.
2500.doc    Installation materials for DTL-H2500 (PCI board) users.
	    Contains examples about how to run samples.
2500.pdf    Installation materials for DTL-H2500 (PCI board) users. (Adobe Acrobat format)
	    Contains examples about how to run samples.
GNU.pdf	    GNU-public license. (Read ".\GNU" above for more details)
GNU.txt	    GNU-public license. (Read ".\GNU" above for more details)
Install.bat Runs "setup.exe" for installing CDROM contents, using
	    InstallShield.  Only useful for Windows 95.
License.pdf SCEA/SCEE license for using the contents of this CD-ROM.
License.txt SCEA/SCEE license for using the contents of this CD-ROM.
Readme.txt  This document.
Readme.pdf  This document (in Acrobat format).
setup.bat   Runs "setup.exe" for installing CDROM contents, using
	    InstallShield.  Only useful for Windows 95.

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
WWW: http://www.scea.sony.com/dev
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