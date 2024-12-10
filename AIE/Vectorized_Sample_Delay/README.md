# Vectorized Sample Delay
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

The delay block produces an output signal by delaying the input signal by the number of samples specified in the block dialog box. If the latency of the block is N, then the N-1 first output samples are always 0, and the N-th output sample is the first input sample.

## Parameters

### Main  
#### Input/Output data type  
Set the input/output data type.


#### Input Window Size(Number of Samples)  
Describes the number of samples used as an input to the Vectorized Sample Delay. This parameter must be in the range of 2^0 and 2^32-1, inclusive.

#### Maximum Sample Delay  
Describes the maximum number of sample delay can be applied to the input signal.This parameter must be in the range of 2^0 and 2^32-1, inclusive.  

## Examples

***Click on the images below to open each model.***

[![](./Images/Vectorized_Sample_Delay_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.2/Examples/Block_Help/AIE/Vectorized_Sample_Delay_Ex1)

[![](./Images/Vectorized_Sample_Delay_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.2/Examples/Block_Help/AIE/Vectorized_Sample_Delay_Ex2)

## References
This block uses the Vitis DSP library implementation of Vectorized Sample Delay. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-sample_delay.html).

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
