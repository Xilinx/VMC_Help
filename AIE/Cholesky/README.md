# Cholesky

Implements Cholesky decomposition targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/Solver/Buffer IO

## Description

This block performs Cholesky decomposition on a square input matrix. The block supports configurable matrix dimension, tiling for large matrices, and optional diagonal-inverse specialization for use with substitution kernels.

Input matrices are 2D signals. See *AI Engine Solver Blocks* in UG1483 for supported matrix layouts and leading-dimension conventions.

## Parameters

### Main

#### Input data type
Type of individual data samples of the input matrix.

#### Length of matrix dimension
Length of one dimension of the square input matrix.

#### Length of tile dimension
Length of one dimension of the tiling scheme used to divide the input matrix across multiple kernels.

#### Number of frames
Number of matrices to decompose per kernel call.

#### Number of cascade stages
Number of kernels used to cascade the workload.

#### Provide diagonal elements inverse
When enabled, the block provides the inverse of diagonal elements. Disable when chaining with a substitution core that requires the standard Cholesky output form.

### Constraints
Use the constraint manager to set per-kernel constraints.

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
