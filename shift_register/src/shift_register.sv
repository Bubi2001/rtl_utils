//=================================================================================
//
// Description    : Universal Shift Register.
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module shift_register
	#(
	parameter SIZE = 8
	)(
	input logic clk,
	input logic rst_n,
	input logic load,
	input logic en,
	input logic serIn,
	input logic [SIZE-1:0] dataIn,
	output logic [SIZE-1:0] dataOut,
	output logic serOut
	);

    logic [SIZE-1:0] dataFF;

	always_ff @(posedge clk) begin
		if (!rst_n) begin
			dataFF <= {SIZE{1'b0}};
		end else begin
			if (load) begin
				dataFF <= dataIn;
			end
			if (en) begin
				dataFF <= {dataFF[SIZE-2:0], serIn};
			end
		end
	end

    always_comb begin
        dataOut = dataFF;
        serOut = dataFF[SIZE-1];
    end

endmodule
