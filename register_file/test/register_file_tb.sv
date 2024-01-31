//=================================================================================
// MIT License
//
// Copyright (c) 2023 - 2024 Adria Babiano Novella
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================
`timescale 1ns/1ps
`define DELAY 2
`define CLK_HALFPERIOD 10

module register_file_tb();
	// input output signals for the DUT
	// test signals
	integer addr2wwrite
	integer data2write;
	integer errors; // Accumulated errors during the simulation
	integer vExpected; // expected value
	integer vObtained; // obtained value
	//___________________________________________________________________________
	// Instantiation of the module to be verified
	register_file dut();
	// 50 MHz clk generation
	initial clk=1'b0;
	always #`CLK_HALFPERIOD clk = ~clk;
	// Basic tasks
	// Synchronous output check
	task syncCheck;
		begin
			waitClk;
			if(vExpected!=vObtained) begin
				$display("[Error! %t] The value is %h and should be %h",$time,vObtained,vExpected);
				errors=errors+1;
			end else begin
				$display("[Info- %t] Successful check at time",$time);
			end
		end
	endtask
	// Asynchronous output check
	task asyncCheck;
		begin
			#`DELAY;
			if(vExpected!=vObtained) begin
				$display("[Error! %t] The value is %h and should be %h",$time,vObtained,vExpected);
				errors=errors+1;
			end else begin
				$display("[Info- %t] Successful check",$time);
			end
		end
	endtask
	// generation of reset pulse
	task resetDUT;
		begin
			$display("[Info- %t] Reset",$time);
			rst_n=1'b0;
			waitCycles(3);
			rst_n=1'b1;
		end
	endtask
	// wait for N clock cycles
	task waitCycles;
		input[31:0] Ncycles;
		begin
			repeat(Ncycles) begin
				waitClk;
			end
		end
	endtask
	// wait the next posedge clock
	task waitClk;
		begin
			@(posedge clk);
				#`DELAY;
		end //begin
	endtask
	// Check for errors during the simulation
	task checkErrors;
		begin
			if(errors==0) begin
				$display("********** TEST PASSED **********");
			end else begin
				$display("********** TEST FAILED **********");
			end
		end
	endtask

endmodule
