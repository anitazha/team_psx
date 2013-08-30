

 ~~~~ GRAPHIC ARTIST TOOLS CD : DTL-S220 ~~~~

TABLES OF CONTENT:
  1.   GENERAL TOPICS     
       1.1  Release Description
       1.2  Install Files
       1.3  New and Enhanced Features
       1.4  Release History
  2.   DOCUMENTATION TOPICS     
  3.   TECHNICAL NOTES 
       3.1 Display Driver Setting    
  4.   KNOWN PROBLEMS
  5.   CONCLUSION
  6.   CD-ROM Contents
---------------------------------------------------------------------------
Copyright 1996
===========================================================================

1.    GENERAL TOPICS
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  

1.1   Release Description
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is the Graphic Artist Tools (DTL-S220) CD.   This CD 
      contains the tools for graphical data conversion, animation and 
      assignment of textures to polygons: 3D Studio Plug-in, Material Editor,
      MIME utilities, ANIM, Sprite Editor, and 2D/3D graphical conversion 
      utilities.
     
      Also included on this CD are the tutorial files and an online version 
      of the Developer Reference Series.  The Developer Reference Series  
      and miscellaneous documentation such as the FAQs can be viewed on the 
      CD under the PSXDREFS directory in the Technical Reference CD.  Please 
      read the readme.txt in the PSXDREFS of the Technical Reference CD
      for additional details.

