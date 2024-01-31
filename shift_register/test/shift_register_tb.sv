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
// Description    : Testbench for a universal shift register.
// Author         : Adria Babiano Novella
// Created        : Jan 09 2024
//
//=================================================================================
`timescale 1ns/1ps
`define DELAY 2

module shift_register_tb();
	// input output signals for the DUT
	parameter SIZE = 8;      // data size of the shift register
	reg             clk;     // rellotge del sistema
	reg             rst_n;   // reset del sistema asi­ncorn i actiu nivell baix
	reg             enable;  // enable signal for the shift register
	reg             load;    // shift register load data
	reg  [SIZE-1:0] dataIn;  // shift register parallel data input
	wire [SIZE-1:0] dataOut; // shift register parallel data output
	reg             serIn;   // shift register serial data input
	wire            serOut;  // shift register serial data output
	// test signals
	integer data2write;
	integer data2load;
	integer errors; // Accumulated errors during the simulation
	integer bitCntr;   // used to count bits
	integer vExpected; // expected value
	integer vObtained; // obtained value
	//___________________________________________________________________________
	// Instantiation of the module to be verified
	shift_register #(.SIZE(SIZE)) dut(
		.clk           (clk),
		.rst_n         (rst_n),
		.load          (load),
		.en            (enable),
		.dataIn        (dataIn),
		.dataOut       (dataOut),
		.serIn         (serIn),
		.serOut        (serOut)
	);
	// 50 MHz clk generation
	initial clk=1'b0;
	always #10ns clk = ~clk;
	//___________________________________________________________________________
	// signals and vars initialization
	initial begin
		rst_n = 1'b1;
		enable = 1'b0; // DUT disabled
		load = 1'b0;   // Load not active
		dataIn = {SIZE{1'b0}};
		serIn = 1'b0;
	end
	//___________________________________________________________________________
	// Test Vectors
	initial begin
		$timeformat(-9, 2, " ns", 10); // format for the time print
		errors = 0;                    // initialize the errors counter
		resetDUT;                      // puts the DUT in a known stage
		waitCycles(5);                 // waits 5 clock cicles
		$display("[Info- %t] Test parallel data loading", $time);
		data2load = 8'hAA;
		loadData(data2load);
		vExpected = data2load;
		vObtained = dataOut;
		asyncCheck;
		checkErrors;
		errors = 0;                    // initialize the errors counter
		$display("[Info- %t] Test serial output", $time);
		data2load = 8'hAA;
		test_serout(data2load);
		checkErrors;
		errors = 0;                    // initialize the errors counter
		$display("[Info- %t] Test serial input", $time);
		resetDUT;                      // puts the DUT in a known stage
		data2load=8'hAA;
		test_serin(data2load,8'd8);
		checkErrors;
		errors=0;
		waitCycles(5); 		   // for easy visualization of the end
		$stop;
	end
	//___________________________________________________________________________
	initial begin
		$monitor("[Info- %t] En=%h DataIn=%h DataOut=%h SerIn=%h SerOut=%b", $time, enable, dataIn, dataOut, serIn, serOut);
	end
	// Test Tasks
	// check serial input
	task test_serin;
		input[SIZE-1:0] data;
		input[SIZE-1:0] despqty;
		begin
			bitCntr=0;
			enable=1'b1;
			repeat(despqty) begin
				serIn=data[SIZE-1-bitCntr];
				bitCntr=bitCntr+1;
				waitClk;
			end
			vExpected=data;
			vObtained=dataOut;
			asyncCheck;
			enable=1'b0;
			waitClk;
		end
	endtask
	// check the serial output
	task test_serout;
		input [SIZE-1:0] data;
		begin
			bitCntr = 0;
			loadData(data);
			enable = 1'b1;
			repeat(SIZE) begin
				vExpected = data[SIZE-1-bitCntr];
				vObtained = serOut;
				asyncCheck;
				bitCntr = bitCntr + 1;
				waitClk;
			end
			enable = 1'b0;
			waitClk;
		end
	endtask
	// check the parallel data input
	task loadData;
		input [SIZE-1:0] data;
		begin
			dataIn = data;
			load = 1'b1;
			waitClk;
			load = 1'b0;
			dataIn = 8'h00;
			waitClk;
		end
	endtask
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
