                Adobe(TM) Acrobat(TM) Reader for DOS
                    Read Me Notes for Version 1.0
                -------------------------------------

This Read Me file contains last-minute information for the Acrobat
Reader for DOS program. The Getting Started Card, Quick Reference
Card, and the On-line Guide (HELPREAD.PDF) also provide essential
information to help you begin using Acrobat Reader for DOS.

Technical Support
-----------------
A complete description of the Adobe Acrobat Reader support options is
found in the file Support.pdf.

If you are having installation problems you can obtain support via one
of the following mechanisms:

* Adobe US Automated Technical Support - A computer-driven diagnostic
  system with answers to the most commonly asked technical questions.
  Call +1-408-986-6560, 24 hours a day, 7 days a week
* Adobe US electronic bulletin board - Dial +1-408-562-6839
* Adobe US Fax Request Line - An easy way to request technical notes
  by fax. Dial +1-408-986-6587, 24 hours a day, 7 days a week
* CompuServe Q & A - GO ADOBE
* 900 Number - Each minute is $2.00. Call 900-555-ADOBE (900-555-2362)
* Credit Card - Via Visa, Mastercard, or American Express, each
  support call is $25. Call 800-87-ADOBE (800-872-3623).
* Adobe's European Customer Support Center has different phone lines
  where native speaking support engineers are ready to help you. Please
  call one of the following numbers to receive support or to obtain 
  additional information:

        French	+31-55-384252
        Spanish	+31-55-384251 
        German	+31-55-384246
        Dutch	+31-55-384245
        English	+31-55-384249
        Swedish	+31-55-384254 
        Italian	+31-55-384250
        Fax	+31-55-434455

For more information and pricing on any Adobe support or training
program, in the US and Canada please call 800-87-ADOBE
(800-872-3623); in Europe please call Adobe's European Customer
Support Center at the numbers listed above.

VESA Video Modes
----------------
Acrobat Reader supports the following VESA (Video Electronic Standard
Association) video modes:
        640x480,   256 colors
        800x600,    16 colors
        800x600,   256 colors
        1024x768,   16 colors
        1024x768,  256 colors

Acrobat Reader detects what VESA video modes your video card supports.
Unsupported modes are disabled in the Preferences dialog. VESA modes
are disabled in the Preferences dialog if: 
    * Your VESA driver is not version 1.2 or later.
    * Or you do not have a VESA driver loaded, or the VESA driver
      built into your BIOS is not enabled.
If a valid VESA driver is not available the VGA video mode 640x480, 16
colors is used.

VESA Driver Included with Acrobat Reader
----------------------------------------
Adobe has licensed and included the Universal VESA VBE video driver
with Acrobat Reader for DOS. This driver provides VESA version 1.2
compatibility for many popular video cards. This program is fully
copyrighted; Copryright (C) 1993 SciTech Software. Some video boards,
such as the Diamond Computer Systems Viper VLB board, come with their
own VESA driver that you should use instead of the Universal driver.

The Installer copies the driver, UNIVESA.EXE, and its documentation
into the VESA directory within the Acrobat Reader program directory.
For instance, if you install Acrobat Reader to C:\ACRODOS, the VESA
driver is copied to C:\ACRODOS\VESA. You can add UNIVESA.EXE to your
AUTOEXEC.BAT file to ensure that the driver is loaded when you run
Acrobat Reader.  Please refer to the file UNIVESA.TXT in the VESA
directory for more information on this driver.

VESA Drivers on CompuServe
--------------------------
CompuServe contains VESA video drivers from several different
manufacturers.  Many of these drivers are located in the IBMPRO
forum, VESA library.  To reach this library on CompuServe, do the
following:

        Log onto CompuServe
        Enter:    GO IBMPRO
        Select:   (3) LIBRARIES
	Select:   VESA library

Getting Information About your Video Board
------------------------------------------
If you try to use a mode that is supported and it does not work
properly, run the VESAINFO.EXE utility that is installed in the
Acrobat Reader program directory in the following way:
        VESAINFO  >VESAINFO.TXT
This creates a file, VESAINFO.TXT, that lists the video modes that
your video card supports. Adobe Technical Support can use this
information to help you determine the cause of the problem.

Due to a limitation in the Acrobat Reader video drivers, a VESA mode
is disabled if its bytes-per-scanline value doesn't match the value
in the following table. The VESAINFO utility lists the
bytes-per-scanline value for each mode.

        VESA Mode               Bytes-per-scanline Value
        --------------------    ------------------------
        640x480,  256 colors 	 640
        800x600,   16 colors     100
        800x600,  256 colors     800
        1024x768,  16 colors     128
        1024x768, 256 colors    1024
   
