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
// Description    : Arithmetic Logic Unit package.
// Author         : Adria Babiano
// Created        : Jan 09 2024
//
//=================================================================================

package alu_pkg;
    typedef struct packed {
        logic signFlag;
        logic overflowFlag;
        logic zeroFlag;
        logic parityFlag;
    } flags_t;

    typedef enum logic [4:0] { ADD,
                               SUBAB,
                               SUBBA,
                               MODAB,
                               MODBA,
                               NEGA,
                               NEGB,
                               INCA,
                               INCB,
                               DECA,
                               DECB,
                               PTA,
                               PTB,
                               SHLA,
                               SHRA,
                               SHLA2,
                               SHRA2,
                               SHLA3,
                               SHRA3,
                               SHLA4,
                               SHRA4,
                               RORA,
                               ROLA,
                               AND,
                               OR,
                               NAND,
                               NOR,
                               XOR,
                               XNOR,
                               INVA,
                               INVB } ALUop_t;
endpackage