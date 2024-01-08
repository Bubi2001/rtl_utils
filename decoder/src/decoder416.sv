//=================================================================================
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================

module decoder416 (
	input logic [3:0] dataIn,
	output logic [15:0] dataOut
	);

	always_comb begin
		case (dataIn)
			4'b0000:		dataOut = 16'h0001;
			4'b0001:		dataOut = 16'h0002;
			4'b0010:		dataOut = 16'h0004;
			4'b0011:		dataOut = 16'h0008;
            4'b0100:		dataOut = 16'h0010;
			4'b0101:		dataOut = 16'h0020;
			4'b0110:		dataOut = 16'h0040;
			4'b0111:		dataOut = 16'h0080;
            4'b1000:		dataOut = 16'h0100;
			4'b1001:		dataOut = 16'h0200;
			4'b1010:		dataOut = 16'h0400;
			4'b1011:		dataOut = 16'h0800;
            4'b1100:		dataOut = 16'h1000;
			4'b1101:		dataOut = 16'h2000;
			4'b1110:		dataOut = 16'h4000;
			4'b1111:		dataOut = 16'h8000;
			default: 		dataOut = 16'h0000;
		endcase
	end

endmodule
