# Complex to Polar

Perform an element-wise conversion of complex input signals into
magnitude and radiant phase angle


![](./Images/block.png)

## Library

Math Functions / Math Operations

## Description

The Complex to Polar block accepts a complex-valued signal of floating
point data types such as double, single and half. It outputs the
magnitude and phase angle of the input signal. The outputs are real
values of the same data type as the block input. The input can be a
scalar, vector or matrix of complex signals, in which case the output
signals are also scalar, vector or matrix. The magnitude signal array
contains the magnitudes of the corresponding complex input elements. The
angle output similarly contains the angles of the input elements in
radian.

## Data Type Support

Data type support for the input port is:

- Dimension: The input can be scalar, vector or matrix. If the input is
  not scalar then the outputs have the same dimension as the input.
- Data Types: Input supports complex signal of floating point data type
  such as double, single, and half.

The outputs are always real-valued signals of floating point data type
such as double, single, and half.

## Parameters

The Complex to Polar block has no parameters to set.

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.
