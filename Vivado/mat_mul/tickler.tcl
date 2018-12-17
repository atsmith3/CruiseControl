#open file and gets the number of runs
set infile [open "input.txt"]
gets $infile line
set runs $line

set base sol

#set project name and top function 
open_project -reset tcl_1
set_top mat_mul_wrap

#Add files that need only be added once
add_files mat_mul.h
add_files -tb test_bench.c


for {set i 0} {$i < $runs } {incr i} {


  open_solution -reset $base$i
  set_part {xc7z020clg484-1} 
  create_clock -period 10 

  gets $infile line
  puts $line
  add_files $line
  

  
  

  
  
  #source "./tcl_1/solution1/directives.tcl"
  #csim_design
  csynth_design
  #cosim_design
  #export_design 
  file delete $line
  
  
}
close $infile
