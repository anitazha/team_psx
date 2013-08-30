========================================================================
Adobe Acrobat Reader 3.0                     Updated: October 31, 1996
for Microsoft Windows
Read Me Notes								
========================================================================

This Read Me file contains last-minute product information for the
Adobe Acrobat Reader 3.0 for Microsoft Windows 3.1, Microsoft Windows
95, and Microsoft Windows NT.

For full instructions on using the Acrobat Reader please see the
Acrobat Reader 3.0 Online Guide, which can be found in the file
READER.PDF in the Help folder which is in the same folder as the
Acrobat Reader.  When using  Acrobat Reader, selecting the Help >
Reader Online Guide menu will open READER.PDF automatically.

Adobe encourages you to register as an Acrobat Reader user; letting us
know who you are helps us continue to provide you with better
products, better service, and the most up-to-date information on Adobe
Acrobat. If you have not already registered, please do so at          
    http://www.adobe.com/acrobat/register.html
     
To view the latest information on Acrobat, please go to:
    http://www.adobe.com/acrobat/


TABLE OF CONTENTS

This document contains the following sections:

    SYSTEM REQUIREMENTS
    KNOWN PROBLEMS AND ISSUES
     - INSTALLATION ISSUES
     - WEB BROWSER ISSUES
     - GENERAL ISSUES
     - PRINTING ISSUES
    READER WITH SEARCH


SYSTEM REQUIREMENTS 
=================== 
 - x86-based personal computer (386 minimum; 486, Pentium, or 
   Pentium Pro recommended)
 - Microsoft Windows 3.1, Microsoft Windows for Workgroups,
   Microsoft Windows 95, Microsoft Windows NT 3.51 or 4.0
 - 4 MB application RAM
 - 5 MB hard disk space, plus 7 MB additional temporary disk space 
   available during installation
- For viewing PDF files inside of a Web browser:
  Netscape Navigator 3.0 or later (3.0.1 or later recommended) 
  or Microsoft Internet Explorer 3.0 or later.  
  (Netscape Navigator 2.0.2 can also be used with limitations; e.g. 
  it will not allow you to submit a PDF form.  You may also be able   
  to use other Web browsers that FULLY support the Netscape APIs.)



KNOWN PROBLEMS AND ISSUES
========================= 

If additional problems and issues are discovered they'll be posted on
Adobe's Web site at
     http://www.adobe.com/acrobat/

- INSTALLATION ISSUES
  ===================   
  
If there is a failure at any point during the installation of Acrobat
3.0, the installer performs a complete uninstall. For this reason, it
is important not to pre-maturely close the installer application by
clicking on its close box in the upper-right corner of the background
window; the installer will automatically close the background window.
[174928, 178252]

Installer for Windows 95 or Windows NT - 
The 32-bit Acrobat Reader installer will install the following
software for use with Microsoft Windows 95 or Microsoft Windows NT: 

- AcroRd32.exe, the 32-bit Acrobat Reader
- PDF.OCX, the Acrobat Control for ActiveX, which will enable
  Microsoft Internet Explorer 3.0 to display PDF documents
- nppdf32.dll, the Netscape plug-in which will allow Netscape
  Navigator and compatible browsers to display PDF documents

If Netscape Navigator 2.0 or later is installed on your computer,
nppdf32.dll will be installed in \Netscape\Navigator\Program\plugins.
If Adobe PageMill 2.0 or later is installed on your computer,
nppdf32.dll will be installed in its plugin directory.
The installer will also place one copy of the Netscape plug-in in the
directory containing the Acrobat Reader in \Browser\nppdf32.dll. If
you would like to use the Acrobat Reader with an additional copy of
Netscape Navigator or another Netscape compatible browser, copy
nppdf32.dll to its plugins directory.


Installers for Windows 3.1 -
The 16-bit Acrobat Reader installer will install the following
software for use ONLY with Microsoft Windows 3.1 or Microsoft Windows
for Workgroups:

- AcroRd16.exe, the 16-bit Acrobat Reader for use ONLY with Microsoft
  Windows 3.1 or Microsoft Windows for Workgroups 
- nppdf16.dll, the Netscape plug-in which will allow Netscape
  Navigator and compatible browsers to display PDF documents

If Netscape Navigator 2.0 or later is installed on your computer,
nppdf16.dll will be installed in \Netscape\Navigator\Program\plugins.
The installer will also place one copy of the Netscape plug-in in the
directory containing the Acrobat Reader in \Browser\nppdf16.dll. If
you would like to use the Acrobat Reader with an additional copy of
Netscape Navigator or another Netscape compatible browser, copy
nppdf16.dll to its plugins directory.

