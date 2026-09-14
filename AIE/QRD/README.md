# QRD (QR Decomposition)

Implements QR decomposition targeted for AI Engines using the Modified Gram-Schmidt method.

![](./Images/block.png)

## Library

AI Engine/Solver/Buffer IO

## Description

This block computes the QR decomposition of an input matrix A, producing orthogonal matrix Q and upper triangular matrix R. The Modified Gram-Schmidt implementation is supported on AIE, AIE-ML, and AIE-ML v2 devices. A Householder variant may be available when supported by the underlying DSPLib delivery.

Input and output matrices are 2D signals whose dimensions are set by the block parameters. Leading-dimension parameters control whether each matrix is stored in row-major or column-major order. For matrix layout assumptions and supported parameter ranges, see *AI Engine Solver Blocks* in the Vitis Model Composer User Guide (UG1483).

## Parameters

### Main

#### Input data type
Type of individual data samples of the input matrix.

#### Rows of matrix
Number of rows in the input matrix.

#### Columns of matrix
Number of columns in the input matrix.

#### Number of frames
Number of matrices to decompose per call to the kernel.

#### Number of cascade stages
Number of kernels used to split up and cascade the workload.

#### A input leading dimension
Describes which dimension of matrix A input data is contiguous in memory. **Row-major (1)** or **Column-major (0)**.

#### Q output leading dimension
Describes which dimension of matrix Q output data is contiguous in memory. **Row-major (1)** or **Column-major (0)**.

#### R output leading dimension
Describes which dimension of matrix R output data is contiguous in memory. **Row-major (1)** or **Column-major (0)**.

### Constraints
Click the constraint manager button to set per-kernel constraints. An asterisk (*) appears next to the button when non-default constraints are in use.

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
