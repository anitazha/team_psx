$PSDocId: Document Release 1.0 for Runtime Library Release 3.6$

							December 18, 1995
Distribution of KANJI Font Data

< Overview >
  The following KANJI font data is distributed as application development 
  tool for PlayStation.
          Font:  Gothic
          Size:  11, 13, 15 dots
          Type:  Non-KANJI				got1[135]j0b
                 The first level KANJI			got1[135]j1b
                 The second level KANJI			got1[135]j2b
                 Character for vertical writing		got1[135]tat
                 Half-size characters (hankaku)		got1[135]hlf
                 User-defined character			got15gai
  
  The data files described above are included in 'fontdata\*.h'.

< How to use >
 0. KANJI font data format 
   Refer to 'fontdata\format.doc' for KANJI font data structure and the
   file structure.
   Also, half-size character array is described in 
  'fontdata\hankaku.doc'.

 1. Built-in KANJI font data in PlayStation
   PlayStation contains the 15-dot font data; non-KANJIs, the first 
   level KANJIs and the user-defined characters. Make use of the built-in
   data with an access function (Krom2RawAdd2()) distributed before.
   (Refer to \psx\doc\jp\api.) 
Å@ The tool for displaying KANJI codes and data can be used, too.
   (sjiscode\codeview.cpe)
    Note: In this tool the Krom2RawAdd2() function is used for the access
          to the user-defined characters added for overseas PlayStation.
          The specification is the same as Krom2RawAdd(), and it 
          corresponds to every code in the non-KANJIs, first level
          KANJIs and user-defined characters. 

 2. Necessary KANJI font data only
   As for the font data distributed this time, the case is assumed that 
   only the necessary data is extracted from all the font data, and that 
   the extracted data is used in each application. 
   The tool for extracting the necessary font data for kanjidiv, and 
   viewer for the extracted data are attached to this document. However, 
   the characters for vertical writing and the half-size data (hankaku) 
   are not included.

 3. KANJI data files by font size 
   As a reference, a sample for handling KANJI data files by font size 
   is included in kanjifnt.

< Files >
	readme_e.txt	This file 

	fontdata\	Font data

		got1[135]j0b.h	Non-KANJI data
		got1[135]j1b.h	The first level KANJI data
		got1[135]j2b.h	The second level KANJI data
		got1[135]tat.h	Data for vertical writing
		got1[135]hlf.h	Half-size data (hankaku )
		got15gai.h	User-defined data
		format_e.txt	Font data file and explanation of KANJI
                                data structure 
		half_e.txt	Character array of half size data
		offset.h	        Code conversion table

	sjiscode\	Built-in font KANJI code list
		codeview.c	Tool for Shift-JIS code list
		readme_e.txt	codeview explanation
		makefile.mak	Tool makefile (for psymake)
		makefile.6x	Tool makefile (for NEWS)

	kanjidiv\	Sample to extract data by character

		readme_e.txt	Extract command explanation
		kanjidiv.exe	Command to extract data by character
		test.knj	Input data sample (-> kanji.out)
		kanji.out	Extracted data sample (<- test.knj)

		viewer_e.txt	Viewer explanation
		viewer.c	        Viewer source file
		makefile.mak	Viewer makefile (for psymake)
		makefile.6x	Viewer makefile (for NEWS)

	kanjifnt\	Sample to use files by font size 

		readme_e.txt	Sample program explanation
		kanji.h		Font size designation
		main.c		Main routine
		trans.c		KANJI code and address conversion
		makefile.mak	Sample makefile (for psymake)
		makefile.6x	Sample makefile (for NEWS)

	asc2sjis\	Utility for converting ASCII code to Shift-JIS code
		asc2sjis.c	Function for converting
		readme_e.txt	Function explanation
		makefile.mak	Tool makefile (for psymake)
		makefile.6x	Tool makefile (for NEWS)
