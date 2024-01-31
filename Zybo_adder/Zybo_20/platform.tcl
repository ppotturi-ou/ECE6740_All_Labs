# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\Zybo_adder\Zybo_20\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\Zybo_adder\Zybo_20\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Zybo_20}\
-hw {D:\Zybo_adder\design_1_wrapper6.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/Zybo_adder}

platform write
platform active {Zybo_20}
domain active {zynq_fsbl}
bsp reload
domain -mss {D:\Zybo_adder\Zybo_20\zynq_fsbl\zynq_fsbl_bsp\system.mss}
domain active {standalone_domain}
bsp reload
platform -make-local
