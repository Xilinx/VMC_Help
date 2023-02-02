# HLS Kernel

This block lets you import an HLS kernel code with a streaming
interface.

![](./Images/opv1646834498428.png)

## Library

HLS/User-Defined Functions

## Description

The HLS Kernel block allows you to import an HLS kernel, which is a
proper HLS IP (an IP with interface specification using HLS pragmas).
The primary use of this block is to co-simulate AI Engine domain with
HLS.

Note: This block does not participate in HLS code generation and should
not be part of the HLS subsystem in a design.

Note: Use this block to connect with AI Engine blocks using the AIE to
HLS Kernel or HLS to AIE blocks and co-simulate a design with both AI
Engines and PL components.

The block also accepts templatized HLS functions.

Function arguments can be either of `hls::stream` type or of `scalar` or
`vector` types. For example the following is a valid HLS function
signature:

``` pre
void func(hls::stream<unsigned int> &in, const ap_uint<8> (&param_in)[32], hls::stream<unsigned int> &out, ap_uint<8> param_out);
```

For stream inputs and outputs, this block accepts variable size signals
and produces variable size outputs. For stream inputs and outputs, the
data width can only be 32, 64, or 128 bit wide.

## Parameters

[TABLE]
