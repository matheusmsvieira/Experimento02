@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto b29764d75a044528a9941f1c29fd3cda -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot bloco_op_TB_behav xil_defaultlib.bloco_op_TB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
