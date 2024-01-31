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
// Description    : 4-to-16 Decoder.
// Author         : Adria Babiano Novella
// Created        : Jan 07 2024
//
//=================================================================================

module decoder416 (
	input logic [3:0] dataIn,
	output logic [15:0] oneHot,
	output logic [15:0] oneCold
	);

	logic [15:0] dataOut;

	always_comb begin
		case (dataIn)
			4'b0000:		dataOut = 16'h0001;
			4'b0001:		dataOut = 16'h0002;
			4'b0010:		dataOut = 16'h0004;
			4'b0011:		dataOut = 16'h0008;
            4'b0100:		dataOut = 16'h0010;
			4'b0101:		dataOut = 16'h0020;
			4'b0110:		dataOut = 16'h0040;
			4'b0111:		dataOut = 16'h0080;
            4'b1000:		dataOut = 16'h0100;
			4'b1001:		dataOut = 16'h0200;
			4'b1010:		dataOut = 16'h0400;
			4'b1011:		dataOut = 16'h0800;
            4'b1100:		dataOut = 16'h1000;
			4'b1101:		dataOut = 16'h2000;
			4'b1110:		dataOut = 16'h4000;
			4'b1111:		dataOut = 16'h8000;
			default: 		dataOut = 16'h0000;
		endcase
	end

	assign oneHot = dataOut;
	assign oneCold = ~dataOut;

endmodule
