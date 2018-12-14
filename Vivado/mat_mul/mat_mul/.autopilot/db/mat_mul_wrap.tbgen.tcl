set C_TypeInfoList {{ 
"mat_mul_wrap" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"matA": [[], {"array": [ {"array": [ {"scalar": "float"}, [100]]}, [100]]}] }, {"matB": [[], {"array": [ {"array": [ {"scalar": "float"}, [100]]}, [100]]}] }, {"matC": [[], {"array": [ {"array": [ {"scalar": "float"}, [100]]}, [100]]}] }],[],""]
}}
set moduleName mat_mul_wrap
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mat_mul_wrap}
set C_modelType { void 0 }
set C_modelArgList {
	{ matA float 32 regular {array 10000 { 1 3 } 1 1 }  }
	{ matB float 32 regular {array 10000 { 1 3 } 1 1 }  }
	{ matC float 32 regular {array 10000 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "matA", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "matA","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 99,"step" : 1},{"low" : 0,"up" : 99,"step" : 1}]}]}]} , 
 	{ "Name" : "matB", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "matB","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 99,"step" : 1},{"low" : 0,"up" : 99,"step" : 1}]}]}]} , 
 	{ "Name" : "matC", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "matC","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 99,"step" : 1},{"low" : 0,"up" : 99,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ matA_address0 sc_out sc_lv 14 signal 0 } 
	{ matA_ce0 sc_out sc_logic 1 signal 0 } 
	{ matA_q0 sc_in sc_lv 32 signal 0 } 
	{ matB_address0 sc_out sc_lv 14 signal 1 } 
	{ matB_ce0 sc_out sc_logic 1 signal 1 } 
	{ matB_q0 sc_in sc_lv 32 signal 1 } 
	{ matC_address0 sc_out sc_lv 14 signal 2 } 
	{ matC_ce0 sc_out sc_logic 1 signal 2 } 
	{ matC_we0 sc_out sc_logic 1 signal 2 } 
	{ matC_d0 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "matA_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "matA", "role": "address0" }} , 
 	{ "name": "matA_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matA", "role": "ce0" }} , 
 	{ "name": "matA_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matA", "role": "q0" }} , 
 	{ "name": "matB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "matB", "role": "address0" }} , 
 	{ "name": "matB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matB", "role": "ce0" }} , 
 	{ "name": "matB_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matB", "role": "q0" }} , 
 	{ "name": "matC_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "matC", "role": "address0" }} , 
 	{ "name": "matC_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matC", "role": "ce0" }} , 
 	{ "name": "matC_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matC", "role": "we0" }} , 
 	{ "name": "matC_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matC", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "mat_mul_wrap",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_copy_mat_fu_28"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_copy_mat_fu_36"},
			{"State" : "ap_ST_fsm_state2", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_copy_mat_fu_44"}],
		"Port" : [
			{"Name" : "matA", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_copy_mat_fu_28", "Port" : "src"}]},
			{"Name" : "matB", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_copy_mat_fu_36", "Port" : "src"}]},
			{"Name" : "matC", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_mat_fu_44", "Port" : "dest"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matC_local_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matB_local_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matA_local_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_copy_mat_fu_28", "Parent" : "0",
		"CDFG" : "copy_mat",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "src", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dest", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_copy_mat_fu_36", "Parent" : "0",
		"CDFG" : "copy_mat",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "src", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dest", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_copy_mat_fu_44", "Parent" : "0",
		"CDFG" : "copy_mat",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "src", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dest", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	mat_mul_wrap {
		matA {Type I LastRead 2 FirstWrite -1}
		matB {Type I LastRead 2 FirstWrite -1}
		matC {Type O LastRead -1 FirstWrite 3}}
	copy_mat {
		src {Type I LastRead 2 FirstWrite -1}
		dest {Type O LastRead -1 FirstWrite 3}}
	copy_mat {
		src {Type I LastRead 2 FirstWrite -1}
		dest {Type O LastRead -1 FirstWrite 3}}
	copy_mat {
		src {Type I LastRead 2 FirstWrite -1}
		dest {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20202", "Max" : "20202"}
	, {"Name" : "Interval", "Min" : "20203", "Max" : "20203"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	matA { ap_memory {  { matA_address0 mem_address 1 14 }  { matA_ce0 mem_ce 1 1 }  { matA_q0 mem_dout 0 32 } } }
	matB { ap_memory {  { matB_address0 mem_address 1 14 }  { matB_ce0 mem_ce 1 1 }  { matB_q0 mem_dout 0 32 } } }
	matC { ap_memory {  { matC_address0 mem_address 1 14 }  { matC_ce0 mem_ce 1 1 }  { matC_we0 mem_we 1 1 }  { matC_d0 mem_din 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
