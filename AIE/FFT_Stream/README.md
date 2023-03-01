# FFT Stream
Stream-based FFT implementation targeted for AI Engines.
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

Stream-based FFT implementation targeted for AI Engines. The FFT block
has two stream ports per subframe processor to maximize performance. The
specified value for SSR parameter should be of the form 2^N, where N is
a positive integer.

## Parameters

### Main  
#### Input Data Type/Output Data Type

Describes the type of individual data samples input/output of the
  stream FFT. It can be cint16, cint32, cfloat types.

#### FFT Size

This is an unsigned integer which describes the point size of the
  transformation. This must be 2^N, where N is in the range 4 to 11
  inclusive.

#### Input Frame Size (Number of Samples)

Specifies the number of samples for a particular frame. The value must
  be in the range 8 to 1024 and the default value is 64. The FFT
  operation will not begin until this number of samples has been input.

#### Scale Output Down by 2^

Describes the power of 2 shift down applied before output. The
  following table shows the range of valid values of this parameter for
  different data types.
  
  | Data Type | Scale output down by 2^    |
  |-----------|----------------------------|
  | cint16    | \[0, log2(FFT Size) + 15\] |
  | cint32    | \[0, log2(FFT Size) + 31\] |
  | cfloat    | 0                          |


#### SSR

This parameter is intended to improve performance and support FFT
  sizes beyond the limitations of a single tile. For an SSR value of 'n'
  (which must be of the form 2^N, where N is a positive integer), the
  FFT operation is performed in parallel and the actual FFT size is
  divided by 'n'. For example, a 16384 point FFT with SSR value of 8
  creates 8 stream inputs and there will be 8 subframe FFTs each of
  point size 2048. The specified FFT size and SSR values should be such
  that (2 \* FFT size / SSR) is in the range of 16 and 4096.

### Advanced  
#### Target Output Throughput (MSPS)

Specifies the output sampling rate of the FFT function in Mega Samples
  per Second (MSPS). The value must be in the range 1 to 1000 and
  the default value is 200.

#### Specify the Number of Cascade Stages

When this option is not enabled, the tool will determine the FFT
  configuration that best achieves the specified input sampling rate.
  When the option is enabled, the Number of cascade stages can be
  specified (which describes the number of AI Engine processors to split
  the operation over). This allows resources to be traded for higher
  performance, but the specified input sampling rate constraint may not
  be achieved. The value must be in the range of 1 to 9.
