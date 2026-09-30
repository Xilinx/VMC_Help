# SVD (Singular Value Decomposition)

Implements singular value decomposition targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/Solver/Buffer IO

## Description

This block computes the singular value decomposition of an input matrix `A`, expressing it as `A = U × diag(S) × V^H`, where `V^H` is the conjugate transpose of `V`. `U` and `V` are orthonormal (orthogonal for real data). `S` is a vector of singular values, and `diag(S)` is the diagonal matrix formed from that vector. The implementation uses Jacobi sweep passes; increasing the number of passes can improve accuracy at the cost of additional processing cycles.

Input matrices are 2D signals. Set the matrix dimensions and Jacobi sweep parameters to match the input and the desired decomposition accuracy. For matrix layout assumptions and supported parameter ranges, see *AI Engine Solver Blocks* in the Vitis Model Composer User Guide (UG1483).

## Parameters

### Main

#### Input data type
Specifies the data type of the input matrix elements. The legal values are `float` and `cfloat`.

#### Rows of matrix
Specifies the number of rows in the input matrix `A`.

#### Columns of matrix
Specifies the number of columns in the input matrix `A`.

#### Number of cascade stages
Specifies the number of kernels used to divide and cascade the computation.

#### Number of Jacobi sweep passes
Specifies the number of Jacobi sweep passes to perform. More passes can improve accuracy but require additional processing cycles.

#### Number of Jacobi sweep passes ssr
Specifies the number of pass-pipeline stages (`TP_PASSES_SSR`). For a value from 1 through **Number of Jacobi sweep passes**, that pass count must be evenly divisible by this value, and each stage performs (passes / stages) Jacobi sweeps. A value of one more than **Number of Jacobi sweep passes** is also legal: the first stages each perform one Jacobi sweep, and the last stage performs no sweep. That last stage extracts the singular values, normalizes `U`, sorts `U`, `S`, and `V`, and compacts `V`.

#### Provide diagonal elements inverse
When enabled, the block provides the inverse of the singular values in `S`. Disable this option when the downstream design requires the standard singular values.

### Constraints
Use the constraint manager to set per-kernel constraints. When **Number of cascade stages** is greater than one, constraints can be set for each kernel; run the design before configuring them. Constraints affect generated graph code, cycle-approximate AIE simulation (System C), and hardware behavior, but not functional simulation in Simulink.

## SVD Block Examples

The following examples demonstrate the AI Engine SVD block. Click an image to open its model.

[![](./Images/SVD_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/SVD_Ex1)
[![](./Images/SVD_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/SVD_Ex2)
[![](./Images/SVD_Ex3.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/SVD_Ex3)

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
