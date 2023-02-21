# Clock Probe

The Xilinx Clock Probe generates a double-precision representation of a
clock signal with a period equal to the Simulink® system period.

![](./Images/block.png)

The output clock signal has a 50/50 duty cycle with the clock asserted
at the start of the Simulink sample period. The Clock Probe's double
output is useful only for analysis, and cannot be translated into
hardware.

There are no parameters for this block.
