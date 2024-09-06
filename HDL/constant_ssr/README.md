# Vector Constant

The Vector Constant Block generates vector constant values.

![](./Images/block.png)

## Description

The Vector Constant block generates a constant that can be a fixed-point
value, a Boolean value, or a DSP48 instruction. This block is similar to
the Simulink® Vector Constant block, but can be used to directly drive
the inputs on HDL blocks.

## Parameters

### Basic tab  
Parameters specific to the Basic tab are as follows:

#### Constant Value  
Specifies the value of the constant. When changed, the new value appears
on the block icon. If the constant data type is specified as fixed-point
and cannot be expressed exactly in the specified fixed-point type, its
value is rounded and saturated as needed. A positive value is
implemented as an unsigned number, a negative value as signed.

#### Output Type  
Specifies the data type of the output.

  - Boolean
  - Fixed-point
  - Floating-point

#### Arithmetic Type  
If the Output Type is specified as Fixed-point.

  - Signed (2’s comp)
  - Unsigned
  - DSP48 instruction

#### Fixed-point Precision  
##### Number of bits  
Specifies the bit location of the binary point of the output number,
where bit zero is the least significant bit.

##### Binary point  
Position of the binary point. in the fixed-point output.

#### Floating-point Precision  
##### Single  
Specifies single precision (32 bits).

##### Double  
Specifies double precision (64 bits).

##### Custom  
Activates the field below so you can specify the Exponent width and the
Fraction width.

#### Exponent width  
Specifies the exponent width.

#### Fraction width  
Specifies the fraction width.

#### Sample Period  
##### Sampled Constant  
Allows a sample period to be associated with the constant output and
inherited by blocks that the Constant block drives. This is useful
mainly because the blocks eventually target hardware and the Simulink
sample periods are used to establish hardware clock periods.

#### Super Sample Rate (SSR)
This configurable GUI parameter is primarily
used to control processing of multiple data samples on every sample
period. This block enables 1-D vector data support for the primary block
operation.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
