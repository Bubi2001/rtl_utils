`timescale 1ns/1ps
`define DELAY 2
`define CLK_HALFPERIOD 10

module parity_check_tb ();
    import parity_types_pkg::*;
	// input output signals for the DUT
	reg clk,rst_n,wr;
	reg[1:0] addr;
	reg[7:0] dataWr;
	reg[1:0] slaveMode;
	wire SCK,MOSI,MISO,SS3;
	wire[7:0] dataRd;
	// test signals
	integer addr2write;
	integer data2write;
    parity_t parityType;
	integer errors; // Accumulated errors during the simulation
	integer vExpected; // expected value
	integer vObtained; // obtained value
	//___________________________________________________________________________
	// Instantiation of the module to be verified
	parity_check DUT(
        .dataIn(dataIn),
        .parityType(parityType),
        .parityCheck(parityCheck)
		);

    // 50 MHz clk generation
    initial clk=1'b0;
	always #`CLK_HALFPERIOD clk=~clk;

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
