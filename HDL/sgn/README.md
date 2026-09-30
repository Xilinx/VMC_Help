# Threshold

![](./Images/block.png)

## Description

The Threshold block tests the sign of the input number. If the
input number is negative, the output of the block is -1; otherwise, the
output is 1. The output is a signed fixed-point integer that is 2 bits
long. The block has one input and one output.

## Parameters


Parameters used by this block are explained in the topic [Common Options
in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

The block parameters do not control the output data type because the
output is always a signed fixed-point integer that is 2 bits long.


#### Provide enable port

Selecting the Provide Enable Port option activates an optional enable (en) pin on the block. When the enable signal is not asserted the block holds its current state until the enable signal is asserted again or the reset signal is asserted.

#### Latency

The number of sample periods by which the block's output is delayed.

##  LogiCORE

The Threshold block does not use a LogiCORE™.

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
