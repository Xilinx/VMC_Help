# AIE Class Kernel

This block allows you to import class-based kernels.  
![](./Images/block.png)  

## Library

AI Engine/User-Defined Functions

## Description

The AIE Class Kernel block is used to import class-based kernels. This
block also supports importing class templates to define a family of
kernels.

## Parameters

#### Kernel class
* Name of the kernel class which contains member variables and kernel member functions. Parameter Type: String, Criticality: Mandatory.

#### Kernel function
* Name of the kernel member function for which the block is to be created. This function should be registered using the registerKernelClass method in the kernel header file. Parameter Type: String, Criticality: Mandatory.

#### Kernel source file
* Name of the source file that contains where the kernel member function definition and non-default constructor parameter values are specified.
The string could be the file name, a relative path to the file or an absolute path of the file. Parameter Type: String, Criticality: Mandatory.

#### Kernel search paths
* If the kernel header file or the kernel source file are not found using the value provided through the Kernel header file or Kernel source file fields respectively, then the paths provided through Kernel search paths are used to find the files. Parameter Type: Vector of strings, Criticality: Optional.

* This parameter allows use of environment variables while specifying paths for the kernel header file and the kernel source file. The environment variable can be used in either ${ENV} or $ENV format.

#### Preprocessor options
* Optional preprocessor arguments for downstream compilation with specific preprocessor options. Criticality: optional.

  The following two preprocessor option formats are accepted and multiple can be selected: -D<name> and -D<name>=<definition> separated by a comma. That is, the optional argument must begin with -D and if the option <definition> value is not provided, it is assumed to be 1.
