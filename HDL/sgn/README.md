# Threshold

The Xilinx Threshold block tests the sign of the input number. If the
input number is negative, the output of the block is -1; otherwise, the
output is 1. The output is a signed fixed-point integer that is 2 bits
long. The block has one input and one output.

![](./Images/huo1555437339003.png)

## Block Parameters

The block parameters dialog box can be invoked by double-clicking the
icon in your Simulink® model.

Parameters used by this block are explained in the topic [Common Options
in Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html).

The block parameters do not control the output data type because the
output is always a signed fixed-point integer that is 2 bits long.

## Xilinx LogiCORE

The Threshold block does not use a Xilinx LogiCORE™™.