1.2   Installation 
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      The following are steps to help setup your Graphic Artist Tools program 
      area. Please follow the instructions carefully so that we may develop a 
      consistent development environment to help in installation of future 
      releases. 

      WINDOWS 95 users can optionally run the "setup.bat" file located in the
      root directory of the Graphic Artist Tools CD.  This will install the
      files into the appropriate directories and set up the correct paths.

   
      Note: For this installation procedure we are assuming that the local 
            hard drive is your c:\ drive and your PC CD-ROM drive is d:\.  

      a.   If applicable, backup or delete your previous 
           "c:\psxgraph" directory.
      b.   Copy the "psxgraph" directory, d:\psxgraph, from the CD to your 
           local hard drive c:\ps\psxgraph.
      c.   Make sure your PATH variable in your autoexec.bat file to contain 
           the path "c:\ps\psxgraph\bin"
      d.   Copy the all files located in the "system" directory, 
           d:\psxgraph\system, to the window's system directory, i.e 
           c:\windows\system.  These files are used by ANIM, Materials 
           Editor and the Movie Converter.
      e.   Create a Graphic Artist Tools program group in the Windows 
           environment.
           1. Under the Program manager "File" pulldown click on the 
              "File->New" button.
           2. Select Program Group; press OK
           3. Fill in the Description "Graphic Artist Tools"
              You may leave the "Group File" field blank.               
              A new group will be displayed.
           4. You are now ready to add the individual tool icons.  Please 
              follow the individual program install instruction listed below.
     
     
      ABOARD
      ~~~~~~~~~~~~~~~~~~~~~~~~~~ 
      This release is for the windows utility to set the I/O address to the 
      Graphics Artist board, DTL-H201A.  This is needed to use the board with
      the Graphic Artist Tools (i.e Materials Editor).

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for aboard.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "Aboard Utility"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\aboard.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      ADOBE
      ~~~~~~~~~~~~~~~~~~~~~~~~~~ 
      This release is for the Adobe plug-in modules.  It allows you to output
      an image which have been created and amended with Adobe Photoshop to 
      the DTL-H201A.
 
      a.   Copy TIMFMTE.8BI and TIMEXPE.8BE from the "d:\psxgraph\adobe" 
           directory into the PHOTOSHOP "PLUGINS" sub-directory.  The plug-in 
           directory can be found where PHOTOSHOP has been installed.

           If addtional detail is needed, please refer to the PHOTOSHOP 
           manual on installing plug-ins.

      ANIMATION TOOL
      ~~~~~~~~~~~~~~~~~~~~~~~~~~ 
      This release is for the Animation Tool of the 3D Graphic Artist Tools.
 
      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the animation tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "Animation Tool"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\animatio.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      DXF2RSDW
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for the windows application dxf2rsd, which converts
      DXF format files by various modelers into RSD format for the 
      PlayStation.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the DXF to RSD windows tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "DXF2RSDW"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\dxf2rsdw.exe)
              Remember to make sure you select the windows version of the
              translator.
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      MEDITOR
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for the Materials Editor tool.  The Material Editor 
      is a tool that edits surface attributes (materials) of polygons,
      such as colors, textures (patterns), and method of shading of 
      3D models.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the Materials Editor tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "Materials Editor"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\meditor.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      MIMEWAVE
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for the MIMEwave.  The MIMewave Editor is a tool used 
      create waveform data for MIMe animation. The tool is specific for the 
      PlayStation system.  The PlayStation development board is only needed 
      for previewing, but not needed for editing.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the MIMewave Editor tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "MIMewave Editor"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\mimewave.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

       Unfortunately, the only adequate documentation for MIMewave Editor 
       is online under the corresponding program's windows help file, 
       mimewave.hlp.  This information can be accessed via the program under 
       the Help button or by opening the file itself which is located in the 
       BIN directory.

       The Windows Help file contains instructions on how to run through the 
       sample contained in the tutorial directory "psxgraph/tutorial/mimew". 


      SPRITE
      ~~~~~~~~~~~~~~~~~~~~~~~~~~ 
      This release is for the Sprite Editor which is the image data editing 
      tool deditcated to the PlayStation unit.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the Sprite Editor tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "Sprite Editor"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\sprite.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      TIMUTIL
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for the Timutil windows application which mutually
      converts bit map formats for PlayStation TIM, Windows BMP, and 
      general purpose RGB.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the TIM Utility tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "TIM Utility"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\timutil.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.
         
       Additional detailed information for TIMUTIL can be found online
       under the corresponding program's windows help file, timutil.hlp.  This 
       information can be accessed via the program under the Help button or 
       by opening the file itself which is located in the BIN directory.

      MOVIE CONVERTER
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for the Movie Converter Tool.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the Movie Converter tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "Movie Converter"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\movconv.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      MOVIE PACK
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for the Movie Pack tool.

      a.   With the "Graphic Artist Tools" program group selected, create 
           program icon for the Movie Pack tool.
           1. Under the Program manager "File" pulldown click on "File->New" 
              button.
           2. Select Program Item; press OK
           3. A Program Item Properties dialog will pop up.  Fill in the 
              Description field with "Movie Pack"
           4. Use the Browse, to identify the name of the executable to
              be placed in the "Command Line" field
              (i.e. c:\ps\psxgraph\bin\movpack.exe)
           5. Click Ok.

           Note: For additional detail for setting up program icons, please 
                 refer to your Windows manual.

      3D Studio Plug-In
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This release is for 3D Studio plug-in utilities (found in "\3rdparty\3ds").

      We highly recommend the following:  Please remove the SN-Dongle, and 
      attach the 3DStudio dongle before progressing with a modeling session 
      utilizing the 3DStudio plug in. Do not remove or add dongles while 
      the PC is powered ON.

      Please do not start a 3DStudio plug in session before accomplishing the 
      following:
      a)	remove dexbios (only if dexbios installed)
      b)	remove mess1.com (only if mess1 installed)
      c)	remove cdbios (only if CDBIOS installed) 

      Please read the files *.doc and *.txt in the "\3rdParty\3ds" 
      directory.  Specific installation instructions are included in the 
      3dstod_e.txt file.
     
1.3   New and Enhanced Features
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      This section list the changes that has occured since previous release. 

      o  Several software programs have been updated since the last release
         of the Graphic Artist Tool CD.  They are indicated below in "Section
	 6 - Contents" with the "*" marked next to the filename.  For 
	 further details of the changes that had occured please 
	 refer to their respective doc directories. (i.e.  3rdparty\3ds,
	 in the Documentation CD-ROM)

