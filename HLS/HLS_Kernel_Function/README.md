# HLS Kernel

This block lets you import an HLS kernel IP and simulate it in Vitis Model Composer. 

![](./Images/block.png)

## Library

HLS/User-Defined Functions

## Description

The HLS Kernel block allows you to import an HLS kernel, which is a
proper HLS IP (an IP with interface specification using HLS pragmas). This block also accepts templatized HLS functions.

This block is treated as an HLS subsystem for the purpose of code generation. 

Use this block to connect with AI Engine blocks using the [AIE to HLS](../../UTIL/AIE_to_HLS/README.md) or [HLS to AIE](../../UTIL/HLS_to_AIE/README.md) blocks and co-simulate a design with both AI
Engines and PL components.

Function arguments can be either of hls::stream type or of scalar or vector types. At least one input hls::stream type and one output hls::stream are needed. 
For example the following is a valid HLS function signature:

``` pre
void func(hls::stream<unsigned int> &in, const ap_uint<8> (&param_in)[32], hls::stream<unsigned int> &out, ap_uint<8> param_out);
```
For a complete list of supported function arguments, see the table below.

<div class="noteBox">
For stream inputs and outputs, this block accepts variable size signals and produces variable size outputs. 
</div>

## Parameters
#### Kernel header file
The name of the HLS kernel header file that contains the function declaration. The string could be just the file name, a relative path to the file, or an absolute path of the file. Use the browse button to select the file.

#### Kernel function
The name of the kernel function in C/C++ for which the HLS Kernel block is to be created.

#### Kernel source file
The name of the source file that contains the kernel function implementation (definition). The string could be just the file name, a relative path to the file or the absolute path of the file.

#### Kernel search paths
If the kernel header file or the kernel source file is not found using the value provided through the 'Kernel header file' or 'Kernel source file' fields respectively, then the paths provided through 'Kernel search paths' are used to locate the files.

This parameter allows use of environment variables while specifying paths for the kernel header file and the kernel source file. The environment variable can be used in either ${ENV} or $ENV format.

#### Preprocessor Options
Optional preprocessor arguments for downstream compilation with specific preprocessor options.

The following two preprocessor option formats will be accepted and multiple can be selected. -Dname and -Dname=definition. That is, the optional argument must begin with the -D string and if the option definition value is not provided, it is assumed to be 1.

## Supported function arguments
Please see the following table for a detailed list of supported data types for inputs and outputs.

| Type	    | Detail	| Examples |
| ----      | ----      | -------- |
| **Scalar Types** | Scalar of C/C++ Primitive (except double, bool) | 	`short`, `int8`, `int32`, `int64`, `int&`, `float&` |
|               | AP Integer: ap_int/ap_uint<X>, 1 <= X <= 128 | `ap_int<32>`, `ap_uint<96>` |
|               | ap_fixed/ap_ufixed, with 1 <= W <=128 | `ap_fixed<32,32>`, `ap_ufixed<96,64>` |
|               | std::complex with C/C++ primitive (except double, bool) | `std::complex<int32>`, `std::complex<float>` |
|               | std::complex with ap_int/ap_uint<X>, 1 <= X <= 64	| `std::complex<ap_int<32>>`, `std::complex<ap_uint<64>>` |
|               | std::complex with ap_fixed/ap_ufixed<X>, 1 <= X <= 64	| `std::complex<ap_fixed<64,32>>`, `std::complex<ap_ufixed<37,10>>` |
| **Vector Types** | Constant size array of any of the above Scalar Types. Must be passed by reference. | `int32 (&arg)[10]`, `std::complex<ap_uint<32>> (&arg)[20]`, `hls::axis<ap_uint<128>, 0, 0, 0> (&arg)[30]` |
| **Pointer Types** | Pointer type of any of the above Scalar Types | `const int32_t *arg`, `std::complex<ap_int<32>> const* arg`, `ap_fixed<57, 0, 0, 0> *arg` |
| **hls::stream** | hls::stream with any of above Scalar Types. Must be passed by reference. | `hls::stream<uint32> &arg`, `hls::stream<std::complex<float>> &arg`, `hls::stream<ap_axis<32>> &arg`, `hls::stream<ap_int<128>> &arg`, `hls::stream<std::complex<ap_int<16>> &arg`, `hls::stream<hls::axis<ap_uint<128> 0, 0, 0>> &arg` |
|               | hls::stream with ap_axis/ap_axiu, data width is 32/64/128 | `hls::stream<ap_axis<32, 0, 0, 0>> &arg`, `hls::stream<ap_axiu<64, 0, 0, 0>> &arg` |
|               | hls::stream with hls::axis<ap_int/ap_uint>, data width is 32/64/128 | `hls::stream<hls::axis<ap_int<32>, 0, 0, 0> > &arg`, `hls::stream<hls::axis<ap_uint<128> 0, 0, 0> > &arg` |
| **Template**	| Any template that is deducted into above supported scalar/vector/stream types | `ap_uint<BITS>`, `std::complex<DATA_TYPE>`, `ap_axiu<BITS, 0, 0, 0>`, `hls::axis<ap_int<BITS>, 0, 0, 0> (&arg)[20]`, `hls::stream<ap_int<BITS>>`, `hls::stream<ap_uint<BITS>>`, `hls::stream<ap_axis<BITS, 0, 0, 0>>`, `hls::stream<ap_axiu<BITS, 0, 0, 0>>` |

## Examples
[2d FFT with both AI Engines and HLS Kernel blocks](https://github.com/Xilinx/Vitis_Model_Composer/blob/HEAD/Examples/AIENGINE_plus_PL/AIE_HLS/FFT2D)



--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.
