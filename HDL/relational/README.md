# Relational

The Xilinx Relational block implements a comparator.

![](./Images/block.png)

The supported comparisons are the following:

- equal-to (a = b)
- not-equal-to (a != b)
- less-than (a \< b)
- greater-than (a \> b)
- less-than-or-equal-to (a \<= b)
- greater-than-or-equal-to (a \>= b)
- The output of the block is a `Bool`.

## Block Parameters

The block parameters dialog box can be invoked by double-clicking the
icon in your Simulink® model.

The only parameter specific to the Relational block is:

- Comparison: specifies the comparison operation computed by the block.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html).

## LogiCORE™ Documentation

[LogiCORE IP Floating-Point Operator
v7.1](https://www.xilinx.com/support/documentation/ip_documentation/floating_point/v7_1/pg060-floating-point.pdf)
