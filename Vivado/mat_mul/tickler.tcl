package require simulation::annealing 0.2

global PROJECT_NAME
set PROJECT_NAME tcl_1
global TOP_FUNCTION
set TOP_FUNCTION mat_mul_wrap
global file_dir
set file_dir mat_mul_files

set REPORT_END _csynth.rpt
global REPORT
set REPORT $TOP_FUNCTION$REPORT_END

proc hls_iteration {iter} {
  #get info with callbacks
  global solution_name
  global array file_arr
  global output_data
  global PROJECT_NAME
  global REPORT
  global file_dir
  set output_file $output_data
  set f $file_arr($iter)

  #name the current solution, set clock, set part
  open_solution -reset $solution_name$iter
  set_part {xc7z020clg484-1} 
  create_clock -period 10 

  #get line in input and add it to project
  file copy "$file_dir/$f$" "."
  add_files $f
  
  #run synthesis and delete file
  #csim_design
  csynth_design
  #cosim_design
  #export_design 
  file delete $f

  set report [open "$PROJECT_NAME\/$solution_name$iter\/syn\/report\/$REPORT"]

  for {set j 0} {$j < 32 } {incr j} {
    gets $report result_line
  }

  close $report

  set res [regexp -all -inline {[0-9]+} $result_line]

  set value [expr [regexp -inline {[0-9]+} $res] + 0]

#  gets $output_file result_line
  puts $output_file "$solution_name$iter : $f"
  puts $output_file "$res"
  puts $output_file "$value"
  puts $output_file "\n" 

  return $value
}


#open file and gets the number of runs read in the files into an array
set infile [open "files.txt"]
set runs [gets $infile]
global array file_arr
array set file_arr {}
for {set i 0} {$i < $runs} {incr i} {
  gets $infile line
  set file_arr($i) $line
}
close $infile

set files "files.txt"

set base sol

#set project name and top function 
open_project -reset $PROJECT_NAME 
set_top $TOP_FUNCTION

#Add files that need only be added once
add_files mat_mul.h
add_files -tb test_bench.c

global output_data
set output_data [open "report.txt" w]
set sa_report [open "sa_report.txt" w]

global synth_result_fname
set synth_result_fname "$PROJECT_NAME\/$base$i\/syn\/report\/$REPORT"

global solution_name
set solution_name "sol"

puts [::simulation::annealing::findMinimum -verbose 1 -reportfile $sa_report -trials 3 -parameters {i 0 [$runs - 1]}  -code {set result [hls_iteration $i]}]

#for {set i 0} {$i < $runs } {incr i} {
  #set iter_result [hls_iteration $base $file_arr($i) $output_data "$PROJECT_NAME\/$base$i\/syn\/report\/$REPORT" $i]
#}

close $output_data
close $sa_report

exit
