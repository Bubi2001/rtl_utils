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

module bin_bcd_tb();
	// input output signals for the DUT
	reg [31:0] bin;
	wire [39:0] bcd;
	// test signals
	integer data2write;
	integer errors; // Accumulated errors during the simulation
	integer vExpected; // expected value
	integer vObtained; // obtained value
	//___________________________________________________________________________
	// Instantiation of the module to be verified
	bin_bcd #(.WIDTH(32)) dut(
		.bin(bin),
		.bcd(bcd)
	);
	//___________________________________________________________________________
	// signals and vars initialization
	initial begin
		bin <= 'd0;
	end
	//___________________________________________________________________________
	// Test Vectors
	initial begin
		$timeformat(-9,2," ns",10); // format for the time print

		
	end
	//___________________________________________________________________________
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
	// Check for errors during the simulation
	task checkErrors;
		begin
            if (errors == 0) begin
                $display("\n");
                $display("         _\\|/_");
                $display("         (o o)");
                $display(" +----oOO-{_}-OOo--------------------------------------------------------------+");
                $display(" |                                 TEST PASSED                                 |");
                $display(" +-----------------------------------------------------------------------------+");
                $display ("\n");
            end else begin
                $display("\n");
                $display("                              _ ._  _ , _ ._");
                $display("                            (_ ' ( `  )_  .__)");
                $display("                          ( (  (    )   `)  ) _)");
                $display("                         (__ (_   (_ . _) _) ,__)");
                $display("                             `~~`\\ ' . /`~~`");
                $display("                             ,::: ;   ; :::,");
                $display("                            ':::::::::::::::'");
                $display(" ________________________________/_____\\________________________________");
                $display("|                                                                       |");
                $display("|                              TEST FAILED                              |");
                $display("|_______________________________________________________________________|");
                $display("\n");
			end
		end
	endtask
endmodule

