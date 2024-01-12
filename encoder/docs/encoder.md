# Encoder
Binary 4-to-2, 8-to-3 & 16-to-4 encoders, each located in independent files.

## Module names
Top module named _encoder42_ located at file `../src/encoder42.sv`.</br>
Top module named _encoder83_ located at file `../src/encoder83.sv`.</br>
Top module named _encoder164_ located at file `../src/encoder164.sv`.</br>

## Module Inputs/Outputs
### 4-to-2 encoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[3:0] | 4-bit 1-hot style input. |
| `OUTPUT` | `dataOut` | logic[1:0] | 2-bit data output. |

### 8-to-3 encoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[7:0] | 8-bit 1-hot style input. |
| `OUTPUT` | `dataOut` | logic[2:0] | 3-bit data output. |

### 16-to-4 encoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[15:0] | 16-bit 1-hot style input. |
| `OUTPUT` | `dataOut` | logic[3:0] | 4-bit data output. |

## Test cases
Since this modules are completely combinational, all possible combinations of inputs are tested.

## Use cases

### Input Selection
The 16-to-4 encoder can be used to select one of four input signals and send that signal to a downstream circuit. For example, it can be used to select the input to a multiplexer or to select the data source for a digital-to-analog converter (DAC).

### Data Encoding
The 8-to-3 encoder can be used to encode data from one format to another. For example, it can be used to encode a four-bit number into a three-bit code.

### Priority Signaling
The 4-to-2 encoder can be used to implement priority signaling schemes. For example, it can be used to determine which of multiple input signals is the most important.
