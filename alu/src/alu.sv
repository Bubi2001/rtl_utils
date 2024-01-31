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
// Description    : Arithmetic Logic Unit.
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

module alu
	import alu_pkg::*;
	#(
	parameter BITWIDTH = 8
	)(
	input logic [BITWIDTH-1:0] opA,
	input logic [BITWIDTH-1:0] opB,
	input ALUop_t ALUop,
	output logic [BITWIDTH-1:0] ALUout,
	output flags_t ALUflags
	);

	always_comb begin
		case (ALUop)
			ADD:
				begin
						ALUout = opA + opB;
						ALUflags.overflowFlag = ((opA[BITWIDTH-1] & opB[BITWIDTH-1]) ^ ALUflags.signFlag);
				end
			SUBAB:
				begin
						ALUout = opA - opB;
						ALUflags.overflowFlag = (((~opA[BITWIDTH-1] & opB[BITWIDTH-1]) & ALUflags.signFlag) | ((opA[BITWIDTH-1] & ~opB[BITWIDTH-1]) & ~ALUflags.signFlag));
				end
			SUBBA:
				begin
						ALUout = opB - opA;
						ALUflags.overflowFlag = (((~opA[BITWIDTH-1] & opB[BITWIDTH-1]) & ~ALUflags.signFlag) | ((opA[BITWIDTH-1] & ~opB[BITWIDTH-1]) & ALUflags.signFlag));
				end
			MODAB:		ALUout = opA % opB;
			MODBA:		ALUout = opB % opA;
			NEGA:		ALUout = ~opA + 'd1;
			NEGB:		ALUout = ~opB + 'd1;
			INCA:		ALUout = opA + 'd1;
			INCB:		ALUout = opB + 'd1;
			DECA:		ALUout = opA - 'd1;
			DECB:		ALUout = opB - 'd1;
			PTA:		ALUout = opA;
			PTB:		ALUout = opB;
			SHLA:		ALUout = opA << 1;
			SHRA:		ALUout = opA >> 1;
			SHLA2:		ALUout = opA << 2;
			SHRA2:		ALUout = opA >> 2;
			SHLA3:		ALUout = opA << 3;
			SHRA3:		ALUout = opA >> 3;
			SHLA4:		ALUout = opA << 4;
			SHRA4:		ALUout = opA >> 4;
			RORA:		ALUout = {opA[0], opA[BITWIDTH-1:1]};
			ROLA:		ALUout = {opA[BITWIDTH-2:0], opA[BITWIDTH-1]};
			AND:		ALUout = opA & opB;
			OR:			ALUout = opA | opB;
			NAND:		ALUout = ~(opA & opB);
			NOR:		ALUout = ~(opA | opB);
			XOR:		ALUout = opA ^ opB;
			XNOR:		ALUout = ~(opA ^ opB);
			INVA:		ALUout = ~opA;
			INVB:		ALUout = ~opB;
			default: 	ALUout = {BITWIDTH{1'b0}};
		endcase
		ALUflags.zeroFlag = (ALUout == {BITWIDTH{1'b0}});
		ALUflags.signFlag = ALUout[BITWIDTH-1];
	end
endmodule
