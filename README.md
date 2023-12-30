# Common RTL modules written in SystemVerilog
In each module you may found 4 folders:
</br>
`docs/`: Contains the documentation of the top module, what inputs/outputs exist and how they work
</br>
`inc/`: Contains the extra files (submodules or packages) used in that top module, if no extra files are used on the top module, this folder will not appear. If one module from this repo uses another one, the file(s) will be copied into the destination `inc/` folder.
</br>
`src/`: Contains the source code of the top module.
</br>
`test/`: Contains the testbench for the module.
</s>

Modules under development:
- `7-seg_dec`: Decoder from BCD to 7 segments display.
- `7-seg_hex`: Decoder that takes a nibble and return the 7 segments display of the hex number inputted.
- `alu`: Basic ALU with parametrable bitwidths.
- `bin-bcd`: Binary to BCD decoder.
- `crc`: Hardware CRC calculator.
- `decoder`: 2-to-4, 3-to-8, 4-to-16 decoders.
- `encoder`: 4-to-2, 8-to-3, 16-to-4 encoders.
- `fifo`: FIFO memory buffer.
- `gpio`: General purpose I/O controller.
- `i2c`: I2C master and slave controllers.
- `lifo`: LIFO memory buffer.
- `parity`: Simple parity calculation and checking.
- `pwm`: PWM controller.
- `register_file`: Simple Register Bank.
- `shift_reg`: Shift register with parametrable size.
- `simple_risc_processor`: Simple RISC-like processing unit.
- `spi`: SPI master and slave controller.
- `timer`: Simple general purpose timer module.
- `uart`: UART transmitter and receiver.

To use any of these modules just include them into your project by adding their header file (.sv) into your compilation list.</s>

If you want to request a new module, find a bug or ask a question about any of this modules, open a issue in the Issues Tab of the Repository!