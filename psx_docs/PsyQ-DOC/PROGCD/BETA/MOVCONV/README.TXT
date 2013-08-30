=== Movie Tools (96/11/11) ===


Date: 11/26/96
Version: MovConv 2.1e-beta1 and MovPack 1.5e-beta1

These are beta versions of MovPack and MovConv.
They work fine under Windows 95 but have problems under
Windows 3.1 when converting files larger than 1.5 gigabytes.


[ Changes from version 1.98e to 2.1e-beta1 ]

(1) MDEC encoding speed has improved (about twice as fast as  version 1.98e)
(2) The size limitation for the script has been removed.
(3) Frame numbers appear on the progress dialog box.
(4) A warning appears  when input audio data is not 16 bits per sample.
(5) Scripts are now  case-insensitve.
(6) A function Pcm2Xa has been added to the script.
(7) The number field of file sequence is now treated as a 32 bit value.
(8) The str(RGB) format has been removed.
(9) '~' and '_' are now recognized as a part of the file name by the script parser.
(10) A warning is now shown when AVI frames are compressed.
(11) 32 bit deep AVI are now supported.
(12) The Q matrix setting is now used correctly.

[ limitations ]

(1) Input AVI must be uncompressed AVI. Audio must be 16 bits per sample.
(2) Preview functionality doesn't work well on a 4 bit or 8 bit display.

[ Known bugs ]

(1) The last frame cannot be shown on an MDEC Preview dialog box.

[ Changes from MovPack 1.2e to MovPack 1.5e ]

(1)MovPack script has been added.
	caution:
		See movpack.scr for detail.
		Movpack script is processed line by line.
		It may cause errors to edit script over multiple
		lines.

[ Misc ]

(1) Attatched help file is obsolete. See below to check new features
    of Movie tools.


=== New features which are not described in help file ===

[ Script ]

MovConv has a batch processing capability.  A script defines the processing
sequence.  The script for MovConv is very simple:  it is a sequence of
functions which defines each conversion.  Refer to the file "movconv.scr"
(in this directory)  to check the syntax of the MovConv script.  
MovPack also has scripting capabilites.  It is a little different from 
MovConv script.  See movpack.scr to check the syntax of MovPack script.  
The parser of MovPack script is much simpler than MovConv script.  
Editing over multiple lines on movpack.scr may cause errors.


[ Q matrix ]

The Q matrix is a quantization matrix which is used in the quantization stage of
MDEC compression.  The MDEC quantization stage is the same as the JPEG or MPEG
quantization stage.  A full discussion of the quantization is beyond the
scope of this document.  However,  normally, you don't need to change the Q 
matrix value.   If you are very familier with JPEG or MPEG compression, 
you can change the Q matrix value to optimize compression.

[ Leap sector ]

A leap sector is a sector which is put on the output data to syncronize video
with audio.  To be exact, the NTSC video frame rate is not 60.00 fps but
59.94 fps.  If you import video using video capture equipment, the base
frame rate of imported video is 59.94 fps.  But the PlayStation streaming
mechanism expects video data to be 60.00fps.  So, if you play NTSC video
data with PlayStaion, it is played slightly faster than it should be.
Usually, it doesn't matter while you play only video data because the frame
rate difference is very small.  But if you play audio data with video
data, you will recognize that synchronization of video and audio becomes
incorrect over time.  You can solve this problem putting a leap sector on
the original 59.94 fps video.  This makes 59.94 fps video 60.00 fps.

Please refer below to see whether you should or should not put in a leap sector.

	===============================================================
	Data is imported from video tape		Leap sector on
	(59.94fps)
	---------------------------------------------------------------
	Data is created on computer			Leap sector off
	(60.00fps)
	===============================================================

There are two dialog boxes in which you can toggle the leap sector:

	1) If you are interleaving a PlayStation streaming 
	   file with XA audio, choose the menu item "File: Interleave 
	   Video with Audio."  The dialog box will have a "leap sector"
	   toggle button.
	2) If you are converting an AVI file into a ".str" (MDEC 
	   streaming) file, select the "Detail" button on the 
	   main screen (which will only be activated if the "Format"
	   output is set to "str (MDEC)" or "bs"). 




