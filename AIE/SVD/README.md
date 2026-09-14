# SVD (Singular Value Decomposition)

Implements singular value decomposition targeted for AI Engines.

![](./Images/block.png)

## Library

AI Engine/Solver/Buffer IO

## Description

This block computes the singular value decomposition of an input matrix using Jacobi sweep passes. More passes improve accuracy at the cost of additional cycles.

Input matrices are 2D signals whose row and column dimensions are set by block parameters. See *AI Engine Solver Blocks* in UG1483 for matrix layout assumptions.

## Parameters

### Main

#### Input data type
Type of individual data samples of the input matrix.

#### Rows of matrix
Number of rows in the input matrix.

#### Columns of matrix
Number of columns in the input matrix.

#### Number of Jacobi sweep passes
Number of Jacobi sweep passes to perform. More passes improve accuracy at the cost of additional cycles.

#### Number of cascade stages
Number of kernels the SVD is split over to support larger matrix sizes.

### Constraints
Use the constraint manager to set per-kernel constraints.

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
