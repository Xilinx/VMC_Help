# IFFT Stream

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

Stream-based IFFT implementation targeted for AI Engines. The IFFT block
has two stream ports per subframe processor to maximize performance. The
specified value for SSR parameter should be of the form 2^N, where N is
a positive integer.

## Parameters

Main  
Input/Output Data Type:

- Describes the type of individual data samples input/output of the
  stream IFFT. It can be `cint16`, `cint32`, `cfloat` types.

IFFT Size:

- This is an unsigned integer which describes the point size of the
  transformation. This must be 2^N, where N is in the range `4` to `11`
  inclusive.

Input Frame Size (Number of Samples):

- Specifies the number of samples for a particular frame. The value must
  be in the range `8` to `1024` and the default value is `64`. The IFFT
  operation will not begin until this number of samples has been input.

Scale Output Down by 2^:

- Describes the power of 2 shift down applied before output. The
  following table shows the range of valid values of this parameter for
  different data types.
  | Data Type | Scale output down by 2^     |
  |-----------|-----------------------------|
  | cint16    | \[0, log2(IFFT Size) + 15\] |
  | cint32    | \[0, log2(IFFT Size) + 31\] |
  | cfloat    | 0                           |

  Table 1. Valid Parameters

SSR:

- This parameter is intended to improve performance and support IFFT
  sizes beyond the limitations of a single tile. For an SSR value of 'n'
  (which must be of the form 2^N, where N is a positive integer), the
  IFFT operation is performed in parallel and the actual IFFT size is
  divided by 'n'. For example, a 16384 point IFFT with SSR value of 8
  creates 8 stream inputs and there will be 8 subframe IFFTs each of
  point size 2048. The specified IFFT size and SSR values should be such
  that (2 \* IFFT size / SSR) is in the range of 16 and 4096.

Advanced  
Target Output Throughput (MSPS):

- Specifies the output sampling rate of the IFFT function in Mega
  Samples per Second (MSPS). The value must be in the range `1` to
  `1000` and the default value is `200`.

Specify the Number of Cascade Stages:

- When this option is not enabled, the tool will determine the IFFT
  configuration that best achieves the specified input sampling rate.
  When the option is enabled, the Number of cascade stages can be
  specified (which describes the number of AI Engine processors to split
  the operation over). This allows resources to be traded for higher
  performance, but the specified input sampling rate constraint may not
  be achieved. The value must be in the range of `1` to `9`.