1.4   Release History
      ~~~~~~~~~~~~~~~  
      Please read file relhist.txt for additional details of releases 
      between 1.6 and 1.8.  (Note: In order to synchronize the releases
      of the Programmer Tools and the Graphic Artist Tools CD-ROMs, 
      the Graphic Artist Tools version number is now "1.8".  There was 
      no "1.7".

      
2.    DOCUMENTATION TOPICS
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      All documentation is now released in Adobe's PDF format on the 
      Technical Reference CD-ROM, which contains a comprehensive search engine.

      Please refer to the 3D Graphic Artist Tool User's Manual of the
      Developer Reference Series for additional information on the 
      following:
  
          aboard.exe
          timexpe.txt
          timfmte.txt
          Animation Tool (animatio.exe)
          dxf2rsdw.exe
          Materials Editor (meditor.exe)
          Mime Utilities (Also, please check the mimesort.txt in 
                          c:\ps\psxgraph\doc\mime)

      Please refer to the Sprite Editor User's Manual of the
      Developer Reference Series for additional detailed information
      on the Sprite Editor.
     
      For detailed information about the tutorial files please
      refer to the Developer Reference Series, 3D Graphics Artist 
      and the Sprite Editor Tool's user manual.

      Please refer to the Developer Reference Series, 3D Graphic Tool 
      User's Manual and Chapter 18 of the Library Overview for detailed 
      information of the conversion utilites.

      Please refer to the release.txt and 3dstod_e.txt for
      detailed information on the 3D Studio Plug-in.

3.    TECHNICAL NOTES
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
   
3.1   Graphics Board Setup
      ~~~~~~~~~~~~~~~~~~~~~~~~~~
      In order to use the Materials Editor, set the I/O
      address to access the artist board (DTL-H201A).  The utility 
      to set the port address is "aboard.exe"  This program when 
      executed under windows allows you to set the address to 
      the one physically set on the graphics board.  

      Refer to the Developer Reference Series, 3D Graphics Tool
      User's Manual, for additional information on "aboard.exe"

3.2   Display Driver Setting
      ~~~~~~~~~~~~~~~~~~~~~~~~~~
      In order to use the Sprite Editor the user must set their windows
      display drivers to 256.

4.    KNOWN PROBLEMS
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      -----------------------------------------------------------
      aboard.exe
      -----------------------------------------------------------
      The address settings in the program does not allow you to set
      the address to be x1360 even though the board may be set to that.

5.    CONCLUSION
      ~~~~~~~~~~~~~~~~~~~~~~~~~~  
      We appreciate any comments and or suggestions on the data 
      released. Any information regarding this release should be
      communicated via BBS and or developer support hotline.


6.    CD-ROM CONTENTS
      ~~~~~~~~~~~~~~~~~~~~~~~~~~ 

      The entire contents of the CD-ROM and associated version
      numbers are listed below.  Please note the following notation:

    		*   indicates a new release since CD-ROM release 1.6
    		==> indicates directory structure


      Users of the 3rd party-plugins for 3D-Studio, Lightwave3D, Adobe Photoshop can
      find the plugins in the "3rdparty" folder.
 
==>\
 
  *readme.txt      Version 1.8          11/26/96


  ==>3rdparty\3DS   (3D Studio Plug-in)

    3dsinfo.txt	- Release information.
    3dstod_e.txt  - 	Installation instructions
    tod_i.kxp     4.0f   Plug-in module.
    tod.ini        -     Configuration file sample.
    todview5.c     -    TOD previewer source code

    Note: The following 3DS-related binaries are located in 
	  in the "\ps\psxgraph\bin" directory of the Graphic Artist
	  Tools CD:

	    todvj.bat     ... TOD previewer batch file (Japanese version)
    	    todvw.bat     ... TOD previewer batch file (non-Japanese version)
    	    todview5.exe  ... TOD previewer


 ==>3rdparty\Adobe
                         FILES TO BE USED WITH ADOBE PHOTOSHOP:
 *readme.txt   -        Overview of Abobe directory contents.
 *TIMEXPE.8BE  1.2E     Export module for the DTL-H201.  This allows you to 
		        create or edit files in Photoshop, and output the image 
		        directly to the DTL-H201 (Artist Board) for viewing on 
		        the screen.  Indexed color and RGB color files may be output.
 *TIMEXPE.PDF   -       Installation instructions for TIMEXPE.8BE in Adobe Acrobat.
 *TIMEXPE.TXT   -       Installation instructions for TIMEXPE.8BE.
 *TIMFMTE.8BI   1.2E    TIM format module.  Allows importing files with a ".TIM" file 
	                extension.  Compatible only with Adobe Photoshop 2.5
 *TIMFMTE.TXT    -      Installation instructions for TIMFMTE.8BI.
 *TIMformatE.8BI 1.3E   TIM format module.  Allows importing files with a ".TIM" file 
	                extension.  Compatible only with Adobe Photoshop 3.0


==>3rdparty\Aliaswav
  
  *Alias.lzh	   -	 LZH compressed file for Alias\Wavefront plug-in
  *GET_DOC.pdf      -	 Installation instructions.
  *PlayStation_GET.lzh	 LZH compressed file for Alias\Wavefront plug-in


    
  
==>3rdParty\LightWav*
  
	This directory contains conversion 
	utilities for Lightwave users.  Refer to the 
	readme.(txt/pdf) for more details.

		 
==>3rdParty\SGI\
 
        This directory contains conversion
        utilities ported to the SGI platform.  Please refer
        to the readme.(txt/pdf) in the directory for more
        details. 

	New files are as follows:

		 mvcnvSGI2tar.z
		 ver11.Z
		 rlnk_tar.z 3.7.2


==>PSXGRAPH\           GRAPHIC ARTIST TOOL ROOT DIRECTORY


   



 ==>BETA\MOVCONV
  
  Gauge.vbx		   Put this is your WINDOWS\SYSTEM or WIN 95\SYSTEM folder.
  Movconv.exe   2.1ebeta1  Beta version of movconv.
  Movcon.hlp       -       Movconv help file (slightly obsolete)
  Movcon.scr	   -       Sample script file for movconv
  Movpack.exe   1.5ebeta1  Beta version of movpack
  Movpack.hlp      -       Movpack help file (slightly obsolete)
  Movpack.scr      - 	   Sample script file for movpack	
  Readme.txt	   -	   Up-to-date information on movconv and movpack features.
  Three.vbx 	   -	   Put this is your WINDOWS\SYSTEM or WIN 95\SYSTEM folder.


  ==>BIN\
  			 AIFF2VAG  
 *aiff2vag.exe 	  2.0	 AIFF to VAG sound format
 
                         ABOARD
  aboard.exe      1.00e  Sets I/O address to access Graphic Artist 
                         Board DTL-H201A

                         ANIMIATION TOOL
  animatio.exe    1.1.5  Animation tool.
  between.dll     1.0.3  Animation tool library DLL
  lib3d.dll       1.1.2  Animation tool library DLL
  libdata.dll     1.1.5  Animation tool library DLL
  todexp.dll      1.0.2  DLL for TOD export

                         DXF2RSD for WINDOWS
  dxf2rsdw.exe    1.10e  Windows application to convert DXF format file
                         to PlayStation RSD format.
  dxf2rsdw.hlp     -     Windows Help file for dxf2rsd.
 
                         MATERIAL EDITOR
  meditor.exe     1.71ae Materials Editor Tool.             
  meditor.hlp      -     Windows help for Material Editor.

                         MIME UTILITIES
 *mimefilt.exe    1.51   Creates Mime difference files.
 *mimesort.exe    2.1    Interleaving tool.
  mimewave.exe    1.0e   MIMe Wave Form Editor
  mimewave.hlp    Sept.  Windows help for MIMewave editor.
  mimewave.cpe    Sept.  MIMewave previewer program.
  wavelink.exe    June   Converts waveform *.wvf file output by MIMewave 
                         into a corresponding binary data for execution 
                         on the PlayStation.

                         SPRITE EDITOR
  sprite.exe      1.7e   Windows Sprite Editor tool   

                         TIM UTILITY
  timutil.exe     1.36e  Converts bit map formats for PlayStation
                         TIM, Windows BMP and general-purpose RGB.
  timutil.hlp      -     Windows Help file.

                         2D UTILITIES
  bmp2tim.exe     2.2    Converts windows image data (BMP)
 
                         to a PlayStation image data file (TIM).
  pict2tim.exe    3.1    Converts Mac. image data (PICT) to a 
                         PlayStation image data file (TIM).
 *rgb2tim.exe     2.1    Converts RGB image data to a PlayStation              
                         image data file (TIM).
  tim2bmp.exe     1.1    Converts PlayStation image data files to  
                         Windows image data (BMP).
 *timpos.exe      1.1    Changes the VRAM addresses of images and 
                         color tables given the image data and TIM
			 files for the PlayStation.
 *timposw.exe 	  1.01	 Interactive Windows program for changing 
			 the VRAM address of images and color tables
			 (similar to the "TIM layout" feature of 
			 the "timutil.exe" application).
  timposw.hlp	   -     Windows Help file.


  timview.exe     1.2    TIM viewer.            

                         3D UTILITIES
 *dxf2rsd.exe     2.81   Converts DXF file to a PlayStation 3D Model
 *mktod.exe       1.4    Reads project files and creates layout files.
  rsd2dxf.exe     1.00   Converts RSD file to DXF format.                      
 *rsdcat.exe      1.04   Links multiple RSD files into one.        
 *rsdform.exe     1.81   Changes and moves 3D modeling data.
 *rsdlink.exe     3.72   Converts 3D model data (RSD) to 3D model format (TMD).
  tmd2pmd.exe     1.14   Converts TMD file to a PMD format. 
  tmdinfo.exe     1.25   Displays contents of the 3D model data TMD file. 
  tmdsort.exe     1.25   Sorts 3D model data file (TMD) by packet type.
       

			  MOVIE CONVERTER        
  movconv.exe	  1.98e	 Movie Converter Program	
  movconv.hlp      -	 Windows help file for Movie Conv.  
  sample.scr       -     Sample script for Movie Converter 
  movpack.exe  	   1.4e  Interleaving tool  
  movpack.hlp      -     Windows help file for Movie Pack.  
     

  			  SOUND CONVERSION UTILITIES
 *aiff2vag.exe 	  2.0 	-AIFF to VAG sound format            
 		 	 conversion utility
 *mkvab.exe       2.0  	-Utility to build sound source bank  
 *seq2sep.exe	   -	-Conversion utility for SEQ to SEP   -   
 *smf2seq.exe	  2.0	-Conversion utility for SMF to SEQ    
 *vabsplit.exe	  2.0	-Utility to split VAB into            
         		 a attribute and wave data section.



                  4.0f   3D STUDIO PLUG IN
  psbload.exe      -     Communication program between DTL-H2000 and PC
                         (data transfer)      
  psreset.exe      -     Communication program between DTL-H2000 and PC
                         (reset DTL-H2000)
  psrun.exe        -     Communication program between DTL-H2000 and PC
                         (run program)
  todvj.bat        -     TOD previewer batch file (Japanese version)
  todvw.bat        -     TOD previewer batch file (non-Japanese version)    
  todview5.exe     -     TOD previewer.
  patchj.exe       -     DTL-H2000 patch program (Japanese version)
  patchw.exe       -     DTL-H2000 patch program (non-Japanese version)

                         Utilities
  patch.bat        -     Patch batch file (calls patchw for sample)

  
  ==>*develop\wingpu	 Dynamic link library files used to access the PlayStation 
			 Artist Board from Windows applications.  The version 
			 corresponds to Microsoft Visual C++ 1.5.
  *wingpu.zip	  1.0 	 Contains the necessary dlls  and files in Zipped format.	
  *readme.txt	  -	 Full installation instructions for installing the files.
  *readme.pdf     -      Full installation instructions for installing the files (PDF format).
  


  ==>DOC\ANIM		 On-line help files for Animatio.exe

  


  ==>SRC\
  ==>SRC\PREVIEW\  -     Source files for the preview program for 
                         MIMewave.
  ==>SRC\WAVELINK\ -     Source files for the waveform data converter

  ==>SYSTEM\    (Put these in your Windows\System or Win 95\system folder)
  grid.vbx         -     Visual Basic runtime library (anim)
  vbrijp200.dll    -     Visual Basic runtime library (anim)
  vbrun200.dll     -     Visual Basic runtime library (anim)
  spin.vbx         -     Visual Basic file. (meditor, timutil)
  threed.vbx       -     Visual Basic file. (meditor & Movie Converter)
  gauge.vbx        -     Visual Basic file. (Movie Converter)

  ==>TUTORIAL\           TUTORIALS USED WITH THE GRAPHIC ARTIST TOOLS
  anim             -     ANIM tutorial files               
  cube             -     Tutorial files.
  helimake         -     Graphic tools helicopter tutorial files.
  heliview         -     Graphic tools helicopter tutorial files.
  meditor          -     Materials Editor tutorial files.
  mime             -     Mime utilities tutorial files.
  mimew            -     MIMEwave tutorial sample files.
  sprite           -     Sprite tutorial sample files. 
  timutil          -     Timutil tutorial files.

-----


HISTORY:
  - 10/17/96: CD Release 1.8 (Note: There was no 1.7 release.)
  - 02/25/96: CD Release 1.6 
  - 09/05/95: Graphic Artist Tool CD Release 1.5
            
INFO:
  - IMPORTANT: Please read the installation instructions carefully.


===========================================================================
Copyright (C) 1994 - 1996 Sony Computer Entertainment Inc.
			              All Rights Reserved.

PlayStation and PlayStation logos are trademarks of Sony Computer
Entertainment Inc. All other trademarks are property of their 
respective owners and/or their licensors.

All specific names included herein are trademarks and are 
so acknowledged: IBM, Microsoft, MS-DOS, PKZIP, ADOBE. 
Any trademarks not mentioned here are still hypothetically 
acknowledged.

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
