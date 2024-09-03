# DSP58

![](./Images/block.png)

The DSP58 block is an efficient building block for DSP
applications that use Versal® devices. DSP applications use many binary
multipliers and accumulators that are best implemented in dedicated DSP
resources. Versal devices have many dedicated low-power DSP slices,
combining high speed with small size while retaining system design
flexibility.

## Description

The DSP58 slice is effectively a super-set of the DSP48E2 slice with
these differences. The DSP58 has the following.

- Wider functionality
- More flexibility in the pre-adder
- New optional negate inport
- More XOR operations
- Additional unique features


![](./Images/nxu1570825076306.png)

## Parameters

### Basic tab  
#### Input Configuration  
##### A or ACIN input  
Specifies if the A input should be taken directly from the a port or
from the cascaded acin port. The acin port can only be connected to
another DSP58 block.

##### B or BCIN input  
Specifies if the B input should be taken directly from the b port or
from the cascaded bcin port. The bcin port can only be connected to
another DSP58 block.

**Note**: If the input to the block is NaN, you will see a behavioral
simulation mismatch.

#### DSP58 Data-Path Configuration  
##### SIMD Mode of Adder/Subtractor/Accumulator  
This mode can be used to implement small add-subtract functions at high
speed and lower power with less logic utilization. The adder and
subtracter in the adder/subtracted/logic unit can also be split into two
24-bit units or four 12-bit units.

##### Mode of Multiplier  
This option is disabled in the current release

##### Do not use multiplier  
When this is selected, the DSP58 block is optimized in hardware for
maximum performance without using the multiplier. If an instruction
using the multiplier is encountered in simulation, an error is reported.

##### Use dynamic multiplier mode  
When this is selected, it instructs the DSP58 block to use the dynamic
multiplier mode. This indicates that the block is switching between A\*B
and A:B operations on the fly, and therefore needs to get the worst-case
timing of the two paths.

#### Preadder Configuration  
Use the 27-bit D data input to the pre-adder or alternative input to the
multiplier. The pre-adder implements D + A as determined by the INMODE3
signal.

##### PREADDINSEL Select preadder input  
Selects the input to be added with D in the pre-adder.

##### AMULTSEL Select A multiplexer output  
Selects the input to the 27-bit A input of the multiplier. In the 7
series primitive, DSP48E1 the attribute is called USE_DPORT, but has
been renamed due to new pre-adder flexibility enhancements (default
AMULTSEL = A is equivalent to USE_DPORT=FALSE).

##### BMULTSEL Select B multiplexer output  
Selects the input to the 18-bit B input of the multiplier.

##### Enable D Port  
Automatically enabled when AD is selected.

#### Pattern Detection  
##### Reset p register on pattern detection  
If selected and the pattern is detected, reset the p register on the
next cycle

##### AUTO RESET PRIORITY  
When enabled by selecting the option above, select RESET (the default)
or CEP (clock enabled for the P (output) resister).

#### Pattern Input  
##### Pattern Input from c port  
When selected, the pattern used in pattern detection is read from the c
port.

##### Using Pattern Attribute (58bit hex value)  
Value is used in pattern detection logic, which is best described as an
equality check on the output of the adder/subtractor/logic unit.

##### Pattern attribute  
A 58-bit value that is used in the pattern detector.

#### Mask Input  
##### Mask input from c port  
When selected, the mask used in pattern detection is read from the c
port.

##### Using Mask Attribute (58 bit hex value)  
A 58-bit value used to mask out certain bits during pattern detection.

##### MODE1  
Selects rounding_mode 1 (C-bar left shifted by 1).

##### MODE2  
Selects rounding_mode 2 (C-bar left shifted by 2).

### Wide Xor tab  
Parameters specific to the Wide Xor tab are as follows.

#### Use Wide XOR  
Use this is feature to perfom a 116 bit XOR function.

#### XORSIMD Select Wide XOR SIMD  
Use the XORSIMD attribute to select the width of the XOR function.
Select either XOR12 (the default), XOR22, XOR24, XOR34, XOR58, or
XOR116).

