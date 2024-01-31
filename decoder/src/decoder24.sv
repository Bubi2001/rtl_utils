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
// Description    : 2-to-4 Decoder.
// Author         : Adria Babiano Novella
// Created        : Jan 07 2024
//
//=================================================================================

module decoder24 (
	input logic [1:0] dataIn,
	output logic [3:0] oneHot,
	output logic [3:0] oneCold
	);

	logic [3:0] dataOut;

	always_comb begin
		case (dataIn)
			2'b00:			dataOut = 4'h1;
			2'b01:			dataOut = 4'h2;
			2'b10:			dataOut = 4'h4;
			2'b11:			dataOut = 4'h8;
			default: 		dataOut = 4'h0;
		endcase
	end

	assign oneHot = dataOut;
	assign oneCold = ~dataOut;

endmodule
