# Function Approximation

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

This block implements the Function Approximation algorithm targeted for
AI Engines.

## Parameters

### Main  

#### Function
Choose lut values for available functions or specify own lut values.

#### Specify LookUp Values
Describes the LUT values.

#### Specify LUT Values via input port
Flag to indicate if LUT reloading is used.

#### Input/Output data type
Describes the type of individual input output data samples of the function.

#### Coarse bits
Describes the number of bits in a sample of input data that will be used to address the provided lookup table.

#### Fine bits
Describes the number of bits in an input data sample used for fine interpolation.

#### Input domain
Specifies a mode for the input domain of the chosen function for approximation.

#### Input window size
Describes number of samples to be processed in each call to this function.

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

[![](./Images/Function_Approximation_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Function_Approximation_Ex1)

[![](./Images/Function_Approximation_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Function_Approximation_Ex2)

[![](./Images/Function_Approximation_Ex3.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Function_Approximation_Ex3)

## References
This block uses the Vitis DSP library implementation of Function Approximation. For more details on this implementation please click [here](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-func-approx.html).

--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
