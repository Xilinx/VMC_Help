# Gateway Out AXI Stream
  
![](./Images/block.png)  

## Library

HDL/Interfaces

## Description

This block serves as a utility block to simplify the connection between an HDL block with an output AXI Stream port, which comprises three signal lines: the _tdata_ and _tvalid_ signals going in one direction, and the _tready_ signal going in the opposite direction. Note that in the generated HDL code, the block name will be used as the name for the AXIS port.

The following figure shows an example of how the block is used to connect HDL blocks to AI Engine blocks.
  
![](./Images/bdd1648735937836.png)  

## Parameters

#### Sample Time  
The sample time of the _tready_ signal leaving the block. In general, the value of this parameter should match the sample time of your HDL design.

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
