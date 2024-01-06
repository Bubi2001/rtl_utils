# Parity
Modules to compute and check simple parity for the given data input, parity can be one of five types:
- `EVEN`: The module will compute Even parity (the number of bits set in the frame should be even, including the parity bit).
- `ODD`: The module will compute Odd parity (the number of bits set in the frame should be odd, including the parity bit).
- `MARK`: The module will compute Mark parity (parity bit will be set always to 1, no matter the data).
- `SPACE`: The module will compute Space parity (parity bit will be set always to 0, no matter tha data).
- `NONE`: No parity will be computed. Output will return 0.

## Parity Computing

### Module name
Top module named _parity_compute_ located at file `../src/parity_compute.sv`.

### Module Parameters
| Parameter | Type | Description |
| :---: | :---: | :---: |
| `BITWIDTH` | UNSIGNED 32-BIT INTEGER | Input data width size in bits, defaults to 8 |

### Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---:|
| `INPUT` | `dataIn` | logic[`BITWIDTH`-1:0] | Binary data to compute parity |
| `INPUT` | `parityType` | `parity_t` | Type of parity to compute |
| `OUTPUT` | `parityOut` | logic | Computed parity bit |

### Package & Include files
At file `../inc/parity_types_pkg.sv` is found the enum used for parity_t type.

### Test
test cases idk

## Parity Checking

### Module name
Top module named _parity_check_ located at file `../src/parity_check.sv`.

### Module Parameters
| Parameter | Type | Description |
| :---: | :---: | :---: |
| `BITWIDTH` | UNSIGNED 32-BIT INTEGER | Input data width (without parity bit) size in bits, defaults to 8 |

### Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---:|
| `INPUT` | `dataIn` | logic[`BITWIDTH`:0] | Binary data to check parity (parity bit in LSB position)|
| `INPUT` | `parityType` | `parity_t` | Type of parity to check |
| `OUTPUT` | `parityCheck` | logic | Result of parity checking |

### Package & Include files
At file `../inc/parity_types_pkg.sv` is found the enum used for parity_t type.

### Test
test cases idk

## Example use

Imagine you are sending and receiving data via a 5 bit UART with a device that has `ODD` parity, to compute sent parity you have to follow this steps:
- Instantiate the `parity_compute` module with the `BITWIDTH` parameter set to 5 (this step can be omitted if `BITWIDTH` is set to 8).
- Set the parity type to `ODD` with the provided enum type.
- Send the paralel frame data to the `dataIn` port.
- Concatenate your initial data with the `parityOut` result (this step should be omitted if `NONE` parity is selected).
- Add necessary start/stop bits to frame.
- Send the data out with a Shift Register.
- Repeat with next frame.

To check if received data has correct parity you have to follow this steps:
- Instantiate the `parity_check` module with the `BITWIDTH` parameter set to 5 (this step can be omitted if `BITWIDTH` is set to 8).
- Set the parity type to `ODD` with the provided enum type.
- Separate start/stop bits from the paralelized frame outputted by a Shift Register.
- Send the paralel frame data to the `dataIn` port.
- If `parityCheck` port goes high, the parity check was succesful (number of single bit errors in that fram was even). If `parityChck` port goes low, the parity check was unsuccesful (number of single bit errors in that frame was odd).
- Repeat with next frame.
