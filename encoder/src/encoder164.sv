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
// Description    : 16-to-4 Encoder
// Author         : Adria Babiano Novella
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
