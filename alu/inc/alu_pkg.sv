package alu_pkg;
    typedef struct packed {
        logic signFlag;
        logic overflowFlag;
        logic zeroFlag;
        logic parityFlag;
    } flags_t;

    typedef enum logic [4:0] { ADD, SUBAB, SUBBA, MODAB, MODBA, NEGA, NEGB, INCA, INCB, DECA, DECB, PTA, PTB, SHLA, SHRA, SHLA2, SHRA2, SHLA3, SHRA3, SHLA4, SHRA4, RORA, ROLA, AND, OR, NAND, NOR, XOR, XNOR, INVA, INVB } ALUop_t;
endpackage