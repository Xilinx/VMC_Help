# Bitwise OR

Perform element and bitwise Boolean OR operation on the inputs

![](./Images/block.png)

## Library

Logic and Bit Operations

## Description

The Bitwise OR block has two input signals and one output signal. The
block performs element and bit-wise boolean OR operation on the inputs.
The first input corresponds to the top input port and the second input
to the bottom input port. The dimension of the output signal matches the
dimensions of the input signals.

## Data Type Support

The Bitwise OR block supports native and fixed-point types except the
floating point types (double, single, and half). If one of the inputs is
scalar, the output dimension is non-scalar. If both inputs are
non-scalar, they must have the same dimension. The dimension can be
scalar, vector, or matrix.

## Parameters

The Bitwise OR block has no parameters to set.

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
