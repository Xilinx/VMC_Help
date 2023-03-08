# FIR Asymmetric
This block implements the Single Rate Asymmetric FIR Filter targeted for AI Engines.
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Window IO

## Description

This block implements the Single Rate Asymmetric FIR Filter targeted for
AI Engines.

## Parameters

### Main  
#### Input data type/Output data type  
Describes the type of individual data samples input to and output from
the filter function. int16, cint16, int32, cint32, float, cfloat.

#### Filter coefficients data type  
Describes the type of individual coefficients of the filter taps. It
should be one of int16, cint16, int32, cint32, float, or cfloat and must
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
filter coefficients via an input port.

#### Filter coefficients  
This field specifies the asymmetric filter coefficients. It could also be a MATLAB array variable defined in the workspace.

#### Input window size (Number of samples)  
Describes the number of samples used as an input to the filter function.
The number of values in the output window will be equal to input window
size also by virtue of the single rate nature of this function.

#### Scale output down by 2^  
Describes the power of 2 shift down applied to the accumulation of FIR
terms before output.

#### Rounding mode  
Describes the selection of rounding to be applied during the shift down
stage of processing. The rounding options are as follows:

1.  Floor (truncate)
2.  Ceiling
3.  Round to positive infinity
4.  Round to negative Infinity
5.  Round symmetrical to Infinity
6.  Round symmetrical to zero
7.  Round convergent to even
8.  Round convergent to odd

Modes 2 to 7 round to the nearest integer. They differ only in how they
round for the value of 0.5.

#### Number of cascade stages  
Determines the number of AI Engine processors to split the operation over. 
This allows resources to be traded for higher throughput.

### Examples
[AI Engine FIR Assymetric](https://github.com/Xilinx/Vitis_Model_Composer/tree/HEAD/Examples/AIENGINE/DSPlib/fir)
