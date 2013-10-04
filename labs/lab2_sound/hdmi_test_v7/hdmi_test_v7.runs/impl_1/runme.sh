#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-1999, 2001-2012 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=C:/Xilinx/14.3/ISE_DS/EDK/bin/nt;C:/Xilinx/14.3/ISE_DS/EDK/lib/nt;C:/Xilinx/14.3/ISE_DS/ISE/bin/nt;C:/Xilinx/14.3/ISE_DS/ISE/lib/nt;C:/Xilinx/14.3/ISE_DS/common/bin/nt;C:/Xilinx/14.3/ISE_DS/common/lib/nt:C:/Xilinx/Vivado/2012.3/bin
else
  PATH=C:/Xilinx/14.3/ISE_DS/EDK/bin/nt;C:/Xilinx/14.3/ISE_DS/EDK/lib/nt;C:/Xilinx/14.3/ISE_DS/ISE/bin/nt;C:/Xilinx/14.3/ISE_DS/ISE/lib/nt;C:/Xilinx/14.3/ISE_DS/common/bin/nt;C:/Xilinx/14.3/ISE_DS/common/lib/nt:C:/Xilinx/Vivado/2012.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .write_bitstream.begin.rst
EAStep vivado -log top_test.rdi -applog -m32 -messageDb vivado.pb -mode batch -source top_test.tcl -notrace


