# Window Function

![](./Images/hnb1664288782630.png)

## Library

AI Engine/DSP/Window IO

## Description

Window function implementation targeted for AI Engines. This block is
the utility to apply a windowing (scaling) function such as Hamming to a
frame of input window data samples.

## Parameters

Main  
Input/Output Data Type:

- Describes the type of individual data samples input/output of the
  dynamic point FFT. It can be cint16, cint32, or cfloat types.

Filter coefficients data type:

- Describes the type of individual coefficients of the filter taps. It
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

Filter coefficients:

- Specifies the filter coefficients as a vector of (N+1)/4+1 elements,
  where 'N' is a positive integer that represents the filter length and
  must be in the range 4 to 240 inclusive.

FFT Maximum Size:

- Specifies the maximum FFT size that is supported by Dynamic point FFT.
  You can perform different lengths of FFT on different input data
  frames. It must be a power of 2 with a minimum value of 16. The
  maximum value supported by the library element is 65536.

Use dynamic point size:

- Describes whether to support run time selectable point size for the
  frames of data within the AIE window to be processed.
- For dynamic FFT, point size specifies the maximum point size and data
  can have smaller point sizes based on the header information. It is
  not trivial to derive the corresponding window function for each point
  size from the max point size. Hence, for example, if you specify the
  point size as 64, then you should specify 128 length coefficients
  where first 64 coefficients specify window function for point size of
  64, the next 32 for the point size of 32, and so on.
- When the flag is enabled, the coefficient list array must specify the
  weights for the maximum point size and all smaller point sizes, so it
  must be in the range FFT_POINT_SIZE + FFT_POINT_SIZE/2 to
  2\*FFT_POINT_SIZE.

Input Window Size:

- Specifies the number of samples in the input frame excluding the
  header. The value must be in the range 16 to 65536 and the default
  value is 64.

Scale Output down by 2^:

- Describes the power of 2 shift down applied before output.

SSR:

- This parameter is intended to improve performance and support FFT
  sizes beyond the limitations of a single tile. For an SSR value of 'n'
  (which must be of the form 2^N, where N is a positive integer), the
  FFT operation is performed in parallel and the actual FFT size is
  divided by 'n'. For example, a 16384 point FFT with SSR value of 8
  creates 8 stream inputs and there will be 8 subframe FFTs each of
  point size 2048. The specified FFT size and SSR values should be such
  that FFT size / SSR should not exceed 2048.