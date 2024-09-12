# Product

Compute element-wise product of the input signals


![](./Images/block.png)

## Library

Math Functions / Math Operations

## Description

The Product block computes the element-wise product of its input
signals.

The block warns or errors out when an integer output overflows during
simulation. To configure, select Simulation → Model Configuration
Parameters → Diagnostics → Data Validity for your model in the Simulink®
Editor, then set the Wrap on overflow, or Saturate on overflow
parameter.

## Data Type Support

The Product block outputs the result of multiplying two inputs. Inputs
can be two scalars, a scalar and a non-scalar, and two non-scalars of
the same dimension. If one of the inputs is scalar and other input is
vector/matrix then the scalar input is expanded to match the dimension
of the other input to perform the operation. If input signals are both
integer data types, such as int16, the datatype of the output is also an
integer datatype int16. Hence an overflow of wrap around (no saturation)
is likely if the output exceeds the range that is represented with
int16. If the operation is to be applied without loss of precision or
range, use fixed-point data types. If you want to narrow the bit width
of the output signal, you can run it through a Data Type Conversion
block and select a fixed-point data type that saturates.

The output dimension is the same as that of the inputs if both inputs
are either scalar or non scalar. If one input is scalar and the other is
a vector/matrix then the output dimension matches the dimension of the
vector/matrix input. The output type is same as that of the inputs if
both inputs are of the same type. Otherwise, the output type is defined
as follows.

| Input Type        | Output Type |
|-------------------|-------------|
| (double, single)  | double      |
| (double, int)     | double      |
| (double, half)    | double      |
| (double, fixed)   | double      |
| (double, Boolean) | double      |
| (single, int)     | single      |
| (single, half)    | single      |
| (single, fixed)   | single      |
| (single, Boolean) | single      |
| (half, int)       | half        |
| (half, fixed)     | half        |
| (half, Boolean)   | half        |
| (fixed, int)      | fixed       |
| (fixed, Boolean)  | fixed       |
| (int, Boolean)    | int         |


## Parameters

#### Saturate on integer overflow

This parameter specifies whether integer overflow is handled by wrapping
(default) or by saturating. This parameter is relevant only if the
output is integral (int8, int16, int32, uint8, uint16, uint32).

Settings for the Saturate on integer overflow parameter are:

##### Not selected
Integer overflow is handled by wrapping.

##### Selected
Integer overflow is handled by saturation.

When overflow is detected, the Diagnostic Viewer displays messages that
depend on the diagnostic action you specify in the Simulink Editor. To
configure, select Simulation → Model Configuration
Parameters → Diagnostics → Data Validity for your model in the Simulink
Editor, then set the Wrap on overflow or Saturate on overflow parameter.

--------------
Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
