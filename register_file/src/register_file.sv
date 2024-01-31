//=================================================================================
//
// Description    : Generic register file
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module register_file
	#(
	parameter WORD_LENGTH = 8,
	parameter REG_AMOUNT  = 8,
	)(
	input logic clk,
	input logic rst_n,
	input logic wrEn,
	input logic[$clog2(REG_AMOUNT)-1:0] addrWrite,
	input logic[$clog2(REG_AMOUNT)-1:0] addrRead1,
	input logic[$clog2(REG_AMOUNT)-1:0] addrRead2,
	input logic[$clog2(REG_AMOUNT)-1:0] addrRead3,
	input logic[WORD_LENGTH-1:0] dataIn,
	output logic[WORD_LENGTH-1:0] dataOut1,
	output logic[WORD_LENGTH-1:0] dataOut2,
	output logic[WORD_LENGTH-1:0] dataOut3
	);

	logic [WORD_LENGTH-1:0] reg_file [REG_AMOUNT-1:0];

	always_ff @(posedge clk) begin
		if (!rst_n) begin
			reg_file <= 'd0;
		end else begin
			if (wrEn) begin
				reg_file[addrWrite] <= dataIn;
			end
			dataOut1 <= reg_file[addrRead1];
			dataOut2 <= reg_file[addrRead2];
		end
	end

endmodule
