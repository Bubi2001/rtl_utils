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
// Description    : Universal Shift Register.
// Author         : Adria Babiano Novella
// Created        : Jan 09 2024
//
//=================================================================================

module shift_register
	#(
	parameter SIZE = 8
	)(
	input logic clk,
	input logic rst_n,
	input logic load,
	input logic en,
	input logic serIn,
	input logic [SIZE-1:0] dataIn,
	output logic [SIZE-1:0] dataOut,
	output logic serOut
	);

    logic [SIZE-1:0] dataFF;

	always_ff @(posedge clk) begin
		if (!rst_n) begin
			dataFF <= {SIZE{1'b0}};
		end else begin
			if (load) begin
				dataFF <= dataIn;
			end
			if (en) begin
				dataFF <= {dataFF[SIZE-2:0], serIn};
			end
		end
	end

    always_comb begin
        dataOut = dataFF;
        serOut = dataFF[SIZE-1];
    end

endmodule
