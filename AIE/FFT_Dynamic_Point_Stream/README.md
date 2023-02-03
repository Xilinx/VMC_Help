# FFT Dynamic Point Stream

  
![](./Images/jhj1664272623052.png)  

## Library

AI Engine/DSP/Stream IO

## Description

FFT Dynamic Point Stream implementation targeted for AI Engines. This
block supports performing different lengths of FFT on input data
streams. Each frame must be preceded by a 256-bit header which describes
run-time parameters of that frame. The format of the header is described
below. The block has two stream ports per subframe processor to maximize
performance. The specified value for SSR parameter should be of the form
2^N, where N is a positive integer.

Note:

- Every input frame must be appended by a header.
- If the FFT size (N) is smaller than the frame size, the block takes
  the N point FFT of the first N samples in the input frame, and
  discards the rest of the samples in the frame.
- If the frame size is an integer multiple (M) of max FFT size, M FFT
  iterations will be performed on a given input frame, resulting in
  multiple iterations of output samples, reducing the number of times
  the kernel needs to be triggered to process a given number of input
  data samples. As a result, the overheads incurred during kernel
  triggering are reduced and overall performance is increased.

Figure: Header Format

![](./Images/vid1664274231317.png)

[TABLE]

Table 1. Header Description

## Example Header Format

To implement the 32-point size FFT of `cint16` datatype, the format of
the header that should be preceded to the input data window should be as
shown in the following figure.

Figure: Example Header Format

![](./Images/jvr1664274761052.png)

## Example (Input to Dynamic Point FFT)

To implement the FFT of different sizes, say, 64, 32 and 128, of type
`cint32`, the format of the input should be as follows:

``` pre
complex([1 6 0 0 ones(1,64) 1 5 0 0 ones(1,32) 1 7 0 0 ones(1,128)])
```

## Parameters

Main  
Input/Output Data Type:

- Describes the type of individual data samples input/output of the
  dynamic point FFT. It can be cint16, cint32, cfloat types.

FFT Maximum Size:

- Specifies the maximum FFT size that is supported by Dynamic Point FFT.
  You can perform different lengths of FFT on different input data
  frames. It must be a power of 2 with a minimum value of 16. The
  maximum value supported by the library element is 65536.

Input Window Size:

- Specifies the number of samples in the input frame excluding the
  header. The value must be in the range 16 to 65536 and the default
  value is 60.

Scale Output down by 2^:

- Describes the power of 2 shift down applied before output.

SSR:

- This parameter is intended to improve performance and support FFT
  sizes beyond the limitations of a single tile. For an SSR value of 'n'
  (which must be of the form 2^N, where N is a positive integer), the
  FFT operation is performed in parallel and the actual FFT size is
  divided by 'n'. For example, a 16384 point FFT with an SSR value of 8
  creates 8 stream inputs and there will be 8 subframe FFTs each of
  point size 2048. The specified FFT size and SSR values should be such
  that FFT size / SSR should not exceed 2048.

Advanced  
Target Output Throughput (MSPS):

- Specifies the output sampling rate of the FFT function in Mega Samples
  per Second (MSPS). The value must be in the range 1 to 1000 and the
  default value is 200.

Specify the Number of Cascade Stages:

- When this option is disabled, the tool will determine the FFT
  configuration that best achieves the specified input sampling rate.
  When the option is enabled, the Number of cascade stages can be
  specified (which describes the number of AI Engine processors to split
  the operation over). This allows resources to be traded for higher
  performance, but the specified input sampling rate constraint may not
  be achieved. The value must be in the range of 1 to 9.