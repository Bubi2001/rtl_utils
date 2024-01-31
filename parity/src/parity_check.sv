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
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Dec 30 2023
//
//=================================================================================


module parity_check
    import parity_types_pkg::*;
    #(
        parameter BITWIDTH = 8
    ) (
    input logic [BITWIDTH:0] dataIn,
    input parity_t parityType,
    output logic parityCheck
    );

    always_comb begin
        case (parityType)
            EVEN:       parityCheck = ((^dataIn) == dataIn[0]);
            ODD:        parityCheck = ((~(^dataIn)) == dataIn[0]);
            MARK:       parityCheck = (1'b1 == dataIn[0]);
            SPACE:      parityCheck = (1'b0 == dataIn[0]);
            NONE:       parityCheck = 1'b1;
            default:    parityCheck = 1'b0;
        endcase
    end

endmodule