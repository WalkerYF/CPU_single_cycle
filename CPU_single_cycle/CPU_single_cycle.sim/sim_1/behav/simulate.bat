@echo off
set xv_path=I:\\envirnment\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xsim Extend_tb_behav -key {Behavioral:sim_1:Functional:Extend_tb} -tclbatch Extend_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
