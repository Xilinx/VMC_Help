# To Fixed Size

This block takes a variable size vector as an input and produces a fixed
size vector as output. The block copies samples from the input to the
output.

  
![](./Images/block.png)  

## Library

AI Engine/Tools

## Description

The To Fixed Size block takes a variable size vector as an input and
produces a fixed size vector as an output. The block copies samples from
the input to the output. To learn more about variable size signals click [here](../../GEN/variable_size_signal/README.md).

This block is needed since some Simulink blocks do not accept Variable Size Signals. Use this block when you need to connect a variable size signal (for example the output of AI Engine blocks or the output of HLS Kernel block) to a
block that does not accept a variable size signal.
 

## Parameters

#### Mode  
The block has two modes:

##### Stop simulation when input variable-size signal is not full 
In this mode, the block will stop the simulation and error out if the input variable-size signal is not full. The output signal size is set to the same size as the input signal.

##### Produce a valid output signal 
In this mode, the input will be buffered until the number of samples reaches the specified Output Size. The buffered samples will then be transferred to the output, and the valid port is set to true. When there are not enough samples buffered, the output will be a vector of zeros, and the valid port is set to zero.

In the second mode, it is recommended that you monitor the Valid output to make sure
you are not processing invalid outputs. For example you can connect the valid port to a scope or an assert block. You can also connect the Valid
output to the enable port of a Simulink enabled subsystem.

#### Output Size
Specify the output size for the second mode. For the first mode, the output size is inherited from the input size.



## Related blocks
[To Variable Size](../To_Variable_Size/README.md)

[Variable size signal to workspace](../Variable_Size_Signal_to_Workspace/README.md)

