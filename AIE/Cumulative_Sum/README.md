# Cumulative Sum

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

This block implements the Cumulative Sum algorithm targeted for
AI Engines.

## Parameters

### Main  

#### Input data type
Describes the type of individual data samples of signal input to the function.

#### Output data type
Describes the type of individual data samples at the function output.

#### Input dimensions A
Defines the number of rows (A) in each input frame or matrix.

#### Input dimensions B
Defines the number of columns (B) in each input frame or matrix.

#### Number of frames
Describes the number of frames of input data samples that occur within each input window of data.

#### Sum input along
Describes the sum along.

***Dimension A***: Sum along rows (vertical direction)

***Dimension B***: Sum along columns (horizontal direction)

#### Scale output down by 2^
Describes the number of bits to downshift.

#### Rounding mode
Describes the selection of rounding to be applied during the shift down stage of processing.

#### Saturation mode
Describes the selection of saturation to be applied during the shift down stage of processing.

### Constraints
Click on the button given here to access the constraint manager and add or update constraints for each kernel. If you set the "Number of cascade stages" parameter to a value greater than one, multiple kernels will be used to process the input. You can use the constraint manager to optimize the performance of your design by setting specific constraints for each kernel (in this case, you need to first run your design). Adding constraints will not affect the functional simulation in Simulink. Constraints will only affect the generated graph code, cycle approximate AIE simulation (System C), and behavior in hardware.

<div class="noteBox">
If you are using non-default constraints for any of the kernels for the block, an asterisk (*) will be displayed next to the button.
</div>

## Examples

***Click on the images below to open each model.***

[![](./Images/Cumulative_Sum_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Cumulative_Sum_Ex1)

[![](./Images/Cumulative_Sum_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Cumulative_Sum_Ex2)

## References
This block uses the Vitis DSP library implementation of Cumulative Sum. For more details on this implementation please click [here](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-cumsum.html).

--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
