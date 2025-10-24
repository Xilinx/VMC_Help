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
Describes the type of individual data samples of input to the function.

This must be one of the following:
* `int16`, `cint16`, `int32`, `cint32`, `float`, `cfloat`, `bfloat16`, `cbfloat16`

Type choice is restricted by AIE variant.

#### Output data type
Describes the type of individual data samples at the function output.

This must be one of the following:
* `int16`, `cint16`, `int32`, `cint32`, `float`, `cfloat`, `bfloat16`, `cbfloat16`

Type choice is restricted by AIE variant.

#### Input dimensions A (rows)
Defines the number of rows (A) in each input frame or matrix.

#### Input dimensions B (columns)
Defines the number of columns (B) in each input frame or matrix.

#### Number of frames
Describes the number of frames of input data samples that occur within each input window of data.

#### Sum input along
Describes the sum along.

***Dimension A***: Sum along rows (vertical direction)

***Dimension B***: Sum along columns (horizontal direction)

#### Scale output down by 2^
Describes the number of bits to downshift the output values.

#### Rounding mode
Describes the selection of rounding to be applied during the shift down stage of processing.

The following modes are available:
* **Floor:** Truncate LSB, always round down (towards negative infinity).
* **Ceiling:** Always round up (towards positive infinity).
* **Round to positive infinity:** Round halfway towards positive infinity.
* **Round to negative infinity:** Round halfway towards negative infinity.
* **Round symmetrical to infinity:** Round halfway towards infinity (away from zero).
* **Round symmetrical to zero:** Round halfway towards zero (away from infinity).
* **Round convergent to even:** Round halfway towards nearest even number.
* **Round convergent to odd:** Round halfway towards nearest odd number.

No rounding is performed on the **Floor** or **Ceiling** modes. Other modes round to the nearest integer. They differ only in how they round for values that are exactly between two integers.

#### Saturation mode
Describes the selection of saturation to be applied during the shift down stage of processing.

The following modes are available:
* **None:** No saturation is performed and the value is truncated on the MSB side.
* **Asymmetric:** Rounds an n-bit signed value in the range `-2^(n-1)` to `2^(n-1)-1`.
* **Symmetric:** Rounds an n-bit signed value in the range `-2^(n-1)-1` to `2^(n-1)-1`.

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
