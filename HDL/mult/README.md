# Mult

The Mult block implements a multiplier. It computes the product
of the data on its two input ports, producing the result on its output
port.

![](./Images/block.png)

## Parameters

### Basic tab  
> Parameters specific to the Basic tab are as follows.

#### Precision  
> This parameter allows you to specify the output precision for
fixed-point arithmetic. Floating point output always has Full precision.

> #### Full  
> The block uses sufficient precision to represent the result without
error.

> #### User Defined  
> If you do not need full precision, this option allows you to specify a
reduced number of total bits and/or fractional bits.

#### Fixed-point output type  
> #### Arithematic Type  
> > #### Signed (2’s comp)  
> > The output is a Signed (2’s complement) number.

> > #### Unsigned  
> > The output is an Unsigned number.

> > #### Number of bits  
> > Specifies the bit location of the binary point of the output number,
where bit zero is the least significant bit.

> > #### Binary point  
> > Position of the binary point in the fixed-point output.

#### Quantization  
> Refer to the Overflow and Quantization section in the [Common Options in
Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html)
topic.

#### Overflow  
> Refer to the Overflow and Quantization section in the [Common Options in
Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html)
topic.

#### Optional Port  
> Provide enable port

#### Latency  
> This defines the number of sample periods by which the block's output is
delayed.

> **Note**: Only when latency of the Mult block is set to 4 in Model Composer,
are all three pipeline stages used in the generated Multiplier IP.


### ementation tab  
Parameters specific to the Implementation tab are as follows.

#### Use behavioral HDL (otherwise use core)  
> The block is implemented using behavioral HDL. This gives the downstream
logic synthesis tool maximum freedom to optimize for performance or
area.

> **Note**: For Floating-point operations, the block always uses the
Floating-point Operator core.

#### Core Parameters  
> #### Optimize for Speed\|Area  
> > Directs the block to be optimized for either Speed or Area.

> #### Use embedded multipliers  
> This field specifies that if possible, use the XtremeDSP slice (DSP48
type embedded multiplier) in the target device.

> #### Test for optimum pipelining  
> Checks if the Latency provided is at least equal to the optimum pipeline
length. Latency values that pass this test imply that the core produced
is optimized for speed.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](common-options-in-block-parameter-dialog-boxes-aa1032308.html).

## LogiCORE™™ Documentation

Multiplier LogiCORE IP Product Guide
([PG108](https://www.xilinx.com/cgi-bin/docs/ipdoc?c=mult_gen;v=latest;d=pg108-mult-gen.pdf))

Floating-Point Operator LogiCORE IP Product Guide
([PG060](https://www.xilinx.com/cgi-bin/docs/ipdoc?c=floating_point;v=latest;d=pg060-floating-point.pdf))
