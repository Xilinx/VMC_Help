<!-- Library: aieDSP -->

# IFFT Stream
Stream-based IFFT implementation targeted for AI Engines.
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

Stream-based IFFT implementation targeted for AI Engines. The IFFT block
has two stream ports per subframe processor to maximize performance. The
specified value for SSR parameter should be of the form 2^N, where N is
a positive integer.

## Parameters

### Main  
#### Input data type  
Set the data type of the block input. The data type of the input signal to the block must match this setting. Valid types are `cint16`, `cint32`, `cfloat`.

#### Output data type
Set the data type of the block output. Valid types are `cint16`, `cint32`, `cfloat`.

#### Twiddle factor data type
Describes the data type of the twiddle factors of the transform. It must be `cint16`, `cint32`, or `cfloat` and must also satisfy the following rules:
* 32-bit twiddle factors are only supported when the input/output data type is also 32-bit.
* The twiddle factor data type must be an integer type if the input/output data type is an integer type.
* The twiddle factor data type must be `cfloat` if the input/output data type is a float type.

#### IFFT Size

This is an unsigned integer which describes the point size of the
  transformation. This must be 2^N, where N is in the range 4 to 16
  inclusive.

#### Input Frame Size (Number of Samples)

Specifies the number of samples for a particular frame. The value must
  be in the range 8 to 1024 and the default value is 64. The IFFT
  operation will not begin until this number of samples has been input.

#### Scale Output Down by 2^

Describes the power of 2 shift down applied before output. The
  following table shows the range of valid values of this parameter for
  different data types.
  
  | Data Type | Scale output down by 2^     |
  |-----------|-----------------------------|
  | cint16    | \[0, log2(IFFT Size) + 15\] |
  | cint32    | \[0, log2(IFFT Size) + 31\] |
  | cfloat    | 0                           |

#### Rounding mode

Describes the selection of rounding to be applied during the shift down stage of processing.

The following modes are available:
* **Round to positive infinity:** Round halfway towards positive infinity.
* **Round to negative infinity:** Round halfway towards negative infinity.
* **Round symmetrical to infinity:** Round halfway towards infinity (away from zero).
* **Round symmetrical to zero:** Round halfway towards zero (away from infinity).
* **Round convergent to even:** Round halfway towards nearest even number.
* **Round convergent to odd:** Round halfway towards nearest odd number.

These modes round to the nearest integer. They differ only in how they round for values that are exactly between two integers.

#### Saturation mode

Describes the selection of saturation to be applied during the shift down stage of processing.

The following modes are available:
* **None:** No saturation is performed and the value is truncated on the MSB side.
* **Asymmetric:** Rounds an n-bit signed value in the range `-2^(n-1)` to `2^(n-1)-1`.
* **Symmetric:** Rounds an n-bit signed value in the range `-2^(n-1)-1` to `2^(n-1)-1`.

#### Twiddle Mode
This parameter controls the amplitude of the twiddle factors. It applies to `cint16` and `cint32` twiddle factors only; it does not apply to `cfloat` twiddle factors.

Twiddle mode 0 means use max amplitude twiddles which saturate at `2^(N-1)-1`, where N is the number of bits in the type (e.g. `cint16` has 16 bits per component).

Twiddle mode 1 means use 1/2 max magnitude twiddles, i.e. `2^(N-1)`. This avoids saturation, but loses 1 bit of precision and so noise overall will be higher.

#### Use Widget for SSR Kernels
This parameter is applicable to streaming and parallel (SSR>1) implementations of the FFT. These implementations require stream to window conversions on the hardware.

When this parameter is disabled, stream to window conversion will occur within the FFT kernels themselves.

When this parameter is enabled, stream to window conversion will occur on its own AI Engine tiles. This will improve performance at the expense of additional tiles being used.

#### SSR

