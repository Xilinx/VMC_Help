# AIE Graph

This block allows you to import an AI Engine graph.  

![](./Images/block.png)  

## Library

AI Engine/User-Defined Functions

## Description

The AIE Graph block allows you to import an AI Engine program that
consists of a dataflow graph specification written in C++.

<div class="noteBox">
This block does not support graph classes with 'input_plio' or 'output_plio' ports. It also does not support a graph with more than one RTP input or one RTP output. 
</div>

## Parameters

#### Graph Header file(\*.h)  
This is a mandatory string that specifies the file (.h), where the
application graph class is defined and the Adaptive Data Flow (ADF)
header (adf.h), kernel function prototypes are included.

#### Graph class  
This is a mandatory string that specifies the name of the graph class.

<div class="noteBox">
Use the namespace if the class definition is at the namespace scope, like "mynamespace::myclass"; otherwise, no namespace specification is required.
</div>

#### Graph search paths  
This is a vector of strings that specifies the search paths where header
files, kernels, and other include files can be found and included for
simulation. The search path \$XILINX_VITIS/adf/include (where adf.h is
defined) is included by default and does not need to be specified.

#### Preprocessor options  
This is an optional parameter and should be specified with a
preprocessor argument for downstream compilation with specific
preprocessor options. The following preprocessor option formats are
accepted and multiple can be selected: ‘-D\<name\>’ and
‘-D\<name\>=\<definition\>’. That is, the optional argument must begin
with the '-D' string and if the option `<definition>` value is not
provided, it is assumed to be 1.

## Examples
[Importing AIE-ML graph](https://github.com/Xilinx/Vitis_Model_Composer/tree/HEAD/Examples/AIENGINE/Importing_AIE_blocks/AIE_ML_Graph_Import)

[Importing AI Engine Graph](https://github.com/Xilinx/Vitis_Model_Composer/tree/HEAD/Examples/AIENGINE/Importing_AIE_blocks/AIE_Graph)
    
[Importing DSP Library Function (Matrix Multiply) as a Graph](https://github.com/Xilinx/Vitis_Model_Composer/tree/HEAD/Examples/AIENGINE/DSPlib/matrix_multiply)



--------------
Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
