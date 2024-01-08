# Decoder
Binary 2-to-4, 3-to-8 & 4-to-16 decoders, each located in independent files.

## Module names
Top module named _decoder24_ located at file `../src/decoder24.sv`.</br>
Top module named _decoder38_ located at file `../src/decoder38.sv`.</br>
Top module named _decoder416_ located at file `../src/decoder416.sv`.</br>

## Module Inputs/Outputs
### 2-to-4 decoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[1:0] | hm |
| `OUTPUT` | `dataOut` | logic[3:0] | hm |

### 3-to-8 decoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[2:0] | hm |
| `OUTPUT` | `dataOut` | logic[7:0] | hm |

### 4-to-16 decoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[3:0] | hm |
| `OUTPUT` | `dataOut` | logic[15:0] | hm |

## Test cases

## Use cases
