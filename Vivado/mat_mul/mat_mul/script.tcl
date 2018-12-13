############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mat_mul
add_files mat_mul/mat_mul.c
add_files mat_mul/mat_mul.h
open_solution "mat_mul"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
#source "./mat_mul/mat_mul/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
