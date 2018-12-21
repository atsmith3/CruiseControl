set PROJECT_NAME tcl_1
set TOP_FUNCTION mat_mul_wrap


set REPORT_END _csynth.rpt
set REPORT $TOP_FUNCTION$REPORT_END

proc hls_iteration {solution_name file_name output_file report_file_name iter} {
  #name the current solution, set clock, set part
  open_solution -reset $solution_name$iter
  set_part {xc7z020clg484-1} 
  create_clock -period 10 

  #get line in input and add it to project
  set line $file_name
  puts $line
  add_files $line
  
  
  #run synthesis and delete file
  #csim_design
  csynth_design
  #cosim_design
  #export_design 
  file delete $line

  set report [open $report_file_name]

  for {set j 0} {$j < 32 } {incr j} {
    gets $report result_line
  }

  close $report

  set res [regexp -all -inline {[0-9]+} $result_line]

  set value [regexp -inline {[0-9]+} $res]

#  gets $output_file result_line
  puts $output_file "$solution_name$iter : $line"
  puts $output_file "$res"
  puts $output_file "$value"
  puts $output_file "\n" 

  return $value
}


#open file and gets the number of runs read in the files into an array
set infile [open "files.txt"]
set runs [gets $infile]
array set file_arr {}
for {set i 0} {$i < $runs} {incr i} {
  gets $infile line
  set file_arr($i) $line
}
close $infile

set base sol

#set project name and top function 
open_project -reset $PROJECT_NAME 
set_top $TOP_FUNCTION

#Add files that need only be added once
add_files mat_mul.h
add_files -tb test_bench.c

set output_data [open "report.txt" w]

for {set i 0} {$i < $runs } {incr i} {
  set iter_result [hls_iteration $base $file_arr($i) $output_data "$PROJECT_NAME\/$base$i\/syn\/report\/$REPORT" $i]
}

close $output_data
