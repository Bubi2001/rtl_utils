# 7 Segments Decoder (Hexadecimal)
A 7-segment decoder module is a digital circuit that converts a four-bit input to a corresponding binary representation of the digits or characters to be displayed on a 7-segment display. It translates the input code into a signal pattern that controls the illumination of the segments of the display to form the desired number.

## Module name
Top module named _dec_7_seg_hex_ located at file `../src/dec_7_seg_hex.sv`.

## Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | bin_in | logic[3:0] | Binary nibble to plot at 7-segment display |
| `OUTPUT` | segments_anode | logic[6:0] | Decoded output for a common anode display, bit 6 is `a` segment, bit 5 is `b` segment, bit 4 is `c` segment, bit 3 is `d` segment, bit 2 is `e` segment, bit 1 is `f` segment and bit 0 is `g` segment. |
| `OUTPUT` | segments_cathode | logic[6:0] | Decoded output for a common cathode display, bit 6 is `a` segment, bit 5 is `b` segment, bit 4 is `c` segment, bit 3 is `d` segment, bit 2 is `e` segment, bit 1 is `f` segment and bit 0 is `g` segment. |

Below is added an image describing the segments nomenclature above used.

![7 segments display segment names](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.U69atcvS3mJMf4qFtglnBQHaGB%26pid%3DApi&f=1&ipt=f81fce0dac864bb4dc049a025484747e2b0801fad603a967cef69efa05d85d7c&ipo=images "7 segments display segment names")

## Test cases
Since this module is completely combinational, all possible combinations of inputs are tested.

## Use cases
### Digital Clocks
7-segment decoders are widely used in digital clocks to display time and date information.

### Counters and Timers
They are employed in counters and timers to display counts or elapsed time values.

### Measurement Instruments
Decoders are integrated into measuring devices to display readouts of various parameters.

### Electronic Displays
They are essential components in various electronic displays, including calculators, vending machines, and signage systems.

### Educational Tools
7-segment decoders are frequently used in educational kits and experiments to introduce digital electronics concepts.
