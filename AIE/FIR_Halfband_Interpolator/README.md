# FIR Halfband Interpolator

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Window IO

## Description

This block implements the FIR Halfband Interpolator targeted for AI
Engines.

## Parameters

Main  
Input data type/Output data type  
Describes the type of individual data samples input to and output from
the filter function. int16, cint16, int32, cint32, float, cfloat.

Filter coefficients data type  
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

Specify filter coefficients via input port  
When this option is enabled, the tool allows you to specify reloadable
filter coefficients via the input port.

Filter coefficients  
Specifies the filter coefficients as a vector of (N+1)/4+1 elements,
where 'N' is a positive integer that represents the filter length and
must be in the range 4 to 240 inclusive.

Input window size (Number of samples)  
Describes the number of samples used as an input to the filter function.
The number of values in the output window will be the Input window size
multiplied by two by virtue of the halfband interpolation factor.

Scale output down by 2^  
Describes the power of 2 shift down applied to the accumulation of FIR
terms before output. It must be in the range 0 to 61.

Rounding mode  
Describes the selection of rounding to be applied during the shift down
stage of processing. The rounding options are as follows:

1.  Floor (truncate)
2.  Ceiling
3.  Round to positive infinity
4.  Round to negative infinity
5.  Round symmetrical to infinity
6.  Round symmetrical to zero
7.  Round convergent to even
8.  Round convergent to odd

Modes 2 to 7 round to the nearest integer. They differ only in how they
round for the value of 0.5.

Use center tap to upshift data  
To upshift the data sample by the center tap coefficient (or its real
part) position.

- When it is set to 0, the center tap coefficient will be treated as any
  other coefficient.
- When it is set to 1, the provided center tap's value will be used to
  upshift the input data sample.
  - taps\[\] = {c0, c2, c4, ..., cN, cCT} where N = (TP_FIR_LEN+1)/4 and
    cCT is the center tap.
    Note: When complex coefficients are used, the center tap's real part
    will be used for the upshift.

    Note: Upshift is only supported with 16-bit coefficient types (i.e.,
    int16 and cint16).

    Note: When Upshift is enabled, the center tap value must be in the
    range 0 to 47.

Example 1:

A 7-tap FIR halfband interpolator has coefficients (1, 0, 2, 5, 2, 0,
1). This would be input as `taps[]= {1,2,5}` because the context of
halfband interpolation allows the remaining coefficients to be inferred.

Example 2:

A 7-tap FIR halfband interpolator has coefficients (1, 2, 2, 1, 2, 1,
3). Here '3' is the center tap value.

Now, if the input has a data stream of all ones (i.e., 1, 1, 1, etc.):
- If the parameter is unset, the expected output will be: \[1, 3, 2,
  3..\]
- If the parameter is set, the expected output will be: \[1, 2^3, 2,
  2^3...\]=\[1, 8, 2, 8..\]

Advanced  
Target input throughput (MSPS)  
Specifies the rate at which data samples should be processed. The
default value is `200`.

Specify the number of cascade stages  
When this option is not enabled, the tool will determine the filter
configuration that best achieves the specified input sampling rate. When
the option is enabled, the 'Number of cascade stages' can be specified
(which describes the number of AI Engine processors to split the
operation over). However, this allows resource to be traded for higher
performance and the specified input sampling rate constraint may not be
achieved. The value must be in the range 1 to 9.
