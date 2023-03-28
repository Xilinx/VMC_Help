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
transformation. This must be 2^N, where N is in the range 4 to 12
inclusive.

#### Input Window Size(Number of Samples)  
Describes the number of samples used as an input to the FFT. This parameter may be set to be an integer multiple of the FFT size, in which case multiple FFT iterations will be performed on a given input window, resulting in multiple iterations of output samples, reducing the number of times the kernel needs to be triggered to process a given number of input data samples. As a result, the overheads inferred during kernel triggering are reduced and overall performance is increased.

#### Scale output down by 2^  
Describes the power of 2 to scale the result by prior to output.

#### Number of cascade stages  
This determines the number of kernels the FFT will be divided over in
series to improve throughput.

### Constraints
Click on the button given here to access the constraint manager and add or update constraints for each kernel. If you set the "Number of cascade stages" parameter to a value greater than one, multiple kernels will be used to process the input. You can use the constraint manager to optimize the performance of your design by setting specific constraints for each kernel (in this case, you need to first run your design). Adding constraints will not affect the functional simulation in Simulink. Constraints will only affect the generated graph code, cycle approximate AIE simulation (System C), and behavior in hardware.

<div class="noteBox">
If you are using non-default constraints for any of the kernels for the block, an asterisk (*) will be displayed next to the button.
</div>

### Examples
For an example using the FFT block where the output is compared with the DSP System toolbox FFT block click [here](https://github.com/Xilinx/Vitis_Model_Composer/tree/HEAD/Examples/AIENGINE/DSPlib/fft).

### References
This block uses the Vitis DSP library implementation of FFT. For more details on this implementation please click [here](https://docs.xilinx.com/r/en-US/Vitis_Libraries/dsp/user_guide/L2/func-fft.html).


