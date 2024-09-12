# Divide

Element-wise division

![](./Images/block.png)

## Library

Math Functions / Math Operations


## Description

The Divide block has two input ports and one output port. The output
signal (quotient) is the result of element-wise division of the first
input (dividend) by the second input (divisor).

## Data Type Support

The data types of the dividend and divisor can be any integer, fixed
point or floating point data type. Boolean dividends or divisors are not
supported. The input signals can be real or complex. The input signals
can be scalars, vectors or matrices. If neither input signal is scalar,
they must either be vectors of the same length or matrices with the same
number of rows and columns. When the output is integer or fixed point
data type, the result is truncated to zero.

The output data type is chosen for maximal alignment with Vitis HLS. If
the dividend and divisor are fixed point types and the fixed point
parameters of the dividend are W1 (word length), FW1 (fractional
length), and S1 (signedness), and the fixed point parameters of the
divisor are W2, FW2, and S2, then the fixed point parameters of the
quotient are as follows:

- S = S1 ‖ S2
- FW2 ≥ 0
  - W = W1 + FW2 + S2
  - FW = FW1
- FW2 \< 0
  - W = W1 +S2
  - FW = FW1 + FW2

## Parameters

The Divide block has no parameters.

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
