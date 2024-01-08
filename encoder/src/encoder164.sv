//=================================================================================
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Jan 07 2024
//
//=================================================================================

module encoder164 (
	input logic [15:0] dataIn,
	output logic [3:0] dataOut
	);

	always_comb begin
		case (dataIn)
			16'h0001:   dataOut = 4'b0000;
			16'h0002:   dataOut = 4'b0001;
			16'h0004:   dataOut = 4'b0010;
			16'h0008:   dataOut = 4'b0011;
            16'h0010:   dataOut = 4'b0100;
            16'h0020:   dataOut = 4'b0101;
            16'h0040:   dataOut = 4'b0110;
            16'h0080:   dataOut = 4'b0111;
            16'h0100:   dataOut = 4'b1000;
            16'h0200:   dataOut = 4'b1001;
            16'h0400:   dataOut = 4'b1010;
            16'h0800:   dataOut = 4'b1011;
            16'h1000:   dataOut = 4'b1100;
            16'h2000:   dataOut = 4'b1101;
            16'h4000:   dataOut = 4'b1110;
            16'h8000:   dataOut = 4'b1111;
			default:    dataOut = 4'b0000;
		endcase
	end

endmodule
