# Gateway In AXI Stream

  
![](./Images/block.png)  

## Library

HDL/Interfaces

## Description

This is a utility block that makes connecting to HDL blocks with AXI Stream port easier. An AXI Stream port consists of three signals, _tdata_ and _tvalid_ signals going in one direction, and _tready_, going in the oposite direction. Note that in the generated HDL code, the block name
will be used as the name for the AXIS port. 

The following figure shows how the block is used when connecting AI Engine blocks to HDL blocks. 
  
![](./Images/gib1648735406711.png)

This block can also be used to connect Simulink signals to an HDL block with an AXI Stream input as shown below:

![](./Images/hdl_with_axis_in.png)

## Parameters

Refer to [Gateway In](../../HDL/gatewayin/README.md) block help to learn more about the parameters.
