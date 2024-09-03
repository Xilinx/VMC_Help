# Sum of Elements

Perform element-wise addition on the input, column-wise, row-wise, or in
all dimensions

![](./Images/block.png)

## Library

Math Functions / Math Operations

## Description

This block performs element-wise addition on a vector or matrix type
input. If input is a scalar then this block operates as a pass-through.
The output is a scalar type if input is a vector or a matrix and the Sum
over parameter is set as All dimensions.

## Data Type Support

Data type support for the block is:

- The Sum of Elements block supports any floating-point, fixed-point,
  integer or Boolean data type.

- The output type is a scalar or a vector depending on the dimensions of
  the input and the selection of the Sum over parameter.

- The block can perform element-wise addition on real or complex number
  data.

## Parameters

#### Sum over
##### All dimensions
Add all elements of the input signal (output is scalar)

##### Specified dimension
This option shows an edit box, Dimension, where the specific dimension value can be entered.

#### Dimension
##### 1
Add input over row dimension. Output is a row matrix.

##### 2 
Add input over column dimension. Output is a column matrix.


--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.
