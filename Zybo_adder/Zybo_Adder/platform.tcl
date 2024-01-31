# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\Zybo_adder\Zybo_Adder\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\Zybo_adder\Zybo_Adder\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Zybo_Adder}\
-hw {D:\Zybo_adder\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/Zybo_adder}

platform write
platform generate -domains 
platform active {Zybo_Adder}
bsp reload
bsp reload
platform clean
platform clean
platform clean
platform clean
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {D:/Zybo_adder/design_1_wrapper2.xsa}
platform clean
platform generate
platform config -updatehw {D:/Zybo_adder/design_1_wrapper3.xsa}
platform clean
platform config -updatehw {D:/Zybo_adder/design_1_wrapper3.xsa}
platform generate
platform generate -domains standalone_domain 
platform config -updatehw {D:/Zybo_adder/design_1_wrapper4.xsa}
platform clean
platform clean
platform generate
platform config -updatehw {D:/Zybo_adder/design_1_wrapper5.xsa}
platform clean
platform generate
platform config -updatehw {D:/Zybo_adder/design_1_wrapper.xsa}
platform clean
platform config -updatehw {D:/Zybo_adder/design_1_wrapper.xsa}
platform config -updatehw {D:/Zybo_adder/design_1_wrapper.xsa}
platform config -updatehw {D:/Zybo_adder/design_1_wrapper6.xsa}
domain active {zynq_fsbl}
bsp reload
bsp write
domain active {standalone_domain}
bsp reload
bsp write
platform config -updatehw {D:/Zybo_adder/design_1_wrapper5.xsa}
catch {platform remove Zybo_Adder}
