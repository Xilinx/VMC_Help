# FIR Compiler 7.2

![](./Images/block.png)


## Description
The FIR Compiler block provides users with a way to generate
highly parameterizable, area-efficient, high-performance FIR filters
with an AXI4-Stream-compliant interface.

### AXI Ports that are Unique to this Block

This block exposes the AXI CONFIG channel as a group of separate ports
based on sub-field names. The sub-field ports are described as follows:


Configuration Channel Input Signals:

| Input Signal | Description |
|--------|-------------|
| config_tdata_fsel     | A sub-field port that represents the fsel field in the Configuration Channel vector. fsel is used to select the active filter set. This port is exposed when the number of coefficient sets is greater than one. Refer to the FIR Compiler LogiCORE IP Product Guide ([PG149](https://docs.xilinx.com/access/sources/framemaker/map?isLatest=true&ft:locale=en-US&url=pg149-fir-compiler)) for an explanation of the bits in this field. |


## Parameters


### Filter Specification tab  
Parameters specific to the Filter Specification tab are as follows.

#### Coefficient Vector  
Specifies the coefficient vector as a single MATLAB® row vector. The
number of taps is inferred from the length of the MATLAB® row vector. If
multiple coefficient sets are specified, then each set is appended to
the previous set in the vector. It is possible to enter these
coefficients using the [FDATool](../../UTIL/Xilinx_FDATool_Interface_Block/README.md) block as well.

#### Number of Coefficients Sets  
The number of sets of filter coefficients to be implemented. The value
specified must divide without remainder into the number of coefficients.

#### Use Reloadable Coefficients  
Check to add the coefficient reload ports to the block. The set of data
loaded into the reload channel will not take action until triggered by a
re-configuration synchronization event. Refer to the FIR Compiler LogiCORE IP Product Guide ([PG149](https://docs.xilinx.com/access/sources/framemaker/map?isLatest=true&ft:locale=en-US&url=pg149-fir-compiler))
for a more detailed explanation of the RELOAD Channel interface timing.
This block supports the xlGetReOrderedCoeff function; see Appendix A of the Vitis Model Composer User Guide (UG1483) for examples of how to use this function.

 
#### Filter Type  
###### Single_Rate  
The data rate of the input and the output are the same.

##### Interpolation  
The data rate of the output is faster than the input by a factor
specified by the Interpolation Rate Value.

##### Decimation  
The data rate of the output is slower than the input by a factor
specified in the Decimation Rate Value.

##### Hilbert  
Filter uses the Hilbert Transform.

###### Interpolated  
An interpolated FIR filter has a similar architecture to a conventional
FIR filter, but with the unit delay operator replaced by k-1 units of
delay. k is referred to as the zero-packing factor. The interpolated FIR
should not be confused with an interpolation filter. Interpolated
filters are single-rate systems employed to produce efficient
realizations of narrow-band filters and, with some minor enhancements,
wide-band filters can be accommodated. The data rate of the input and
the output are the same.

#### Rate Change Type  
This field is applicable to Interpolation and Decimation filter types.
Used to specify an Integer or Fixed_Fractional rate change.

#### Interpolation Rate Value  
This field is applicable to all Interpolation filter types and
Decimation filter types for Fractional Rate Change implementations. The
value provided in this field defines the up-sampling factor, or P for
Fixed Fractional Rate (P/Q) resampling filter implementations.

#### Decimation Rate Value  
This field is applicable to the all Decimation and Interpolation filter
types for Fractional Rate Change implementations. The value provided in
this field defines the down-sampling factor, or Q for Fixed Fractional
Rate (P/Q) resampling filter implementations.


### Channel Specification tab  
Parameters specific to the Channel Specification tab are as follows.
 
#### Channel Sequence  
Select Basic or Advanced. See the FIR Compiler LogiCORE IP Product Guide ([PG149](https://docs.xilinx.com/access/sources/framemaker/map?isLatest=true&ft:locale=en-US&url=pg149-fir-compiler)) 
for an explanation of the advanced channel specification feature.

#### Number of Channels  
The number of data channels to be processed by the FIR Compiler block.
The multiple channel data is passed to the core in a time-multiplexed
manner. A maximum of 64 channels is supported.

#### Sequence ID List  
A comma delimited list that specifies which channel sequences are
implemented.


#### Number of Paths  
Specifies the number of parallel data paths the filter is to process. As
shown below, when more than one path is specified, the data_tdata input
port is divided into sub-ports that represent each parallel path.  

![](./Images/qfl1538085406107.png)



#### Select format  
##### Maximum_Possible  
Specifies that oversampling be automatically determined based on the din
sample rate.

##### Input_Sample_Period/Output_Sample_Period  
Activates the Sample period. Enter the Sample Period specification.
Selecting this option exposes the s_axis_data_tvalid port (called ND
port on earlier versions of the core). With this port exposed, no input
handshake abstraction and no rate-propagation takes place.

##### Hardware Oversampling Rate  
Activates the Hardware Oversampling Rate. Enter the Hardware
Oversampling Rate specification below.

#### Hardware Oversampling Rate  
The hardware oversampling rate determines the degree of parallelism. A
rate of one produces a fully parallel filter. A rate of n (resp., n+1)
for an n-bit input signal produces a fully serial implementation for a
non-symmetric (resp., symmetric) impulse response. Intermediate values
produce implementations with intermediate levels of parallelism.

### Implementation tab  
Parameters specific to the Implementation tab are as follows.


#### Coefficient Type  
Specify Signed or Unsigned.

#### Quantization  
Specifies the quantization method to be used for quantizing the
coefficients. This can be set to one of the following:

  - Integer_Coefficients
  - Quantize_Only
  - Maximize_Dynamic_Range
  - Normalize_to_Centre_Coefficient

#### Coefficient Width  
Specifies the number of bits used to represent the coefficients.

#### Best Precision Fractional Bits  
When selected, the coefficient fractional width is automatically set to
maximize the precision of the specified filter coefficients.

#### Coefficient Fractional Bits  
Specifies the binary point location in the coefficients datapath
options.

#### Coefficients Structure  
Specifies the coefficient structure. Depending on the coefficient
structure, optimizations are made in the core to reduce the amount of
hardware required to implement a particular filter configuration. The
selected structure can be any of the following:

  - Inferred
  - Non-Symmetric
  - Symmetric
  - Negative_Symmetric
  - Half_Band
  - Hilbert

The vector of coefficients specified must match the structure specified
unless Inferred from coefficients is selected in which case the
structure is determined automatically from these coefficients.


#### Output Rounding Mode  
  Choose one of the following:

  - Full_Precision
  - Truncate_LSBs
  - Non_Symmetric_Rounding_Down
  - Non_Symmetric_Rounding_Up
  - Symmetric_Rounding_to_Zero
  - Symmetric_Rounding_to_Infinity
  - Convergent_Rounding_to_Even
  - Convergent_Rounding_to_Odd

#### Output Width  
Specify the output width. Edit box activated only if the Rounding mode
is set to a value other than Full_Precision.

### Detailed Implementation tab  
Parameters specific to the Detailed Implementation tab are as follows.

#### Filter Architecture  
The following two filter architectures are supported:

  - Systolic_Multiply_Accumulate
  - Transpose_Multiply_Accumulate
    **Note**: When selecting the Transpose Multiply-Accumulate architecture,
  these limitations apply:

    - Symmetry is not exploited. If the Coefficient Vector specified on
    the Filter Specification tab is detected as symmetric, the FIR
    Compiler 7.2 block parameters dialog box will not allow you to
    select Transpose Multiply Accumulate.
    - Multiple interleaved channels are not supported.

#### Optimization Options  
Specifies if the core is required to operate at maximum possible speed
(“Speed” option) or minimum area (“Area” option). The “Area” option is
the recommended default and will normally achieve the best speed and
area for the design, however in certain configurations, the “Speed”
setting might be required to improve performance at the expense of
overall resource usage (this setting normally adds pipeline registers in
critical paths).

#### Goal  
  - Area
  - Speed
  - Custom


#### List
A comma delimited list that specifies which optimizations are
implemented by the block. The optimizations are as follows.

###### Data_Path_Fanout  
Adds additional pipeline registers on the data memory outputs to
minimize fan-out. Useful when implementing large data width filters
requiring multiple DSP slices per multiply-add unit.

###### Pre-Adder_Pipeline  
Pipelines the pre-adder when implemented using fabric resources. This
may occur when a large coefficient width is specified.

###### Coefficient_Fanout  
Adds additional pipeline registers on the coefficient memory outputs to
minimize fan-out. Useful for Parallel channels or large coefficient
width filters requiring multiple DSP slices per multiply-add unit.

###### Control_Path_Fanout  
Adds additional pipeline registers to control logic when Parallel
channels have been specified.

###### Control_Column_Fanout  
Adds additional pipeline registers to control logic when multiple DSP
columns are required to implement the filter.

###### Control_Broadcast_Fanout  
Adds additional pipeline registers to control logic for fully parallel
(one clock cycle per channel per input sample) symmetric filter
implementations.

###### Control_LUT_Pipeline  
Pipelines the Look-up tables required to implement the control logic for
Advanced Channel sequences.

###### No_BRAM_Read_First_Mode  
Specifies that Block RAM READ-FIRST mode should not be used.

###### Increased speed  
Multiple DSP slice columns are required for non-symmetric filter
implementations.

###### Other  
Miscellaneous optimizations.
**Note**: All optimizations may be specified but are only implemented when
relevant to the core configuration.

#### Memory Options  
The memory type for MAC implementations can either be user-selected or
chosen automatically to suit the best implementation options. Note that
a choice of “Distributed” might result in a shift register
implementation where appropriate to the filter structure. Forcing the
RAM selection to be either Block or Distributed should be used with
caution, as inappropriate use can lead to inefficient resource usage -
the default Automatic mode is recommended for most applications.

#### Data Buffer Type  
Specifies the type of memory used to store data samples.

#### Coefficient Buffer Type  
Specifies the type of memory used to store the coefficients.

#### Input Buffer Type  
Specifies the type of memory to be used to implement the data input
buffer, where present.

#### Output Buffer type  
Specifies the type of memory to be used to implement the data output
buffer, where present.

#### Preference for other storage  
Specifies the type of memory to be used to implement general storage in
the datapath.


#### Multi-Column Support  
For device families with DSP slices, implementations of large high speed
filters might require chaining of DSP slice elements across multiple
columns. Where applicable (the feature is only enabled for multi-column
devices), you can select the method of folding the filter structure
across the multiple-columns, which can be Automatic (based on the
selected device for the project) or Custom (you select the length of the
first and subsequent columns).

#### Column Configuration  
Specifies the individual column lengths in a comma delimited list. (See
the data sheet for a more detailed explanation.)

#### Inter-Column Pipe Length  
Pipeline stages are required to connect between the columns, with the
level of pipelining required being depending on the required system
clock rate, the chosen device and other system-level parameters. The
choice of this parameter is always left for you to specify.


### Interface tab  
  
#### TLAST  
TLAST can either be Not_Required, in which case the block will not have
the port, or Vector_Framing, where TLAST is expected to denote the last
sample of an interleaved cycle of data channels, or Packet_Framing,
where the block does not interpret TLAST, but passes the signal to the
output DATA channel TLAST with the same latency as the datapath.

#### Output TREADY  
This field enables the data_tready port. With this port enabled, the
block will support back-pressure. Without the port, back-pressure is not
supported, but resources are saved and performance is likely to be
higher.

#### Input FIFO  
Selects a FIFO interface for the S_AXIS_DATA channel. When the FIFO has
been selected, data can be transferred in a continuous burst up to the
size of the FIFO (default 16) or, if greater, the number of interleaved
data channels. The FIFO requires additional FPGA logic resources.

#### Input/Output
Select one of the following options for the Input and the Output.
##### Not_Required  
Neither of the uses is required; the channel in question will not have a
TUSER field.

##### User_Field  
In this mode, the block ignores the content of the TUSER field, but
passes the content untouched from the input channel to the output
channels.

##### Chan_ID_Field  
In this mode, the TUSER field identifies the time-division-multiplexed
channel for the transfer.

##### User and Chan_ID_Field  
In this mode, the TUSER field will have both a user field and a chan_id
field, with the chan_id field in the least significant bits. The minimal
number of bits required to describe the channel will determine the width
of the chan_id field, e.g. 7 channels will require 3 bits.


#### Synchronization Mode  
##### On_Vector  
Configuration packets, when available, are consumed and their contents
applied when the first sample of an interleaved data channel sequence is
processed by the block. When the block is configured to process a single
data channel configuration packets are consumed every processing cycle
of the block.

##### On_Packet  
Further qualifies the consumption of configuration packets. Packets will
only be consumed once the block has received a transaction on the
s_axis_data channel where s_axis_data_tlast has been asserted.

#### Configuration Method  
##### Single  
A single coefficient set is used to process all interleaved data
channels.

##### By_Channel  
A unique coefficient set is specified for each interleaved data channel.


#### Reload Slots  
Specifies the number of coefficient sets that can be loaded in advance.
Reloaded coefficients are only applied to the block once the
configuration packet has been consumed (Range 1 to 256).


#### ACLKEN
Active-high clock enable. Available for MAC-based FIR implementations.

#### ARESETn (active low)  
Active-low synchronous clear input that always takes priority over
ACLKEN. A minimum ARESETn active pulse of two cycles is required, since
the signal is internally registered for performance. A pulse of one
cycle resets the control and datapath of the core, but the response to
the pulse is not in the cycle immediately following.

### Advanced tab  
#### Block Icon Display  
##### Display shortened port names  
On by default. When unchecked, data_tvalid, for example, becomes
m_axis_data_tvalid.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

## Examples

***Click on the images below to open each model.***

**Decimation Filter:**

[![](./Images/FIR_Compiler_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.1/Examples/Block_Help/HDL/FIR_Compiler_Ex1)

**Interpolation Filter:**

[![](./Images/FIR_Compiler_Ex2.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2024.1/Examples/Block_Help/HDL/FIR_Compiler_Ex2)

## LogiCORE™ Documentation

FIR Compiler LogiCORE IP Product Guide
([PG149](https://docs.xilinx.com/access/sources/framemaker/map?isLatest=true&ft:locale=en-US&url=pg149-fir-compiler))

--------------
Copyright (C) 2024 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
