//=================================================================================
//
// Description    : Encoder testbench
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================
`timescale 1ns/1ps
`define DELAY 2

module encoder_tb();
	// input output signals for the DUT
	reg [3:0] dataIn1;
	reg [7:0] dataIn2;
	reg [15:0] dataIn3;
	wire [1:0] dataOut1;
	wire [2:0] dataOut2;
	wire [3:0] dataOut3;
	// test signals
	integer errors; // Accumulated errors during the simulation
	integer vExpected; // expected value
	integer vObtained; // obtained value
	//___________________________________________________________________________
	// Instantiation of the modules to be verified
	decoder24 dut1(
		.dataIn		(dataIn1),
		.dataOut	(dataOut1)
    );

	decoder38 dut2(
		.dataIn		(dataIn2),
		.dataOut	(DataOut2)
	);

	decoder416 dut3(
		.dataIn		(dataIn3),
		.dataOut	(dataOut3)
    );
	//__________________________________________________________________________
	// Initial state
	initial begin
		dataIn1 <= 4'h0;
		dataIn2 <= 8'h00;
		dataIn3 <= 16'h0000;
	end
	//__________________________________________________________________________
	// Test vectors
	initial begin
		$timeformat(-9,2," ns",10);
		errors = 0;
		for (int i = 0; i < 4; i++) begin
		//encoder42
			vExpected = 0;
			dataIn1 <= 1 << i;
			vExpected = i;
			#`DELAY;
			vObtained = dataOut1;
			asyncCheck;
		end
		//encoder83
		for (int i = 0; i < 8; i++) begin
			vExpected = 0;
			dataIn2 <= 1 << i;
			vExpected = i;
			#`DELAY;
			vObtained = dataOut2;
			asyncCheck;
		end
		//encoder164
		for (int i = 0; i < 16; i++) begin
			vExpected = 0;
			dataIn3 <= 1 << i;
			vExpected = i;
			#`DELAY;
			vObtained = dataOut3;
			asyncCheck;
		end
		checkErrors;
	end
	// Basic tasks
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
