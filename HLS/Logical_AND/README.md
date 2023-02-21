# Logical AND

Performs element-wise logical AND operation on inputs

## Library

Logic and Bit Operations

![](./Images/block.png)

## Description

The Logical AND block has two input ports and one output port. The block
performs an element-wise logical AND operation on the inputs and
produces a Boolean result on the output.

Figure: Logical AND Block

![](./Images/uxx1532103642785.png)

## Data Type Support

- The block supports inputs of different data types. The output data
  type is always Boolean.
- The block only supports real inputs.
- If one input is non-scalar type then the other input can be scalar
  type.
- If both inputs are non-scalar type then their dimensions must match.
  In case of non-scalar inputs, the output has the same dimension as the
  inputs.

## Parameters

The Logical AND block has no parameters to set.
