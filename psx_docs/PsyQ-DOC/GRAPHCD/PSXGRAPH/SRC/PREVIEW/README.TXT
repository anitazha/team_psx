		    * MIMeWave previewer *

[Button configuration]

Direction buttons, L1, L2 : translations
Right buttons, R1, R2     : rotations

SELECT:		pause / change view mode
START:		start a preview

[Compiling program]

> psymake all

[Program execution]

> resetps
> psymake load
> run mimewave

[Customizing]

o When normal MIMe is needed, please define NORMALMIME in main.c as follows:

     #define NORMALMIME

o To preview in the 640x480 high resolution mode, please define HIRESOLUTION
  in main.c as follows:

     #define HIRESOLUTION

  This mode may result in failing to draw a frame in 1/60 second especially 
  for a large model.

o Lights and the background color can be changed; see light_init() and
  GsSortClear().
