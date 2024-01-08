//=================================================================================
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================

module decoder24 (
	input logic [1:0] dataIn,
	output logic [3:0] dataOut
	);

	always_comb begin
		case (dataIn)
			2'b00:			dataOut = 4'h1;
			2'b01:			dataOut = 4'h2;
			2'b10:			dataOut = 4'h4;
			2'b11:			dataOut = 4'h8;
			default: 		dataOut = 4'h0;
		endcase
	end

endmodule
