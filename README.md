# RTL modules written in SystemVerilog
In each module you may find 4 folders:
</br>
`docs/`: Contains the documentation of the top module, what inputs/outputs exist and how they work.
</br>
`inc/`: Contains the extra files (submodules or packages) used in that top module, if no extra files are used on the top module, this folder will not appear. If one module from this repo uses another one, the file(s) will be copied into the destination `inc/` folder.
</br>
`src/`: Contains the source code of the top module.
</br>
`test/`: Contains the testbench for the top module.
</s>

Modules under development:
- [alu](https://github.com/Bubi2001/rtl_utils/tree/module/alu): Basic ALU with parametrable bitwidths.
- [bin_bcd](https://github.com/Bubi2001/rtl_utils/tree/module/bin_bcd): Binary to BCD decoder.
- [crc](https://github.com/Bubi2001/rtl_utils/tree/module/crc): Hardware CRC calculator.
- [dpll](https://github.com/Bubi2001/rtl_utils/tree/module/dpll): Digital Phase Locked Loop.
- [fifo](https://github.com/Bubi2001/rtl_utils/tree/module/fifo): FIFO memory buffer.
- [gpio](https://github.com/Bubi2001/rtl_utils/tree/module/gpio): General purpose I/O controller.
- [i2c](https://github.com/Bubi2001/rtl_utils/tree/module/i2c): I2C master and slave controllers.
- [i2s](https://github.com/Bubi2001/rtl_utils/tree/module/i2s): I2S master and slave controllers.
- [lifo](https://github.com/Bubi2001/rtl_utils/tree/module/lifo): LIFO memory buffer.
- [one_wire](https://github.com/Bubi2001/rtl_utils/tree/module/one_wire): One-Wire master and slave module.
- [parity](https://github.com/Bubi2001/rtl_utils/tree/module/parity): Simple parity calculation and checking.
- [pid](https://github.com/Bubi2001/rtl_utils/tree/module/pid): PID controller.
- [pwm](https://github.com/Bubi2001/rtl_utils/tree/module/pwm): PWM controller.
- [register_file](https://github.com/Bubi2001/rtl_utils/tree/module/register_file): Simple Register Bank.
- [simple_risc_processor](https://github.com/Bubi2001/rtl_utils/tree/module/simple_risc_processor): Simple RISC-like processing unit.
- [spi](https://github.com/Bubi2001/rtl_utils/tree/module/spi): SPI master and slave controller.
- [timer](https://github.com/Bubi2001/rtl_utils/tree/module/timer): Simple general purpose timer module.
- [uart](https://github.com/Bubi2001/rtl_utils/tree/module/uart): UART transmitter and receiver module.

Modules under development will be in their own branch, when module is complete and functioning, branch will merge into master.

To use any of these modules just include them into your project by adding their header file (.sv) into your compilation list.</s>

You can test any of this modules in [EDA Playground](https://www.edaplayground.com) by copying the source and include files, alongside with the top module testbench.

If you want to request a new module, report new a bug or ask a question about any of this modules, open a issue in the Issues Tab of the Repository!