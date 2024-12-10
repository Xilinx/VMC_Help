# Shared Buffer
This block allows access to a shared buffer within the AIE-ML memory tile.
  
![](./Images/block.png)  

## Library

AI Engine/Interfaces

## Description

This block allows access to a shared buffer within the AIE-ML memory tile. Memory tiles are large memories that can be used to store intermediate results that would not fit in an AI Engine-ML data memory. Memory tiles can also be used to efficiently rearrange data.

The Shared Buffer block can be connected with other AI Engine kernels in your design to read to and write from the shared buffer.

<div class="noteBox">
This block requires an AIE-ML device to be selected in the Vitis Model Composer Hub block.
</div>

## Parameters

#### Data type

Data type contained in the shared buffer. The output of the **Shared Buffer** block will have this data type.

#### Number of buffers

Number of buffers instantiated in the memory tile. When **Number of buffers** is 2 a ping-pong mechanism will be used, increasing throughput. 

#### Buffer dimension

A vector of 1, 2, 3 or 4 elements defining the sizes over the various dimensions of the buffer. These sizes are defined in terms of samples.

For example, to create a 64x64x2 buffer, set **Buffer dimension** to `[64,64,2]`.

#### Number of input ports

The number of physical input ports that are used to write to the shared buffer. There are six ports that can be shared among all buffers located in a memory tile.

#### Number of output ports

The number of physical output ports that will be used to read from this buffer. There are six ports that can be shared among all buffers located in a memory tile.

#### Input tiling

A MATLAB structure containing the tiling parameters for each input port. See [Tiling Parameters](#tiling-parameters). You can define the tiling parameters as variables in the MATLAB workspace and specify the variable name in this field.

#### Output tiling

A MATLAB structure containing the tiling parameters for each output port. See [Tiling Parameters](#tiling-parameters). You can define the tiling parameters as variables in the MATLAB workspace and specify the variable name in this field.

## Tiling Parameters

Tiling parameters define the order in which data is transferred to or from the memory tile on each port. 

The tiling parameters should be specified in a MATLAB structure with the following fields. 
* **`tiling_dimension`**: A vector of 1, 2, 3 or 4 elements defining the sizes over the various dimensions of the tile. These sizes are defined in terms of samples.
* **`offset`**: Multidimensional offset with respect to the starting element in the buffer.
* **`tile_traversal`**: A vector of MATLAB structures defining the traversal parameters for each dimension of the buffer. Each structure has the following fields:
    * **`dimension`**: The buffer dimension on which this traversing loop applies. For AIE-ML memory tiles, it could be the 0th, 1st, 2nd or 3rd dimension. The stride and wrap members of this structure are applied in the dimension specified.
    * **`stride`**: Represents the distance in terms of buffer element data type between consecutive inter-tile traversal in this dimension.
    * **`wrap`**: Number of tiles to access in this dimension.
* **`packet_port_id`**: Multiple connections can go through a single port that are previously merged through a `pktmerge` block or split afterward with a `pktsplit` block. This member represents the output port ID of the connected `pktsplit` or the input port ID of the connected `pktmerge`. If this member is set to a specific id, the data transfer will only happen if the incoming or outgoing data block ID matches this ID.
* **`repetition`**: Number of repetitions of tiling traversal scheme.
* **`boundary_dimension`**: Real data boundary dimension for padding.

<div class="noteBox">
Not all fields are mandatory.

Within the tiling parameters structure, `tiling_dimension` and `offset` are the only mandatory fields. 

Within the `tile_traversal` structure, `dimension`, `stride`, and `wrap` are all mandatory fields.
</div>

The output size of each port can be determined from the tiling parameters as follows:

`output size = tiling_dimension * (total wraps in all dimensions) * repetition`

For a further description of the tiling parameters, see [Tiling Parameters and Buffer Descriptors](https://docs.xilinx.com/r/en-US/ug1603-ai-engine-ml-kernel-graph/Tiling-Parameters-and-Buffer-Descriptors).

### Tiling Parameter Examples

#### 16x16 Shared Buffer implementing a Matrix Transpose

Write full contents of the buffer in one write:
```
inputTilingParams = struct( ...
    'tiling_dimension', [16, 16], ...
    'offset', [0, 0] ...
)
```

Read full contents of buffer one sample at a time, transposed:
```
outputTilingParams = struct( ...
    'tiling_dimension', [1, 1], ...
    'offset', [0, 0], ...
    'tile_traversal', [struct('dimension', 1, 'stride', 1, 'wrap', 16), ...
                       struct('dimension', 0, 'stride', 1, 'wrap', 16)] ...
)
```

#### 64x64 Shared Buffer

Write full contents of the buffer in a row-wise fashion:
```
inputTilingParams = struct( ...
    'tiling_dimension', [64, 1], ... 
    'offset', [0, 0], ...
    'tile_traversal', [struct('dimension', 1, 'stride', 1, 'wrap', 64)] ...
)
```

Read full contents of the buffer in tiles of size 16x4:
```
outputTilingParams = struct( ...
    'tiling_dimension', [16, 4], ...
    'offset', [0, 0], ...
    'tile_traversal', [struct('dimension', 0, 'stride', 16, 'wrap', 4) ...
                       struct('dimension', 1, 'stride', 4, 'wrap', 16)] ...
)
```
## Examples

***Click on the images below to open each model.***

[![](./Images/Shared_Buffer_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.2/Examples/Block_Help/AIE/Shared_Buffer_Ex1)

## References
To learn more about Shared Buffers, refer to [AI Engine-ML Kernel and Graph Programming Guide (UG1603)](https://docs.xilinx.com/r/en-US/ug1603-ai-engine-ml-kernel-graph/AI-Engine-ML-Memory-Tile-Access).

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
