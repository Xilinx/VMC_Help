# Lesser

Performs element-wise less than relational operation on the inputs. The
top input corresponds to the first operand.


![](./Images/block.png)

## Library

Relational Operations

## Description

The Lesser block has two input signals and one output signal. The block
compares two inputs using element-wise lesser relational operation. The
first input corresponds to the top input port and the second input to
the bottom input port. The dimension of the output signal matches the
dimensions of the input signals. An element of the output signal is true
if the corresponding element of the first input signal is less than the
corresponding element of the second signal; otherwise the element is
false.

## Data Type Support

Data types support for the Lesser block is:

- The data types of the input signals can be integer, fixed-point,
  boolean, or floating point data type.
- The input signals can be scalars, vectors, or matrices. If both inputs
  are not scalar, their dimensions must match.
- The input signals must be real.
- The output signal is boolean.
- The dimension of the output signal is scalar if both inputs are
  scalar. Otherwise it matches the dimensions of the non-scalar input.

## Parameters

The Lesser block has no parameters to set.
