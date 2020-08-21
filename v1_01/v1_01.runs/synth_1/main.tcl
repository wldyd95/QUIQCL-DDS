# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.cache/wt [current_project]
set_property parent.project_path C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/data_sender_v1_01.sv
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/AD9912_DAC8734_main.sv
}
read_verilog -library xil_defaultlib {
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/WriteToRegister.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/ascii2decimal.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/ascii2hex.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/async_receiver.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/async_transmitter.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/data_receiver_v1_00.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/hex2ascii.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/new/led_intensity_adjust.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/imports/new/DAC8734.v
  C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/imports/new/device_DNA.v
}
read_ip -quiet C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.xci
set_property used_in_implementation false [get_files -all c:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/constrs_1/imports/Arty_S7/Arty-S7-50-Master.xdc
set_property used_in_implementation false [get_files C:/Users/hp/Desktop/QUIQCL/DDS/AD9912_DAC8734/v1_01/v1_01.srcs/constrs_1/imports/Arty_S7/Arty-S7-50-Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top main -part xc7s50csga324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]