Due to problems with some Desktop Managers for Windows 3.1, during
installation the Adobe Acrobat program group and the Acrobat Exchange
program item may not be created. By default, the program is installed
in the directory c:\Acrobat3\Read16 and the executable is
c:\Acrobat3\Read16\acrord16.exe.

Installing Quicktime -
To allow the Acrobat Reader to play .mov files, movies or sounds
created with Apple QuickTime(TM), your computer must have the
appropriate sound and video boards installed and Apple QuickTime
software version 2.0 or later.  This software can be downloaded from 		
	http://quicktime.apple.com/qt/sw/sw.html


Plug-in Names - Removing plug-ins from the Reader's Plug-Ins folder
can improve performance and reduce the  memory required to use the
Reader.  When removing plug-ins, refer to the following list of the
Reader plug-ins' file names and their functionality:

Windows 95 and Windows NT:
	aform32.api	Acrobat Forms 
	ahls32.api	Acrobat Highlight server  
			(highlights results of Web-based search)
	asrch32.api	Acrobat Search  (installed with optional 
			Acrobat Reader with Search) 
	ewh32.api	External Window Handler
			(communicates with Web browser)
	ieweb32.api	Internet Explorer Web Browser Interface 
	movie32.api	Movie and Sound 
	olesrv32.api	OLE Server
	weblnk32.api	WebLink Plug-in 

Windows 3.1:
	aform16.api	Acrobat Forms 
	ahls16.api	Acrobat Highlight server  
			(highlights results of Web-based search)
	acrosrch.api	Acrobat Search  (installed with optional 
			Acrobat Reader with Search) 
	ewh16.api	External Window Handler
			(communicates with Web browser)
	movie.api	Movie and Sound 
	olesrv.api	OLE Server
	weblnk16.api	WebLink Plug-in 



 - WEB BROWSER ISSUES
   ==================
 
Known problems using Acrobat Reader 3.0 with Netscape Navigator 2.0,
Netscape Navigator 3.0, or Microsoft Internet Explorer 3.0 include:

Many of the Acrobat Reader keyboard navigation accelerators (arrow
keys, page up/down, etc.) are not available when viewing PDF files
within a Web browser window.  [142844] 

When large PDF files which have NOT been optimized for page-at-a-time
downloading are downloaded over very slow transmission lines (e.g.
slow modems), the Acrobat Reader may "time-out" before the entire file
has been downloaded.  Aternatively, the first page of the document may
be displayed but changing to another page could result in a blank page
being displayed until the document is fully downloaded. [143637,
179356]

"Open File" links and bookmarks to non-PDF files will not work when
activated while viewing the PDF file in a Web browser window.  [147871]

When viewing a PDF file in a Web browser, the destination of an
Acrobat Weblink is not displayed in the control bar even if the
Weblink preference is set to do so. [144784]

Microsoft Internet Information Server -  The Microsoft Internet
Information Server (IIS) version 2.0 distributed with Windows NT
Server 4.0 includes built-in support for byteserving (byte range
serving) PDF files. However, the shipping version of IIS 2.0 has a bug
which causes it not to return all the bytes needed to display some PDF
files  (regardless of whether or not the PDF files are optimized).

Microsoft has corrected these bugs in updated versions of three
Windows NT 4.0 DLL files (httpodbc.dll, infocomm.dll, and w3svc.dll).
These updated files will be included with Windows NT 4.0 Service Pack
2 which Microsoft expects to release in December 1996. Before then,
Windows NT 4.0 owners can contact Microsoft's pay per incident product
support group (in the U.S. their phone number is 800-936-5900) and
request "NT hot fix number 56945".  If you install Windows NT 4.0
Service Pack 1, be sure to reinstall this hot fix afterwards.


Movies - PDF files with movies and sounds work inside of World Wide
Web browsers, but the performance is generally unacceptable. Acrobat's
Movie plug-in is best used for disk- and CD-ROM-based applications.
[174588]

Documents with PAGES larger than 4 MBytes each may have display
problems. [155364]  


Known problems using Acrobat Reader 3.0 with Netscape Navigator 2.0 or
3.0 include:

Acrobat Reader 3.0 and Netscape Navigator communicate with each other
via two plug-ins installed by Adobe Acrobat 3.0; one called EWH on the
Acrobat side in the Reader\PLUG_INS folder and one called nppdf32.dll
or nppdf16.dll in the Netscape\Navigator\Program\plugins folder. 
Opening an Acrobat document from within a copy of Netscape Navigator
which uses an old version of the nppdf32.dll or nppdf16.dll plug-in
may cause your browser to crash.   For best results, make sure both
plug-ins are from the same Acrobat release.

