# Gateway In AXI Stream

  
![](./Images/block.png)  

## Library

HDL/Interfaces

## Description

This is a utility block that makes connecting between HDL and AI Engine
domains easier by combining three HDL gateway blocks into one block. Note that in the generated code, the block name
will be used as the AXIS. The following figure shows how the block
is used when connecting AI Engine blocks to HDL blocks. 
  
![](./Images/gib1648735406711.png)

This block can also be used to connect Simulink signals to HDL blocks with an AXI Stream input as shown below:

![](./Images/hdl_with_axis_in.png)

## Parameters

Refer to [Gateway In](../../HDL/gatewayin/README.md) block help to learn more about the parameters.
