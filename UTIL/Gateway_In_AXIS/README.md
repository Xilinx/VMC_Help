# Gateway In AXI Stream

  
![](./Images/block.png)  

## Library

HDL/Interfaces

## Description

This is a utility block that makes connecting between HDL and AI Engine
domains easier by combining three HDL gateway blocks into one block. It
is primarily used with the AIE to HDL block. Note that the block name
will be used as the AXIS name. The following figure shows how the block
is used.

Figure: Gateway In AXI Usage

  
![](./Images/gib1648735406711.png)  

## Parameters

Output Data Type  
The output data type of the block. The output data type should match the
receiving HDL design input.

Sample Time  
The output sample time. Refer to the AIE to HDL block help to learn more
how to set this parameter.
