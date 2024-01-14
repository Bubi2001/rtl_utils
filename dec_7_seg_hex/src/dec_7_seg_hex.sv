//=================================================================================
//
// Description    : Binary-to-7-segments decoder
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module dec_7_seg_hex (
  input logic [3:0] bin_in,
	output logic [6:0] segments_anode,
	output logic [6:0] segments_cathode
	);

	logic [6:0] segments;

	always_comb begin
		case (bin_in)
			4'h0:		segments = 7'b0000001;
			4'h1:		segments = 7'b1001111;
			4'h2:		segments = 7'b0010010;
			4'h3:		segments = 7'b0000110;
			4'h4:		segments = 7'b1001100;
			4'h5:		segments = 7'b0100100;
			4'h6:		segments = 7'b0100000;
			4'h7:		segments = 7'b0001111;
			4'h8:		segments = 7'b0000000;
			4'h9:		segments = 7'b0001100;
			4'ha:		segments = 7'b0001000;
			4'hb:		segments = 7'b1100000;
			4'hc:		segments = 7'b0110001;
			4'hd:		segments = 7'b1000010;
			4'he:		segments = 7'b0110000;
			4'hf:		segments = 7'b0111000;
			default: 	segments = 7'b1111111;
		endcase
	end

	assign segments_anode = segments;
	assign segments_cathode = ~segments;

endmodule
