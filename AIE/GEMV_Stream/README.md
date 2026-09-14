# GEMV Stream (General Matrix-Vector Multiplication)

Implements General Matrix-Vector Multiplication using stream interfaces on AI Engines.

![](./Images/block.png)

## Library

AI Engine/DSP/Stream IO

## Description

This block performs GEMV (output = A×B) with stream IO, matching the functionality of the [buffer IO GEMV](../GEMV/README.md) block. Matrix A can be supplied through an input stream or via Run-Time Parameterization (RTP).

When RTP delivery of matrix A is enabled, the tool validates matrix dimensions and data types at configuration time and reports actionable design rule check messages if parameters are inconsistent.

## Parameters

### Main

Parameters match the [GEMV](../GEMV/README.md) block unless noted below.

#### Provide matrix A via RTP
When checked, matrix A is provided via RTP instead of an input stream.

#### A input data type / B input data type
Supported types include `int16`, `int32`, `cint16`, `cint32`, `float`, and `cfloat`.

#### Rows in input A / Columns in input A, Length of vector B
Define matrix and vector dimensions for the GEMV operation.

#### SSR (Super Sample Rate)
Number of parallel stream lanes. When SSR > 1, matrix A is split across lanes along the first dimension, vector B is duplicated, and outputs are concatenated.

#### Number of cascade stages
Number of cascaded kernel instances.

#### A input leading dimension
Row-major (0) or column-major (1) layout for matrix A.

### Constraints
Use the constraint manager for per-kernel constraints.

--------------
Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
