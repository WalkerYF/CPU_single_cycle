# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -ruleid {1}  -id {DRC 23-20}  -suppress 
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/code/CPU_single_cycle/CPU_single_cycle/CPU_single_cycle.cache/wt [current_project]
set_property parent.project_path E:/code/CPU_single_cycle/CPU_single_cycle/CPU_single_cycle.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_mem E:/code/CPU_single_cycle/src/Ins_Memory/code.mem
read_verilog -library xil_defaultlib {
  E:/code/CPU_single_cycle/src/DEBUG/debouncing.v
  E:/code/CPU_single_cycle/src/DEBUG/displayReg.v
  E:/code/CPU_single_cycle/src/DEBUG/clkdiv_190hz.v
  E:/code/CPU_single_cycle/src/DEBUG/test.v
  E:/code/CPU_single_cycle/src/top.v
}
read_xdc E:/code/CPU_single_cycle/CPU_single_cycle/CPU_single_cycle.srcs/constrs_1/new/my.xdc
set_property used_in_implementation false [get_files E:/code/CPU_single_cycle/CPU_single_cycle/CPU_single_cycle.srcs/constrs_1/new/my.xdc]

synth_design -top top -part xc7a35tcpg236-1
write_checkpoint -noxdef top.dcp
catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }