//=================================================================================
//
// Description    : 4-to-2 Encoder
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================

module encoder42 (
	input logic [3:0] dataIn,
	output logic [1:0] dataOut
	);

	always_comb begin
		case (dataIn)
			4'h1:		dataOut = 2'b00;
			4'h2:		dataOut = 2'b01;
			4'h4:		dataOut = 2'b10;
			4'h8:		dataOut = 2'b11;
			default:	dataOut = 2'b00;
		endcase
	end

endmodule
