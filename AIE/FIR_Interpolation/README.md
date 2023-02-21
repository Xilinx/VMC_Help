# FIR Interpolation

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Window IO

## Description

This block implements the FIR Asymmetric Interpolation filter targeted
for AI Engines.

## Parameters

### Main  
#### Input data type/Output data type  
* Describes the type of individual data samples input to and output from
the filter function. int16, cint16, int32, cint32, float, cfloat.

#### Filter coefficients data type  
* Describes the type of individual coefficients of the filter taps. It
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
* When this option is enabled, the tool allows you to specify reloadable
filter coefficients via the input port.

#### Filter coefficients  
* Specifies the filter coefficients as a vector of (N+1)/4+1 elements,
where 'N' is a positive integer that represents the filter length and
must be in the range 4 to 240 inclusive.

#### Interpolation factor  
* An unsigned integer which describes the interpolation factor of the
filter. It must be in the range 1 to 16.

#### Input window size (Number of samples)  
* Describes the number of samples used as an input to the filter function.
The number of values in the output window will be Input window size
multiplied by interpolation factor.

#### Scale output down by 2^  
* Describes power of 2 shift down applied to the accumulation of FIR terms
before output. It must be in range 0 to 61.

#### Rounding mode  
* Describes the selection of rounding to be applied during the shift down
stage of processing. The rounding options are as follows:

1.  Floor (truncate)
2.  Ceiling
3.  Round to positive infinity
4.  Round to negative infinity
5.  Round symmetrical to infinity
6.  Round symmetrical to zero
7.  Round convergent to even
8.  Round convergent to odd

* Modes 2 to 7 round to the nearest integer. They differ only in how they
round for the value of 0.5.

### Advanced  
#### Target input throughput (MSPS)  
* Specifies the rate at which data samples should be processed. The
default value is `200`.

#### Specify the number of cascade stages  
* When this option is not enabled, tool will determine the filter
configuration that best achieves the specified input sampling rate. When
the option is enabled and the 'Number of cascade stages' is specified,
the tool will guarantee the same. In such cases, however, the specified
input sampling rate constraint may not be achieved.
