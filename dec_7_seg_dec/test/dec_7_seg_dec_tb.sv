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
// Description    : BCD-to-7-segments decoder testbench.
// Author         : Adria Babiano Novella
// Created        : Jan 09 2024
//
//=================================================================================
`timescale 1ns/1ps
`define DELAY 2

module dec_7_seg_dec_tb();
	// input output signals for the DUT
	reg [3:0] bcd;
	wire [6:0] segments_anode;
	wire [6:0] segments_cathode;
	// test signals
	integer data2write;
	integer errors; // Accumulated errors during the simulation
	integer vExpectedn; // expected value
	integer vExpectedp;
	integer vObtainedn; // obtained value
	integer vObtainedp;
	//___________________________________________________________________________
	// Instantiation of the module to be verified
	dec_7_seg_dec dut(
		.bcd				(bcd),
		.segments_anode		(segments_anode),
		.segments_cathode	(segments_cathode)
	);
		//__________________________________________________________________________
	// Initial state
	initial begin
		bcd <= 4'h0;
	end
	//__________________________________________________________________________
	// Test vectors
	initial begin
		$timeformat(-9, 2, " ns", 10);
		errors = 0;
		for (int i = 0; i < 16; i++) begin
			vExpectedp = 0;
			vExpectedn = 0;
			bcd <= i;
			case (i)
				0: 			vExpectedp[6:0] = 7'b0000001;
				1:			vExpectedp[6:0] = 7'b1001111;
				2:			vExpectedp[6:0] = 7'b0010010;
				3:			vExpectedp[6:0] = 7'b0000110;
				4:			vExpectedp[6:0] = 7'b1001100;
				5:			vExpectedp[6:0] = 7'b0100100;
				6:			vExpectedp[6:0] = 7'b0100000;
				7:			vExpectedp[6:0] = 7'b0001111;
				8:			vExpectedp[6:0] = 7'b0000000;
				9:			vExpectedp[6:0] = 7'b0001100;
				default: 	vExpectedp[6:0] = 7'b1111111;
			endcase
			vExpectedn = 32'h0000007F & (~vExpectedp);
			#`DELAY;
			vObtainedp = segments_anode;
			vObtainedn = segments_cathode;
			asyncCheckp;
			asyncCheckn;
		end
		checkErrors;
	end
	// Basic tasks
	// Asynchronous output check
	task asyncCheckp;
		begin
			#`DELAY;
			if(vExpectedp!=vObtainedp) begin
				$display("[Error! %t] The value is %h and should be %h",$time,vObtainedp,vExpectedp);
				errors=errors+1;
			end else begin
				$display("[Info- %t] Successful check",$time);
			end
		end
	endtask
	task asyncCheckn;
		begin
			#`DELAY;
			if(vExpectedn!=vObtainedn) begin
				$display("[Error! %t] The value is %h and should be %h",$time,vObtainedn,vExpectedn);
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
