# Binary to BCD
A binary to BCD converter module is a digital circuit that transforms a binary number into its corresponding Binary Coded Decimal (BCD) representation. It converts the binary digits into a BCD code, which is a more convenient format for representing decimal numbers in digital systems. This module is based on the [Double Dabble Algorithm](https://en.wikipedia.org/wiki/Double_dabble).

## Module name
Top module named _bin_bcd_ located at file `../src/bin_bcd.sv`.

## Module parameters
| Parameter | Type | Default Value | Description |
| :---: | :---: | :---: | :---:|
| `WIDTH` | UNSIGNED 32-BIT INTEGER | 32 | Width of input vector. |

## Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | bin | logic[WIDTH-1:0] | Binary data input. |
| `OUTPUT` | bcd | logic[(WIDTH+(WIDTH-4)/3):0] | BCD data output. |

## Test cases


## Use cases
### Data Conversions
Used to convert binary data to BCD for display on 7-segment displays or for interfacing with analog systems.

### Data Processing
Employed in various data processing applications, such as arithmetic operations and data encoding/decoding.

### Digital Interfaces
Integrated into digital interfaces to bridge the gap between binary and BCD data formats.

### Embedded Systems
Widely used in embedded systems and microcontroller applications.