Unreadable Display
------------------
If you try a VESA mode and the screen is unreadable, switch back to a
16-color mode at 640 video mode (you can edit ACROBAT.INI with any
editor). You may be running a video mode that your monitor does not
support or you may need to obtain a newer VESA driver from your video
card manufacturer. 

To run in 640x480, 16-color mode, your ACROBAT.INI file should contain
the following entries:

        [Video]
        Driver=VGA

        [Preferences]
        VideoMode=640
        Colors=16

Note: The valid VideoMode settings are 640, 800, or 1024.

8514 Video Support 
------------------
Acrobat Reader supports the 8514 video adapter in the following
resolutions:
        640x480,   16 colors
        640x480,  256 colors
        1024x768,  16 colors
        1024x768, 256 colors

Acrobat Reader's 8514 driver does not use the 8514 AI interface; it
writes directly to 8514 hardware. Thus, if your 8514 video card is
not 100% IBM 8514 hardware compatible, this driver will not work
properly. 

To use an 8514 video mode,  your ACROBAT.INI file should contain the
following entries:

        [Video]
        Driver=8514

        [Preferences]
        VideoMode=640
        Colors=16

Note: The valid VideoMode settings are 640 or 1024; the valid Colors
settings are 16 or 256.

Novell's TCP/IP Network Driver
------------------------------
If you are running Novell Lan WorkPlace for DOS, version 4.0.1 on 
your PC, Acrobat Reader crashes with the error "Unexpected Interrupt"
may be due to a buggy Novell TCP/IP driver.

Novell has a patch to fix this problem. You may either contact Novell
directly or download the patch from CompuServe. In CompuServe, type
GO NOVLIB and search for the file "LD401A.EXE" that is in the 
Mac/NFS/MHS/NMS/LWP section. Here is Novell's description of this
patch: "This is a `super patch' for Lan WorkPlace for DOS 4.01 which
corrects numerous problems. This includes updates for TCP/IP, TelAPI,
TNVT220, WLIBSOCK, and RFCNBIOS."

After Dark for DOS
------------------
You need to disable After Dark for DOS when Acrobat Reader is running.
To do this, run the program ADSETUP.EXE in the After Dark directory
to tell After Dark to do nothing when "ACROBAT" or "ACROMAIN" is
running. Refer to the After Dark documentation for instructions on how
to do this.

After Dark for Windows
----------------------
The DOS screen blanker included with After Dark for Windows
(AD-DOS.COM) is incompatible with protected-mode programs, and can
cause your system to lock up when running Acrobat Reader. There is no
way to configure the DOS screen blanker to disable itself when a 
certain program is running; the full After Dark for DOS program does
have this feature. Because of this, Adobe recommends that you not run
the After Dark DOS screen blanker with Acrobat.  You should remove
AD-DOS from your AUTOEXEC.BAT.

Security Software and the Installer
-----------------------------------
If you are running a security program, such as Fischer International's
Watchdog, or any other security software you should disable the
option to restrict access to the start up files and disable the option
to enable integrity check prior to running the installer if you want
to allow the installer to modify your CONFIG.SYS and AUTOEXEC.BAT.

Files Left by the Installer
---------------------------
If you terminate an install before it completes, the Installer may
leave the directory C:\ADMALTOI with the files INSTALIT.EXE and
NORCIMO.ATE on your hard disk.You can delete these files and remove
this directory. 

LaserTools Printer Control Panel (PCPanel)
------------------------------------------
If you are using the PCPanel utility program, you need to configure it
to "Postscript only" mode. 

PostScript Printing
-------------------
If you encounter problems, such as a "VMerror," printing to PostScript
Level 1 or 2 printers it may be because the printer has little
available memory (for example, a non-upgraded LaserWriter, LaserWriter
Plus, LaserWriter II NT or NTX). There are two potential solutions to
this problem:
    1. In the Preferences dialog (select from the Edit menu) you may
       choose to use Serif only or Sans only for font substitution.
       This frees up additional memory in the printer and chances are 
       your document will print successfully.
    2. The other option is to purchase more memory for your printer.

If you are using an Apple Personal LaserWriter NT printer that has not
been upgraded to a Personal LaserWriter NTR, Acrobat Reader won't be
able to print substitute fonts. Contact your Apple dealer for
information on upgrading your printer.

DeskJet Color Printers
----------------------
Acrobat Reader printer driver supports the Hewlett Packard DeskJet
500c and 550c in black and white mode only.

After Dark is a trademark of Berkeley Systems Incorporated. LaserTools
Printer Control Panel is a trademark of LaserTools Corporation.
Watchdog is a registered trademark of Fischer International Systems
Corporation. DeskJet is a registered trademark of Hewlett-Packard
Company. Adobe, Acrobat, and PostScript are trademarks of Adobe
Systems Incorporated which may be registered in certain
jurisdictions. (C) 1987 - 1993 Adobe Systems Incorporated. All rights
reserved. Prices subject to change without notice. 

