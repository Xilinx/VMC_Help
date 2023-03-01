# Mixer

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Window IO

## Description

This block implements the Mixer targeted for AI Engines.

## Parameters

#### Input/Output data type  
Describes the types of individual data samples input to and output from
the Mixer function. The supported data types are cint16, cint32, and
cfloat.

#### Input window size (Number of samples)  
Specifies the number of samples in the input window. The value must be
in the range 16 to 4096. Default value is 32.

#### Mixer mode  
This specifies the mixer operation modes. Two modes are supported by
Mixer function:

##### Single Input Mode:  
This is a DDS plus Mixer for a single data input port. Each data input
sample is complex multiplied with the corresponding DDS sample to create
a modulated signal that is written to the output window. This is the
default Mixer mode.

##### Dual Input Mode:  
This is a special configuration for symmetrical carriers and two data
input ports. Each data sample of the first input is complex multiplied
with the corresponding DDS sample to create a modulated signal. Each
data sample of the second data input is complex multiplied with the
conjugate (which is equivalent to a signal rotating in the opposite
direction) of the DDS sample to create a second modulated signal. These
two modulated signals are added together and written to the output
window.

#### Phase increment  
This specifies the phase increment between the samples. The value should
be in the range 0 to 2^31.

Phase increment is calculated using the formula (Fo\*(2^N ))/ Fs)

Where:
  - Fo = Output frequency
  - N = 32, which represents the accumulator width, and it is fixed
  - Fs = Sampling frequency

#### Target input throughput (MSPS)  
Specifies the input sampling rate of the function in Mega Samples per
Second (MSPS). The value must be in the range 1 to 1000 and the
default value is 200.
