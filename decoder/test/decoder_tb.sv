//=================================================================================
//
// Description    : Decoder testbench
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================
`timescale 1ns/1ps
`define DELAY 2

module decoder_tb();
	// input output signals for the DUT
	reg [1:0] dataIn1;
	reg [2:0] dataIn2;
	reg [3:0] dataIn3;
	wire [3:0] oneHot1;
	wire [7:0] oneHot2;
	wire [15:0] oneHot3;
	wire [3:0] oneCold1;
	wire [7:0] oneCold2;
	wire [15:0] oneCold3;
	// test signals
	integer errors; // Accumulated errors during the simulation
	integer vExpectedp; // expected value
	integer vExpectedn;
	integer vObtainedp; // obtained value
	integer vObtainedn;
	//___________________________________________________________________________
	// Instantiation of the modules to be verified
	decoder24 dut1(
		.dataIn		(dataIn1),
		.oneHot		(oneHot1),
		.oneCold	(oneCold1)
	);

	decoder38 dut2(
		.dataIn		(dataIn2),
		.oneHot		(oneHot2),
		.oneCold	(oneCold2)
	);

	decoder416 dut3(
		.dataIn		(dataIn3),
		.oneHot		(oneHot3),
		.oneCold	(oneCold3)
	);
	//__________________________________________________________________________
	// Initial state
	initial begin
		dataIn1 <= 2'b00;
		dataIn2 <= 3'b000;
		dataIn3 <= 4'b0000;
	end
	//__________________________________________________________________________
	// Test vectors
	initial begin
		$timeformat(-9,2," ns",10);
		errors = 0;
		//decoder24
		for (int i = 0; i < 4; i++) begin
			vExpectedp = 0;
			vExpectedn = 0;
			dataIn1 <= i;
			vExpectedp = 1 << i;
			vExpectedn = 32'h0000000F & (~vExpectedp);
			#`DELAY;
			vObtainedp = oneHot1;
			vObtainedn = oneCold1;
			asyncCheckp;
			asyncCheckn;
		end
		//decoder38
		for (int i = 0; i < 8; i++) begin
			vExpectedp = 0;
			vExpectedn = 0;
			dataIn2 <= i;
			vExpectedp = 1 << i;
			vExpectedn = 32'h000000FF & (~vExpectedp);
			#`DELAY;
			vObtainedp = oneHot2;
			vObtainedn = oneCold2;
			asyncCheckp;
			asyncCheckn;
		end
		//decoder416
		for (int i = 0; i < 16; i++) begin
			vExpectedp = 0;
			vExpectedn = 0;
			dataIn3 <= i;
			vExpectedp = 1 << i;
			vExpectedn = 32'h0000FFFF & (~vExpectedp);
			#`DELAY;
			vObtainedp = oneHot3;
			vObtainedn = oneCold3;
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
