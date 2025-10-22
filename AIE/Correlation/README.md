# Correlation

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

This Correlation block computes the correlation between two input signals F and G using AI Engine resources.
It supports both integer and floating-point data types and provides various configuration options for scaling, rounding and computation mode.

## Parameters

### Main  
#### F input data type
Describes the type of individual data samples of signal F to input to the function.

#### G input data type
Describes the type of individual data samples of signal G to input to the function.

#### Output data type
Describes the type of individual data samples output from the function.

#### Computation mode

Specifies the correlation computation type.
Options include:

***Full (0)***: Produces the full correlation result of length `F_length + G_length - 1`.

***Same (1)***: Produces the correlation result of length `max(F_length, G_length)`.

***Valid (2)***: Produces the correlation result of length `F_length - G_length + 1`.

#### F input length
Specifies the length of the F input signal.

#### G input length
Specifies the length of the G input signal.

#### Specify G input length via input port
When enabled, allows the G input length to be specified via an input port.

#### Number of frames
Specifies the number of frames to be processed.

#### Scale output down by 2^
Specifies the power of 2 shift down applied to the output.

#### Rounding mode
Describes the selection of rounding to be applied during processing.

#### Saturation mode
Describes the selection of saturation to be applied during processing.

### Constraints
Click on the button given here to access the constraint manager and add or update constraints for each kernel. If you set the "Number of cascade stages" parameter to a value greater than one, multiple kernels will be used to process the input. You can use the constraint manager to optimize the performance of your design by setting specific constraints for each kernel (in this case, you need to first run your design). Adding constraints will not affect the functional simulation in Simulink. Constraints will only affect the generated graph code, cycle approximate AIE simulation (System C), and behavior in hardware.

<div class="noteBox">
If you are using non-default constraints for any of the kernels for the block, an asterisk (*) will be displayed next to the button.
</div>

## Examples

***Click on the images below to open each model.***

[![](./Images/Correlation_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Correlation_Ex1)

[![](./Images/Correlation_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Correlation_Ex2)

[![](./Images/Correlation_Ex3.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Correlation_Ex3)

[![](./Images/Correlation_Ex4.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Correlation_Ex4)

## References
This block uses the Vitis DSP library implementation of Correlation. For more details on this implementation please click [here](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-conv-corr.html).

--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
