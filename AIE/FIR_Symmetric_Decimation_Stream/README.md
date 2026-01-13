<!-- Library: aieDSP -->

# FIR Symmetric Decimation Stream

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

This block implements the stream-based FIR Symmetric Decimation filter
targeted for AI Engines.

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
When this option is enabled, a second stream input can be connected to the FIR, increasing available throughput. When using a second stream input, the data should be organized in a 128-bit interleaved pattern. For example, for a cint16 input samples 0-3 should be sent over the first stream and samples 4-7 should be sent over the second stream.

#### Provide second set of output ports
When this option is enabled, a second stream output is added to the block. The two output data streams are interleaved in a 128-bit pattern. For example, for cint16 output data, samples 0-3 will be sent on the first output stream and samples 4-7 will be sent on the second output stream.

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

#### Input frame size (Number of samples)  
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

#### Number of parallel input/output (SSR)  
This parameter specifies the number of input (or output) ports and must
be of the form 2^N, where N is a non-negative integer.

#### Number of cascade stages:
This determines the number of kernels the FIR will be divided over in series to improve throughput.

The number of AI Engine tiles used is determined by `(SSR)^2 * (Number of cascade stages)`.

## Examples

***Click on the images below to open each model.***

[![](./Images/FIR_Symmetric_Decimation_Stream_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/FIR_SymmetricDecimatorStream_Ex1)


<!--
DESCRIPTION:
Model: FIR_SymmetricDecimatorStream_Ex1
Generated: 13-Jan-2026 15:37:11

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: FIR Symmetric Decimation Stream

Model Annotations:
  p, li { white-space: pre-wrap; }
  MATLAB Function to generate Filter Coefficients:

  p, li { white-space: pre-wrap; }
  function [coeffs, AIE_Coeffs] = FIR_Symmetric_DecimatorStream_Coeff()
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
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine FIR Symmetric Decimation Stream block. A 2kHz complex input signal is provided to the block, 

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: FIR_SymmetricDecimatorStream_Ex1
% Essential setup focusing on critical parameters

modelName = 'FIR_SymmetricDecimatorStream_Ex1';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% CRITICAL: FIR Symmetric uses half-length coefficient vector
% Provide first half + center tap for odd lengths


% FIR Symmetric Decimation Stream
add_block('aieDSP/FIR Symmetric Decimation Stream', [modelName '/AIE_SymmetricFIRStream_DecimationFactor = 2 & OutputScaling:2^15 ']);
set_param([modelName '/AIE_SymmetricFIRStream_DecimationFactor = 2 & OutputScaling:2^15 '], ...
    'data_type', 'cint16', ...
    'coef_type', 'int16', ...
    'use_coeff_reload', 'on', ...
    'coeff', '[1, zeros(1, 15)]', ...
    'fir_length', '64', ...
    'input_window_size', '128', ...
    'shift_val', '15', ...
    'ssr', '1');

-->


[![](./Images/FIR_Symmetric_Decimation_Stream_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/FIR_SymmetricDecimatorStream_Ex2)


<!--
DESCRIPTION:
Model: FIR_SymmetricDecimatorStream_Ex2
Generated: 13-Jan-2026 15:37:11

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: FIR Symmetric Decimation Stream
  - AIE: To Fixed Size

Model Annotations:
  p, li { white-space: pre-wrap; }
  MATLAB Function to generate Filter Coefficients:

  p, li { white-space: pre-wrap; }
  function [coeffs, AIE_Coeffs] = FIR_Symmetric_DecimatorStream_Coeff()
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
  AIE_Coeffs = (int16(coeffs(1:32)*2^15));
  end

  p, li { white-space: pre-wrap; }
  Observation on Filtered ouput:
  Output Frame Size = 512
  Output Sampling Rate = 50 ksps (Input Sampling Rate / Decimation Factor)
  Output: Complex Signal spectrum with 2 KHz frequency

  p, li { white-space: pre-wrap; }
  Model parameter settings:
  Decimation Factor = 2
  Input Frame Size = 1024
  Input Sampling Rate = 100 ksps
  Scaling:  2^15
  Number of parallel paths (SSR)  = 4
  Input: Complex Signal with 2 KHz frequency

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine FIR Symmetric Decimation Stream block. A 2kHz complex input signal is provided to the block, 

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: FIR_SymmetricDecimatorStream_Ex2
% Essential setup focusing on critical parameters

modelName = 'FIR_SymmetricDecimatorStream_Ex2';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% CRITICAL: FIR Symmetric uses half-length coefficient vector
% Provide first half + center tap for odd lengths


% FIR Symmetric Decimation Stream
add_block('aieDSP/FIR Symmetric Decimation Stream', [modelName '/AIE_SymmetricFIRStream_DecimationFactor = 2 & OutputScaling:2^15 ']);
set_param([modelName '/AIE_SymmetricFIRStream_DecimationFactor = 2 & OutputScaling:2^15 '], ...
    'data_type', 'cint16', ...
    'coef_type', 'int16', ...
    'use_coeff_reload', 'off', ...
    'coeff', 'AIE_Coeffs', ...
    'fir_length', '64', ...
    'input_window_size', '1024', ...
    'shift_val', '15', ...
    'ssr', '4');

-->


[![](./Images/FIR_Symmetric_Decimation_Stream_Ex3.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/FIR_SymmetricDecimatorStream_Ex3)


<!--
DESCRIPTION:
Model: FIR_SymmetricDecimatorStream_Ex3
Generated: 13-Jan-2026 15:37:12

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: FIR Symmetric Decimation Stream
  - AIE: To Fixed Size

Model Annotations:
  p, li { white-space: pre-wrap; }
  MATLAB Function to generate Filter Coefficients:

  p, li { white-space: pre-wrap; }
  function [coeffs, AIE_Coeffs] = FIR_Symmetric_DecimatorStream_Coeff()
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
  AIE_Coeffs = (int16(coeffs(1:32)*2^15));
  end

  p, li { white-space: pre-wrap; }
  Observation on Filtered ouput:
  Output Frame Size = 512
  Output Sampling Rate = 50 ksps (Input Sampling Rate / Decimation Factor)
  Output: Complex Signal spectrum with 2 KHz frequency

  p, li { white-space: pre-wrap; }
  Model parameter settings:
  Decimation Factor = 2
  Input Frame Size = 1024
  Input Sampling Rate = 100 ksps
  Scaling:  2^15
  Number of parallel paths (SSR)  = 4
  Input: Complex Signal with 2 KHz frequency

  p, li { white-space: pre-wrap; }
  FIR Symmetric Decimation Stream example with reloadable coefficients and SSR>1

  p, li { white-space: pre-wrap; }
  Note: For SSR>1, each additional coefficient port must be a duplicate of the complete coefficient array.

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine FIR Symmetric Decimation Stream block. A 2kHz complex input signal is provided to the block,  and the output is visualized for analysis.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: FIR_SymmetricDecimatorStream_Ex3
% Essential setup focusing on critical parameters

modelName = 'FIR_SymmetricDecimatorStream_Ex3';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% CRITICAL: FIR Symmetric uses half-length coefficient vector
% Provide first half + center tap for odd lengths


% FIR Symmetric Decimation Stream
add_block('aieDSP/FIR Symmetric Decimation Stream', [modelName '/AIE_SymmetricFIRStream_DecimationFactor = 2 & OutputScaling:2^15 ']);
set_param([modelName '/AIE_SymmetricFIRStream_DecimationFactor = 2 & OutputScaling:2^15 '], ...
    'data_type', 'cint16', ...
    'coef_type', 'int16', ...
    'use_coeff_reload', 'on', ...
    'coeff', 'AIE_Coeffs', ...
    'fir_length', '64', ...
    'input_window_size', '1024', ...
    'shift_val', '15', ...
    'ssr', '4');

-->


### References

This block uses the Vitis DSP library implementation of a FIR filter. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fir-filtersAIE.html).

--------------

Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
