set PROJECT_NAME tcl_1
set TOP_FUNCTION mat_mul_wrap


set REPORT_END _csynth.rpt
set REPORT $TOP_FUNCTION$REPORT_END


#open file and gets the number of runs
set infile [open "input.txt"]
gets $infile line
set runs $line

set base sol

#set project name and top function 
open_project -reset $PROJECT_NAME 
set_top $TOP_FUNCTION

#Add files that need only be added once
add_files mat_mul.h
add_files -tb test_bench.c


set outfile [open "report.out" w]


for {set i 0} {$i < $runs } {incr i} {

  #name the current solution, set clock, set part
  open_solution -reset $base$i
  set_part {xc7z020clg484-1} 
  create_clock -period 10 

  #get line in input and add it to project
  gets $infile line
  puts $line
  add_files $line
  
  
  #run synthesis and delete file
  #csim_design
  csynth_design
  #cosim_design
  #export_design 
  file delete $line


  set infile_2 [open "$PROJECT_NAME\/$base$i\/syn\/report\/$REPORT"]

  for {set j 0} {$j < 31 } {incr j} {
    gets $infile_2 line_2
  }

  gets $infile_2 full_line
  puts $outfile "$base$i : $line"
  puts $outfile "$full_line"
  puts $outfile "\n" 



  
  
}
close $infile
close $infile_2
close $outfile
