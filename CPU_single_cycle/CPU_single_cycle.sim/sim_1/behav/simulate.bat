@echo off
set xv_path=I:\\envirnment\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xsim top_tb_behav -key {Behavioral:sim_1:Functional:top_tb} -tclbatch top_tb.tcl -view D:/code/CPU_single_cycle/CPU_single_cycle/CPU_single_cycle_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
