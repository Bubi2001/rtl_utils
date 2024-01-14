//=================================================================================
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module bin2bcd #( 
	parameter W = 32												// input width
	)(
	input logic[W-1:0] Bin,  										// Binary
	output logic[(W+(W-4)/3):0] Bcd 								// Bcd {...,thousands,hundreds,tens,ones}
	); 
	integer i,j;
	always @(Bin) begin
		for(i = 0; i <= W+(W-4)/3; i++) Bcd[i] = 0;					// initialize with zeros
		Bcd[W-1:0] = Bin;                                   		// initialize with input vector
		for(i = 0; i <= W-4; i = i+1)                       		// iterate on structure depth
			for(j = 0; j <= i/3; j = j+1)                     		// iterate on structure width
				if (Bcd[W-i+4*j -: 4] > 4)                      	// if > 4
					Bcd[W-i+4*j -: 4] = Bcd[W-i+4*j -: 4] + 4'd3; 	// add 3
	end
endmodule
