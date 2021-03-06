set C_TypeInfoList {{ 
"fc6" : [[], {"return": [[], {"scalar": "int"}] }, [{"ExternC" : 0}], [ {"input": [[], {"array": [ {"array": [ {"scalar": "float"}, [1,1]]}, [120]]}] }, {"weights": [[], {"array": [ {"array": [ {"scalar": "float"}, [120,1,1]]}, [10]]}] }, {"bias": [[], {"array": [ {"scalar": "float"}, [10]]}] }, {"output": [[], {"array": [ {"scalar": "float"}, [10]]}] }],[],""]
}}
set moduleName fc6
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {fc6}
set C_modelType { int 32 }
set C_modelArgList {
	{ DATA_A float 32 regular {axi_master 0}  }
	{ DATA_B float 32 regular {axi_master 0}  }
	{ DATA_C float 32 regular {axi_master 0}  }
	{ DATA_D float 32 regular {axi_master 1}  }
	{ input_r int 32 regular {axi_slave 0}  }
	{ weights int 32 regular {axi_slave 0}  }
	{ bias int 32 regular {axi_slave 0}  }
	{ output_r int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "DATA_A", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "input","cData": "float","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "input_r","bundle": "AXILiteS"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 119,"step" : 1},{"low" : 0,"up" : 0,"step" : 1},{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "DATA_B", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "weights","cData": "float","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "weights","bundle": "AXILiteS"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 9,"step" : 1},{"low" : 0,"up" : 119,"step" : 1},{"low" : 0,"up" : 0,"step" : 1},{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "DATA_C", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bias","cData": "float","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "bias","bundle": "AXILiteS"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 9,"step" : 1}]}]}]} , 
 	{ "Name" : "DATA_D", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "output","cData": "float","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "output_r","bundle": "AXILiteS"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 9,"step" : 1}]}]}]} , 
 	{ "Name" : "input_r", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "weights", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "bias", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "output_r", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "return","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1,"step" : 0}]}]}], "offset" : {"out":16}} ]}
# RTL Port declarations: 
set portNum 200
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_DATA_A_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_DATA_A_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_DATA_A_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_DATA_A_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_DATA_A_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_DATA_A_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_DATA_A_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_DATA_A_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_DATA_A_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_DATA_A_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_DATA_A_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_DATA_A_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_DATA_A_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_DATA_A_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_DATA_A_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_DATA_A_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_DATA_A_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_DATA_A_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_DATA_A_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_DATA_A_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_DATA_B_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_DATA_B_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_DATA_B_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_DATA_B_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_DATA_B_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_DATA_B_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_DATA_B_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_DATA_B_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_DATA_B_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_DATA_B_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_DATA_B_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_DATA_B_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_DATA_B_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_DATA_B_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_DATA_B_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_DATA_B_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_DATA_B_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_DATA_B_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_DATA_B_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_DATA_B_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_DATA_C_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_AWADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_DATA_C_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_DATA_C_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_DATA_C_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_DATA_C_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_DATA_C_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_DATA_C_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_DATA_C_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_ARADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_DATA_C_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_DATA_C_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_DATA_C_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_DATA_C_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_DATA_C_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_DATA_C_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_DATA_C_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_DATA_C_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_DATA_C_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_DATA_C_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_DATA_C_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_DATA_C_BUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_DATA_D_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_AWADDR sc_out sc_lv 32 signal 3 } 
	{ m_axi_DATA_D_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_AWLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_DATA_D_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_DATA_D_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_DATA_D_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_DATA_D_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_DATA_D_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_WDATA sc_out sc_lv 32 signal 3 } 
	{ m_axi_DATA_D_WSTRB sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_ARADDR sc_out sc_lv 32 signal 3 } 
	{ m_axi_DATA_D_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_ARLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_DATA_D_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_DATA_D_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_DATA_D_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_DATA_D_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_DATA_D_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_DATA_D_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_RDATA sc_in sc_lv 32 signal 3 } 
	{ m_axi_DATA_D_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_DATA_D_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_DATA_D_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_DATA_D_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_DATA_D_BUSER sc_in sc_lv 1 signal 3 } 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"fc6","role":"start","value":"0","valid_bit":"0"},{"name":"fc6","role":"continue","value":"0","valid_bit":"4"},{"name":"fc6","role":"auto_start","value":"0","valid_bit":"7"},{"name":"input_r","role":"data","value":"24"},{"name":"weights","role":"data","value":"32"},{"name":"bias","role":"data","value":"40"},{"name":"output_r","role":"data","value":"48"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"fc6","role":"start","value":"0","valid_bit":"0"},{"name":"fc6","role":"done","value":"0","valid_bit":"1"},{"name":"fc6","role":"idle","value":"0","valid_bit":"2"},{"name":"fc6","role":"ready","value":"0","valid_bit":"3"},{"name":"fc6","role":"auto_start","value":"0","valid_bit":"7"},{"name":"return","role":"data","value":"16"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_DATA_A_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWVALID" }} , 
 	{ "name": "m_axi_DATA_A_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWREADY" }} , 
 	{ "name": "m_axi_DATA_A_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWADDR" }} , 
 	{ "name": "m_axi_DATA_A_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWID" }} , 
 	{ "name": "m_axi_DATA_A_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWLEN" }} , 
 	{ "name": "m_axi_DATA_A_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_DATA_A_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWBURST" }} , 
 	{ "name": "m_axi_DATA_A_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_DATA_A_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_DATA_A_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWPROT" }} , 
 	{ "name": "m_axi_DATA_A_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWQOS" }} , 
 	{ "name": "m_axi_DATA_A_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWREGION" }} , 
 	{ "name": "m_axi_DATA_A_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "AWUSER" }} , 
 	{ "name": "m_axi_DATA_A_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "WVALID" }} , 
 	{ "name": "m_axi_DATA_A_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "WREADY" }} , 
 	{ "name": "m_axi_DATA_A_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_A", "role": "WDATA" }} , 
 	{ "name": "m_axi_DATA_A_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "WSTRB" }} , 
 	{ "name": "m_axi_DATA_A_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "WLAST" }} , 
 	{ "name": "m_axi_DATA_A_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "WID" }} , 
 	{ "name": "m_axi_DATA_A_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "WUSER" }} , 
 	{ "name": "m_axi_DATA_A_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARVALID" }} , 
 	{ "name": "m_axi_DATA_A_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARREADY" }} , 
 	{ "name": "m_axi_DATA_A_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARADDR" }} , 
 	{ "name": "m_axi_DATA_A_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARID" }} , 
 	{ "name": "m_axi_DATA_A_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARLEN" }} , 
 	{ "name": "m_axi_DATA_A_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_DATA_A_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARBURST" }} , 
 	{ "name": "m_axi_DATA_A_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_DATA_A_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_DATA_A_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARPROT" }} , 
 	{ "name": "m_axi_DATA_A_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARQOS" }} , 
 	{ "name": "m_axi_DATA_A_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARREGION" }} , 
 	{ "name": "m_axi_DATA_A_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "ARUSER" }} , 
 	{ "name": "m_axi_DATA_A_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "RVALID" }} , 
 	{ "name": "m_axi_DATA_A_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "RREADY" }} , 
 	{ "name": "m_axi_DATA_A_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_A", "role": "RDATA" }} , 
 	{ "name": "m_axi_DATA_A_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "RLAST" }} , 
 	{ "name": "m_axi_DATA_A_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "RID" }} , 
 	{ "name": "m_axi_DATA_A_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "RUSER" }} , 
 	{ "name": "m_axi_DATA_A_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_A", "role": "RRESP" }} , 
 	{ "name": "m_axi_DATA_A_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "BVALID" }} , 
 	{ "name": "m_axi_DATA_A_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "BREADY" }} , 
 	{ "name": "m_axi_DATA_A_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_A", "role": "BRESP" }} , 
 	{ "name": "m_axi_DATA_A_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "BID" }} , 
 	{ "name": "m_axi_DATA_A_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_A", "role": "BUSER" }} , 
 	{ "name": "m_axi_DATA_B_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWVALID" }} , 
 	{ "name": "m_axi_DATA_B_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWREADY" }} , 
 	{ "name": "m_axi_DATA_B_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWADDR" }} , 
 	{ "name": "m_axi_DATA_B_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWID" }} , 
 	{ "name": "m_axi_DATA_B_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWLEN" }} , 
 	{ "name": "m_axi_DATA_B_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_DATA_B_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWBURST" }} , 
 	{ "name": "m_axi_DATA_B_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_DATA_B_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_DATA_B_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWPROT" }} , 
 	{ "name": "m_axi_DATA_B_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWQOS" }} , 
 	{ "name": "m_axi_DATA_B_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWREGION" }} , 
 	{ "name": "m_axi_DATA_B_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "AWUSER" }} , 
 	{ "name": "m_axi_DATA_B_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "WVALID" }} , 
 	{ "name": "m_axi_DATA_B_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "WREADY" }} , 
 	{ "name": "m_axi_DATA_B_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_B", "role": "WDATA" }} , 
 	{ "name": "m_axi_DATA_B_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "WSTRB" }} , 
 	{ "name": "m_axi_DATA_B_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "WLAST" }} , 
 	{ "name": "m_axi_DATA_B_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "WID" }} , 
 	{ "name": "m_axi_DATA_B_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "WUSER" }} , 
 	{ "name": "m_axi_DATA_B_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARVALID" }} , 
 	{ "name": "m_axi_DATA_B_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARREADY" }} , 
 	{ "name": "m_axi_DATA_B_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARADDR" }} , 
 	{ "name": "m_axi_DATA_B_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARID" }} , 
 	{ "name": "m_axi_DATA_B_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARLEN" }} , 
 	{ "name": "m_axi_DATA_B_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_DATA_B_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARBURST" }} , 
 	{ "name": "m_axi_DATA_B_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_DATA_B_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_DATA_B_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARPROT" }} , 
 	{ "name": "m_axi_DATA_B_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARQOS" }} , 
 	{ "name": "m_axi_DATA_B_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARREGION" }} , 
 	{ "name": "m_axi_DATA_B_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "ARUSER" }} , 
 	{ "name": "m_axi_DATA_B_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "RVALID" }} , 
 	{ "name": "m_axi_DATA_B_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "RREADY" }} , 
 	{ "name": "m_axi_DATA_B_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_B", "role": "RDATA" }} , 
 	{ "name": "m_axi_DATA_B_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "RLAST" }} , 
 	{ "name": "m_axi_DATA_B_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "RID" }} , 
 	{ "name": "m_axi_DATA_B_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "RUSER" }} , 
 	{ "name": "m_axi_DATA_B_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_B", "role": "RRESP" }} , 
 	{ "name": "m_axi_DATA_B_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "BVALID" }} , 
 	{ "name": "m_axi_DATA_B_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "BREADY" }} , 
 	{ "name": "m_axi_DATA_B_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_B", "role": "BRESP" }} , 
 	{ "name": "m_axi_DATA_B_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "BID" }} , 
 	{ "name": "m_axi_DATA_B_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_B", "role": "BUSER" }} , 
 	{ "name": "m_axi_DATA_C_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWVALID" }} , 
 	{ "name": "m_axi_DATA_C_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWREADY" }} , 
 	{ "name": "m_axi_DATA_C_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWADDR" }} , 
 	{ "name": "m_axi_DATA_C_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWID" }} , 
 	{ "name": "m_axi_DATA_C_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWLEN" }} , 
 	{ "name": "m_axi_DATA_C_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_DATA_C_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWBURST" }} , 
 	{ "name": "m_axi_DATA_C_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_DATA_C_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_DATA_C_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWPROT" }} , 
 	{ "name": "m_axi_DATA_C_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWQOS" }} , 
 	{ "name": "m_axi_DATA_C_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWREGION" }} , 
 	{ "name": "m_axi_DATA_C_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "AWUSER" }} , 
 	{ "name": "m_axi_DATA_C_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "WVALID" }} , 
 	{ "name": "m_axi_DATA_C_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "WREADY" }} , 
 	{ "name": "m_axi_DATA_C_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_C", "role": "WDATA" }} , 
 	{ "name": "m_axi_DATA_C_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "WSTRB" }} , 
 	{ "name": "m_axi_DATA_C_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "WLAST" }} , 
 	{ "name": "m_axi_DATA_C_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "WID" }} , 
 	{ "name": "m_axi_DATA_C_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "WUSER" }} , 
 	{ "name": "m_axi_DATA_C_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARVALID" }} , 
 	{ "name": "m_axi_DATA_C_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARREADY" }} , 
 	{ "name": "m_axi_DATA_C_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARADDR" }} , 
 	{ "name": "m_axi_DATA_C_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARID" }} , 
 	{ "name": "m_axi_DATA_C_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARLEN" }} , 
 	{ "name": "m_axi_DATA_C_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_DATA_C_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARBURST" }} , 
 	{ "name": "m_axi_DATA_C_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_DATA_C_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_DATA_C_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARPROT" }} , 
 	{ "name": "m_axi_DATA_C_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARQOS" }} , 
 	{ "name": "m_axi_DATA_C_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARREGION" }} , 
 	{ "name": "m_axi_DATA_C_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "ARUSER" }} , 
 	{ "name": "m_axi_DATA_C_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "RVALID" }} , 
 	{ "name": "m_axi_DATA_C_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "RREADY" }} , 
 	{ "name": "m_axi_DATA_C_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_C", "role": "RDATA" }} , 
 	{ "name": "m_axi_DATA_C_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "RLAST" }} , 
 	{ "name": "m_axi_DATA_C_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "RID" }} , 
 	{ "name": "m_axi_DATA_C_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "RUSER" }} , 
 	{ "name": "m_axi_DATA_C_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_C", "role": "RRESP" }} , 
 	{ "name": "m_axi_DATA_C_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "BVALID" }} , 
 	{ "name": "m_axi_DATA_C_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "BREADY" }} , 
 	{ "name": "m_axi_DATA_C_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_C", "role": "BRESP" }} , 
 	{ "name": "m_axi_DATA_C_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "BID" }} , 
 	{ "name": "m_axi_DATA_C_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_C", "role": "BUSER" }} , 
 	{ "name": "m_axi_DATA_D_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWVALID" }} , 
 	{ "name": "m_axi_DATA_D_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWREADY" }} , 
 	{ "name": "m_axi_DATA_D_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWADDR" }} , 
 	{ "name": "m_axi_DATA_D_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWID" }} , 
 	{ "name": "m_axi_DATA_D_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWLEN" }} , 
 	{ "name": "m_axi_DATA_D_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_DATA_D_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWBURST" }} , 
 	{ "name": "m_axi_DATA_D_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_DATA_D_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_DATA_D_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWPROT" }} , 
 	{ "name": "m_axi_DATA_D_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWQOS" }} , 
 	{ "name": "m_axi_DATA_D_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWREGION" }} , 
 	{ "name": "m_axi_DATA_D_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "AWUSER" }} , 
 	{ "name": "m_axi_DATA_D_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "WVALID" }} , 
 	{ "name": "m_axi_DATA_D_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "WREADY" }} , 
 	{ "name": "m_axi_DATA_D_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_D", "role": "WDATA" }} , 
 	{ "name": "m_axi_DATA_D_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "WSTRB" }} , 
 	{ "name": "m_axi_DATA_D_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "WLAST" }} , 
 	{ "name": "m_axi_DATA_D_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "WID" }} , 
 	{ "name": "m_axi_DATA_D_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "WUSER" }} , 
 	{ "name": "m_axi_DATA_D_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARVALID" }} , 
 	{ "name": "m_axi_DATA_D_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARREADY" }} , 
 	{ "name": "m_axi_DATA_D_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARADDR" }} , 
 	{ "name": "m_axi_DATA_D_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARID" }} , 
 	{ "name": "m_axi_DATA_D_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARLEN" }} , 
 	{ "name": "m_axi_DATA_D_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_DATA_D_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARBURST" }} , 
 	{ "name": "m_axi_DATA_D_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_DATA_D_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_DATA_D_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARPROT" }} , 
 	{ "name": "m_axi_DATA_D_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARQOS" }} , 
 	{ "name": "m_axi_DATA_D_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARREGION" }} , 
 	{ "name": "m_axi_DATA_D_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "ARUSER" }} , 
 	{ "name": "m_axi_DATA_D_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "RVALID" }} , 
 	{ "name": "m_axi_DATA_D_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "RREADY" }} , 
 	{ "name": "m_axi_DATA_D_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "DATA_D", "role": "RDATA" }} , 
 	{ "name": "m_axi_DATA_D_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "RLAST" }} , 
 	{ "name": "m_axi_DATA_D_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "RID" }} , 
 	{ "name": "m_axi_DATA_D_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "RUSER" }} , 
 	{ "name": "m_axi_DATA_D_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_D", "role": "RRESP" }} , 
 	{ "name": "m_axi_DATA_D_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "BVALID" }} , 
 	{ "name": "m_axi_DATA_D_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "BREADY" }} , 
 	{ "name": "m_axi_DATA_D_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "DATA_D", "role": "BRESP" }} , 
 	{ "name": "m_axi_DATA_D_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "BID" }} , 
 	{ "name": "m_axi_DATA_D_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "DATA_D", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"],
		"CDFG" : "fc6",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "DATA_A", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "DATA_A_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "DATA_A_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "DATA_B", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "DATA_B_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "DATA_B_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "DATA_C", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "DATA_C_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "DATA_C_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "DATA_D", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "DATA_D_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "DATA_D_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "DATA_D_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_AXILiteS_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_DATA_A_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_DATA_B_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_DATA_C_m_axi_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_DATA_D_m_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_w_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_b_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_o_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_fadd_32ns_32nbkb_U0", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_fadd_32ns_32nbkb_U1", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_fadd_32ns_32nbkb_U2", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_fmul_32ns_32ncud_U3", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fc6_fmul_32ns_32ncud_U4", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fc6 {
		DATA_A {Type I LastRead 127 FirstWrite -1}
		DATA_B {Type I LastRead 255 FirstWrite -1}
		DATA_C {Type I LastRead 145 FirstWrite -1}
		DATA_D {Type O LastRead 160 FirstWrite 150}
		input_r {Type I LastRead 0 FirstWrite -1}
		weights {Type I LastRead 0 FirstWrite -1}
		bias {Type I LastRead 0 FirstWrite -1}
		output_r {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2526", "Max" : "2526"}
	, {"Name" : "Interval", "Min" : "2527", "Max" : "2527"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	DATA_A { m_axi {  { m_axi_DATA_A_AWVALID VALID 1 1 }  { m_axi_DATA_A_AWREADY READY 0 1 }  { m_axi_DATA_A_AWADDR ADDR 1 32 }  { m_axi_DATA_A_AWID ID 1 1 }  { m_axi_DATA_A_AWLEN LEN 1 8 }  { m_axi_DATA_A_AWSIZE SIZE 1 3 }  { m_axi_DATA_A_AWBURST BURST 1 2 }  { m_axi_DATA_A_AWLOCK LOCK 1 2 }  { m_axi_DATA_A_AWCACHE CACHE 1 4 }  { m_axi_DATA_A_AWPROT PROT 1 3 }  { m_axi_DATA_A_AWQOS QOS 1 4 }  { m_axi_DATA_A_AWREGION REGION 1 4 }  { m_axi_DATA_A_AWUSER USER 1 1 }  { m_axi_DATA_A_WVALID VALID 1 1 }  { m_axi_DATA_A_WREADY READY 0 1 }  { m_axi_DATA_A_WDATA DATA 1 32 }  { m_axi_DATA_A_WSTRB STRB 1 4 }  { m_axi_DATA_A_WLAST LAST 1 1 }  { m_axi_DATA_A_WID ID 1 1 }  { m_axi_DATA_A_WUSER USER 1 1 }  { m_axi_DATA_A_ARVALID VALID 1 1 }  { m_axi_DATA_A_ARREADY READY 0 1 }  { m_axi_DATA_A_ARADDR ADDR 1 32 }  { m_axi_DATA_A_ARID ID 1 1 }  { m_axi_DATA_A_ARLEN LEN 1 8 }  { m_axi_DATA_A_ARSIZE SIZE 1 3 }  { m_axi_DATA_A_ARBURST BURST 1 2 }  { m_axi_DATA_A_ARLOCK LOCK 1 2 }  { m_axi_DATA_A_ARCACHE CACHE 1 4 }  { m_axi_DATA_A_ARPROT PROT 1 3 }  { m_axi_DATA_A_ARQOS QOS 1 4 }  { m_axi_DATA_A_ARREGION REGION 1 4 }  { m_axi_DATA_A_ARUSER USER 1 1 }  { m_axi_DATA_A_RVALID VALID 0 1 }  { m_axi_DATA_A_RREADY READY 1 1 }  { m_axi_DATA_A_RDATA DATA 0 32 }  { m_axi_DATA_A_RLAST LAST 0 1 }  { m_axi_DATA_A_RID ID 0 1 }  { m_axi_DATA_A_RUSER USER 0 1 }  { m_axi_DATA_A_RRESP RESP 0 2 }  { m_axi_DATA_A_BVALID VALID 0 1 }  { m_axi_DATA_A_BREADY READY 1 1 }  { m_axi_DATA_A_BRESP RESP 0 2 }  { m_axi_DATA_A_BID ID 0 1 }  { m_axi_DATA_A_BUSER USER 0 1 } } }
	DATA_B { m_axi {  { m_axi_DATA_B_AWVALID VALID 1 1 }  { m_axi_DATA_B_AWREADY READY 0 1 }  { m_axi_DATA_B_AWADDR ADDR 1 32 }  { m_axi_DATA_B_AWID ID 1 1 }  { m_axi_DATA_B_AWLEN LEN 1 8 }  { m_axi_DATA_B_AWSIZE SIZE 1 3 }  { m_axi_DATA_B_AWBURST BURST 1 2 }  { m_axi_DATA_B_AWLOCK LOCK 1 2 }  { m_axi_DATA_B_AWCACHE CACHE 1 4 }  { m_axi_DATA_B_AWPROT PROT 1 3 }  { m_axi_DATA_B_AWQOS QOS 1 4 }  { m_axi_DATA_B_AWREGION REGION 1 4 }  { m_axi_DATA_B_AWUSER USER 1 1 }  { m_axi_DATA_B_WVALID VALID 1 1 }  { m_axi_DATA_B_WREADY READY 0 1 }  { m_axi_DATA_B_WDATA DATA 1 32 }  { m_axi_DATA_B_WSTRB STRB 1 4 }  { m_axi_DATA_B_WLAST LAST 1 1 }  { m_axi_DATA_B_WID ID 1 1 }  { m_axi_DATA_B_WUSER USER 1 1 }  { m_axi_DATA_B_ARVALID VALID 1 1 }  { m_axi_DATA_B_ARREADY READY 0 1 }  { m_axi_DATA_B_ARADDR ADDR 1 32 }  { m_axi_DATA_B_ARID ID 1 1 }  { m_axi_DATA_B_ARLEN LEN 1 8 }  { m_axi_DATA_B_ARSIZE SIZE 1 3 }  { m_axi_DATA_B_ARBURST BURST 1 2 }  { m_axi_DATA_B_ARLOCK LOCK 1 2 }  { m_axi_DATA_B_ARCACHE CACHE 1 4 }  { m_axi_DATA_B_ARPROT PROT 1 3 }  { m_axi_DATA_B_ARQOS QOS 1 4 }  { m_axi_DATA_B_ARREGION REGION 1 4 }  { m_axi_DATA_B_ARUSER USER 1 1 }  { m_axi_DATA_B_RVALID VALID 0 1 }  { m_axi_DATA_B_RREADY READY 1 1 }  { m_axi_DATA_B_RDATA DATA 0 32 }  { m_axi_DATA_B_RLAST LAST 0 1 }  { m_axi_DATA_B_RID ID 0 1 }  { m_axi_DATA_B_RUSER USER 0 1 }  { m_axi_DATA_B_RRESP RESP 0 2 }  { m_axi_DATA_B_BVALID VALID 0 1 }  { m_axi_DATA_B_BREADY READY 1 1 }  { m_axi_DATA_B_BRESP RESP 0 2 }  { m_axi_DATA_B_BID ID 0 1 }  { m_axi_DATA_B_BUSER USER 0 1 } } }
	DATA_C { m_axi {  { m_axi_DATA_C_AWVALID VALID 1 1 }  { m_axi_DATA_C_AWREADY READY 0 1 }  { m_axi_DATA_C_AWADDR ADDR 1 32 }  { m_axi_DATA_C_AWID ID 1 1 }  { m_axi_DATA_C_AWLEN LEN 1 8 }  { m_axi_DATA_C_AWSIZE SIZE 1 3 }  { m_axi_DATA_C_AWBURST BURST 1 2 }  { m_axi_DATA_C_AWLOCK LOCK 1 2 }  { m_axi_DATA_C_AWCACHE CACHE 1 4 }  { m_axi_DATA_C_AWPROT PROT 1 3 }  { m_axi_DATA_C_AWQOS QOS 1 4 }  { m_axi_DATA_C_AWREGION REGION 1 4 }  { m_axi_DATA_C_AWUSER USER 1 1 }  { m_axi_DATA_C_WVALID VALID 1 1 }  { m_axi_DATA_C_WREADY READY 0 1 }  { m_axi_DATA_C_WDATA DATA 1 32 }  { m_axi_DATA_C_WSTRB STRB 1 4 }  { m_axi_DATA_C_WLAST LAST 1 1 }  { m_axi_DATA_C_WID ID 1 1 }  { m_axi_DATA_C_WUSER USER 1 1 }  { m_axi_DATA_C_ARVALID VALID 1 1 }  { m_axi_DATA_C_ARREADY READY 0 1 }  { m_axi_DATA_C_ARADDR ADDR 1 32 }  { m_axi_DATA_C_ARID ID 1 1 }  { m_axi_DATA_C_ARLEN LEN 1 8 }  { m_axi_DATA_C_ARSIZE SIZE 1 3 }  { m_axi_DATA_C_ARBURST BURST 1 2 }  { m_axi_DATA_C_ARLOCK LOCK 1 2 }  { m_axi_DATA_C_ARCACHE CACHE 1 4 }  { m_axi_DATA_C_ARPROT PROT 1 3 }  { m_axi_DATA_C_ARQOS QOS 1 4 }  { m_axi_DATA_C_ARREGION REGION 1 4 }  { m_axi_DATA_C_ARUSER USER 1 1 }  { m_axi_DATA_C_RVALID VALID 0 1 }  { m_axi_DATA_C_RREADY READY 1 1 }  { m_axi_DATA_C_RDATA DATA 0 32 }  { m_axi_DATA_C_RLAST LAST 0 1 }  { m_axi_DATA_C_RID ID 0 1 }  { m_axi_DATA_C_RUSER USER 0 1 }  { m_axi_DATA_C_RRESP RESP 0 2 }  { m_axi_DATA_C_BVALID VALID 0 1 }  { m_axi_DATA_C_BREADY READY 1 1 }  { m_axi_DATA_C_BRESP RESP 0 2 }  { m_axi_DATA_C_BID ID 0 1 }  { m_axi_DATA_C_BUSER USER 0 1 } } }
	DATA_D { m_axi {  { m_axi_DATA_D_AWVALID VALID 1 1 }  { m_axi_DATA_D_AWREADY READY 0 1 }  { m_axi_DATA_D_AWADDR ADDR 1 32 }  { m_axi_DATA_D_AWID ID 1 1 }  { m_axi_DATA_D_AWLEN LEN 1 8 }  { m_axi_DATA_D_AWSIZE SIZE 1 3 }  { m_axi_DATA_D_AWBURST BURST 1 2 }  { m_axi_DATA_D_AWLOCK LOCK 1 2 }  { m_axi_DATA_D_AWCACHE CACHE 1 4 }  { m_axi_DATA_D_AWPROT PROT 1 3 }  { m_axi_DATA_D_AWQOS QOS 1 4 }  { m_axi_DATA_D_AWREGION REGION 1 4 }  { m_axi_DATA_D_AWUSER USER 1 1 }  { m_axi_DATA_D_WVALID VALID 1 1 }  { m_axi_DATA_D_WREADY READY 0 1 }  { m_axi_DATA_D_WDATA DATA 1 32 }  { m_axi_DATA_D_WSTRB STRB 1 4 }  { m_axi_DATA_D_WLAST LAST 1 1 }  { m_axi_DATA_D_WID ID 1 1 }  { m_axi_DATA_D_WUSER USER 1 1 }  { m_axi_DATA_D_ARVALID VALID 1 1 }  { m_axi_DATA_D_ARREADY READY 0 1 }  { m_axi_DATA_D_ARADDR ADDR 1 32 }  { m_axi_DATA_D_ARID ID 1 1 }  { m_axi_DATA_D_ARLEN LEN 1 8 }  { m_axi_DATA_D_ARSIZE SIZE 1 3 }  { m_axi_DATA_D_ARBURST BURST 1 2 }  { m_axi_DATA_D_ARLOCK LOCK 1 2 }  { m_axi_DATA_D_ARCACHE CACHE 1 4 }  { m_axi_DATA_D_ARPROT PROT 1 3 }  { m_axi_DATA_D_ARQOS QOS 1 4 }  { m_axi_DATA_D_ARREGION REGION 1 4 }  { m_axi_DATA_D_ARUSER USER 1 1 }  { m_axi_DATA_D_RVALID VALID 0 1 }  { m_axi_DATA_D_RREADY READY 1 1 }  { m_axi_DATA_D_RDATA DATA 0 32 }  { m_axi_DATA_D_RLAST LAST 0 1 }  { m_axi_DATA_D_RID ID 0 1 }  { m_axi_DATA_D_RUSER USER 0 1 }  { m_axi_DATA_D_RRESP RESP 0 2 }  { m_axi_DATA_D_BVALID VALID 0 1 }  { m_axi_DATA_D_BREADY READY 1 1 }  { m_axi_DATA_D_BRESP RESP 0 2 }  { m_axi_DATA_D_BID ID 0 1 }  { m_axi_DATA_D_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ DATA_A { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ DATA_B { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ DATA_C { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ DATA_D { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ DATA_A 1 }
	{ DATA_B 1 }
	{ DATA_C 1 }
	{ DATA_D 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ DATA_A 1 }
	{ DATA_B 1 }
	{ DATA_C 1 }
	{ DATA_D 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
