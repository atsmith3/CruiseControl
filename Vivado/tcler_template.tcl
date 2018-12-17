#USER DEFINED VARIABLES
set PROJECT_NAME tcl_1
set TOP_FUNCTION mat_mul_wrap
#END OF USER DEFINED FILES
#DO NOT TOUCH BELOW
#THAT MEANS YOU JERRY

set REPORT_END _csynth.rpt
set REPORT $TOP_FUNCTION$REPORT_END

#open file and gets the number of runs
set infile [open "files.txt" ]
gets $infile line
set runs $line
set base sol

#set project name and top function 
open_project -reset $PROJECT_NAME 
set_top $TOP_FUNCTION

#USER DEFINDED FILES
add_files mat_mul.h
add_files -tb test_bench.c
#END OF USER DEFINED FILES

#make file for report data
set outfile [open "report.out" w]

#main loop to cycle through different optimizations
for {set i 0} {$i < $runs } {incr i} {

	#name the current solution, set clock, set part
	open_solution -reset $base$i
	set_part {xc7z020clg484-1} 
	create_clock -period 10 

	#get line in input and add it to project
	gets $infile line
	add_files $line
	
	
	#run synthesis and delete file
	#csim_design
	csynth_design
	#cosim_design
	#export_design 
	file delete $line

	#open solution file for current iteration
	set infile_2 [open "$PROJECT_NAME\/$base$i\/syn\/report\/$REPORT"]

	#move to latency line
	for {set j 0} {$j < 31 } {incr j} {
		gets $infile_2 line_2
	}

	#grab latency line and output to report file 
	gets $infile_2 full_line
	puts $outfile "$base$i : $line"
	puts $outfile "$full_line"
	puts $outfile "\n" 
	
	report_power -no_propagation -xpe /Power/p$i.xpe
	
	

}
close $infile
close $infile_2
close $outfile