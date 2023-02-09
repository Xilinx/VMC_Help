# Vector Concat

The Vector Concat block concatenates two or more inputs of type vector.
The output is cast to an unsigned value with the binary point at zero.

## Description

Super Sample Rate (SSR): This configurable GUI parameter is primarily
used to control processing of multiple data samples on every sample
period. This block enables 1-D vector data support for the primary block
operation.

![](./Images/block.png)

The [Vector Reinterpret](vectorreinterpret.html) block provides
capabilities that can extend the functionality of the Vector Concat
block.

## Block Interface

The block has n input ports, where n is a value between 2 and 1024,
inclusively, and one output port. The first and last input ports are
labeled `hi` and `low`, respectively. Input ports between these two
ports are not labeled. The input to the `hi` port occupies the most
significant bits of the output, and the input to the `lo` port occupies
the least significant bits of the output.

## Block Parameters

Double-click the icon in your Simulink® model to open the Block
Parameter dialog box.

Parameters specific to this block are as follows:

- Number of Inputs: Specifies number of inputs, between 2 and 1024,
  inclusively, to concatenate together.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html).

The Vector Concat block does not use a Xilinx LogiCORE™™.
