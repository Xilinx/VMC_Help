# FFT
  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

This block implements FFT targeted for AI Engines.

## Parameters

### Main  
#### Input/Output data type  
Set the input/output data type.

#### FFT size  
This is an unsigned integer which describes the point size of the
transformation. This must be 2^N, where N is in the range 4 to 16
inclusive.

#### Input Window Size(Number of Samples)  
Describes the number of samples used as an input to the FFT. This parameter may be set to be an integer multiple of the FFT size, in which case multiple FFT iterations will be performed on a given input window, resulting in multiple iterations of output samples, reducing the number of times the kernel needs to be triggered to process a given number of input data samples. As a result, the overheads inferred during kernel triggering are reduced and overall performance is increased.

#### Scale output down by 2^  
Describes the power of 2 to scale the result by prior to output.

#### Number of cascade stages  
This determines the number of kernels the FFT will be divided over in
series to improve throughput.

### Examples
For an example using the FFT block where the output is compared with DSP System toolbox FFT block clic [here](https://github.com/Xilinx/Vitis_Model_Composer/tree/2022.2/Examples/AIENGINE/DSPlib/fft).

### References
This block uses the Vitis DSP library implementation of FFT. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fft.html).


