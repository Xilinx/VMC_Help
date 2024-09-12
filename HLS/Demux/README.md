# Demux

Separates a vector input into a number of scalar and vector outputs.

![](./Images/block.png)

## Library

Signal Routing

## Description

The Demux block input signal can be a scalar, a vector, a row matrix
(1xN), or a column matrix (Nx1). The block splits elements in the input
signal into scalar and vector type output signals according to the width
of each output port starting from the first port at the top right.

The number of output ports and the port widths are configurable using
the Number of outputs block parameter,

You can specify the width of each port or it can be dynamically computed
by the block based on how the parameter value is provided. Refer to the
Parameters section below for more details.

When the value of the Number of outputs parameter is changed, the output
ports are either added or removed starting from the last port at the
bottom right.


![](./Images/ezt1554848296729.png)


![](./Images/thn1555289591954.png)

The output ports are added/removed starting from the last port at the
bottom right.

## Data Type Support

Inputs  
- The block has one input port.
- The input signal can be a scalar, a vector (N), a row matrix (1xN), or
  column matrix (Nx1), where N is the width of input signal.
- The Demux block supports all native data types (double, single, uint8,
  int8, uint16, int16, uint32, int32, and boolean), and Model Composer
  supported half and fixed-point data types.
- The block supports input data in real or complex numeric type.


Outputs  
- The number of outputs for the block is specified using the Number of
  outputs block parameter.
- The value of the block parameter can be a finite positive integer, P,
  or an array of integers. The numbers in the array are used to decide
  the number of outputs as well as the width of each output signal.
- An output signal can be configured as a scalar, a vector (M), a row
  matrix (1xM), or a column matrix (Mx1) where M is less than or equal
  to the width of the input signal.
- The sum of widths of all output signals is ensured to be the same as
  the input signal width.
- The data type and the numeric type (real or complex) of output signals
  are the same as those of the input signal.

## Parameters

#### Number of outputs  
This parameter takes number of outputs in several ways. Depending upon
the parameter value, the output ports are added/removed starting from
the last port at the bottom right.

##### 1
###### 2
The block icon is initially created with two output ports.

The input signal width is equally divided between the two outputs. If the input signal width is an odd number, then any remainder of the width is assigned to the first port at the top right.


##### 2
###### P
A finite integer value representing the number of output ports.

P must be greater than 0.

The block icon is redrawn with the specified number of output ports. The widths of the output ports are dynamically computed by the block as follows:

The width of the input is equally divided among the outputs. Any remainder of the width is assigned, one each, to the outputs starting from the first port at the top right.

For example, if N is 3, and the width of the input is 14, then the first output is assigned with the first 5 input elements, the second output is assigned with the next 5 input elements, and the third output is assigned with the last 4 input elements.

##### 3
###### [P]
A finite positive integer in square brackets is treated just like option 2 above. Here, the number of outputs will be P.

##### 4
###### [-1 -1 -1]
The block icon is redrawn with 3 output ports. Here -1 means that the width of the particular output port needs to be computed in the same way as it is explained in the option 2 above.

##### 5
###### [3 -1 -1]
The block icon is redrawn with 3 output ports.

You specify the width of the first output, and Model Composer computes the widths of the second and the third outputs.

For example, if width of the input is 8, and the first output width is 3, then the remaining width of 5 is divided between the second and the third outputs. This results in the widths of the second and the third outputs to be set to 3 and 2 respectively.

##### 6
###### 3 3 1
The block icon is redrawn with 3 output ports.

The width of each output port is already specified by the user. The sum of the width of the outputs is 7. The width of the input must be 7, otherwise, an error message appears.

--------------
Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
