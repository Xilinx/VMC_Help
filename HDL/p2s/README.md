# Parallel to Serial

The Parallel to Serial block takes an input word and splits it into N
time-multiplexed output words where N is the ratio of number of input
bits to output bits. The order of the output can be either least
significant bit first or most significant bit first.

![](./Images/block.png)

The following waveform illustrates the block's behavior:

Figure: Block Behavior

  
![](./Images/jiv1538085483379.png)  

This example illustrates the case where the input width is 4, output
word size is 1, and the block is configured to output the most
significant word first.

## Block Interface

The Parallel to Serial block has one input and one output port. The
input port can be any size. The output port size is indicated on the
Block Parameters dialog box.

## Block Parameters

The block parameters dialog box can be invoked by double-clicking the
icon in your Simulink® model.

Basic tab  
Parameters specific to the Basic tab are as follows.

Output order  
Most significant word first or least significant word first.

Type  
Signed or unsigned.

Number of bits  
Output width. Must divide Number of Input Bits evenly.

Binary Point  
Binary point location.

The minimum latency of this block is 0.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html).
