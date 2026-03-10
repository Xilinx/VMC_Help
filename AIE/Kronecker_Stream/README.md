# Kronecker Stream

Stream-based Kronecker product implementation targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/DSP/Stream IO

## Description

This block implements the Kronecker product, which multiplies two input matrices to produce a larger matrix where each element of the first matrix is multiplied by the entire second matrix. The input can be matrices or vectors, and the output is always column-major order, matching Simulink conventions.

## Parameters

### Main

#### A input data type
Specifies the data type for the A input port. Supported types include `int16`, `int32`, `cint16`, `cint32`, `float`, and `cfloat`.

#### B input data type
Specifies the data type for the B input port. Supported types include `int16`, `int32`, `cint16`, `cint32`, `float`, and `cfloat`.

#### Rows in input A
Specifies the number of rows in matrix A.

#### Columns in input A
Specifies the number of columns in matrix A.

#### Rows in input B
Specifies the number of rows in matrix B.

#### Columns in input B
Specifies the number of columns in matrix B.

#### Number of frames
Specifies the number of frames (sets of input matrices) processed per window.

#### Scale output down by 2^
Describes the power of 2 by which the output is scaled down (right-shifted) before output. For `float` and `cfloat` data types, this parameter must be zero.


#### SSR (Super Sample Rate)
Specifies the number of parallel data paths processed by the block. Increasing SSR allows for higher throughput by processing multiple samples in parallel.

**Column Distribution When SSR > 1:**

In the SSR case, only input A is split column-wise across the SSR input ports. Input B is not split or duplicated; each SSR path receives the full input B matrix. The output is concatenated column-wise.

**Input/Output Mapping Example (SSR = 2):**

Suppose Matrix A is 8×4 and Matrix B is 8×2, with SSR = 2:

- inA[0] receives columns 1 and 2 of Matrix A (8×2)
- inA[1] receives columns 3 and 4 of Matrix A (8×2)
- inB[0] and inB[1] both receive the full Matrix B (8×2)

The output from each SSR path is concatenated column-wise to form the final output matrix.

**Important Note:**

Alternating columns are not mandatory.
Any distribution scheme is valid, provided the output ports will reflect the same distribution pattern used at the inputs.

For example:

First half columns on port 0, second half on port 1.

Even columns on port 0, odd columns on port 1.


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

[![](./Images/Kronecker_Stream_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.1/Examples/Block_Help/AIE/Kronecker_Stream_Ex1)



--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT

