//=================================================================================
// MIT License
//
// Copyright (c) 2023 - 2024 Adria Babiano Novella
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Description    : Binary to BCD converter.
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

