# CORDIC 6.0

The Xilinx CORDIC block implements a generalized coordinate rotational
digital computer (CORDIC) algorithm and is AXI compliant.

![](./Images/block.png)

The CORDIC core implements the following equation types:

- Rotate
- Translate
- Sin_and_Cos
- Sinh_and_Cosh
- Arc_Tan
- Arc_Tanh
- Square_Root

Two architectural configurations are available for the CORDIC core:

- A word serial implementation with multiple-cycle throughput, but
  occupying a small silicon area.
- A fully parallel configuration with single-cycle data throughput at
  the expense of silicon area.

A coarse rotation is performed to rotate the input sample from the full
circle into the first quadrant. (The coarse rotation stage is required
as the CORDIC algorithm is only valid over the first quadrant). An
inverse coarse rotation stage rotates the output sample into the correct
quadrant.

The CORDIC algorithm introduces a scale factor to the amplitude of the
result, and the CORDIC core provides the option of automatically
compensating for the CORDIC scale factor.

## Changes from CORDIC 4.0 to CORDIC 6.0

AXI compliant

- The CORDIC 6.0 block is AXI compliant.

Ports Renamed

- en to aclken
- rst to aresetn
- rdy maps to dout_tready.
- cartesian_tready and phase_tready are automatically added when their
  respective channels are added.
- x_in to cartesian_tdata_real
- y_in to cartesian_tdata_imag
- phase_in to phase_tdata_phase
- x_out to dout_tdata_real
- y_out to dout_tdata_imag
- phase_out to dout_tdata_phase

Port Changes

- The data output ports are not optional in CORDIC 6.0. The data output
  ports are selected based on the Function selected.
- A fully parallel configuration with single-cycle data throughput at
  the expense. There are separate tuser, tlast, and tready ports for the
  Cartesian and Phase input channels.
- The dout_tlast output port can be configured to provide tlast from the
  Cartesian input channel, from the Phase input channel, or the AND and
  or the OR of all tlasts.

Optimization

- When you select Blocking mode for the AXI behavior, you can then
  select whether the core is configured for minimum Resources or maximum
  Performance.

Displaying Port Names on the Block Icon

- You can select Display shortened port names to trim the length of the
  AXI port names on the block icon.

## Block Parameters

Page 1 tab  
Functional selection  
Rotate  
When selected, the input vector, (real, imag), is rotated by the input
angle using the CORDIC algorithm. This generates the scaled output
vector, Zi \* (real’, imag’).

Translate  
When selected, the input vector (real, imag) is rotated using the CORDIC
algorithm until the imag component is zero. This generates the scaled
output magnitude, Zi \* Mag(real, imag), and the output phase,
Atan(imag/real).

Sin_and_Cos  
When selected, the unit vector is rotated, using the CORDIC algorithm,
by input angle. This generates the output vector (Cos( ), Sin( )).

Sinh_and_Cosh  
When selected, the CORDIC algorithm is used to move the vector (1,0)
through hyperbolic angle p along the hyperbolic curve. The hyperbolic
angle represents the log of the area under the vector (real, imag) and
is unrelated to a trigonometric angle. This generates the output vector
(Cosh(p), Sinh(p)).

Arc_Tan  
When selected, the input vector (real, imag) is rotated (using the
CORDIC algorithm) until the imag component is zero. This generates the
output angle, Atan(imag/real).

Arc_Tanh  
When selected, the CORDIC algorithm is used to move the input vector
(real, imag) along the hyperbolic curve until the imag component reaches
zero. This generates the hyperbolic “angle,” Atanh(imag/real). The
hyperbolic angle represents the log of the area under the vector (real,
imag) and is unrelated to a trigonometric angle.

Square_Root  
When selected a simplified CORDIC algorithm is used to calculate the
positive square root of the input.

Architectural configuration  
Configuration:

Word_Serial  
Select for a hardware result with a small area.

Parallel  
Select for a hardware result with high throughput.

Pipelining mode  
No_Pipelining  
The CORDIC core is implemented without pipelining.

Optimal  
The CORDIC core is implemented with as many stages of pipelining as
possible without using any additional LUTs.

Maximum  
The CORDIC core is implemented with a pipeline after every shift-add sub
stage.

Data format  
SignedFraction  
Default setting. The real and imag inputs and outputs are expressed as
fixed-point 2’s complement numbers with an integer width of 2-bits.

UnsignedFraction  
Available only for Square Root functional configuration. The real and
imag inputs and outputs are expressed as unsigned fixed-point numbers
with an integer width of 1-bit.

UnsignedInteger  
Available only for Square Root functional configuration. The real and
imag inputs and outputs are expressed as unsigned integers.