If you would prefer to use Acrobat Reader as a helper application, be
sure to remove nppdf32.dll or nppdf16.dll from Navigator's plug-ins
folder and then configure the Acrobat Reader as a helper application.


Due to a bug in Navigator, when viewing PDF within a frame, if you
resize the window and quit Netscape before the page is done drawing,
Netscape and/or Acrobat will crash. [175265]

When using Navigator's Back button or Go menu to return to a
previously viewed PDF document, page 1 of that document may be
displayed regardless of the page you were last viewing.  This will
occur if the entire document was not downloaded or if the General
Preferences "Allow Background Download of Entire File" option was not
enabled. [122652]

Changes to Acrobat preferences while viewing PDF files within Netscape
Navigator will not take full effect until you exit Exchange/Reader and
restart. [160324]

For best results when printing, use the Print button in the Acrobat
toolbar rather than Navigator's Print menu item. [156393]

Resizing frames in Navigator may not properly update a PDF file being
viewed in that frame. [175222]

When you click the Weblink icon from Acrobat toolbar or select any of
the Help > Adobe on the Web menu items, if Netscape Navigator 3.0 is
launched the toolbar and location field are not displayed. Resizing
the Navigator window will cause these items to appear. Netscape plans
to fix this in their 4.0 release. [161815]

If you change Navigator's disk cache while Acrobat Reader 3.0 is
running and a PDF file is being displayed in the Navigator window,
Navigator will crash. [175091]



Forms / Secure Servers - If a form button submits FDF data to a secure
https server, the user needs to turn on the Navigator Network
Preferences Option "Allow Persistent Caching of Pages Retrieved
through SSL" for the return FDF data to be processed properly.
[161718]

The very first time you use Netscape Navigator to submit an HTML form
which returns an FDF file, Navigator will display a dialog which says
you have started to download a file of type application/vnd.fdf. 
Click the "Pick App..." button and locate your Acrobat Reader.
[160928]

Be sure that the Acrobat Reader is running before you submit an HTML
form which returns an FDF file.  [162661]


Additional known problems using Acrobat Reader 3.0 with Netscape
Navigator 2.0 include:

Adobe recommends that Netscape Navigator users use Netscape Navigator
3.0 with Acrobat Reader 3.0.  However, if you need to use Netscape
Navigator 2.0, please be aware of the following limitations:

Using Netscape Navigator 2.0, PDF forms can be viewed, filled in, and
printed, but they cannot be submitted or received; when the submit
button is pressed, nothing will happen.

When a PDF file is displayed inside a Netscape Navigator frame, you
can select the Print Preview... menu in Netscape Navigator 2.0  but it
will not preview the PDF file; the Print Frame... menu will print the
file.


Known problems using Acrobat Reader 3.0 with Microsoft Internet
Explorer 3.0 or 3.0.1 include:

Using Internet Explorer with Acrobat 3.0, PDF forms can be viewed,
filled in, and printed, but they cannot be submitted or retrieved;
when the submit button is pressed, an error dialog will be displayed.