### Optional Ports tab  
#### Input Ports  
##### Consolidate control port  
When selected, combines the opmode, alumode, carry_in, carry_in_sel,
inmode, and negate ports into one 25-bit port. Bits 0 to 8 are the
opmode, bits 9 to 12 are the alumode port, bit 13 is the carry_in port,
and bits 14 to 16 are the carry_in_sel port, bits 17 to 21 are the
inmode port, and bits 22 to 24 are the negate port. This option should
be used when the Opmode block is used to generate a DSP58 instruction.

##### Provide c port  
When selected, the c port is made available. Otherwise, the c port is
tied to '0'.

##### Provide global reset port  
When selected, the port rst is made available. This port is connected to
all available reset ports based on the pipeline selections.

##### Provide global enable port  
When selected, the optional en port is made available. This port is
connected to all available enable ports based on the pipeline
selections.

#### Cascadable Ports  
##### Provide pcin port  
When selected, the pcin port is exposed. The pcin port must be connected
to the pcout port of another DSP58 block.

##### Provide carry cascade in port  
When selected, the carry cascade in port is exposed. This port can only
be connected to a carry cascade out port on another DSP58 block.

##### Provide multiplier sign cascade in port  
When selected, the multiplier sign cascade in port (multsigncascin) is
exposed. This port can only be connected to a multiplier sign cascade
out port of another DSP58 block.

#### Output Ports  
##### Provide carryout port  
When selected, the carryout output port is made available. When the mode
of operation for the adder/subtractor is set to one 58-bit adder, the
carryout port is 1-bit wide. When the mode of operation is set to two 24
bit adders, the carryout port is 2 bits wide. The MSB corresponds to the
second adder's carryout and the LSB corresponds to the first adder's
carryout. When the mode of operation is set to four 12 bit adders, the
carryout port is 4 bits wide with the bits corresponding to the addition
of the 48 bit input split into four 12-bit sections.

##### Provide pattern detect port  
When selected, the pattern detection output port is provided. When the
pattern, either from the mask or the c register, is matched the pattern
detection port is set to '1'.

##### Provide pattern bar detect port  
When selected, the pattern bar detection (patternbdetect) output port is
provided. When the inverse of the pattern, either from the mask or the c
register, is matched the pattern bar detection port is set to '1'.

##### Provide overflow port  
When selected, the overflow output port is provided. This port indicates
when the operation in the DSP58 has overflowed beyond the bit P\[N\]
where N is between 1 and 46. N is determined by the number of 1s in the
mask whether set by the GUI mask field or the c port input.

##### Provide underflow port  
When selected, the underflow output port is provided. This port
indicates when the operation in the DSP58 has underflowed. Underflow
occurs when the number goes below –P\[N\] where N is determined by the
number of 1s in the mask whether set by the GUI mask field or the c port
input.

#### Cascadable Ports  
##### Provide ACOUT port  
When selected, the acout output port is made available. The acout port
must be connected to the acin port of another DSP58 block.

##### Provide BCOUT port  
When selected, the bcout output port is made available. The bcout port
must be connected to the bcin port of another DSP58 block.

##### Provide PCOUT port  
When selected, the pcout output port is made available. The pcout port
must be connected to the pcin port of another DSP58 block.

##### Provide multiplier sign cascade out port  
When selected, the multiplier sign cascade out port (multsigncascout) is
made available. This port can only be connected to the multiplier sign
cascade in port of another DSP58 block and is used to support 96-bit
accumulators/adders and subtracters which are built from two DSP58s.

##### Provide carry cascade out port  
When selected, the carry cascade out port (carrycascout) is made
available. This port can only be connected to the carry cascade in port
of another DSP58 block.

### Pipelining tab  
#### Pipeline Options  
##### Length of a/acin pipeline  
Specifies the length of the pipeline on input register A. A pipeline of
length 0 removes the register on the input.

##### Length of b/bCIN pipeline  
Specifies the length of the pipeline for the b input whether it is read
from b or bcin.

##### Length of acout pipeline  
Specifies the length of the pipeline between the a/acin input and the
acout output port. A pipeline of length 0 removes the register from the
acout pipeline length. Must be less than or equal to the length of the
a/acin pipeline.

##### Length of bcout pipeline  
Specifies the length of the pipeline between the b/bcin input and the
bcout output port. A pipeline of length 0 removes the register from the
bcout pipeline length. Must be less than or equal to the length of the
b/bcin pipeline.

