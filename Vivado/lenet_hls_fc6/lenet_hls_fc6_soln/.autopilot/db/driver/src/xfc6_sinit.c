// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfc6.h"

extern XFc6_Config XFc6_ConfigTable[];

XFc6_Config *XFc6_LookupConfig(u16 DeviceId) {
	XFc6_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFC6_NUM_INSTANCES; Index++) {
		if (XFc6_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFc6_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFc6_Initialize(XFc6 *InstancePtr, u16 DeviceId) {
	XFc6_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFc6_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFc6_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif
