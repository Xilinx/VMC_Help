# Not Equals

Perform element-wise not equal to relational operation on the inputs.
The top input corresponds to the first operand.

## Library

Relational Operations

![](./Images/uls1532106555783.png)

## Description

The Not Equals block has two input signals and one output signal. The
block compares two inputs using element-wise not equals relational
operation. The first input corresponds to the top input port and the
second input to the bottom input port. The dimension of the output
signal matches the dimensions of the input signals. An element of the
output signal is true if the corresponding element of the first input
signal is not equal to the corresponding element of the second signal;
otherwise the element is false.

## Data Type Support

Data type support for the block is:

- The data types of the input signals can be of any integer,
  fixed-point, boolean, or floating-point data type.
- The input signals can be a scalars, vectors, or matrices. If both
  inputs are not scalar, their dimension must match.
- The input signals can be complex.
- The output signal is boolean.
- The dimension of the output signal is scalar if both inputs are
  scalar. Otherwise, it matches the dimensions of the non-scalar input.

## Parameters

The Not Equals block has no parameters to set.
