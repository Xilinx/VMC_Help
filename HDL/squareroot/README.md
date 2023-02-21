# SquareRoot

The Xilinx SquareRoot block performs the square root on the input.
Currently, only the floating-point data type is supported.

![](./Images/block.png)

## Block Parameters

The block parameters dialog box can be invoked by double-clicking the
icon in your Simulink® model.

Basic tab  
Parameters specific to the Basic tab are as follows.
Flow Control  
Blocking  
Selects “Blocking” mode. In this mode, the lack of data on one input
channel does block the execution of an operation if data is received on
another input channel.

NonBlocking  
Selects “Non-Blocking” mode. In this mode, the lack of data on one input
channel does not block the execution of an operation if data is received
on another input channel.

&nbsp;

Optional ports  
Input Channel Ports  
Has TLAST  
Adds a TLAST port to the Input channel.

Has TUSER  
Adds a TUSER port to the Input channel.

Provide enable port  
Adds an enable port to the block interface.

Has Result TREADY  
Adds a TREADY port to the Result channel.

Exception Signals  
INVALID_OP  
Adds an output port that serves as an invalid operation flag.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html).

## LogiCORE™ Documentation

Floating-Point Operator LogiCORE IP Product Guide
([PG060](https://www.xilinx.com/cgi-bin/docs/ipdoc?c=floating_point;v=latest;d=pg060-floating-point.pdf))
