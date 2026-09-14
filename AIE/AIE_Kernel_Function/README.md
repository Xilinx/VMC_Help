# AIE Kernel

This block allows you to import an AI Engine kernel.  

![](./Images/block.png)  

## Library

AI Engine/User-Defined Functions

## Description

The AIE Kernel block enables you to import an AI Engine kernel, which is a C/C++ program. This block supports importing Window, Buffer, Stream, Cascade, and Run time parameter as arguments to the kernel function. Additionally, this block allows you to import a function template with typename template parameter T, and a non-type (integral) template parameter N.

<div class="noteBox">
If your kernel is a class based kernel, you should use the 
AIE Class block to import the kernel.
</div>

## Parameters
#### Kernel header file
Mandatory string. Name of the header file that contains the kernel function declaration. The string could be just the file name, a relative path to the file or an absolute path of the file. Use the browse button to choose the file.

#### Kernel function
Mandatory string. Name of the kernel function for which the block is to be created. This function should be declared in the kernel header file. 

#### Kernel init function
Optional string. Name of the initialization function used by the kernel function. An initialization function cannot return a value and cannot have input/output arguments, that is,
the function prototype must be as follows:

_void init_function_name(void)_

<div class="noteBox">
  The initialization function is called only once before the kernel function is called.
</div>

This function can be used to initialize global variables and set or clear rounding and saturation
modes. It cannot use buffer or stream APIs to access memory or stream interfaces, but stream
intrinsics (for example, get_ss() or put_ss()) can be used.

#### Kernel source file
Mandatory string. Name of the source file that contains the kernel function definition. The string could be the file name, a relative path to the file or an absolute path of the file.

#### Kernel search paths
Optional vector of strings. If the kernel header file or the kernel source file are not found using the value provided through the 'Kernel header file' or 'Kernel source file' fields respectively, then the paths provided through 'Kernel search paths' are used to find the files.

This parameter allows use of environment variables while specifying paths for the kernel header file and the kernel source file. The environment variable can be used in either ${ENV} or $ENV format. 

#### Preprocessor options
Optional preprocessor arguments for downstream compilation with specific preprocessor options.

The following two preprocessor option formats are accepted and multiple can be selected: -Dname and -Dname=definition separated by a comma. That is, the optional argument must begin with -D and if the option definition value is not provided, it is assumed to be 1.

#### SSR (Super Sample Rate)
Specifies the number of replicated AI Engine kernel instances inside the mask subsystem. The default value is **1**, which preserves legacy single-kernel behavior.

When SSR is greater than 1:
- The block accepts an **M×SSR** column matrix on each input port and produces an **M×SSR** matrix on each output port.
- Internal Splitter and Merger blocks (Simulink Selector and Matrix Concatenation) distribute and collect samples across the replicated kernels.
- Each kernel parameter can be specified as a scalar (same value for all kernels), a vector of length SSR, or a workspace variable holding either form.
- Set constraints for each replicated kernel independently in the Constraint Editor.

Changing SSR requires clicking **Apply** or **OK** on the mask dialog to rebuild the subsystem. Use **Import** or **Update** to refresh kernel source after changes to the kernel header, source, or function.

For design rule checks, interoperability with DSPLib SSR blocks, and subsystem boundary placement rules, see [SSR Support for AIE Kernel and Graph Blocks](https://docs.amd.com/r/en-US/ug1483-model-composer-sys-gen-user-guide/SSR-Support-for-AIE-Kernel-and-Graph-Blocks) in the Vitis Model Composer User Guide (UG1483).

## Examples

***Click on the images below to open each model.***

This example shows import of kernel functions with int16 real and complex inputs and outputs.

[![](./Images/AIE_Kernel_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/AIE_Kernel_Ex1)

## Related blocks
Use [AIE Class](../AIE_Class_Kernel_Function/README.md) block to import a class based kernel.

Use [AIE Graph](../AIE_Graph_Function/README.md) block to import an AI Engine graph.




--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
