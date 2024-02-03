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
// Description    : Testbench for a Register File.
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================
`timescale 1ns/1ps
`define CLK_HALFPERIOD 10

module register_file_tb();
	parameter WORD_LENGTH 	= 8;
	parameter REG_AMOUNT  	= 8;
	parameter NUM_TESTS		= 250;
	// input output signals for the DUT
	reg clk;
	reg rst_n;
	reg wrEn;
	reg [$clog2(REG_AMOUNT)-1:0] addrWrite;
	reg [$clog2(REG_AMOUNT)-1:0] addrRead1;
	reg [$clog2(REG_AMOUNT)-1:0] addrRead2;
	reg [$clog2(REG_AMOUNT)-1:0] addrRead3;
	reg [WORD_LENGTH-1:0] dataIn;
	wire [WORD_LENGTH-1:0] dataOut1;
	wire [WORD_LENGTH-1:0] dataOut2;
	wire [WORD_LENGTH-1:0] dataOut3;
	// test signals
	integer errors; // Accumulated errors during the simulation
	integer storedData0 = 0;
	integer storedData1 = 0;
	integer storedData2 = 0;
	integer storedData3 = 0;
	integer storedData4 = 0;
	integer storedData5 = 0;
	integer storedData6 = 0;
	integer storedData7 = 0;
	integer vExpected;
	integer vObtained;
	//___________________________________________________________________________
	// Instantiation of the module to be verified
	register_file #(
		.WORD_LENGTH	(WORD_LENGTH),
		.REG_AMOUNT		(REG_AMOUNT)
	) dut (
		.clk			(clk),
		.rst_n			(rst_n),
		.wrEn			(wrEn),
		.addrWrite		(addrWrite),
		.addrRead1		(addrRead1),
		.addrRead2		(addrRead2),
		.addrRead3		(addrRead3),
		.dataIn			(dataIn),
		.dataOut1		(dataOut1),
		.dataOut2		(dataOut2),
		.dataOut3		(dataOut3)
	);
	// 50 MHz clk generation
	initial clk=1'b0;
	always #`CLK_HALFPERIOD clk = ~clk;
	//___________________________________________________________________________
	// signals and vars initialization
	initial begin
		rst_n=1'b1;
		wrEn=1'b0;
		addrWrite='d0;
		addrRead1='d0;
		addrRead2='d0;
		addrRead3='d0;
		dataIn='d0;
	end
	//___________________________________________________________________________
	// Test Vectors
	initial begin
		$timeformat(-9,2," ns",10); // format for the time print
		errors=0; // initialize the errors counter
		resetDUT;
		for (int i = 0; i < NUM_TESTS; ++i) begin
          	regFileTest(($urandom() && 32'h000000ff),
                        ($urandom() && 32'h00000001),
                        ($urandom() && 32'h000000ff),
                        ($urandom() && 32'h000000ff),
                        ($urandom() && 32'h000000ff),
                        ($urandom() && 32'h000000ff));
		end
      	$display();
      	checkErrors;
		$display("[Info- %t] Test completed",$time);
		resetDUT;
		waitCycles(5); // for easy visualization of the end
		$stop;
	end

	// Test tasks
	task applyInputs;
		input writeEnable;
		input [WORD_LENGTH-1:0] writeData;
		input [$clog2(REG_AMOUNT)-1:0] writeAddr;
		input [$clog2(REG_AMOUNT)-1:0] readAddr1;
		input [$clog2(REG_AMOUNT)-1:0] readAddr2;
		input [$clog2(REG_AMOUNT)-1:0] readAddr3;
		begin
			wrEn = writeEnable;
			dataIn = writeData;
			addrWrite = writeAddr;
			addrRead1 = readAddr1;
			addrRead2 = readAddr2;
			addrRead3 = readAddr3;
		end
	endtask

	task checkOutput;
		input [WORD_LENGTH-1:0] expectedValue;
		input [WORD_LENGTH-1:0] actualValue;
		begin
			vExpected = expectedValue;
			vObtained = actualValue;
			asyncCheck;
		end
	endtask

	task checkOutputs;
		input [WORD_LENGTH-1:0] expRd1;
		input [WORD_LENGTH-1:0] expRd2;
		input [WORD_LENGTH-1:0] expRd3;
		begin
			checkOutput(expRd1, dataOut1);
			checkOutput(expRd2, dataOut2);
			checkOutput(expRd3, dataOut3);
		end
	endtask

	task regFileTest;
      	input [WORD_LENGTH-1:0] data2write;
      	input writeEn;
      	input [$clog2(REG_AMOUNT)-1:0] addr2write;
      	input [$clog2(REG_AMOUNT)-1:0] addr2read1;
      	input [$clog2(REG_AMOUNT)-1:0] addr2read2;
      	input [$clog2(REG_AMOUNT)-1:0] addr2read3;
		begin
			integer rd1, rd2, rd3;
			$display("[Info- %t] Inputs: WD=%h WE=%b WA=%h RA1=%h RA2=%h  RA3=%h", $time, data2write, writeEn, addr2write, addr2read1, addr2read2, addr2read3);
			applyInputs(writeEn, data2write, addr2write, addr2read1, addrRead2, addrRead3);
			waitClk;
			if (writeEn) begin
				case (addr2write)
					0: 	storedData0 = data2write;
					1:	storedData1 = data2write;
					2:	storedData2 = data2write;
					3:	storedData3 = data2write;
					4:	storedData4 = data2write;
					5:	storedData5 = data2write;
					6:	storedData6 = data2write;
					7:	storedData7 = data2write;
				endcase
			end
			case (addr2read1)
				0:	rd1 = storedData0;
				1:	rd1 = storedData1;
				2:	rd1 = storedData2;
				3:	rd1 = storedData3;
				4:	rd1 = storedData4;
				5:	rd1 = storedData5;
				6:	rd1 = storedData6;
				7:	rd1 = storedData7;
			endcase
			case (addr2read2)
				0:	rd2 = storedData0;
				1:	rd2 = storedData1;
				2:	rd2 = storedData2;
				3:	rd2 = storedData3;
				4:	rd2 = storedData4;
				5:	rd2 = storedData5;
				6:	rd2 = storedData6;
				7:	rd2 = storedData7;
			endcase
			case (addr2read3)
				0:	rd3 = storedData0;
				1:	rd3 = storedData1;
				2:	rd3 = storedData2;
				3:	rd3 = storedData3;
				4:	rd3 = storedData4;
				5:	rd3 = storedData5;
				6:	rd3 = storedData6;
				7:	rd3 = storedData7;
			endcase
			checkOutputs(rd1, rd2, rd3);
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
				#1ps;
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
