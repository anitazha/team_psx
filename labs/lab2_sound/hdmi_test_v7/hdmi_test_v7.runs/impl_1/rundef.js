//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2012 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "C:/Xilinx/14.3/ISE_DS/EDK/bin/nt;C:/Xilinx/14.3/ISE_DS/EDK/lib/nt;C:/Xilinx/14.3/ISE_DS/ISE/bin/nt;C:/Xilinx/14.3/ISE_DS/ISE/lib/nt;C:/Xilinx/14.3/ISE_DS/common/bin/nt;C:/Xilinx/14.3/ISE_DS/common/lib/nt;C:/Xilinx/Vivado/2012.3/bin;";
} else {
  PathVal = "C:/Xilinx/14.3/ISE_DS/EDK/bin/nt;C:/Xilinx/14.3/ISE_DS/EDK/lib/nt;C:/Xilinx/14.3/ISE_DS/ISE/bin/nt;C:/Xilinx/14.3/ISE_DS/ISE/lib/nt;C:/Xilinx/14.3/ISE_DS/common/bin/nt;C:/Xilinx/14.3/ISE_DS/common/lib/nt;C:/Xilinx/Vivado/2012.3/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


// pre-commands:
ISETouchFile( "init_design", "begin" );
ISEStep( "vivado",
         "-log top_test.rdi -applog -m32 -messageDb vivado.pb -mode batch -source top_test.tcl -notrace" );





function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
