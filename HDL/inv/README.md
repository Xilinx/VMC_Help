# Inverter

![](./Images/block.png)

## Description
The Inverter block calculates the bitwise logical complement of a
fixed-point number. The block is implemented as a synthesizable VHDL
module.

## Parameters

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

#### Provide enable port

Selecting the Provide Enable Port option activates an optional enable (en) pin on the block. When the enable signal is not asserted the block holds its current state until the enable signal is asserted again or the reset signal is asserted.

#### Latency

The number of sample periods by which the block's output is delayed.

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
