# FIR Halfband Decimator
This block implements the FIR Halfband Decimator targeted for AI Engines.
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

This block implements the FIR Halfband Decimator targeted for AI
Engines.

## Parameters

### Main  
#### Input data type/Output data type  
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
filter coefficients via the input port.

**AIE1 Devices:** Specify the filter coefficients as a vector of (N+1)/4+1 elements,
where 'N' is the filter length.

Consider a half-band filter of length 7 with coefficients `[1 0 2 5 2 0 1]`. In this case, the coefficients vector should be set to `[1 2 5]`. 

**AIE-ML Devices:** Specifies the filter coefficients as a vector of (N+1)/2+1 elements,
where 'N' the filter length.

Consider a half-band filter of length 7 with coefficients `[1 0 2 5 2 0 1]`. In this case, the coefficients vector should be set to `[1 2 2 1 5]`.

#### Provide second set of input ports
When this option is enabled, a second input port can be connected to the FIR, increasing available throughput. In Simulink, both input ports should be connected to the same signal.

This setting is an implementation trade-off between performance and data bank resources. When this option is disabled, the FIR performance may be limited by load contention; when this option is enabled, two RAM banks are used for input, reducing load contention.

#### Provide second set of output ports
When this option is enabled, a second output port is added to the block producing the same data as the first output port.

#### Filter coefficients  
Specifies the filter coefficients as a vector of (N+1)/4+1 elements,
where 'N' is a positive integer that represents the filter length and
must be in the range 4 to 240 inclusive.

#### Input window size (Number of samples)  
Describes the number of samples used as an input to the filter function.
The number of values in the output window will be the Input window size
divided by two by virtue of the halfband decimation factor.

#### Scale output down by 2^  
Describes the power of 2 shift down applied to the accumulation of FIR
terms before output. It must be in the range 0 to 61.

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

#### Number of decimator polyphases

Specifies the number of distinct input data phases into which the input stream will be split. In each stream computations are performed in parallel and the outputs are combined into a single output stream. 

Currently, only 2 decimator polyphases are supported for the halfband interpolators with SSR > 1. Each polyphase processes half of the input data stream. 

The first polyphase is implemented using a single rate asymmetric filter that is configured to produce and consume data in parallel in `(SSR)` phases, each phase can operate at maximum throughput depending on the configuration.
The first polyphase uses `(SSR)^2 * (Number of cascade stages)` kernels. 
The second polyphase simplifies into a single kernel that does a single tap because halfband decimators only have one non-zero coefficient in the second coefficient phase. The second polyphase uses `(SSR)` kernels operating at maximum throughput.

The overall theoretical output data rate is `(SSR) * (Number of output ports) * 1 GSa/s`.
The overall theoretical input data rate is `(SSR) * (Number of decimator polyphases) * (Number of input ports) * 1GSa/s`.

When SSR = 1, 1 or 2 decimator polyphases can be used.

#### Number of cascade stages  

This determines the number of kernels the FIR will be divided over to improve throughput.

## Examples

***Click on the images below to open each model.***

[![](./Images/HBDecimator_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.2/Examples/Block_Help/AIE/HalfBandDecimator_Ex1)

[![](./Images/HBDecimator_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.2/Examples/Block_Help/AIE/HalfBandDecimator_Ex2)

### References
This block uses the Vitis DSP library implementation of a FIR filter. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fir-filtersAIE.html).
--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
