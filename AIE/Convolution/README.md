<!-- Library: aieDSP -->

# Convolution

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

This Convolution block computes the convolution between two input signals F and G using AI Engine resources.
It supports both integer and floating-point data types and provides various configuration options for scaling, rounding and computation mode.

## Parameters

### Main  
#### F input data type
Describes the type of individual data samples of signal F to input to the function.

This must be one of the following:
* `int16`, `int32`, `cint16`, `cint32`, `cfloat`, and `float` for AIE
* `int8`, `int16`, `int32`, `cint16`, `cint32`, `float`, and `bfloat16`  for AIE-ML and AIE-MLv2

#### G input data type
Describes the type of individual data samples of signal G to input to the function.

This must be one of the following:
* `int16`, `int32`, `cint16`, `cfloat`, and `float` for AIE
* `int8`, `int16`, `int32`, `cint16`, `float`, and `bfloat16`  for AIE-ML and AIE-MLv2

#### Output data type
Describes the type of individual data samples output from the function.

This must be one of the following:
* `int16`, `int32`, `cint16`, `cint32`, `cfloat`, and `float` for AIE
* `int16`, `int32`, `cint16`, `cint32`, and `float` for AIE-ML and AIE-MLv2

> For a list of valid combinations of **F input data type**, **G input data type**, and **Output data type**, refer to the [Vitis Libraries documentation](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-conv-corr.html_2).

#### Computation mode

Specifies the convolution computation type.
Options include:

* ***Full (0)***: Produces the full convolution result of length `F_length + G_length - 1`.

* ***Same (1)***: Produces the convolution result of length `max(F_length, G_length)`.

* ***Valid (2)***: Produces the convolution result of length `F_length - G_length + 1`, zero-padded up to the nearest multiple of 256 bits (the number of samples will vary with data type).


#### F input length
Specifies the length of the F input signal.

#### G input length
Specifies the length of the G input signal.

<!--
#### Specify G input length via input port
When enabled, allows the G input length to be specified via an [asynchronous Run Time Parameter (RTP)](https://github.com/Xilinx/Vitis_Model_Composer/blob/2025.2/Examples/AIENGINE/Run_Time_Parameters/rtp_vector_async) input port.

The exposed RTP expects an `int32` vector of length 2. This vector contains values for the F length and G length. Currently the first element of the vector (`rtpVecLen[0]`) is ignored. The second element of the vector (`rtpVecLen[1]`) is used to specify the G length.

The input length specified at runtime cannot exceed the input length specified in the block parameters. For example, if **G input length** is set to 32, you can set `rtpVecLen[1]` to 16 but not 64. This will not produce an error at runtime, but the block results will be incorrect.
-->

#### Number of frames
Specifies the number of frames to be processed on each invocation of the block.

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

[![](./Images/Convolution_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Convolution_Ex1)


<!--
DESCRIPTION:
Model: Convolution_Ex1
Generated: 13-Jan-2026 15:36:46

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Convolution

Model Annotations:
  p, li { white-space: pre-wrap; }
  Convolving a signal with itself

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Convolution block.  and the output is visualized for analysis.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Convolution_Ex1
% Essential setup focusing on critical parameters

modelName = 'Convolution_Ex1';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');


% Convolution
add_block('aieDSP/Convolution', [modelName '/Convolution']);
set_param([modelName '/Convolution'], ...

-->


[![](./Images/Convolution_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Convolution_Ex2)


<!--
DESCRIPTION:
Model: Convolution_Ex2
Generated: 13-Jan-2026 15:36:47

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Convolution

Model Annotations:
  p, li { white-space: pre-wrap; }
  Model Parameter Settings:
  Input data type: cint16
  Output data type: cint16
  F Length: 64
  G Length: 32
  Computation mode: Same

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Convolution block.  and the output is visualized for analysis.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Convolution_Ex2
% Essential setup focusing on critical parameters

modelName = 'Convolution_Ex2';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');


% Convolution
add_block('aieDSP/Convolution', [modelName '/Convolution']);
set_param([modelName '/Convolution'], ...

-->


[![](./Images/Convolution_Ex3.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Convolution_Ex3)


<!--
DESCRIPTION:
Model: Convolution_Ex3
Generated: 13-Jan-2026 15:36:47

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Convolution

Model Annotations:
  p, li { white-space: pre-wrap; }
  Model Parameter Settings:
  Input data type: cint16
  Output data type: cint16
  F Length: 64
  G Length: 32
  Computation mode: Valid

  p, li { white-space: pre-wrap; }
  AIE output length is always aligned to the number of LANES for a given data type combination.
  For cint16 x cint16, the number of LANES is 8.
  Actual_Output_Length is F_Length-G_Length + 1 = 33.
  AIE_Output_Length = (ceil(Actual_Output_Length, LANES ) * LANES)
  For the above configuration, AIE Output Length= ( ceil(33,8) * 8) = 5*8 = 40
  Thus, the first 33 samples are valid output samples, while the remaining 7 samples are padded with zeros.

  p, li { white-space: pre-wrap; }
  Note: LANES in AIE:
  It depends on data type width (int16, int32, float, cint16, etc.).
  Each AIE vector register is 256 bits wide, so the number of lanes is:
  LANES = Vector Register Width (bits)​ / Bits per Sample (bits)
  cint16 = complex int16 → 16 bits for real + 16 bits for imag = 32 bits per sample.
  A 256-bit register can hold:
  256/32 = 8 LANES
  ​

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Convolution block.  and the output is visualized for analysis.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Convolution_Ex3
% Essential setup focusing on critical parameters

modelName = 'Convolution_Ex3';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');


% Convolution
add_block('aieDSP/Convolution', [modelName '/Convolution']);
set_param([modelName '/Convolution'], ...

-->


## References
This block uses the Vitis DSP library implementation of Convolution. For more details on this implementation please click [here](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-conv-corr.html).

--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
