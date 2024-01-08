//=================================================================================
//
// Description    : Template for description
// Author         : Adria Babiano
// Created        : Dec 30 2023
//
//=================================================================================


module parity_compute
    import parity_types_pkg::*;
    #(
        parameter BITWIDTH = 8
    ) (
    input logic [BITWIDTH-1:0] dataIn,
    input parity_t parityType,
    output logic parityOut
    );

    always_comb begin
        case (parityType)
            EVEN:       parityOut = ^dataIn;
            ODD:        parityOut = ~(^dataIn);
            MARK:       parityOut = 1'b1;
            SPACE:      parityOut = 1'b0;
            NONE:       parityOut = 1'b0;
            default:    parityOut = 1'b0;
        endcase
    end

endmodule
