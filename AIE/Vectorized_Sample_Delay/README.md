<!-- Library: aieDSP -->

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

[![](./Images/Vectorized_Sample_Delay_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Vectorized_Sample_Delay_Ex1)


<!--
DESCRIPTION:
Model: Vectorized_Sample_Delay_Ex1
Generated: 13-Jan-2026 15:37:37

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Vectorized Sample Delay

Model Annotations:
  p, li { white-space: pre-wrap; }
  Observation on AIE & Simulink Sample Delay Output:
  Output Sample Size  = 64
  Output signal is delayed by 12 samples

  p, li { white-space: pre-wrap; }
  Model Parameter Settings:
  Input Window SIze: 64
  numSampleDelay: 12

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Vectorized Sample Delay block. A 10Hz real input signal is provided to the block,  and the output is visualized for analysis.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Vectorized_Sample_Delay_Ex1
% Essential setup focusing on critical parameters

modelName = 'Vectorized_Sample_Delay_Ex1';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');


% Vectorized Sample Delay
add_block('aieDSP/Vectorized Sample Delay', [modelName '/Vectorized Sample Delay']);
set_param([modelName '/Vectorized Sample Delay'], ...
    'data_type', 'float', ...
    'input_window_size', '64');


% Test signal and connections setup omitted for brevity
% Add input sources, displays, and connect blocks as needed
-->


[![](./Images/Vectorized_Sample_Delay_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Vectorized_Sample_Delay_Ex2)


<!--
DESCRIPTION:
Model: Vectorized_Sample_Delay_Ex2
Generated: 13-Jan-2026 15:37:38

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Vectorized Sample Delay

Model Annotations:
  p, li { white-space: pre-wrap; }
  Model Parameter Settings:
  Input Window SIze: 64
  numSampleDelay: 8

  p, li { white-space: pre-wrap; }
  Observation on AIE & Simulink Sample Delay Output:
  Output Sample Size  = 64
  Output signal is delayed by 8 samples

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Vectorized Sample Delay block. A 10Hz real input signal is provided to the block,  and the output is visualized for analysis.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Vectorized_Sample_Delay_Ex2
% Essential setup focusing on critical parameters

modelName = 'Vectorized_Sample_Delay_Ex2';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');


% Vectorized Sample Delay
add_block('aieDSP/Vectorized Sample Delay', [modelName '/Vectorized Sample Delay']);
set_param([modelName '/Vectorized Sample Delay'], ...
    'data_type', 'float', ...
    'input_window_size', '64');


% Test signal and connections setup omitted for brevity
% Add input sources, displays, and connect blocks as needed
-->


## References
This block uses the Vitis DSP library implementation of Vectorized Sample Delay. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-sample_delay.html).

--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
