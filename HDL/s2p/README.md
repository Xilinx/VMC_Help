# Serial to Parallel

![](./Images/block.png)

## Description

The Serial to Parallel block takes a series of inputs of any size and
creates a single output of a specified multiple of that size. The input
series can be ordered either with the most significant word first or the
least significant word first.

The following waveform illustrates the block's behavior:


![](./Images/agn1538085490823.png)  

This example illustrates the case where the input width is 1, output
width is 4, word size is 1 bit, and the block is configured for most
significant word first.

### Block Interface

The Serial to Parallel block has one input and one output port. The
input port can be any size. The output port size is indicated on the
Block Parameters dialog box.

## Block Parameters

#### Basic tab  
Parameters specific to the Basic tab are as follows.

#### Input order  
Least or most significant word first.

#### Arithmetic type  
Signed or unsigned output.

#### Number of bits  
Output width which must be a multiple of the number of input bits.

#### Binary point  
Output binary point location

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

An error is reported when the number of output bits cannot be divided
evenly by the number of input bits. The minimum latency for this block
is zero.
