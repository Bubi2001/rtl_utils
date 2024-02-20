# PID


## Module name
Top module named _pid_ located at file `../src/pid.sv`.



## Module Inputs/Outputs
| Direction | Name | Type | Description |
| :---: | :---: | :---: | :---: |
| `INPUT` | clk | logic | Reference clock signal. |
| `INPUT` | rst_n | logic | Asyncronous active-low reset signal. |
| `INPUT` | setpoint | real | Targeted output value of the plant. |
| `INPUT` | measurement | real | Current state of the plant. |
| `INPUT` | Kp | real | Proportional gain. |
| `INPUT` | Ki | real | Integral gain. |
| `INPUT` | Kd | real | Derivative gain. |
| `INPUT` | sampleTime | real | Sampling time in seconds. |
| `INPUT` | tau | real | Time constant for derivative low-pass filter. |
| `OUTPUT` | out | real | Output value of the PID controller. |

## Test cases


## Use cases