This parameter is intended to improve performance and support IFFT
  sizes beyond the limitations of a single tile. For an SSR value of 'n'
  (which must be of the form 2^N, where N is a positive integer), the
  IFFT operation is performed in parallel and the actual IFFT size is
  divided by 'n'. For example, a 16384 point IFFT with SSR value of 8
  creates 8 stream inputs and there will be 8 subframe IFFTs each of
  point size 2048. The specified IFFT size and SSR values should be such
  that (2 \* IFFT size / SSR) is in the range of 16 and 4096.

####  Number of Cascade Stages
This determines the number of kernels the IFFT will be divided over in series to improve throughput. For int data types, and FFT size of 2^N, the maximum cascade length is N/2 when N is even and (N+1)/2 when N is odd. For float data type, the maximum cascade length is N.

## Examples 

***Click on the images below to open each model.***

[![](./Images/IFFT_Stream_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/IFFT_Stream_Ex1)


<!--
DESCRIPTION:
Model: IFFT_Stream_Ex1
Generated: 13-Jan-2026 15:37:25

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: IFFT Stream
  - AIE: To Fixed Size

Model Annotations:
  p, li { white-space: pre-wrap; }
  Observation on IFFT Output:
  Complex Signal in time-domain
  Outut Frame Size = 1024
  AIE & Simulink IFFT output signals are matching

  Simulink_IFFT and scaling

  p, li { white-space: pre-wrap; }
  Model Configuration Parameters:
  IFFT Size = 1024
  Input sampling rate = 8 MHz
  SSR = 2
  Output scale down factor = 2^2
  Input signal frequency = 2 MHz

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine IFFT Stream block. A 2MHz complex input signal is provided to the block,  and the block's output is compared to a Simulink golden reference.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: IFFT_Stream_Ex1
% Essential setup focusing on critical parameters

modelName = 'IFFT_Stream_Ex1';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% CRITICAL: Twiddle factor data type rules:
%   - Must be cint16/cint32/cfloat
%   - Must match input/output type (int→int, float→float)


% IFFT Stream
add_block('aieDSP/IFFT Stream', [modelName '/AIE_IFFT Stream']);
set_param([modelName '/AIE_IFFT Stream'], ...
    'data_type', 'cint16', ...
    'twiddle_type', 'cint16', ...
    'point_size', '1024', ...
    'input_window_size', '1024', ...
    'shift_val', '2', ...
    'ssr', '2');

-->


[![](./Images/IFFT_Stream_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/IFFT_Stream_Ex2)


<!--
DESCRIPTION:
Model: IFFT_Stream_Ex2
Generated: 13-Jan-2026 15:37:25

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: IFFT Stream
  - AIE: To Fixed Size

Model Annotations:
  p, li { white-space: pre-wrap; }
  Observation on IFFT Output:
  Complex Signal in time-domain
  Outut Frame Size = 1024
  AIE & Simulink IFFT output signals are matching

  p, li { white-space: pre-wrap; }
  Model Configuration Parameters:
  IFFT Size = 1024
  Input sampling rate = 8 MHz
  SSR = 4
  Output scale down factor = 2^2
  Input signal frequency = 2 MHz

  Simulink_IFFT and scaling

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine IFFT Stream block. A 2MHz complex input signal is provided to the block,  and the block's output is compared to a Simulink golden reference.

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: IFFT_Stream_Ex2
% Essential setup focusing on critical parameters

modelName = 'IFFT_Stream_Ex2';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% CRITICAL: Twiddle factor data type rules:
%   - Must be cint16/cint32/cfloat
%   - Must match input/output type (int→int, float→float)


% IFFT Stream
add_block('aieDSP/IFFT Stream', [modelName '/AIE_IFFT Stream']);
set_param([modelName '/AIE_IFFT Stream'], ...
    'data_type', 'cint16', ...
    'twiddle_type', 'cint16', ...
    'point_size', '1024', ...
    'input_window_size', '1024', ...
    'shift_val', '2', ...
    'ssr', '4');

-->


## References
This block uses the Vitis DSP library implementation of IFFT. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fft-ifft-aie-only.html).

--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