#####  Pipeline c  
Indicates whether the input from the c port should be registered.

##### Pipeline p  
Indicates whether the outputs p and pcout should be registered.

##### Pipeline multiplier  
Indicates whether the internal multiplier should register its output.

##### Pipeline opmode  
Indicates whether the opmode port should be registered.

##### Pipeline alumode  
Indicates whether the alumode port should be registered.

##### Pipeline carry in  
Indicates whether the carry in port should be registered.

##### Pipeline carry in select  
Indicates whether the carry in select port should be registered.

##### Pipeline preadder input register d  
  Indicates to add a pipeline register to the d input.

#### Pipeline preadder output register ad  
  Indicates to add a pipeline register to the ad output.

##### Pipeline INMODE register  
Indicates to add a pipeline register to the INMODE input.

### Reset/Enable Ports tab  
#### Provide Reset Ports  
##### Reset port for a/acin  
When selected, a port rst_a is made available. This resets the pipeline
register for port a when set to '1'.

##### Reset port for b/bcin  
When selected, a port rst_b is made available. This resets the pipeline
register for port b when set to '1'.

##### Reset port for c  
When selected, a port rst_c is made available. This resets the pipeline
register for port c when set to '1'.

##### Reset port for multiplier  
When selected, a port rst_m is made available. This resets the pipeline
register for the internal multiplier when set to '1'.

##### Reset port for P  
 When selected, a port rst_p is made available. This resets the output
register when set to '1'.

##### Reset port for carry in  
When selected, a port rst_carryin is made available. This resets the
pipeline register for carry in when set to '1'.

##### Reset port for alumode  
When selected, a port rst_alumode is made available. This resets the
pipeline register for the alumode port when set to '1'.

##### Reset port for controls (opmode and carry_in_sel)  
When selected, a port rst_ctrl is made available. This resets the
pipeline register for the opmode register (if available) and the
carry_in_sel register (if available) when set to '1'.

#### Provide Enable Ports  
##### Enable port for first a/acin register  
When selected, an enable port ce_a1 for the first a pipeline register is
made available.

##### Enable port for second a/acin register  
When selected, an enable port ce_a2 for the second a pipeline register
is made available.

##### Enable port for first b/bcin register  
When selected, an enable port ce_b1 for the first b pipeline register is
made available.

##### Enable port for second b/bcin register  
When selected, an enable port ce_b2 for the second b pipeline register
is made available.

##### Enable port for c  
When selected, an enable port ce_c for the port C register is made
available.

##### Enable port for multiplier  
When selected, an enable port ce_m for the multiplier register is made
available.

##### Enable port for p  
When selected, an enable port ce_p for the port P output register is
made available.

##### Enable port for carry in  
When selected, an enable port ce_carry_in for the carry in register is
made available.

##### Enable port for alumode  
When selected, an enable port ce_alumode for the alumode register is
made available.

##### Enable port for multiplier carry in  
When selected, an enable port mult_carry_in for the multiplier register
is made available.

#####  Enable port for controls (opmode and carry_in_sel)  
When selected, the enable port ce_ctrl is made available. The port
ce_ctrl controls the opmode and carry in select registers.

##### Enable port for d  
When selected, an enable port is added input register d.

##### Enable port for ad  
When selected, an enable port is add for the preadder output register
ad.

##### Enable port for INMODE  
When selected, an enable port is added for the INMODE register.

### Inversion Options tab  
When a checkbox is selected under this tab, the specified signal is
inverted.

### Implementation tab  
#### Use synthesizable model  
When selected, the DSP58 is implemented from an RTL description which
might not map directly to the DSP58 hardware. This is useful if a design
using the DSP58 block is targeted at device families that do not contain
DSP58 hardware primitives.

#### Mode of operation for the adder/subtractor  
This mode can be used to implement small add-subtract functions at high
speed and lower power with less logic utilization. The adder and
subtractor in the adder/subtracted/logic unit can also be split into two
24-bit fields or four12-bit fields. This is achieved by setting the mode
of operation to "Two 24-bit adders" or "Four 12-bit adders".

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.
