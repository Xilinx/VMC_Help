# Window Function Stream

Window function implementation targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/DSP/Stream IO

## Description

Window function implementation targeted for AI Engines. This block is
the utility to apply a windowing (scaling) function such as Hamming to a
frame of input Stream data samples.

The Windowing utility block is only expected to work with FFTs which
only allow 2^n input/output ports.

## Parameters

#### Input/Output data type

Describes the type of individual data samples input/output of the
  FFT. It can be cint16, cint32, and cfloat types.

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
  maximum value supported by the library element is 65536.

#### Use dynamic point size
Describes whether to support run time selectable point size for the
  frames of data within the AIE window to be processed.
* For dynamic FFT, point size specifies the maximum point size and data
  can have smaller point sizes based on the header information. It is
  not trivial to derive the corresponding window function for each point
  size from the max point size. Hence, for example, if we specify point
  size as 64, then we should specify 128 length coefficients where first
  64 coefficients specify window function for point size of 64, the next
  32 for the point size of 32, and so on.
* When the flag is enabled, The coefficient list array must specify the
  weights for the maximum point size and all smaller point sizes, so
  must be in the range FFT_POINT_SIZE + FFT_POINT_SIZE/2 to
  2\*FFT_POINT_SIZE.

#### Input frame size (Number of Samples)

Specifies the number of samples in the input frame excluding the
  header. The value must be in the range 16 to 65536 and the default
  value is 64.

#### Scale Output down by 2^

Describes the power of 2 shift down applied before output.

#### SSR

This parameter is intended to improve performance and support FFT
  sizes beyond the limitations of a single tile. For an SSR value of 'n'
  (which must be of the form 2^N, where N is a positive integer), the
  FFT operation is performed in parallel and the actual FFT size is
  divided by 'n'. For example, a 16384 point FFT with SSR value of 8
  creates 8 stream inputs and there will be 8 subframe FFTs each of
  point size 2048. The specified FFT size and SSR values should be such
  that FFT size / SSR should not exceed 2048

The Windowing utility accepts only powers of 2 as the number of
  inputs/outputs.

# Examples 
This example compares AI Engine Window Function Stream block in Vitis Model Composer with the Simulink Window Function.

![](./Images/WindowStream_Ex1.png)

The Window function block arranges the coefficients in a round robin way and multiplies with the input data,
window function code is depicted below:


```
function [y1,y2] = WindowFunction(u1,u2,Coeffs)
y1 = complex(zeros(128,1,'single'));
y2 = complex(zeros(128,1,'single'));
count = 0;
count2 = 0;
for i = 1:1:256
   if(rem(i,2)==1)  
   count = count + 1;
   %Multiplication of odd samples with window coefficients
   y1(count,1) = (Coeffs(i,1)*u1(count,1)); 
   else           
   count2 = count2 + 1;
   %Multiplication of even samples with window coefficients
   y2(count2,1) = (Coeffs(i,1)*u2(count2,1)); 

   end
end
end
```
**Complex_Signal_5KHz Subsystem blocks:**

![](./Images/Complex_Signal_5KHz.png)

**Splitting Subsystem blocks:**

![](./Images/Splitting_Subsystem.png)

**EvenSamples selector block parameters:**

![](./Images/EvenSamples_Selector_BlockParameters.png)

**OddSamples selector block parameters:**

![](./Images/OddSample_Selector_BlockParameters.png)

**Window Function Stream block parameters:**

![](./Images/WindowStreamBlockParameters.png)

**Merging subsystem blocks:**

![](./Images/Merging_Subsystem.png)

**AIE_Simulink_WindowComparison subsystem blocks:**

![](./Images/AIE_Simulink_WindowComparison.png)

**AIE and Simulink Window Output Real Part Comparison:**

![](./Images/WindowOutRealPart.png)

**AIE and Simulink Window Output Imaginary Part Comparison:**

![](./Images/WindowOutImaginaryPart.png)

**Window Function Stream Block Example2:**

![](./Images/WindowStream_Ex2.png)

**AIE and Simulink Window Output Real Part Comparison:**

![](./Images/WindowOut_RealPart_Ex2.png)

**AIE and Simulink Window Output Imaginary Part Comparison:**

![](./Images/WindowOut_imagpart_Ex2.png)

