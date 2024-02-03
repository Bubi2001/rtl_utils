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
// Description    : Generic register file.
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module register_file
	#(
	parameter WORD_LENGTH = 8,
	parameter REG_AMOUNT  = 8
	)(
	input logic clk,
	input logic rst_n,
	input logic wrEn,
	input logic[$clog2(REG_AMOUNT)-1:0] addrWrite,
	input logic[$clog2(REG_AMOUNT)-1:0] addrRead1,
	input logic[$clog2(REG_AMOUNT)-1:0] addrRead2,
	input logic[$clog2(REG_AMOUNT)-1:0] addrRead3,
	input logic[WORD_LENGTH-1:0] dataIn,
	output logic[WORD_LENGTH-1:0] dataOut1,
	output logic[WORD_LENGTH-1:0] dataOut2,
	output logic[WORD_LENGTH-1:0] dataOut3
	);

	logic [WORD_LENGTH-1:0] reg_file [REG_AMOUNT-1:0];

	always_ff @(posedge clk) begin
		if (!rst_n) begin
			for(int i = 0; i < REG_AMOUNT; i++) begin
				reg_file[i] <= {WORD_LENGTH{1'b0}};
            end
		end else begin
			if (wrEn) begin
				reg_file[addrWrite] <= dataIn;
			end
			dataOut1 <= reg_file[addrRead1];
			dataOut2 <= reg_file[addrRead2];
			dataOut3 <= reg_file[addrRead3];
		end
	end
endmodule
