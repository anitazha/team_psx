Usage :

SYMMUNGE [options] <infile> [<outfile>]

Symmunge will compact a symbol file by removing multiple definitions of the
same structure/union/enum and by reordering source level debug info, etc.
This can have a drastic effect on the size of the symbol file, e.g. a 4 Mbyte
symbol file was reduced to 430k.  This reduces the debugger's memory
requirement and speeds debugger startup.

Symmunge can also unmangle c++ names.  To enable this specify /u as an option
on the command line.  To do this it uses a gnu library routine.  In
accordance with the gnu library license the source for the library and the
object code of the SN Systems copyright part of symmunge are included in
the zip file symsrc.zip.  See the license file COPYING.LIB for further
information.

Symmunge will also ensure that all definitions of a particular named
structure are identical and will give an error if they're not, e.g. if one
file defines

struct xxx
{
   int a;
   int b;
};


and another defines

struct xxx
{
   int a;
   short b;
};

then you'll get an error message.


Please report any problems through the usual channels.

