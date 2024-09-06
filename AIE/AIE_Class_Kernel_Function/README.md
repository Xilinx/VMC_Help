# AIE Class Kernel

This block allows you to import class-based kernels.  

![](./Images/block.png)  

## Library

AI Engine/User-Defined Functions

## Description

The AIE Class Kernel block allows you to import an AI Engine class kernel. This block supports importing Window, Buffer, Stream, Cascade, and Run time parameter as arguments to the kernel function. Additionally, this block allows you to import a function template with typename template parameter T, and a non-type (integral) template parameter N. You can also import Class kernels with non-default constructors. 

If you use file scope variable, global variable, or static function scope variable to store the internal states of a C function kernel, when multiple instances of such a kernel are mapped to the same core, the internal state variables are shared across multiple instances and cause conflicts. You can avoid this problem using Class kernels.

<div class="noteBox">
Use class kernels if your kernel needs to preserve internal states. 
</div>

To learn more about class kernels click [here](https://docs.xilinx.com/r/en-US/ug1079-ai-engine-kernel-coding/C-Kernel-Class-Support).

## Parameters

#### Kernel hearder file
This mandatory string points to the header file (.h file) containing the class definition.

#### Kernel class
Mandatory string. Name of the kernel class which contains member variables and kernel member functions.

<div class="noteBox">
Use the namespace if the class definition is at the namespace scope, like "mynamespace::myclass"; otherwise, no namespace specification is required.
</div>

#### Kernel function
Mandatory string. Name of the kernel member function for which the block is to be created. This function should be registered using the registerKernelClass method in the kernel header file. 

#### Kernel source file
Mandatory string. Name of the source file that contains where the kernel member function definition and non-default constructor parameter values are specified.
The string could be the file name, a relative path to the file or an absolute path of the file. 

#### Kernel search paths
Optional vector of strings. If the kernel header file or the kernel source file are not found using the value provided through the Kernel header file or Kernel source file fields respectively, then the paths provided through Kernel search paths are used to find the files. 

This parameter allows use of environment variables while specifying paths for the kernel header file and the kernel source file. The environment variable can be used in either ${ENV} or $ENV format.

#### Preprocessor options
Optional preprocessor arguments for downstream compilation with specific preprocessor options.

The following two preprocessor option formats are accepted and multiple can be selected: -D<name> and -D<name>=<definition> separated by a comma. That is, the optional argument must begin with -D and if the option <definition> value is not provided, it is assumed to be 1.
  
## Related blocks
Use [AIE Kernel](../AIE_Kernel_Function/README.md) block to import a non class based kernel.

Use [AIE Graph](../AIE_Graph_Function/README.md) block to import an AI Engine graph.

## Examples
[Importing a templatized class kernel as a block](https://github.com/Xilinx/Vitis_Model_Composer/tree/HEAD/Examples/AIENGINE/Importing_AIE_blocks/AIE_Class_Kernel_FIR)

  

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
