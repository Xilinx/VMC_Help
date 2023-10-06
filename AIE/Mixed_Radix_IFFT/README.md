# Mixed Radix IFFT 

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Buffer IO

## Description

Mixed Radix IFFT implementation targeted for AI Engines. 

## Parameters

### Main  
#### Input/Output Data Type
Set the input/output data type.

#### Point Size (IFFT Size)
This is an unsigned integer which describes the point size of the transformation. This must be 2^N, where N is in the range 3 to 12 inclusive.


#### Input Frame Size (Number of Samples)

Specifies the number of samples for a particular frame. The value must
  be in the range 16 to 4096 and the default value is 64. The IFFT
  operation will not begin until this number of samples has been input.

#### Scale Output Down by 2^
Describes the power of 2 shift down applied before output. For _cfloat_ data type, the value for this parameter must be zero. 




####  Number of Cascade Stages
This determines the number of kernels the Mixed Radix IFFT will be divided over in series to improve throughput. For int data types, and IFFT size of 2^N, the maximum cascade length is N/2 when N is even and (N+1)/2 when N is odd. For float data type, the maximum cascade length is N.


### Constraints
Click on the button given here to access the constraint manager and add or update constraints for each kernel. If you set the "Number of cascade stages" parameter to a value greater than one, multiple kernels will be used to process the input. You can use the constraint manager to optimize the performance of your design by setting specific constraints for each kernel (in this case, you need to first run your design). Adding constraints will not affect the functional simulation in Simulink. Constraints will only affect the generated graph code, cycle approximate AIE simulation (System C), and behavior in hardware.

<div class="noteBox">
If you are using non-default constraints for any of the kernels for the block, an asterisk (*) will be displayed next to the button.
</div>


**Mixed Radix IFFT Block Example1:**

![](./Images/Mixed_Radix_IFFT_Ex1.png)


**AIE and Simulink Radix IFFT Output Signal Real Part Comparison:**

![](./Images/Mixed_Radix_IFFT_RealPart_Comparison.png)

**AIE and Simulink Radix IFFT Output Signal Imaginary Part Comparison:**

![](./Images/Mixed_Radix_IFFT_ImaginaryPart_Comparison.png)

**Mixed Radix IFFT Block Example2:**

![](./Images/Mixed_Radix_IFFT_Ex2.png)

**AIE and Simulink Radix IFFT Output Signal Real Part Comparison:**

![](./Images/Mixed_Radix_IFFT_RealPart_Comparison_Ex2.png)

**AIE and Simulink Radix IFFT Output Signal Imaginary Part Comparison:**

![](./Images/Mixed_Radix_IFFT_ImaginaryPart_Comparison_Ex2.png)
