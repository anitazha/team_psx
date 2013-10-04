proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param general.maxThreads 4
  read_checkpoint C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.runs/impl_1/top_test.dcp
  set_property webtalk.parent_dir C:/work/psx_synthesis/hdmi_test_v7/hdmi_test_v7.data/wt [current_project]
  set_property parent.project_dir C:/work/psx_synthesis/hdmi_test_v7 [current_project]
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force top_test_opt.dcp
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  catch { report_io -file top_test_io_placed.rpt }
  catch { report_clock_utilization -file top_test_clock_utilization_placed.rpt }
  catch { report_utilization -file top_test_utilization_placed.rpt }
  catch { report_control_sets -verbose -file top_test_control_sets_placed.rpt }
  write_checkpoint -force top_test_placed.dcp
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  catch { report_drc -file top_test_drc_routed.rpt }
  catch { report_power -file top_test_power_routed.rpt }
  catch { report_route_status -file top_test_route_status_routed.rpt }
  catch { report_timing_summary -file top_test_timing_summary_routed.rpt }
  write_checkpoint -force top_test_routed.dcp
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

