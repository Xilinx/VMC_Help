# Window Function
Window function implementation targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/DSP/Buffer IO

## Description

Window function implementation targeted for AI Engines. This block is
applies a windowing function such as Hamming to a
frame of input data samples. It is usually used in conjunction with an FFT block.

## Parameters

#### Input/Output data type

Describes the type of individual data samples input/output of the
  FFT. It can be cint16, cint32, or cfloat types.

#### Function coefficient data type

Describes the type of individual coefficients of the filter taps. It
  should be one of int16, int32, or float and must also satisfy the
  following rules:
  - Complex types are only supported when the Input/Output data type is
    also complex.
  - 32-bit types are only supported when the Input/Output data type is
    also a 32-bit type.
  - Filter coefficients data type must be an integer type if the
    Input/Output data type is an integer type.
  - Filter coefficients data type must be a float type if the
    Input/Output data type is a float type.

#### Function coefficients
Specifies the filter coefficients as a vector of (N+1)/4+1 elements,
  where 'N' is a positive integer that represents the filter length and
  must be in the range 4 to 240 inclusive.

#### FFT/IFFT point size
Specifies the maximum FFT/IFFT size that is supported by the FFT block.
  You can perform different lengths of FFT/IFFT on different input data
  frames. It must be a power of 2 with a minimum value of 16. The
  maximum value supported by this block is 65536.

#### Use dynamic point size
This option is primarily checked when the block is used with the [Dynamic point FFT block](../FFT_Dynamic_Point/README.md). When unchecked, each input frame will be of the size _Window size_ though the _Input size_ can be an integer multiple of the _Window size_ indicating the procesing of multiple frames together. When this option is checked, each window must be preceeded by a 256bit header to describe the run-time parameters of that window. Note that the _Window size_ parameter does not include this header. The format of the header is described in the table below. When checked, the _Windows size_ parameter describes the maximum window size which may be input.

Field name	Location (TT_DATA sample)	Description
Direction	0 (real part)	0 (inverse FFT) 1 (forward FFT)
Point size (radix2 stages)	1 (real part)	Point size described as a power of 2. E.g. 5 described a point size of 32.
Reserved	2 OR 6 for TT_DATA=cint16	reserved
Status (output only)	3 (real part) OR 7 for TT_DATA=cint16	0 = legal point size, 1 = illegal point size
The locations are set to suit TT_DATA type. That is, for TT_DATA=cint16, direction is described in the first cint16 (real part) of the 256 bit header and point size is described in the real part of the second cint16 value. Similarly, for TT_DATA=cint32, the real part of the first cint32 value in the header holds the direction field and the second cint32 value’s real part holds the Point size (radix2) field.

Note that for TT_DATA=cfloat, the values in the header are expected as cfloat and are value-cast (not reinterpret-cast) to integers internally. The output window also has a header. This is copied from the input header except for the status field, which is inserted. The status field is ignored on input. If an illegal point size is entered, the output header will have this field set to a non-zero value and the remainder of the output window is undefined.

When this option is checked, the window will operate on frames of _Window size_ or (_Window size_)/2^N down to 16. Since the window values cannot be faithfully determined by sampling or interpolating from the provided parent array, it is necessary when in this mode to provide an array holding the window values for each window size. Since this is a full array of (_Window size_)*(1+ 1/2 + 1/4 + …) the overall table size provided must be (_Window size_) * 2. For example, for (_Window size_)=64, the values of the window coefficients for a window size of 64 will occupy array indices 0 to 63. The coefficients for window size of 32 will occupy indices 64 thru 95, and those for windows size of 16 will occupy 96 thru 111.

#### Input frame size (Number of Samples)

Specifies the number of samples in the input frame excluding the
  header. The value must be in the range 16 to 65536 and the default
  value is 64.

#### Scale output down by 2^

Describes the power of 2 shift down applied before output.

## Examples 

***Click on the images below to open each model.***

[![](./Images/WindowFunctionModel1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.2/Examples/Block_Help/AIE/WindowFunction_Ex1)
  
### References
This block uses the Vitis DSP library implementation of a FFT window function. For more details on this implementation please click [here](https://docs.amd.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fft_window.html).
 

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
