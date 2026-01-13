<!-- Library: aieDSP -->

# FIR Symmetric Decimation

  
![](./Images/block.png)  

## Library

AIE Engine/DSP/Buffer IO

## Description

This block implements the FIR Symmetric Decimation Filter targeted for
AI Engines.

## Parameters

### Main  
#### Input/Output data type  
Describes the type of individual data samples input to and output from
the filter function. int16, cint16, int32, cint32, float, cfloat.

#### Filter coefficients data type  
Describes the type of individual coefficients of the filter taps. It
should be one of int16, cint16, int32, cint32, float, cfloat and must
also satisfy the following rules:

  - Complex types are only supported when the Input/Output data type is
  also complex.
  - 32-bit types are only supported when the Input/Output data type is
  also a 32-bit type.
  - Filter coefficients data type must be an integer type if the
  Input/Output data type is an integer type.
  - Filter coefficients data type must be a float type if the Input/Output
  data type is a float type.

#### Specify filter coefficients via input port  
When this option is enabled, the tool allows you to specify reloadable
filter coefficients via an [asynchronous Run Time Parameter (RTP)](https://github.com/Xilinx/Vitis_Model_Composer/blob/2025.2/Examples/AIENGINE/Run_Time_Parameters/rtp_vector_async) input port.

#### Provide second set of input ports
When this option is enabled, a second input port can be connected to the FIR, increasing available throughput. In Simulink, both input ports should be connected to the same signal.

This setting is an implementation trade-off between performance and data bank resources. When this option is disabled, the FIR performance may be limited by load contention; when this option is enabled, two RAM banks are used for input, reducing load contention.

#### Provide second set of output ports
When this option is enabled, a second output port is added to the block producing the same data as the first output port.

#### Filter coefficients  

<font color=red><b>WARNING:</b></font> Before using this block with coefficients that are odd symmetric, refer to this [Answer Record](https://adaptivesupport.amd.com/s/article/000038190).

This field should only be supplied for the first half of the filter
length plus the center tap for odd lengths i.e., taps\[\] = {c0, c1, c2,
..., cN \[, cCT\]} where N = (FILTER_LENGTH)/2 and cCT is the center tap
where FILTER_LENGTH is odd. For example, a 9-tap filter might use coeffs
(1, 3, 2, 3, 5, 3, 2, 3, 1). This could be input as taps\[\]= {1,3,2,3,5}
because the context of symmetry allows the remaining coefficients to be
inferred.

#### Filter length  
This is an unsigned integer which describes the number of taps in the
filter. The filter length must be in the range 4 to 240 and must be an
integer multiple of the decimation factor.

#### Decimation factor  
An unsigned integer which describes the decimation factor of the filter.
It must be in the range 2 to 3. For larger factors, use the FIR
Asymmetric decimation filter.

#### Input window size (Number of samples)  
Describes the number of samples used as an input to the filter function.
The number of values in the output window will be the input window size
divided by decimation factor by virtue of the decimation factor.

#### Scale output down by 2^  
Describes power of 2 shift down applied to the accumulation of FIR terms
before output. It must be in range 0 to 61.

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

#### Number of cascade stages  
This determines the number of kernels the FIR will be divided over in series to improve throughput.

The number of AI Engine tiles used is determined by `(SSR)^2 * (Number of cascade stages)`.

## Examples

***Click on the images below to open each model.***

[![](./Images/FIR_SymmetricDecimation_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/FIR_Symmetric_Decimation_Ex1)


<!--
DESCRIPTION:
Model: FIR_Symmetric_Decimation_Ex1
Generated: 13-Jan-2026 15:37:14

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: FIR Symmetric Decimation

Model Annotations:
  p, li { white-space: pre-wrap; }
  MATLAB Function to generate Filter Coefficients:

  p, li { white-space: pre-wrap; }
  function coeffs = FIR_Symmetric_Decimator_Coeff()
  Fs = 100000;  % Sampling Frequency
  Fpass = 5000;              % Passband Frequency
  Fstop = 10000;             % Stopband Frequency
  Dpass = 0.0046051376314;   % Passband Ripple
  Dstop = 0.00025118864315;  % Stopband Attenuation
  dens  = 16;                % Density Factor
  % Calculate the order from the parameters using FIRPMORD.
  [N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
  % Calculate the coefficients using the FIRPM function.
  coeffs = firpm(N, Fo, Ao, W, {dens});
  end

  p, li { white-space: pre-wrap; }
  Observation on Filtered ouput:
  Output Frame Size = 64
  Output Sampling Rate = 50 ksps (Input Sampling Rate / Decimation Factor)
  Output: Complex Signal spectrum with 2 KHz frequency

  p, li { white-space: pre-wrap; }
  Model parameter settings:
  Decimation Factor = 2
  Input Frame Size = 128
  Input Sampling Rate = 100 ksps
  Scaling:  2^15
  Input: Complex Signal with 2 KHz frequency

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine FIR Symmetric Decimation block. A 2kHz complex input signal is provided to the block, 

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: FIR_Symmetric_Decimation_Ex1
% Essential setup focusing on critical parameters

modelName = 'FIR_Symmetric_Decimation_Ex1';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% CRITICAL: FIR Symmetric uses half-length coefficient vector
% Provide first half + center tap for odd lengths


% FIR Symmetric Decimation
add_block('aieDSP/FIR Symmetric Decimation', [modelName '/AIE_SymmetricFIR_DecimationFactor = 2 & OutputScaling:2^15 ']);
set_param([modelName '/AIE_SymmetricFIR_DecimationFactor = 2 & OutputScaling:2^15 '], ...
    'data_type', 'cint16', ...
    'coef_type', 'int16', ...
    'use_coeff_reload', 'on', ...
    'coeff', 'int16(firpm(31, [0;0.1;0.2;1], [1;1;0;0], [1;18.3333831245308], {16})*2^15)', ...
    'fir_length', '64', ...
    'input_window_size', '128', ...
    'shift_val', '15', ...
    'ssr', '1');

-->


### References
This block uses the Vitis DSP library implementation of a FIR filter. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fir-filtersAIE.html).
--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
