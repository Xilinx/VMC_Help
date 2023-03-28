# DDS Stream
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Stream IO

## Description

This block implements the stream-based Direct Digital Synthesizer (DDS)
targeted for AI Engines.

## Parameters

### Main  
#### Output Data Type

Sets the output data type.

#### Output Window Size (Number of Samples)

Specifies the number of samples in the output frame. The value must be in the range of 8 to 1024 and the default value is 32. Note that for SSR values greater than one, this value is to sum of the sizes of all the outputs.

#### Number of Parallel Outputs (SSR)

This parameter specifies the number of output ports and must be of the form 2^N, where N is a non-negative integer. 

#### Phase Increment

Specifies the phase increment between samples. The value must be in
  the range 0 to 2^31 and the default value is 0. Input value
  2^31 corresponds to pi (i.e., 180). Phase increment is calculated
  using the formula (Fo\*(2^N)) / Fs where:
  - Fo = Output frequency.
  - N = 32, which represents the accumulator width, and it is fixed.
  - Fs = Sampling frequency.

For example, for a sampling frequency of 1 Gsps and output frequency of 100 MHz, the _Phase Increment_ should be in 2^32/10.  

#### Initial Phase Offset

Specifies the initial phase offset. The default value is 0.

#### Sample Time

Specifies the sample time for the block output port. The default value is -1 which will result in inheriting the sample time.

### Examples
Assume you need the DDS to gnerate a frequnecy of 250 MHz at 1Gsps. Here is how you set the parameters:
* Output data type: cint16
* Output Window size: 32
* SSR: 1
* Phase increment: 2^30 = 250e6*2^32/1e9
* Initial Phase Offset = 0
* Sample time = 1e9*32  (This is becasue the output window has 32 samples)



