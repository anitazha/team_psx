/******************************************************************************
*
* (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xaxidma_sinit.c
*
* Look up the hardware settings using device ID. The hardware setting is inside
* the configuration table in xaxidma_g.c, generated automatically by XPS or
* manually by the user.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a jz   08/16/10 First release
* 2.00a jz   08/10/10 Second release, added in xaxidma_g.c, xaxidma_sinit.c,
*                     updated tcl file, added xaxidma_porting_guide.h
* 3.00a jz   11/22/10 Support IP core parameters change
* 5.00a srt  08/29/11 Removed a compiler warning
*
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xaxidma.h"


/*****************************************************************************/
/**
 * Look up the hardware configuration for a device instance
 *
 * @param	DeviceId is the unique device ID of the device to lookup for
 *
 * @return
 *		The configuration structure for the device. If the device ID is
 *		not found,a NULL pointer is returned.
 *
 * @note	None
 *
 ******************************************************************************/
XAxiDma_Config *XAxiDma_LookupConfig(u32 DeviceId)
{
	extern XAxiDma_Config XAxiDma_ConfigTable[];
	XAxiDma_Config *CfgPtr;
	u32 Index;

	CfgPtr = NULL;

	for (Index = 0; Index < XPAR_XAXIDMA_NUM_INSTANCES; Index++) {
		if (XAxiDma_ConfigTable[Index].DeviceId == DeviceId) {

			CfgPtr = &XAxiDma_ConfigTable[Index];
			break;
		}
	}

	return CfgPtr;
}
