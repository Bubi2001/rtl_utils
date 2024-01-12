//=================================================================================
//
// Description    : 8-to-3 Encoder
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================

module encoder83 (
	input logic [7:0] dataIn,
	output logic [2:0] dataOut
	);

	always_comb begin
		case (dataIn)
			8'h01:      dataOut = 3'b000;
			8'h02:      dataOut = 3'b001;
			8'h04:      dataOut = 3'b010;
			8'h08:      dataOut = 3'b011;
            8'h10:      dataOut = 3'b100;
            8'h20:      dataOut = 3'b101;
            8'h40:      dataOut = 3'b110;
            8'h80:      dataOut = 3'b111;
			default:    dataOut = 3'b000;
		endcase
	end

endmodule
