/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "myip_adder.h"


#define ADDER_BASEADDRESS 0x43C00000

int main()
{
    int a, b=1, answer=0,a_readback=0,b_readback=0,dummy=13,i,j;

    init_platform();

    printf("UART_Adder_test#5\n");
    printf("Add Two Number Program begins now. Enter b=0 to Exit\n");

    while(b!=0)
    {
        printf("Enter a= \n");
        scanf("%d",&a);
        MYIP_ADDER_mWriteReg(ADDER_BASEADDRESS,(4*0),a);
        printf("You entered a= %d\n",a);
        printf("Enter b= \n");
        scanf("%d",&b);
        MYIP_ADDER_mWriteReg(ADDER_BASEADDRESS,(4*1),b);
        printf("You entered b= %d\n",b);
        MYIP_ADDER_mWriteReg(ADDER_BASEADDRESS,(4*3),0x33);

        a_readback=MYIP_ADDER_mReadReg(ADDER_BASEADDRESS,(4*0));
        b_readback=MYIP_ADDER_mReadReg(ADDER_BASEADDRESS,(4*1));
        dummy=MYIP_ADDER_mReadReg(ADDER_BASEADDRESS,(4*3));
        answer=MYIP_ADDER_mReadReg(ADDER_BASEADDRESS,(4*2));

        //answer = a_readback+b_readback;
        printf("Sum = %d\n",answer);
        printf("a_readback = %d\n",a_readback);
        printf("b_readback = %d\n",b_readback);
        printf("dummy = %d\n",dummy);

        answer=MYIP_ADDER_mReadReg(ADDER_BASEADDRESS,(4*2));
        printf("Sum = %d\n",answer);

    }
    printf("Exiting\n");
    cleanup_platform();
    //return 0;
}
