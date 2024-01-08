//=================================================================================
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================

module decoder38 (
	input logic [2:0] dataIn,
	output logic [7:0] dataOut
	);

	always_comb begin
		case (dataIn)
			3'b000:			dataOut = 8'h01;
			3'b001:			dataOut = 8'h02;
			3'b010:			dataOut = 8'h04;
			3'b011:			dataOut = 8'h08;
			3'b100:			dataOut = 8'h10;
			3'b101:			dataOut = 8'h20;
			3'b110:			dataOut = 8'h40;
			3'b111:			dataOut = 8'h80;            
			default: 		dataOut = 8'h0;
		endcase
	end

endmodule
