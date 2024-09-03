# Subtract

Perform element-wise subtraction

![](./Images/block.png)

## Library

Math Functions / Math Operations

## Description

The Subtract block performs element-wise subtraction of two input
signals.

The block warns or errors out when an integer output overflows during
simulation. To configure, select Simulation → Model Configuration
Parameters → Diagnostics → Data Validity for your model in the Simulink
Editor, then set the Wrap on overflow or Saturate on overflow parameter.

## Data Type Support

The Subtract block supports any floating point, fixed-point, integer or
Boolean data type. The block can perform element-wise subtraction on
real and complex inputs. The input signals can be scalars, vectors or
matrices. When both inputs have non-scalar dimensions, the dimensions
must match each other.

## Parameters

#### Saturate on integer overflow

This parameter specifies whether integer overflow is handled by wrapping
(default) or by saturating. This parameter is relevant only if the
output is integral (int8, int16, int32, uint8, uint16, uint32).

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
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.
