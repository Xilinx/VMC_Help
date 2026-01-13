<!-- Library: aieDSP -->

# Mixer Stream

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

This block implements the stream-based Mixer targeted for AI Engines.

## Parameters

### Main  
#### Input/Output data type
Describes the type of individual data samples output of the DDS
  function. It should be cint16, cint32, or cfloat.

#### Input Frame Size (Number of Samples)
Specifies the number of samples in the input frame. The value must be
  in the range 8 to 1024 and the default value is 32.

#### Mixer mode  
This specifies the mixer operation modes. Two modes are supported by
the Mixer function:

* **Single Input Mode**: This is a DDS plus Mixer for a single data input port. Each data input
sample is complex multiplied with the corresponding DDS sample to create
a modulated signal that is written to the output window. This is the
default Mixer mode.

* **Dual Input Mode**: This is a special configuration for symmetrical carriers and two data
input ports. Each data sample of the first input is complex multiplied
with the corresponding DDS sample to create a modulated signal. Each
data sample of the second data input is complex multiplied with the
conjugate (which is equivalent to a signal rotating in the opposite
direction) of the DDS sample to create a second modulated signal. These
two modulated signals are added together and written to the output
window.

#### Number of parallel input/output (SSR):
This parameter specifies the number of input (and output) ports of the Mixer block.
The number of AI Engine kernels used is equal to the value of SSR parameter.

#### Phase Increment
Specifies the phase increment between samples. The value must be in
  the range 0 to 2^31 and the default value is 0. Input value
  2^31 corresponds to Pi (i.e., 180). Phase increment is calculated
  using the formula (Fo\*(2^N)) / Fs where:
  - Fo = Output frequency.
  - N = 32, which represents the accumulator width, and it is fixed.
  - Fs = Sampling frequency.

#### Reload phase increment via input port
Allows the phase increment to be reloaded during simulation via an input port.

#### Initial Phase Offset
Specifies the initial phase offset. The default value is 0.

#### Reload initial phase via input port
Allows the initial phase to be reloaded during simulation via an input port. By default the reload port is a Real-Time Parameter (RTP) port that is non-blocking (async).

#### Use iobuffer port for phase offset reload
Reload the phase offset using an iobuffer port, instead of a Real-Time Parameter (RTP) port. The iobuffer port is a blocking (sync) port, whereas the RTP port is a non-blocking (async) port. 


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

## Examples

***Click on the images below to open each model.***

[![](./Images/Mixer_Stream_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Mixer_stream_Ex1) 


<!--
DESCRIPTION:
Model: Mixer_stream_Ex1
Generated: 13-Jan-2026 15:37:33

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Mixer Stream
  - AIE: To Fixed Size

Model Annotations:
  p, li { white-space: pre-wrap; }
  Note: Phase increment is calculated using the formula (Fo*(2^N)) / Fs
  Where:
  Fo = DDS frequency
  N = 32, which represents the accumulator width, and it is fixed
  Fs = Sampling frequency

  p, li { white-space: pre-wrap; }
  Observation on Mixer output:
  Mixer output signal frequency = 300 KHz (Input signal frequency + DDS signal frequency)
  Output sampling rate: 4MHz

  p, li { white-space: pre-wrap; }
  Model Configuration Parameters:
  Phase Increment: 2^32*(100e3/4e6)
  Input window size: 1024
  Input sampling frequency: 4MHz
  Number of parallel In/Out Ports (SSR): 4

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Mixer Stream block. A 200kHz complex input signal is provided to the block, 

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Mixer_stream_Ex1
% Essential setup focusing on critical parameters

modelName = 'Mixer_stream_Ex1';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% NOTE: Stream blocks use SSR (Super Sample Rate) for parallelism
% Input data is split into SSR parallel streams


% Mixer Stream
add_block('aieDSP/Mixer Stream', [modelName '/Mixer Stream']);
set_param([modelName '/Mixer Stream'], ...
    'data_type', 'cfloat', ...
    'input_window_size', '1024', ...
    'ssr', '4');

-->


[![](./Images/Mixer_Stream_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2025.2/Examples/Block_Help/AIE/Mixer_stream_Ex2) 


<!--
DESCRIPTION:
Model: Mixer_stream_Ex2
Generated: 13-Jan-2026 15:37:34

Vitis Model Composer Configuration:
  Target Device: xcvc1902-vsva2197-1LP-e-S

Vitis Model Composer Blocks:
  - AIE: Mixer Stream
  - AIE: To Fixed Size

Model Annotations:
  p, li { white-space: pre-wrap; }
  Observation on Mixer output:
  Mixer output signal frequency = 300 KHz (Input signal frequency + DDS signal frequency)
  Output sampling rate: 4MHz

  p, li { white-space: pre-wrap; }
  Model Configuration Parameters:
  Phase Increment: 2^32*(100e3/4e6)
  Input window size: 1024
  Input sampling frequency: 4MHz
  Number of parallel In/Out Ports (SSR): 8

  p, li { white-space: pre-wrap; }
  Note: Phase increment is calculated using the formula (Fo*(2^N)) / Fs
  Where:
  Fo = DDS frequency
  N = 32, which represents the accumulator width, and it is fixed
  Fs = Sampling frequency

Description:
This MATLAB script creates a Vitis Model Composer Simulink model that uses the AI Engine Mixer Stream block. A 200kHz complex input signal is provided to the block, 

-->

<!--
MATLAB CREATION SCRIPT:

% Quick Start: Mixer_stream_Ex2
% Essential setup focusing on critical parameters

modelName = 'Mixer_stream_Ex2';
new_system(modelName); open_system(modelName);

% Hub Block - Configure target device
add_block('vmcUtilities/Vitis Model Composer Hub', [modelName '/Hub']);
hubBlk = xmcFindHubBlock(modelName);
vmchub_set_param(hubBlk, modelName, 'SelectHardware', 'xcvc1902-vsva2197-1LP-e-S');

% NOTE: Stream blocks use SSR (Super Sample Rate) for parallelism
% Input data is split into SSR parallel streams


% Mixer Stream
add_block('aieDSP/Mixer Stream', [modelName '/Mixer Stream']);
set_param([modelName '/Mixer Stream'], ...
    'data_type', 'cfloat', ...
    'input_window_size', '1024', ...
    'ssr', '8');

-->


## References
This block uses the Vitis DSP library implementation of Mixer. For more details on this implementation please click [here](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-dds_mixer_intrinsic.html).


--------------
Copyright (C) 2025 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