Phase format  
Radians  
The phase is expressed as a fixed-point 2’s complement number with an
integer width of 3-bits, in radian units.

Scaled_Radians  
The phase is expressed as fixed-point 2’s complement number with an
integer width of 3-bits, with pi-radian units. One scaled-radian equals
Pi \* 1 radians.

Input/Output Options  
Input width  
Controls the width of the input ports cartesian_tdata_real,
cartesian_tdata_imag, and phase_tdata_phase. The Input width range 8 to
48 bits.

Output width  
Controls the width of the output ports dout_tdata_real, dout_tdata_imag,
and dout_tdata_phase. The Output width range 8 to 48 bits.

Round mode  
Truncate  
The real, imag, and phase outputs are truncated.

Round_Pos_Inf  
The real, imag, and phase outputs are rounded (1/2 rounded up).

Round_Pos_Neg_Inf  
The real, imag, and phase outputs are rounded (1/2 rounded up, -1/2
rounded down).

Nearest_Even  
The real, imag, and phase outputs are rounded toward the nearest even
number (1/2 rounded down and 3/2 is rounded up).

&nbsp;

Page 2 tab  
Advanced Configuration Parameters  
Iterations  
Controls the number of internal add-sub iterations to perform. When set
to zero, the number of iterations performed is determined automatically
based on the required accuracy of the output.

Precision  
Configures the internal precision of the add-sub iterations. When set to
zero, internal precision is determined automatically based on the
required accuracy of the output and the number of internal iterations.

Compensation scaling  
Controls the compensation scaling module used to compensate for CORDIC
magnitude scaling. CORDIC magnitude scaling affects the Vector Rotation
and Vector Translation functional configurations, and does not affect
the SinCos, SinhCosh, ArcTan, ArcTanh and Square Root functional
configurations. For the latter configurations, compensation scaling is
set to No Scale Compensation.

Coarse rotation  
Controls the instantiation of the coarse rotation module. Instantiation
of the coarse rotation module is the default for the following
functional configurations: Vector rotation, Vector translation, Sin and
Cos, and Arc Tan. If Coarse Rotation is turned off for these functions
then the input/output range is limited to the first quadrant (-Pi/4 to +
Pi/4).

Coarse rotation is not required for the Sinh and Cosh, Arctanh, and
Square Root configurations. The standard CORDIC algorithm operates over
the first quadrant. Coarse Rotation extends the CORDIC operational range
to the full circle by rotating the input sample into the first quadrant
and inverse rotating the output sample back into the appropriate
quadrant.

Optional ports  
Standard  
aclken  
When this signal is not asserted, the block holds its current state
until the signal is asserted again or the aresetn signal is asserted.
The aresetn signal has precedence over this clock enable signal. This
signal has to run at a multiple of the blocks sample rate. The signal
driving this port must be Boolean.

aresetn  
When this signal is asserted, the block goes back to its initial state.
This reset signal has precedence over the optional aclken signal
available on the block. The reset signal has to run at a multiple of the
block's sample rate. The signal driving this port must be Boolean.

tready  
Adds dout_tready port if Blocking mode is activated.

Cartesian  
tlast  
Adds a tlast input port to the Cartesian input channel.

tuser  
Adds a tuser input port to the Cartesian input channel.

tuser width  
Specifies the bit width of the Cartesian tuser input port.

Phase  
tlast  
Adds a tlast input port to the Phase input channel.

tuser  
Adds a tuser input port to the Phase input channel.

tuser width  
Specifies the bit width of the Phase tuser input port.

Tlast behavior  
Null  
Data output port.

Pass_Cartesian_TLAST  
Data output port.

Pass_Phase_TLAST  
Data output port.

OR_all_TLASTS  
Pass the logical OR of all the present TLAST input ports.

AND_all_TLASTS  
Pass the logical AND of all the present TLAST input ports

Flow control  
AXI behavior  
NonBlocking  
Selects “Non-Blocking” mode. In this mode, the lack of data on one input
channel does not block the execution of an operation if data is received
on another input channel.

Blocking  
Selects “Blocking” mode. In this mode, the lack of data on one input
channel does block the execution of an operation if data is received on
another input channel.

Optimization  
When NonBlocking mode is selected, the following optimization options
are activated:

Resources  
Core is configured for minimum resources.

Performance  
Core is configured for maximum performance.

&nbsp;

Implementation tab  
Block Icon Display  
Display shortened port names  
This option is ON by default. When unselected, the full AXI name of each
port is displayed on the block icon.

## LogiCORE™ Documentation

CORDIC LogiCORE IP Product Guide
([PG105](https://www.xilinx.com/cgi-bin/docs/ipdoc?c=cordic;v=latest;d=pg105-cordic.pdf))
