# DDS

  
![](./Images/block.png)  

## Library

AI Engine/DSP/Window IO

## Description

This block implements the Direct Digital Synthesizer (DDS) targeted for
AI Engines.

## Parameters

### Main  
#### Output data type  
* Describes the types of individual data samples output of the DDS
function. The supported data types are `cint16` and `cfloat`.

#### Output window size (Number of samples)  
* Specifies the number of samples in output window. The value must be in
the range 8 to 1024 and the default value is `32`.

#### Phase increment  
* Specifies the phase increment between samples. The value must be in the
range `0` to `2^31` and the default value is `0`. Input value `2^31`
corresponds to Pi (i.e., `180`).

  Phase increment is calculated using the formula (Fo\*(2^N)) / Fs

  Where:
  - `Fo` = Output frequency
  - `N` = 32, which represents the accumulator width, and it is fixed
  - `Fs` = Sampling frequency

#### Sample time  
* Specifies the sample time for the block output port. The default value
is `-1`.

### Advanced  
#### Target output throughput (MSPS)  
* Specifies the output sampling rate of the DDS function in Mega Samples
per Second (MSPS). The value must be in the range `1` to `1000` and the
default value is `200`.

--------------
Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
