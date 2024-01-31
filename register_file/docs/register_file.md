# Register File


## Module name


## Module parameters
| Parameter | Type | Default Value | Description |
| :---: | :---: | :---: | :---: |
| `WORD_LENGTH` | UNSIGNED 32-BIT INTEGER | 8 | Word length of each register. |
| `REG_AMOUNT` | UNSIGNED 32-BIT INTEGER | 8 | Amount of registers. |

## Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | clk | logic | Reference clock input. |
| `INPUT` | rst_n | logic | Active low reset signal. |
| `INPUT` | wrEn | logic | Write enable input. Assert this signal to write to the addressed register. |
| `INPUT` | adrrWrite | logic[$clog2(REG_AMOUNT)-1:0] | Address to select which register to write. |
| `INPUT` | addrRead1 | logic[$clog2(REG_AMOUNT)-1:0] | Address to select which register to read on port 1. |
| `INPUT` | addrRead2 | logic[$clog2(REG_AMOUNT)-1:0] | Address to select which register to read on port 2. |
| `INPUT` | addrRead3 | logic[$clog2(REG_AMOUNT)-1:0] | Address to select which register to read on port 3.
| `INPUT` | dataIn | logic[WORD_LENGTH-1:0] | Data input. |
| `OUTPUT` | dataOut1 | logic[WORD_LENGTH-1:0] | Data output from port 1. |
| `OUTPUT` | dataOut2 | logic[WORD_LENGTH-1:0] | Data output from port 2. |
| `OUTPUT` | dataOut3 | logic[WORD_LENGTH-1:0] | Data output from port 3. |

## Test cases


## Use cases

