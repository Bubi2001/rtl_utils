# Universal Shift Register
A universal shift register is a sequential logic circuit that can store and temporarily hold a sequence of data bits. It consists of a cascade of flip-flops, each of which can latch the data from the previous flip-flop on the rising edge of a clock signal. The data can be shifted in and out of the register serially or in parallel.

**Operational Modes:**

* **Serial In, Serial Out (SISO):** Data is shifted in one bit at a time at the input, and the shifted output is available one bit at a time on the output.

* **Serial In, Parallel Out (SIPO):** Data is shifted in one bit at a time at the input, and the entire shifted data is available in parallel at the output on the rising edge of the clock pulse.

* **Parallel In, Serial Out (PISO):** The entire data is loaded into the register in parallel at the input, and the shifted data is available one bit at a time on the output on the rising edge of the clock pulse.

* **Parallel In, Parallel Out (PIPO):** The entire data is loaded into the register in parallel at the input, and the entire shifted data remains available in parallel at the output on the rising edge of the clock pulse.

## Module name
Top module named _shift_register_ located at file `../src/shift_register.sv`

## Module parameters
| Parameter | Type | Default Value | Description |
| :---: | :---: | :---: | :---: |
| SIZE | UNSIGNED 32-BIT INTEGER | 8 | Size in bits of the Shift Register |

## Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | clk | logic | Reference clock signal. |
| `INPUT` | rst_n | logic | Asyncronous active-low reset signal. |
| `INPUT` | load | logic | Source for data loading: if 1, data is loaded in parallel (via dataIn port), if 0, data is loaded in serially (via serIn port). |
| `INPUT` | en | logic | Enable signal for the shift register. |
| `INPUT` | serIn | logic | Serial data input. |
| `INPUT` | dataIn | logic[SIZE-1:0] | Parallel data input. |
| `OUTPUT` | dataOut | logic[SIZE-1:0] | Parellel data output. |
| `OUTPUT` | serOut | logic | Serial data output. |

## Test cases
- Serial Input checking via a loop shifting bits.
- Serial Output checking via a loop shifting bits.
- Parallel Input checking, where `load` is asserted and data is presented at parallel inputs, then `load` is de-asserted to check data does not load when it shouldn't.

## Use cases

### Data Transfer
Shift registers facilitate the transfer of data between devices or within a digital system. They can handle data transmission in both serial and parallel modes, making them versatile for various communication protocols.

### Data Encoding and Decoding
Shift registers play a crucial role in data encoding and decoding schemes. They are used to modulate and demodulate signals, converting digital data to analog signals and vice versa.

### Sample Rate Conversion
Shift registers are employed in sample rate conversion systems to adjust the sampling frequency of digital signals. They effectively resample data by shifting and buffering samples.

### Data Encryption and Decryption
Shift registers are embedded in encryption algorithms to provide enhanced security by scrambling and shuffling data bits. They contribute to the complexity of encryption processes.

### Time Delays and Pulse Generators
Shift registers can be used to generate controlled delays or pulses with specific durations. They are essential components in timing circuits and pulse generators.

### Counters and Timers
Shift registers can be configured as counters to count the number of clock pulses or to generate timing signals.
