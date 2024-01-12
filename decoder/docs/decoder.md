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
| `INPUT` | `dataIn` | logic[1:0] | 2-bit data input. |
| `OUTPUT` | `oneHot` | logic[3:0] | 4-bit 1-hot style output. |
| `OUTPUT` | `oneCold` | logic[3:0] | 4-bit 1-cold style output. |

### 3-to-8 decoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[2:0] | 3-bit data input. |
| `OUTPUT` | `oneHot` | logic[7:0] | 8-bit 1-hot style output. |
| `OUTPUT` | `oneCold` | logic[7:0] | 8-bit 1-cold style output. |

### 4-to-16 decoder
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | `dataIn` | logic[3:0] | 4-bit data input. |
| `OUTPUT` | `oneHot` | logic[15:0] | 16-bit 1-hot style output. |
| `OUTPUT` | `oneCold` | logic[15:0] | 16-bit 1-cold style output. |

## Test cases
Since this modules are completely combinational, all possible combinations of inputs are tested.

## Use cases

### Data Selection

A 2-to-4 decoder can be used to select one of four output signals based on the value of two input signals, a 3-to-8 decoder can be used to select one of eight output signals based on the value of three input signals, a 4-to-16 decoder can be used to select one of sixteen output signals based on the value of four input signals. This is particularly useful in situations where multiple data streams or signals need to be directed to different destinations or processed in different ways. For instance, in a digital circuit controlling a display, a 2-to-4 decoder can be used to select one of four lines on the display based on the input signals, allowing for the presentation of different characters or symbols.

### Address to Output Mapping

In many digital systems, addresses are used to identify or access specific memory locations, peripherals, or control signals. A decoder can be used to map these addresses to corresponding output signals. For example, in a memory system, a 3-to-8 decoder can be used to select one of eight memory banks based on the address bus, allowing for the access of different data blocks.

### Data Multiplexing

Data multiplexing is a technique used to select and transmit one of multiple data streams within a single data path. A 4-to-16 decoder can be employed in data multiplexing applications to select the desired data stream based on the input signals. For instance, in a communication system, a 4-to-16 decoder can be used to switch between four different communication channels based on the input signals, ensuring that the correct channel is selected for data transmission.

### Control Signal Decoding

In digital systems, control signals are used to initiate specific actions or operations. A 2-to-4 decoder can be used to decode these control signals, determining which action or operation should be performed. For example, in a programmable logic controller (PLC), a 2-to-4 decoder can be used to decode control signals representing different machine states, allowing the PLC to control the appropriate machine functions based on the state information.

### Input Validation

Input validation is a crucial step in ensuring the integrity and correctness of data inputs to a digital system. A 3-to-8 decoder can be used to perform simple input validation by checking whether the input signals fall within a defined range. For instance, in a password entry system, a 3-to-8 decoder can be used to check if the entered characters belong to a specified set, ensuring that only valid passwords are accepted.

### Conditional Routing

In digital systems, it is often necessary to route data or signals based on certain conditions or criteria. A 4-to-16 decoder can be used to implement conditional routing by selecting the appropriate output signal based on the input conditions. For example, in a traffic light control system, a 4-to-16 decoder can be used to determine the color of the traffic light based on the current traffic conditions, ensuring that drivers receive clear and consistent signals.