Internet Explorer 3.0 will not display a PDF file accessed by an URL
which does not end in ".pdf" or ".PDF".  (Some Web search engines
return URLs which don't end in ".pdf" which refer to a PDF file). 
Internet Explorer 3.0.1 will attempt to display such files but it does
so incorrectly by attempting to use the nppdf32.dll Netscape plugin,
which does not work reliably under Internet Explorer.

Internet Explorer 3.0 and 3.0.1 will not display highlight information
in PDF files returned by Web search engines.

Changes to Acrobat preferences while viewing PDF files within Internet
Explorer will not take full effect until you exit Reader and restart.
[160324]

When viewing a PDF file within an Internet Explorer window, if you go
to an HTML page, switch to Acrobat Reader and exit, then return to
Internet Explorer and hit the Back button, Reader will not re-launch
properly.  (This is due to the way Internet Explorer caches ActiveX
controls.) [159618]

When a PDF file is displayed in its own Internet Explorer window,
Internet Explorer's File > Save As... menu will not correctly save the
PDF file to your disk.  If you opened the PDF file by clicking on a
link to it in an HTML page, you can save the PDF file to your disk as
follows:
  - Use the Back button in the Internet Explorer toolbar to return 
    to the HTML page containing the link.
  - Click on the link to the PDF file using your RIGHT mouse button
    to display a drop-down menu.
  - Choose the Save Target As... menu item from the drop-down menu 
    and use the resulting dialog box to save the PDF file to your 
    hard disk.
Alternatively, you could use another Web browser to save the PDF file
to your disk.

At times Internet Explorer may display an empty area where it should
display a PDF file.  This may occur if Internet Explorer has an old or
bad copy of the PDF file in its cache.  You may be able to correct the
problem by clearing its cache as follows:
  - select Internet Explorer's View > Options... menu
  - click on the "Advanced" tab (at the top right of the dialog)
  - click on the Settings... button under "Temporary Internet files"
  - click on the Empty Folder... button
  - click Yes
  - click OK
  - click OK
Then redisplay the open window in Internet Explorer using either the
Refresh button or the View > Refresh menu or F5.

If Internet Explorer has been selected as your WWW Browser Application
in the Acrobat Reader's Weblink Preferences dialog and you are using
the Acrobat Reader outside of a Web browser, a separate Internet
Explorer session will be launched each time you click on a Weblink in
a PDF file or select any of the submenus of Help > Adobe on the Web.
(Note: When you install Acrobat Reader, if Internet Explorer is your
primary Web browser the Acrobat Reader installer will automatically
configure it as your WWW Browser Application in Weblink Preferences).

When viewing a PDF file which fills an Internet Explorer window,
Internet Explorer's print icon or File > Print... menu will not
correctly print the PDF file.  The Print icon on the Acrobat toolbar
will open the Acrobat print dialog which will allow the entire PDF
file to be printed.


When using Internet Explorer's print toolbar icon or File > Print...
menu to print an HTML page which contains a PDF file embedded in it,
the printed output will include the HTML page with just the first page
of the PDF file scaled to fit in the area provided for it. Printing
such an HTML page to a Postscript printer with the current Acrobat
Reader release is very slow.

If an embedded PDF file is displayed with a toolbar, the Print icon on
the toolbar will open the Acrobat print dialog which will allow the
entire PDF file to be printed.

The author of an HTML page can provide a Print button associated with
an embedded PDF file (this button is implemented using a VBScript).
Pressing the Print button will open the Acrobat print dialog.


 - GENERAL ISSUES
   ==============

Calibrated Color - The "Use Calibrated Color for Display" option in
the General Preferences dialog is only functional if you have the
Acrobat Device-Independent Color plug-in installed. [163728]

CD-ROM - If you open a PDF file from a CD-ROM, then remove the CD-ROM
and later try to access that PDF file you may get a system error.
Always remember to close all files opened from a CD-ROM before
removing it.

Clipboard - If you select Windows > Show Clipboard and get an error it
is most likely because the CLIPBRD.EXE program was not installed with
Windows. [162165]

Colors Incorrect - If the colors on your monitor seem completely
wrong, try the following: In Acrobat Reader's ini file
(c:\windows\acroread.ini) try changing the line 'IS8514=4' to
'IS8514=105'.

Compaq MGA8.DRV Video Driver - Using this video driver (installed on
Compaq DeskproXL 586 (1024x768, 640x480, 256 colors) with Compaq
Qvision 2000 board may cause Acrobat Reader to crash. Solution: Turn
off the Use Page Cache option in the File > Preferences > General
dialog.

Continuous View and Notes - Text notes which extend outside (above or
below) of the page boundary when viewed in Single Page mode may get
clipped when you switch to Continuous or Continuous  - Facing Pages
mode. Solution: Click on the note to activate it and it will pop to
the surface. [148150]

Copy Text To Clipboard - When you copy text to the clipboard and paste
it into another application the font is not always preserved. [117507]

Full Screen Preferences - Changes to full-screen preferences do not
take effect until you exit and re-enter full-screen mode. [163985]

Lotus Notes 3.x - When you open an embedded PDF file from a Notes
database, the Acrobat Reader window may flicker slightly. This is
because Lotus Notes is giving Acrobat Reader OLE instructions to
Show, Hide, then Show the PDF document. 

Mach 32 Video Card From ATI - If you are using the MACH 32 ATI card,
be sure to use the 256-color mode with the Color Pallette ON. In other
words, do not use the 256-color mode with the color pallette off. For
Acrobat, make sure the Pallette is ON.

Matrox Video Driver - The Matrox MGA 24-bit 16.7m colors video driver
for Windows 3.1 may produce garbled-looking text when used with
Acrobat Reader 3.0. Try using the Windows VGA video driver. [165155]

Movie Posters - Movie posters do not print.  [164996]

Monitor Colors - If you change the number of colors available to your
monitor you will need to restart the Acrobat Reader for this to take
effect. [158859]

NEC Ultralite Versa Linear Driver - Rotated images may display with
artifacts when using the UltraLite Versa Linear 640x480 256 color
video driver. Solution: Use the UltraLite Versa 640x480 256 color
driver. 

Number 9 Video Driver - When Acrobat Reader's page caching
is enabled, if you experience horizontal lines running across the page
try turning off the turbo mode in the #9GXE video driver. This can be
done via the Turbo menu in the program "#9GXE Status" available in the
"#9 Hawkeye Control Panel."

OLE - The Acrobat Reader cannot be used to to insert or create objects
with OLE Embedding because you cannot use Reader to save or make
changes to a PDF file. [117835]

OLE and Links/Bookmarks/Movies - Links and bookmarks to other PDF
files and playback of external movie and sound files will not work if
the PDF file is embedded as an OLE object. [109027,118373]

OS/2 - Acrobat Reader 3.0 should run in the Windows 3.1
compatibility mode of OS/2 2.1 and OS/2 2.1.1.

PC Tools for Windows 1.0 - On Windows 3.1 no Adobe Acrobat 3.0 group
is created and no program items/icons are created. See the
INSTALLATION ISSUES section above for description of workaround.

PhoneNet - PhoneNet does not properly map Macintosh file names
containing upper-ASCII characters. As a result, you will not be able
to open any such files in Acrobat Reader. Solution: Don't use
special characters in file names to be accessed by both Macintosh and
Windows users over a PhoneNet network.

QEMM - There appear to be conflicts between QEMM, ATI Mach 64, and
Acrobat Reader 3.0 which can cause crashes. Updating to QEMM 8.0.1 may
fix this. See http://arachnid.qdeck.com/qdeck/products/QEMM/ or
http://www.quarterdeck.com/ for update information. [154597]

QuickTime 2.1.x - Some older QuickTime movies (circa 1991 or earlier)
may not work properly because their poster images cannot be extracted
by the current QuickTime system software. A potential solution is to
process the movie with Apple's Internet Movie tool. See Apple's
QuickTime website at http://quicktime.apple.com/qt/qthome.html or
http://quicktime.apple.com/qt/sw/sw.html for more details. [174670]

Smooth Fonts and Monochrome Images - Font smoothing (antialiasing) is
not available for Windows 3.x systems. Monochrome images can be
antialiased in Windows 3.1 systems if this option is enabled (File >
Preferences > General dialog). Font smoothing is only performed on
Type 1 and TrueType fonts; Type 3 fonts are not affected.
[153457,151701]

Standard Mode (Windows 3.1) - Acrobat Reader 3.0 does not work in
standard mode; you must be running Windows 3.1 in enhanced mode.

Syshook- Syshook is an application that patches the system menus of
applications; it does not work well with Acrobat Reader.

Toolbar Buttons - In the unlikely even that you have installed a large
number of Acrobat Reader plug-ins, some toolbar button may extend
beyond the right edge of the screen of low-resolution monitors and get
clipped. One workaround is to remove as many plug-ins as possible that
are adding additional toolbar buttons. [151999]

Windows for Workgroups - The Windows for Workgroups Netware extensions
(\windows\netx.com) have been known to cause problems with Acrobat
Reader's Open dialog, as well as other application's Open dialog.
Solution: Contact Microsoft.

Windows NT 3.51 - Make sure you have installed the latest Service Pack
for best results with Acrobat Reader 3.0. Software updates from
Microsoft can be found at ftp://ftp.microsoft.com/softlib/. The
following items are known to be affected: printing to PCL printers
[151625]


  - PRINTING ISSUES
    ===============

Printing from within Internet Explorer - See the information on
printing in the  "Known problems using Acrobat Reader 3.0 with
Microsoft Internet Explorer 3.0" portion of the WEB BROWSER ISSUES
section above.

===============  Specific Printers

Canon BJC 4100 - PDF files may not print properly in the printer's
"Photographic Mode". Solution: Use the printers "Graphics and Text" or
"Automatic" modes. [174198]

Canon LBP-8IV - Use the printer's "bitmap mode" for best results.

HP DeskJet Printers - For best results, it is recommended that you use
the printer's Raster Graphics mode as opposed to the Vector Graphics
mode.

HP DeskJet 500C - This printer has an unprintable area near the top of
the page. Be sure to use the "Shrink to Fit" option in Acrobat
Exchange's Print dialog.

HP LaserJet Printers - For best results, it is recommended that you
use the printer driver's TrueType font option to download TrueType
fonts as bitmaps (not outlines). Details for each driver's Properties
dialog is presented below:

	LaserJet III - Fonts tab, TrueType fonts section: Select the 
		"Download TrueType fonts as bitmap soft fonts" option.
	LaserJet 4 - Fonts tab, TrueType fonts section: Select the 
		"Download TrueType fonts as bitmap soft fonts" option.
	LaserJet 5 - Print Quality tab, Text Mode section: Select the 
		"TrueType as Bitmaps" option

HP LaserJet 5M Enhanced Printer Driver - For best results, it is
recommended that you use the standard HP LaserJet 5M printer driver,
not the enhanced driver that ships with the printer. [158889]



===============  PCL and Non-PostScript Printing

Forms / PCL Printers - Some form objects (fields, buttons, etc.) that
overlap other items on the page may not print properly to PCL printers
due to layering issues. [164189]

Performance Improvements - Acrobat 3.0 contains significant
performance improvements for printing to PCL and other non-PostScript
printers as compared to Acrobat 2.1. On Windows 95 and NT systems,
both text and graphics printing performance is improved; on Windows
3.x systems, performance enhancements are limited to text.

TrueType / Printing - For best results, it is recommended that you use
the printer driver's TrueType font option to download TrueType fonts
as bitmaps (not outlines). Details for each driver's Properties dialog
is presented below:

	LaserJet III - Fonts tab, TrueType fonts section: Select the 
		"Download TrueType fonts as bitmap soft fonts" option.
	LaserJet 4 - Fonts tab, TrueType fonts section: Select the 
		"Download TrueType fonts as bitmap soft fonts" option.
	LaserJet 5 - Print Quality tab, Text Mode section: Select the 
		"TrueType as Bitmaps" option.

If you still have problems, we recommend trying the "Print TrueType as
Graphics" option (if your driver has one). [174299]

Non-PostScript Printers - 
A few PDF files may not print properly to non-PostScript printers.  If
your print output doesn't look right you may want to select a
different printing mode for your driver and try again.  Alternatively
you may wish to print your document to a PostScript printer if one is
available.

To change printing modes in Windows 95, click on the Start button in
Windows 95, and then Settings > Printers.  Select a different printing
mode for your driver and try again.

To change printing modes in Windows 3.1, the double-click on the
Control Panel icon, then double-click on the Printers icon.  In the
Printers dialog box, click on the Setup button to display the
printer's setup dialogs.  To select the graphics mode you may also
have to click an Options button.

Raster vs. Vector Mode - You may get more consistent results if your
printer driver is set to use Raster mode for graphics. Not all printer
drivers have this mode. [162671]

Dithering - Set your printer driver's Graphics / Dithering option to
"Fine" or "Coarse" for best results printing halftone images. A
setting of "None" will produce poor results. [176134]


Windows 3.1 Printer Drivers - The printer drivers shipped with
Microsoft Windows 3.1 for the HP LaserJet III, IIID, IIIP, and IIISi
printers may not work well with Acrobat Reader (and other applications
for that matter). Adobe recommends you use a PCL printer driver based
on the Universal Printer Driver V.3.1.2. Here are several ways to get
this driver:

- World Wide Web - Download the file named "HPPCL5.EXE" from
"http://www.microsoft.com/kb/softlib/mslfiles/hppcl5.exe".

- Microsoft's Bulletin Board - Microsoft's bulletin-board download
service can be reached at 206-739-4009. It supports up to 9600 baud
and you should set up your modem to use 8-bit, 1 stop bit, and no
parity. Once connected, there is a menu-driven bulletin board.
Download the file named "HPPCL5.EXE" and follow the same directions as
above.

- Microsoft - If you're in the US and you don't have a modem, you may
call Microsoft directly at 800-426-9400 and obtain the LaserJet III
printer drivers on a diskette.

- Hewlett-Packard - Again, if you don't have a modem, you may call
Hewlett-Packard directly at 303-739-4009 and obtain the LaserJet III
printer drivers on a diskette. You may also use this number to obtain
the latest printer drivers for the HP LaserJet 4, DeskJet, and
PaintJet families of printers.


600 dpi - If you experience problems printing to HP LaserJet printers
in the 600-dpi mode try switching back to 300-dpi mode or if it is
equipped with a PostScript option, use the PostScript mode for 600-dpi
printing. This 600-dpi PCL5 printing problem does not seem specific to
Acrobat. Documents with various graphic images may not print correctly
to the LaserJet 4 in PCL mode at 600 dpi unless the Graphics option in
the Windows printer driver setup is set to Raster mode.

Drag-and-drop Printing - You can only drag one PDF file at a time onto
printer icons for non-PostScript printers. For PostScript printers,
you can drag-and-drop mutliple PDF files for printing. [176051]

Landscape - To increase printer performance of documents formatted
entirely in landscape orientation to non-PostScript printers the
printer driver must be set in landscape orientation in the Windows
printer setup.

=============== PostScript Printing

AdobePS 4.1 for Windows 95 - For best results when printing to
PostScript printers, Adobe recommends you use the Adobe PostScript
Printer Driver 4.1 for use with the Windows 95 operating system.
AdobePS 4.1 provides several features not found in the standard
Windows 95 PostScript driver, such as Watermark printing and greater
support for many popular applications. The driver and installation
instructions are included on the Acrobat Reader 3.0 CD-ROM in the
DRIVERS\WIN95 folder.  They can also be downloaded from
	http://www.adobe.com/prodindex/printerdrivers/

AdobePS 3.01 for Windows 3.1 - For best results when printing to
PostScript printers, Adobe recommends you use the AdobePS 3.01 (or
later) driver. The driver and installation instructions are included
on the Acrobat Reader 3.0 CD-ROM in the DRIVERS\WIN31 folder.  Please
note, the watermark and n-up feature of this printer driver do not
work with Acrobat Exchange/Reader 3.0. [181119]

JPEG Images - To improve the performance of printing PDF files with
JPEG-compressed images to PostScript Level 2 printers you can change
the setting of your PostScript printer driver to enable Acrobat and
the driver to send JPEG-compressed data directly to the printer. In
the printer driver's Properties dialog, choose the PostScript tab.
Click the "Advanced..." button to display the Advanced PostScript
Options dialog. Choose the "Pure binary data" option in the Data
Format section. This setting may cause problems with other
applications; if it does, return to the default settings by clicking
the Defaults button. [121344]

Memory Issues - If you encounter problems, such as a "VMerror,"
printing to PostScript Level 1 or 2 printers it may be because the
printer has little available memory (for example, a non-upgraded
LaserWriter, LaserWriter Plus, LaserWriter II NT or NTX). There are
two potential solutions to this problem: 1/In the General Preferences
dialog (select from the File > Preferences menu) you may choose to use
Serif only or Sans only for font substitution. This frees up additional
memory in the printer and chances are your document will print
successfully. 2/The other option is to purchase more memory for your
printer.

N-up Printing - N-up printing is only supported with the AdobePS
driver for Windows 95, not the Microsoft "pscript" driver. [177536]

Pure Binary - Do not use the "Pure Binary" option of your PostScript
printer driver when printing from Acrobat Exchange/Reader; use the
"ASCII data" option instead, which is the default setting. In the
printer driver's Properties dialog, choose the PostScript tab. Click
the "Advanced..." button to display the Advanced PostScript Options
dialog. Choose the "ASCII data" option in the Data Format section.
[161459]

Scale/Enlarge to Fit - There is no "Scale/Enlarge to Fit" option in
the print dialog, but a trick that works only to PostScript printers
for "scale my page to fit my paper no matter how big or small" is the
following: 1/ In the print setup dialog, set Scaling (on Windows) or
Reduce/Enlarge (Macintosh) to something like 400%. 2/ In Acrobat's
print dialog select "Shrink to Fit". 3/Then print. This will shrink or
expand the page as necessary to fit the paper. What you have really
done is make the page overly large, and then "Shrink to Fit" it onto
the paper.

Apple Personal LaserWriter NT - If you are using an Apple Personal
LaserWriter NT printer that has not been upgraded to a Personal
LaserWriter NTR, Acrobat Reader won't be able to print substitute
fonts. Contact your Apple dealer for information on upgrading your
printer.



READER WITH SEARCH
==================
The Acrobat Search plug-in allows searches of text in PDF files on a
local hard disk or CD-ROM or across a local area network.  (Searching
PDF files stored on a Web-server requires a Web-server-based search
engine.)  The Acrobat Reader is available with or without the Search
plug-in.  Acrobat Reader with Search can be found on the Acrobat
Reader 3.0 CD-ROM and can redistributed for no charge.    For known
problems and issues related to the Search plug-in see the
ReadMe-Search file installed with Acrobat Reader with Search.


The following issues apply to Reader with Search:


Highlighting and unexpected words - Using some of the word options
such as sounds like and thesaurus can lead to searching and
highlighting of unexpected words. For example the sounds like feature
is designed to work best with proper names. For other words sounds
like will not always give the results one might expect. Use the words
assist dialog to understand what words are being searched for when you
use word options.

Highlighting and proximity - When using the proximity word option only
one occurrence of the search terms will be highlighted in each document
even if the search words occur multiple times. The proximity option
sorts the results list bases how close together the search terms are
in a document. The document is ranked by the search terms which appear
closest together. Only this occurrence of the search terms is
highlighted in the document. The other occurrences are not highlighted
because they did not contribute to the document's high ranking in the
results list.

Internal Error while searching - When searching documents which
contain long titles you may get an internal error message from
Acrobat. This message is due to having titles which are same through
the first 63 characters in the title. For example, suppose we have two
documents with the titles: "The Quick Brown Fox Jumped Over The Lazy
Dogs. By John A. Smithson" and "The Quick Brown Fox Jumped Over The
Lazy Dogs. By John A. Smithsun". These titles are 66 characters long
and are identical in the first 63 characters. The dialog will appear
in this instance if the search results are sorted by title. As a
work-around change all document fields (especially the Title) to be
unique within the first 63 characters if their field values are more
than 64 characters long and reindex the documents.

Networks - Acrobat Search and Catalog may have problems indexing or
finding documents due to differences in how networking software maps
non-8.3 file and folder names. For example what is seen on the network
by a Macintosh may be different from what is seen by a PC. The
following networks have been used in testing Acrobat Search and
Catalog:
	Novell Netware & Netware Lite
	Banyan Vines
	Sun Select PC-NFS 3.5, 4.0, 5.0 and 5.1
	NetManage ChameleonNFS
	IBM OS/2 2.1
	Microsoft Windows for Workgroups 3.11
	Microsoft Windows 95
	Microsoft Windows NT Advanced Server 3.1 
Other networks may work, but have not been thoroughly tested.

Network server overload - A network file server can reach max
utilization when many users are running broad searches at the same
time. This causes an overload on the server slowing down all other
processes. This occurs when many broad searches attempt to read the
entire index which forces the server to load the entire index into its
cache. As indexes can be very large the caches can be overloaded. To
avoid this problem discourage broad searches such as "*report" which
will read the entire index.

No results found - If you are searching for a phrase which contains a
stop word you may unexpectedly get no results found for your search.
For example searching for "nick of time" will lead to no results found
if "of" is a stop word.

Performance - When opening a file from the results list it may take a
long time to open the file or in some case the file can not be opened
at all. This problem is caused by using non 8.3 filenames and
directory names with more than 8 characters. To resolve this problem
name your files and directories using 8.3 conventions and rebuild the
index. You can also avoid this problem by checking "add ID's to 1.0
files" in the index options dialog, and using 8 character directory
names for your top level directories. These changes will help search
locate and open files more quickly. When searching for common words,
such as searching for "the" by itself, search may appear to hang. In
fact Search is just taking a very long time. This happens because the
number of hits is so large it takes a while to retrieve them from the
index.

Proximity not being used - Proximity is only available for simple AND
searches such as "earnings AND report". Complex searches such as
"earnings AND (report OR analysis)" will automatically turn off
proximity.

Search results list / files not appearing - If proximity is turned on,
files which contain the words being searched for may not appear in the
results list if these words are 2 to 3 pages apart. For example when
searching for "income and report" if both words appear in a file with
8.5 x 11 pages full of 12-point text then the file will only appear in
the results list if income and report appear are on the same page or
consecutive pages.

Word options - Some indexes are built without the support for word
options such as stemming or thesaurus. The documentation incorrectly
states that when searching against these indexes with these options
Search will not find stems or synonyms of the search words. Search
will in fact find these even when these options are not included in
the index. Not including these options in the index only affects the
word assistant which will not be able to show stems or synonyms for
this index.


=====================================================================

Adobe, Acrobat, and PageMill are trademarks of Adobe Systems,
Incorporated. Macintosh and QuickTime are registered trademarks and
TrueType is a trademark of Apple Computer, Inc.  Pentium is a
registered trademark of Intel Corporation.  Microsoft and Windows are
registered trademarks and ActiveX and Windows NT are trademarks of
Microsoft Corporation. Netscape and Netscape Navigator are trademarks
of Netscape Communications Corporation.

(c) 1983-1996 Adobe Systems Incorporated. All rights reserved.


