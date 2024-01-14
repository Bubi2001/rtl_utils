//=================================================================================
//
// Description    : Binary to BCD converter
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module bin_bcd #( 
	parameter WIDTH = 32													// input width
	)(
	input logic[WIDTH-1:0] bin,  											// Binary
	output logic[(WIDTH+(WIDTH-4)/3):0] bcd 								// Bcd {...,thousands,hundreds,tens,ones}
	); 
	integer i,j;
	always_comb begin
		for(i = 0; i <= WIDTH+(WIDTH-4)/3; i++) bcd[i] = 0;					// initialize with zeros
		bcd[WIDTH-1:0] = bin;                                   			// initialize with input vector
		for(i = 0; i <= WIDTH-4; i = i+1)                       			// iterate on structure depth
			for(j = 0; j <= i/3; j = j+1)                     				// iterate on structure width
				if (bcd[WIDTH-i+4*j -: 4] > 4)                 		     	// if > 4
					bcd[WIDTH-i+4*j -: 4] = bcd[WIDTH-i+4*j -: 4] + 4'd3; 	// add 3
	end
endmodule

