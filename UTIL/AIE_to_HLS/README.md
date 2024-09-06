# AIE to HLS

This block is used to connect the AI Engine domain to the HLS kernel
block in cases where the data type or complexity of the ports do not
match.

  
![](./Images/block.png)  

## Library

Utilities/Connectors

## Description

The AIE to HLS kernel block reformats a signal driven by an AI Engine
block so that the resulting signal matches the data type and complexity
required by the input of an HLS Kernel block.


<div class="noteBox">
This block is needed only if the output of the AI Engine block does not match the data type and complexity of the input to the HLS Kernel block. Otherwise, you can directly connect the AI Engine block to the HLS Kernel block.
</div>

### Topology
![](./Images/yyz1647631688897.png)  

## Parameters

#### Output Data Type  
Possible values are: cint16, int32, uint32, cint32, int64, uint64,
sfix128, ufix128, float, cfloat

#### Output Size  
The size of the output port. The output port is a variable sized signal
whose maximum size is specified by the Output Size parameter. Default
Output Size is '1'. For example if the input signal to the block is a
vector of size 24 and of uint16 data type and the output data type is
set to uint64, each output sample will include four input samples. As
such the output size must be equal to or larger than 8.

Note:

1.  The input data type must be one of the following: int8, int16,
    int32, int64, x_sfix128, uint8, uint16, uint32, uint64, x_ufix128, bfloat16.
2.  The input can be real or complex, but complex inputs are supported
    only for int16 and int32.
    
### Examples
[AIE to HLS Kernel with an interface block](https://github.com/Xilinx/Vitis_Model_Composer/blob/HEAD/Examples/AIENGINE_plus_PL/AIE_HLS/AIE_HLS_with_interface/README.md)

[AIE to HLS Kernel without an interface block](https://github.com/Xilinx/Vitis_Model_Composer/blob/HEAD/Examples/AIENGINE_plus_PL/AIE_HLS/AIE_HLS_without_interface/README.md)

You can find more examples [here](https://github.com/Xilinx/Vitis_Model_Composer/tree/2023.1/Examples/AIENGINE_plus_PL/AIE_HLS).



--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
