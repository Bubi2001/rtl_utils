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
// Description    : 8-to-3 Encoder.
// Author         : Adria Babiano Novella
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
