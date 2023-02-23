# Vector FIR

The Vector FIR block supports FIR filtering for vector type inputs.

![](./Images/block.png)

## Description

This Vector FIR Compiler block provides a way to generate highly
parameterizable, area-efficient, high-performance FIR filters with an
AXI4-Stream-compliant interface.

### AXI Ports that are Unique to this Block

This block exposes the AXI CONFIG channel as a group of separate ports
based on sub-field names. The sub-field ports are described as follows:

Configuration Channel Input Signals:

|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| config_tdata_fsel | A sub-field port that represents the fsel field in the Configuration Channel vector. fsel is used to select the active filter set. This port is exposed when the number of coefficient sets is greater than one. Refer to the [FIR Compiler V7.2 Product Guide](https://www.xilinx.com/support/documentation/ip_documentation/fir_compiler/v7_2/pg149-fir-compiler.pdf) starting on page 5 for an explanation of the bits in this field. |

## Parameters

### Filter Specification tab  
Parameters specific to the Filter Specification tab are as follows:

#### Filter Coefficients  
##### Coefficient Vector  
Specifies the coefficient vector as a single MATLAB row vector. The
number of taps is inferred from the length of the MATLAB row vector. If
multiple coefficient sets are specified, then each set is appended to
the previous set in the vector. It is possible to enter these
coefficients using the [FDATool](fdatool.html) block as well.

##### Number of Coefficients Sets  
The number of sets of filter coefficients to be implemented. The value
specified must divide without remainder into the number of coefficients.

##### Use Reloadable Coefficients  
Check to add the coefficient reload ports to the block. The set of data
loaded into the reload channel will not take action until triggered by a
re-configuration synchronization event. Refer to the [FIR Compiler V7.2
Product
Guide](https://www.xilinx.com/support/documentation/ip_documentation/fir_compiler/v7_2/pg149-fir-compiler.pdf)
for a more detailed explanation of the RELOAD Channel interface timing.
This block supports the xlGetReloadOrder function. See the Model
Composer Utility function xlGetReloadOrder for details.

#### Filter Specification  
##### Filter Type  
###### Single_Rate  
The data rate of the input and the output are the same.

###### Interpolation  
The data rate of the output is faster than the input by a factor
specified by the Interpolation Rate value.

###### Decimation  
The data rate of the output is slower than the input by a factor
specified in the Decimation Rate Value.

##### Rate Change Type  
This field is applicable to Interpolation and Decimation filter types.
Used to specify an Integer or Fixed_Fractional rate change.

##### Interpolation Rate Value  
This field is applicable to all Interpolation filter types and
Decimation filter types for Fractional Rate Change implementations. The
value provided in this field defines the up-sampling factor, or P for
Fixed Fractional Rate (P/Q) resampling filter implementations.

##### Decimation Rate Value  
This field is applicable to the all Decimation and Interpolation filter
types for Fractional Rate Change implementations. The value provided in
this field defines the down-sampling factor, or Q for Fixed Fractional
Rate (P/Q) resampling filter implementations.


##### Super Sample Rate (SSR)
This configurable GUI parameter is primarily
used to control processing of multiple data samples on every sample
period. This blocks enable 1-D vector support for the primary block
operation.
- If the filter type is Interpolation, the output vector size (SSR value
  on the output side) is equal to the SSR value on the input side
  multiplied by Interpolation Rate Value.
- If the filter type is Decimation, the output vector size is equal to
  the SSR value on the input side divided by Decimation Rate Value.

### Implementation tab  
Parameters specific to the Implementation tab are as follows:

#### Coefficient Options  
##### Coefficient Type  
Specify Signed or Unsigned.

##### Quantization  
Specifies the quantization method to be used for quantizing the
coefficients. This can be set to one of the following:

- Integer_Coefficients
- Quantize_Only
- Maximize_Dynamic_Range
- Normalize_to_Centre_Coefficient

##### Coefficient Width  
Specifies the number of bits used to represent the coefficients.

##### Best Precision Fractional Bits  
When selected, the coefficient fractional width is automatically set to
maximize the precision of the specified filter coefficients.

##### Coefficient Fractional Bits  
Specifies the binary point location in the coefficients datapath options

##### Coefficients Structure  
Specifies the coefficient structure. Depending on the coefficient
  structure, optimizations are made in the core to reduce the amount of
  hardware required to implement a particular filter configuration. The
  selected structure can be any of the following:
- Inferred
- Non-Symmetric
- Symmetric

The vector of coefficients specified must match the structure specified
unless Inferred from coefficients is selected in which case the
structure is determined automatically from these coefficients.

#### Datapath Options  
##### Output Rounding Mode  
Choose one of the following:
- Full_Precision
- Truncate_LSBs
- Non_Symmetric_Rounding_Down
- Non_Symmetric_Rounding_Up
- Symmetric_Rounding_to_Zero
- Symmetric_Rounding_to_Infinity
- Convergent_Rounding_to_Even
- Convergent_Rounding_to_Odd

##### Output Width  
Specify the output width. Edit box activated only if the Rounding mode
is set to a value other than Full_Precision.

### Detailed Implementation tab  
Parameters specific to the Detailed Implementation tab are as follows:

#### Filter Architecture  
The following two filter architectures are supported.
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

##### Goal  
- Area
- Speed
- Custom

##### List  
A comma delimited list that specifies which optimizations are
implemented by the block. The optimizations are as follows.
##### Data_Path_Fanout  
Adds additional pipeline registers on the data memory outputs to
minimize fan-out. Useful when implementing large data width filters
requiring multiple DSP slices per multiply-add unit.

##### Pre-Adder_Pipeline  
Pipelines the pre-adder when implemented using fabric resources. This
may occur when a large coefficient width is specified.

##### Coefficient_Fanout  
Adds additional pipeline registers on the coefficient memory outputs to
minimize fan-out. Useful for Parallel channels or large coefficient
width filters requiring multiple DSP slices per multiply-add unit.

##### Control_Path_Fanout  
Adds additional pipeline registers to control logic when Parallel
channels have been specified.

##### Control_Column_Fanout  
Adds additional pipeline registers to control logic when multiple DSP
columns are required to implement the filter.

##### Control_Broadcast_Fanout  
Adds additional pipeline registers to control logic for fully parallel
(one clock cycle per channel per input sample) symmetric filter
implementations.

##### Control_LUT_Pipeline  
Pipelines the Look-up tables required to implement the control logic for
Advanced Channel sequences.

##### No_BRAM_Read_First_Mode  
Specifies that Block RAM READ-FIRST mode should not be used.

##### Increased speed  
Multiple DSP slice columns are required for non-symmetric filter
implementations.

##### Other  
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

##### Data Buffer Type  
Specifies the type of memory used to store data samples.

##### Coefficient Buffer Type  
Specifies the type of memory used to store the coefficients.

##### Input Buffer Type  
Specifies the type of memory to be used to implement the data input
buffer, where present.

##### Output Buffer type  
Specifies the type of memory to be used to implement the data output
buffer, where present.

##### Preference for other storage  
Specifies the type of memory to be used to implement general storage in
the datapath.

#### DSP Slice Column Options  
##### Multi-Column Support  
For device families with DSP slices, implementations of large high speed
filters might require chaining of DSP slice elements across multiple
columns. Where applicable (the feature is only enabled for multi-column
devices), you can select the method of folding the filter structure
across the multiple-columns, which can be Automatic (based on the
selected device for the project) or Custom (you select the length of the
first and subsequent columns).

##### Inter-Column Pipe Length  
Pipeline stages are required to connect between the columns, with the
level of pipelining required being depending on the required system
clock rate, the chosen device and other system-level parameters. The
choice of this parameter is always left for you to specify.

### Interface tab  
#### Data Channel Options  
##### Output TREADY  
This field enables the data_tready port. With this port enabled, the
block will support back-pressure. Without the port, back-pressure is not
supported, but resources are saved and performance is likely to be
higher.

#### Control Options  
##### ACLKEN  
Active-High clock enable. Available for MAC-based FIR implementations.

##### ARESETn (active low)  
Active-low synchronous clear input that always takes priority over
ACLKEN. A minimum ARESETn active pulse of two cycles is required, since
the signal is internally registered for performance. A pulse of one
cycle resets the control and datapath of the core, but the response to
the pulse is not in the cycle immediately following.

Other parameters used by this block are explained in the topic [Common
Options in Block Parameter Dialog
Boxes](../../GEN/common-options/README.md).

## LogiCORE™ Documentation

FIR Compiler LogiCORE IP Product Guide
([PG149](https://www.xilinx.com/cgi-bin/docs/ipdoc?c=fir_compiler;v=latest;d=pg149-fir-compiler.pdf))
