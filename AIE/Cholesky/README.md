# Cholesky

Implements Cholesky decomposition targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/Solver/Buffer IO

## Description

This block computes the Cholesky factorization of a square input matrix. For a real symmetric positive-definite matrix `A`, it returns the lower triangular factor `L` such that `A = L × L^T`. The input must be symmetric positive-definite; for a real symmetric matrix, verify that all eigenvalues are positive before using the block.

Input matrices are 2D signals. The block supports configurable matrix dimensions, tiling, multiple frames, and cascade stages. For matrix layout conventions and supported parameter ranges, see *AI Engine Solver Blocks* in the Vitis Model Composer User Guide (UG1483).

## Reconstructing the Input Matrix

To reconstruct the input, connect the Cholesky output `L` directly to one Matrix Multiply input and connect it through a Transpose block to the other. The multiply computes `A_reconstructed = L × L^T`, which should match the original matrix `A` within numerical precision. Disable **Provide diagonal elements inverse** to output the standard factor `L` required for this reconstruction.

## Parameters

### Main

#### Input data type
Specifies the data type of the input matrix elements.

#### Length of matrix dimension
Specifies the number of rows and columns in the square input matrix.

#### Length of tile dimension
Specifies the number of rows and columns in each tile. Choose a value supported by the selected device and library implementation.

#### Number of frames
Specifies the number of input matrices to process per kernel call.

#### Number of cascade stages
Specifies the number of kernels used to divide and cascade the computation.

#### Provide diagonal elements inverse
When enabled, the diagonal elements of the Cholesky factor are provided as their reciprocals. Enable this option when a downstream substitution kernel expects inverse diagonal elements. Disable it to retain the standard factor output.

### Constraints
Use the constraint manager to set per-kernel constraints. When **Number of cascade stages** is greater than one, constraints can be set for each kernel; run the design before configuring them. Constraints affect generated graph code, cycle-approximate AIE simulation (System C), and hardware behavior, but not functional simulation in Simulink.

## Cholesky Block Examples

These examples compare the AI Engine Cholesky block in Vitis Model Composer with the MATLAB Cholesky reference. Click an image to open its model.

[![](./Images/Cholesky_Example1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/Cholesky_Ex1)
[![](./Images/Cholesky_Example2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/Cholesky_Ex2)
[![](./Images/Cholesky_Example3.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/Cholesky_Ex3)
[![](./Images/Cholesky_Example4.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.2/Examples/Block_Help/AIE/Cholesky_Ex4)


--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
