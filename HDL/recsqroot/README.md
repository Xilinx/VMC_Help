# Reciprocal SquareRoot

![](./Images/block.png)

## Description

The Reciprocal SquareRoot block performs the reciprocal
squareroot on the input. Currently, only the floating-point data type is
supported.

## Parameters

### Basic tab  
Parameters specific to the Basic tab are as follows.
#### Flow Control  
##### Blocking  
Selects Blocking mode. In this mode, the lack of data on one input
channel does block the execution of an operation if data is received on
another input channel.

##### NonBlocking  
Selects Non-Blocking mode. In this mode, the lack of data on one input
channel does not block the execution of an operation if data is received
on another input channel.

### Optional ports  
#### Input Channel Ports  
##### Has TLAST  
Adds a TLAST port to the Input channel.

##### Has TUSER  
Adds a TUSER port to the Input channel.

##### Provide enable port  
Adds an enable port to the block interface.

##### Has Result TREADY  
Adds a TREADY port to the Result channel.

### Exception Signals  
#### INVALID_OP  
Adds an output port that serves as an invalid operation flag.

#### DIVIDE_BY_ZERO  
Adds an output port that serves as a divide-by-zero flag.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

## LogiCORE™ Documentation

Floating-Point Operator LogiCORE IP Product Guide
([PG060](https://docs.xilinx.com/access/sources/ud/document?isLatest=true&url=pg060-floating-point&ft:locale=en-US))

--------------
Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
