# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Zybo_adder\MyAdder_system\_ide\scripts\systemdebugger_myadder_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Zybo_adder\MyAdder_system\_ide\scripts\systemdebugger_myadder_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B7C018A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B7C018A-23727093-0"}
fpga -file D:/Zybo_adder/MyAdder/_ide/bitstream/design_1_wrapper6.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/Zybo_adder/Zybo_20/export/Zybo_20/hw/design_1_wrapper6.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/Zybo_adder/MyAdder/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/Zybo_adder/MyAdder/Debug/MyAdder.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
