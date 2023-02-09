# DDS Stream

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

This block implements the stream-based Direct Digital Synthesizer (DDS)
targeted for AI Engines.

## Parameters

Main  
Output Data Type:

- Describes the type of individual data samples output of the DDS
  function. It should be `cint16` or `cfloat`.

Output Frame Size (Number of Samples):

- Specifies the number of samples in the output frame. The value must be
  in the range `8` to `1024` and the default value is `32`.

Number of Parallel Outputs (SSR):

- This parameter specifies the number of output ports and must be of the
  form 2^N, where N is a non-negative integer.

Phase Increment:

- Specifies the phase increment between samples. The value must be in
  the range `0` to `2^31` and the default value is `0`. Input value
  `2^31` corresponds to Pi (i.e., 180). Phase increment is calculated
  using the formula (Fo\*(2^N)) / Fs where:
  - Fo = Output frequency.
  - N = 32, which represents the accumulator width, and it is fixed.
  - Fs = Sampling frequency.

Initial Phase Offset:

- Specifies the initial phase offset. The default value is `0`.

Sample Time:

- Specifies the sample time for the block output port. The default value
  is `-1`.

Advanced  
Target Output Throughput (MSPS):

- Specifies the output sampling rate of the DDS function in Mega Samples
  per Second (MSPS). The value must be in the range `1` to `1000` and
  the default value is `200`.
