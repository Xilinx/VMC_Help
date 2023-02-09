# Product

The Xilinx Product block implements a scalar or complex multiplier. It
computes the product of the data on its two input channels, producing
the result on its output channel. For complex multiplication the input
and output have two components: real and imaginary.

![](./Images/block.png)

The Product block is ideal for generating a simple scalar or complex
multiplier. If your implementation will use more complicated features
such as AXI4 ports or a user-specified precision, use the Xilinx
[Complex Multiplier 6.0](complexmultiplier60.html) block (if you are
configuring a complex multiplier) or Xilinx [Mult](mult.html) block (if
you are configuring a scalar multiplier) in your design instead of the
Product block.

In the Vivado® design flow, the Product block is inferred as "LogiCORE™
IP Complex Multiplier" (if you have configured the Product block for
complex multiplication) or “LogiCORE IP Multiplier” (if you have
configured the Product block for scalar multiplication) for code
generation. Refer to the [LogiCORE IP Complex Multiplier v6.0 Product
Guide](https://www.xilinx.com/support/documentation/ip_documentation/cmpy/v6_0/pg104-cmpy.pdf)
or the [LogiCORE IP Multiplier v12.0 Product
Guide](https://www.xilinx.com/support/documentation/ip_documentation/mult_gen/v12_0/pg108-mult-gen.pdf)
for details about these LogiCORE IP.

## Block Parameters

The block parameters dialog box can be invoked by double-clicking the
icon in your Simulink® model.

Parameters specific to the block are as follows.

Complex Multiplication  
Specifies mode of operation: scalar multiplier (Complex Multiplication
deselected) or complex multiplier (Complex Multiplication selected).

Optimize for  
Specifies whether your design will be optimized for Performance or for
Resources when it is implemented in the Xilinx FPGA or SoC device.

Based on the settings for Complex Multiplication and Optimize for, and
rate and type propagation (from the input data width), the latency value
of the block will be derived automatically for a fully pipelined
circuit. This latency value will be displayed on the block in the
Simulink model.

## LogiCORE™ Documentation

[LogiCORE IP Complex Multiplier
v6.0](https://www.xilinx.com/support/documentation/ip_documentation/cmpy/v6_0/pg104-cmpy.pdf)

[LogiCORE IP Multiplier
v12.0](https://www.xilinx.com/support/documentation/ip_documentation/mult_gen/v12_0/pg108-mult-gen.pdf)
