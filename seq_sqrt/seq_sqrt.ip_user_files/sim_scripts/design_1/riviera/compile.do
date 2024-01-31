vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xlslice_v1_0_2

vmap xil_defaultlib riviera/xil_defaultlib
vmap xlslice_v1_0_2 riviera/xlslice_v1_0_2

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_Seq_decoder_bits_0_0/sim/design_1_Seq_decoder_bits_0_0.vhd" \
"../../../bd/design_1/ip/design_1_sqrt2_0_0/sim/design_1_sqrt2_0_0.vhd" \

vlog -work xlslice_v1_0_2  -v2k5 \
"../../../../seq_sqrt.gen/sources_1/bd/design_1/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_xlslice_0_0/sim/design_1_xlslice_0_0.v" \
"../../../bd/design_1/ip/design_1_xlslice_1_0/sim/design_1_xlslice_1_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

