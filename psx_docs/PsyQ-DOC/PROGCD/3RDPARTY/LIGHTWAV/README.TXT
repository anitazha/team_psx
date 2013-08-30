                               
                       PlayStation Development Plug-ins

                            for LightWave 3D 4.0

                   version Beta.2(Intel,Alpha,SGI) May 1, 1996



Copyright 1996, D-STORM, Inc.

Yoshiaki Tazaki





Installation:


1. Copy the appropriate plug-in file for your system to your plugins/modeler 
   and plugins/layout directory.

   To plugins/modeler:

       RSDLOAD.P   (RSD Geometry file loader)

       RSDSAVE.p   (RSD Geometry file saver)

   To plugins/layout:

       TIMIMAGE.P  (TIM Image file loader and saver)




2. Add RSDLOAD.P and RSDSAVE.P to your Modeler

   Start LightWave Modeler 4.0 and choose "Add Plugin" from the "Objects/Custom" 
   pop-up.

   Select the plug-ins from the file requestor.  In the "Custom" menu, you will 
   find  "RSDLOAD.P" and "RSDSAVE.P" added the the list.  When you quit Modeler, 
   the plug-ins will be saved in the list for future use.


3. Add TIMIMAGE.P to your LightWave

   Start LightWave 4.0 and choose "Add Plug-ins" from the "Options" pop-up.

   Select the plug-ins from the file requestor.  In the "RGB Image Format" popup
   from the "Record" menu, you will find  "TIMIMAGE.P" added the the list.  
   When you quit LightWave, the plug-ins will be saved in the list for future 
   use.



Instructions:


   RSD file is the geometry file for Sony PlayStation. It has 4 separate files
   such as (.rsd), (.ply), (.grp) and (.ply) file.



   RSDSAVE.P exports above files from Modeler. To export (.rsd) files, select
   "RSD_EXPORT(Ver.1.0)" from the "Custom" popup in the "Object" menu. And
   type just a file name to export your geometry without suffix from the file
   requestor.

   Tips: PlayStation can read only 3 and 4 vertices polygons. If the geometry
         has >4 vertices polygons, then the RSDSAVE Plugin show you the error
         message dialog. You can triple >4 vertices polygons with T-key after
         finding >4 vertices polygons with the "Stats" button from the 
         "Display" menu (same as w-key).



   RSDLOAD.P imports the (.rsd) files to Modeler. To import (.rsd) files, push
   the "Load" button from the "Objects" menu. And choose the (.rsd) file to 
   import from the file requestor. the RSDLOAD automaticaly reads the (.rsd)
   file included (.ply) and (.grp) files to your Modeler.

   Note: PlayStation and LightWave have different texture mapping method.
         You lost all of texture vertices in the (.rsd) file in the Modeler
         when you load your (.rsd) file with texture uv vertices in the (.mat)
         file.



   TIMIMAGE.P load and save Sony TIM image format files to the LightWave.
   You can use any TIM image file as the texture mapping images in your
   animations and you can save your rendered image as the TIM image files.
   TIMIMAGE.P supports following TIM image format.

   To load:    4bit CLUT (Color Look Up Table)
               8bit CLUT 
               16bit Direct color
               24bit Direct color

   To save:    24bit Direct color

   To load the TIM image files to your LightWave, select "Load Image" button
   from the "Images" menu, and choose the (.tim) file to load from the file 
   requestor.

   To save the TIM image files from your LightWave, select "PlayStation(.tim)" 
   popup from the "RGB image format" in the "Record" menu, and specifiy (.tim)
   file name from "Save RGB images" and render your scene.




CAUTION !!

   DON'T COPY THIS PLUGINS TO ANYBODY. THIS PLUGINS ARE STILL BETA VERSION,
   PLEASE USE IT WITH YOUR LIABILITIES.



For more information about the PlayStation Plug-ins:


Yoshiaki Tazaki

D-STORM, Inc. 

6-8-8, Akasaka, Minato-ku, Tokyo 107 Japan
e-mail:  taz@technonet.co.jp
fax:     81-3-5570-8723
