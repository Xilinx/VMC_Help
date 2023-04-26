# AIE Graph

This block allows you to import an AI Engine graph.  

![](./Images/block.png)  

## Library

AI Engine/User-Defined Functions

## Description

The AIE Graph block allows you to import an AI Engine program that
consists of a dataflow graph specification written in C++.

<div class="noteBox">
This block does not support graph classes with 'input_plio' or 'output_plio' ports.
</div>

## Parameters

#### Graph file  
Specifies whether the graph import should be done using the header file
(\*.h) or using source file (\*.cpp). By default the header file is
selected.

#### Graph Header file(\*.h)  
This is the mandatory string that specifies the file (.h), where the
application graph class is defined and the Adaptive Data Flow (ADF)
header (adf.h), kernel function prototypes are included. This parameter
is only visible when you choose the Header file (\*.h) option in the
Graph file.

#### Graph Source file (\*.cpp)  
This is the mandatory string that specifies the file (.cpp), where the adf
dataflow graph is instantiated. This file should contain the main()
function, from where the dataflow graph initializes and runs. This
option is available only when the Source file (\*.cpp) is selected in
Graph file.

#### Graph class  
This is a mandatory string that specifies the name of the graph class.
This parameter is only visible when you choose the Header file (\*.h)
option in the Graph file.

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
