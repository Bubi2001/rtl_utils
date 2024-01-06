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