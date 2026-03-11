# Hadamard Stream

Stream-based Hadamard implementation targeted for AI Engines. 

![](./Images/block.png)

## Library

AI Engine/DSP/Stream IO

## Description

This block implements the Hadamard (element-wise) product, which multiplies corresponding elements of two input matrices or vectors. The input can be matrices or vectors, and the output is always column-major order, matching Simulink conventions.

When Super Sample Rate (SSR) is enabled, inputs and outputs are split and combined in a round-robin fashion across the parallel data paths.

## Parameters

### Main

#### A input data type
Specifies the data type for the A input port. Supported types include `int16`, `int32`, `cint16` , `cint32` , `float` , and `cfloat`.

#### B input data type
Specifies the data type for the B input port. Supported types include `int16`, `int32`, `cint16` , `cint32` , `float` , and `cfloat`.

#### Input length
Specifies the length of the input vector for the Hadamard product. 

#### Number of frames
Specifies the number of frames (sets of input vectors) processed per window. 

#### Scale output down by 2^
Describes the power of 2 by which the output is scaled down (right-shifted) before output. For `float` and `cfloat` data types, this parameter must be zero.

#### SSR (Super Sample Rate)
Specifies the number of parallel data paths processed by the block. Increasing SSR allows for higher throughput by processing multiple samples in parallel. 

**Row Distribution When SSR = 2:**

When the Hadamard block is configured with SSR = 2, the input matrices are divided across two parallel data paths to improve throughput.

**Input Port Mapping**

Each matrix is distributed across:

Matrix A → inA[0], inA[1]
Matrix B → inB[0], inB[1]

The same distribution pattern must be applied consistently to both matrices to maintain correct element alignment.

**Example Distribution (Alternating Rows)**

One common approach is to distribute rows in an alternating pattern.

Matrix A (8×8)

inA[0] receives rows: 1, 3, 5, 7
inA[1] receives rows: 2, 4, 6, 8

Matrix B (8×8)

inB[0] receives rows: 1, 3, 5, 7
inB[1] receives rows: 2, 4, 6, 8

Each port therefore receives a 4 × 8 sub-matrix, enabling parallel Hadamard processing.

**Important Note**

Alternating rows are not mandatory.
Any distribution scheme is valid, provided that both inputs follow the same mapping.

For example:

- First half rows on port 0, second half on port 1
- Even rows on port 0, odd rows on port 1
- Block partitioning schemes

The output ports will reflect the same distribution pattern used at the inputs.

#### Rounding mode
Describes the selection of rounding to be applied during the shift down stage of processing.

The following modes are available:
* **Floor:** Truncate LSB, always round down (towards negative infinity).
* **Ceiling:** Always round up (towards positive infinity).
* **Round to positive infinity:** Round halfway towards positive infinity.
* **Round to negative infinity:** Round halfway towards negative infinity.
* **Round symmetrical to infinity:** Round halfway towards infinity (away from zero).
* **Round symmetrical to zero:** Round halfway towards zero (away from infinity).
* **Round convergent to even:** Round halfway towards nearest even number.
* **Round convergent to odd:** Round halfway towards nearest odd number.

No rounding is performed on the **Floor** or **Ceiling** modes. Other modes round to the nearest integer. They differ only in how they round for values that are exactly between two integers.


#### Saturation mode
Describes the selection of saturation to be applied during the shift down stage of processing.

The following modes are available:
* **None:** No saturation is performed and the value is truncated on the MSB side.
* **Asymmetric:** Rounds an n-bit signed value in the range `-2^(n-1)` to `2^(n-1)-1`.
* **Symmetric:** Rounds an n-bit signed value in the range `-2^(n-1)-1` to `2^(n-1)-1`.

### Constraints
Click on the button given here to access the constraint manager and add or update constraints for each kernel. You can use the constraint manager to optimize the performance of your design by setting specific constraints for each kernel (in this case, you need to first run your design). Adding constraints will not affect the functional simulation in Simulink. Constraints will only affect the generated graph code, cycle approximate AIE simulation (System C), and behavior in hardware.

<div class="noteBox">
If you are using non-default constraints for any of the kernels for the block, an asterisk (*) will be displayed next to the button.
</div>

## Examples

***Click on the images below to open each model.***

[![](./Images/Hadamard_Stream_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.1/Examples/Block_Help/AIE/Hadamard_Stream_Ex1)


--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT

