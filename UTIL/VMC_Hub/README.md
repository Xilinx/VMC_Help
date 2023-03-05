# Vitis Model Composer Hub

Control implementation of the model.

![](./Images/ttd1532103642779.png)

## Library

AI Engine/Tools; HLS/Tools; Utilities/Code Generation.

## Description

The Vitis Model Composer Hub block controls the behavior of the Vitis
Model Composer tool.

You can specify the targeted design flow for the generated output, the
directory path for the output, and the desired device and design clock
frequency using the following tabs.

- The Hardware Selection pane helps with device or board selection.
- The Code Generation pane provides options to select the output flow by
  selecting subsystems and specifying Code directory. Different options
  will be displayed depending on if the subsystem is targeting HDL, HLS,
  or AIE.


### Data Type Support

Data type support is not applicable to the Vitis Model Composer Hub
block.

## Parameters
  
![](./Images/vbk1663246159437.png)  

The following section describes the configurable options available in
each pane of the Vitis Model Composer Hub block.

#### Hardware Selection  
Clicking the browse button (…) displays the Device Chooser dialog box.
This allows you to select a part, board, or platform to which your
design is targeted. Vitis Model Composer obtains board and device data
from the Vivado database.

#### Code Generation  
Select the subsystem name for which to generate code from the list on
the left. Different settings will display depending on the type of code
generation (HDL, HLS, or AI Engine) to be performed.

#### AIE Settings  
##### AIE Compiler Options  
When specified, the compiler options provide control over AI Engine compiler. For a full list of compiler options refer to 
[AI Engine Compiler Options](https://docs.xilinx.com/r/en-US/ug1076-ai-engine-environment/AI-Engine-Compiler-Options). Specify the compiler options as a cell array of characters, for example, {'--stacksize=20', '--heapsize=1024'}. Use an empty cell array, {}, if you do not want to specify any compiler options.

##### AIE Simulator Options
For a full list of cycle approximate System C AI Engine simulator options refer to [AI Engine Simulator Options](https://docs.xilinx.com/r/en-US/ug1076-ai-engine-environment/Simulator-Options). Specify the AI Engine simulator options as a cell array of characters, for example, {'--enable-memory-check','--hang-detect-time=10'}. These options are used when "Run cycle-approximate AIE Simulation (SystemC) after code generation" is checked. 

##### Create Testbench  
When enabled, Vitis Model Composer generates test vectors while generating the code. Test vectors are gathered from the inputs and outputs of the AI Engine subsystem when the simulation is running and a text file containing the data is created for each port and saved in the 'data' directory under the specified code directory.

##### Run cycle-approximate AIE Simulation (SystemC) after code generation  
This option is only available if Create testbench is selected. When
enabled, it runs the AIE simulation after code generation and verfies that for each output of the AI Engine Subsystem in the Simulink design, the output of AIE Simulation numerically matches the output of the Simulink desgin. 

##### Simulation timeout (cycles)  
This determines the duration of the cycle accurate AIE simulation in terms of the number of cycles. By default, it runs for 50000 cycles, after which it terminates. It's important to note that this value is not directly linked to the simulation time in your Simulink design. If the number of cycles is insufficient, the Simulink simulation may generate more output than the AIE Simulation, leading to a partial match between the Simulink output and the AI Engine simulator during verification after running the AIE Simulation. To address this issue, you can increase the Simulation timeout, which will result in more output from the AIE simulator. However, not all partial matches are necessarily due to this factor. The picture below shows part of the output log that indicates a partial match:

![](./Images/partail_match.png) 

##### Plot AIE Simulation Output and Estimate Throughput  
When enabled, this option logs simulation data and allows visualization
of the outputs of the AI Engine subsystem in the [Simulation Data Inspector](https://www.mathworks.com/help/simulink/slref/simulationdatainspector.html). Along with that the throughput for each output is also calculated. Note that you can use the 

##### Collect profiling statistics and enable 'printf' for debugging  
When enabled, this option allows profiling data to be collected for
analysis.

##### Collect data for Vitis Analyzer  
When enabled, this option provides a summary of the simulation results
which can be viewed in the Vitis Analyzer.

##### Open Vitis Analyzer  
Click to invoke the Vitis Analyzer tool. This option is only enabled
after AI Engine Simulation has been ran at least once after enabling.

#### AIE Hardware Flow  
To generate the hardware image, specify the platform in the Target pane
and select the Create Testbench option in the AIE Settings panel.

##### Generate Hardware Validation Code  
When enabled, Vitis Model Composer generates code to be used for
hardware validation.

##### HW System Type  
Choose between Baremetal or Linux hardware validation flow.

##### Target  
Specify the target for hardware validation flow.

##### Common SW Dir  
Provide the path to the folder containing the Petalinux common images.
This option is only enabled when a Linux HW System Type is selected.

##### Target SDK Dir  
Provide the path to the folder containing the target SDK. This option is
only enabled when a Linux HW System Type is selected.

##### Run hardware emulation after code generation  
When enabled, hardware emulation will run immediately after code
generation.

#### HDL Settings  
##### Compilation Type  
Specifies the type of compilation result that should be produced when
the code generator is invoked. The default compilation type is IP
Catalog. When IP Catalog is selected, the Settings (...) button brings
up a dialog box that allows you to add a description of the IP that will
be placed in the IP catalog.

##### Hardware Description  
Specifies the HDL language to be used for compilation of the design. The
possibilities are VHDL and Verilog.

###### VHDL library  
Specifies the name of VHDL work library for code generation. The default
name is xil_defaultlib.

###### Use STD_LOGIC type for Boolean or 1 bit wide gateways  
If your design's Hardware Description Language (HDL) is VHDL, selecting
this option will declare a Boolean or 1-bit port (Gateway In or Gateway
Out) as a STD-LOGIC type. If this option is not selected, Vitis Model
Composer will interpret Boolean or 1-bit ports as vectors.

**Note**: When you enable this option and try to run Generate code and Run
behavioral simulation in Vivado, you may see a failure during the
elaboration phase.

##### Synthesis strategy  
Choose a Synthesis strategy from the pre-defined strategies in the
drop-down menu.

##### Implementation strategy  
Choose an Implementation strategy from the pre-defined strategies in the
drop-down menu.

##### Create testbench  
This instructs Vitis Model Composer to create an HDL test bench.
Simulating the test bench in an HDL simulator compares Simulink
simulation results with ones obtained from the compiled version of the
design. To construct test vectors, Vitis Model Composer simulates the
design in Simulink, and saves the values seen at gateways. The top HDL
file for the test bench is named \<name\>\_testbench.vhd/.v, where
\<name\> is a name derived from the portion of the design being tested.

**Note**: Testbench generation is not supported for designs that have
gateways (Gateway In or Gateway Out) configured as an AXI4-Lite
interface.

#### HDL Clock Settings  
##### Enable multiple clocks  
Must be enabled when the design has multiple clocks. This indicates to
the code generation engine that the clock information for the various
subsystems must be obtained from the respective clock tabs. If not
enabled, then the design will be treated as a single clock design.

##### Number of clocks  
Defines the number of clocks in the design. The number of clock tabs
that appear will be equivalent to the number of clocks. In each clock
tab, you must select the subsystem and configure the clock settings of
that subsystem.

##### FPGA clock period (ns)  
Defines the period in nanoseconds of the system clock. The value need
not be an integer. The period is passed to the Xilinx implementation
tools through a constraints file, where it is used as the global PERIOD
constraint. Multicycle paths are constrained to integer multiples of
this value.

##### Simulink system period (sec)  
Defines the Simulink System Period, in units of seconds. The Simulink
system period is the greatest common divisor of the sample periods that
appear in the model. These sample periods are set explicitly in the
block dialog boxes, inherited according to Simulink's propagation rules,
or implied by a hardware oversampling rate in blocks with this option.
In the final case, the implied sample time is in fact faster than the
observable simulation sample time for the block in Simulink. In
hardware, a block having an oversampling rate greater than one processes
its inputs at a faster rate than the data. For example, a sequential
multiplier block with an over-sampling rate of eight implies a
(Simulink) sample period that is one eighth of the multiplier block’s
actual sample time in Simulink. This parameter can be modified only in a
master block.

##### Clock pin location  
Defines the pin location for the hardware clock. This information is
passed to the Xilinx implementation tools through a constraints file.
This option should not be specified if the Vitis Model Composer design
is to be included as part of a larger HDL design.

##### Provide clock enable clear pin  
This instructs Vitis Model Composer to provide a ce_clr port on the
top-level clock wrapper. The ce_clr signal is used to reset the clock
enable generation logic. The ability to reset clock enable generation
logic allows designs to have dynamic control for specifying the
beginning of data path sampling.

#### HDL Analysis  
##### Block icon display  
Specifies the type of information to be displayed on each block icon in
the model after compilation is complete. The various display options are
described below.

###### Default  
Displays the default block icon information on each block in the model.
A block’s default icon is derived from the xbsIndex library.

![](./Images/kgl1663681704579.png)

###### Normalized Sample Periods  
Displays the normalized sample periods for all the input and output
ports on each block. For example, if the Simulink System Period is set
to 4 and the sample period propagated to a block port is 4, then the
normalized period that is displayed for the block port is 1; and if the
period propagated to the block port is 8 then the sample period
displayed would be 2 (a larger number indicates a slower rate).


![](./Images/izx1663681740141.png)

###### Sample frequencies (MHz)  
Displays sample frequencies for each block.

###### Pipeline stages  
Displays the latency information from the input ports of each block. The
displayed pipeline stage might not be accurate for certain high-level
blocks such as the FFT, RS Encoder/Decoder, Viterbi Decoder, etc. In
this case the displayed pipeline information can be used to determine
whether a block has a combinational path from the input to the output.
For example, the Up Sample block in the following figure shows that it
has a combinational path from the input to the output port.


![](./Images/nyt1663681793844.png)

###### HDL port names  
Displays the HDL port name of each port on each block in the model.

###### Input data types  
Displays the data type of each input port on each block in the model.

###### Output data types  
Displays the data type of each output port on each block in the model.

##### Update the model  
Update the model to display the selected Block Icon type.

##### Perform Analysis  
Specifies whether an analysis (timing or resource) will or will not be
performed on the Vitis Model Composer design when it is compiled. If
None is selected, no timing analysis or resource analysis will be
performed. If Post Synthesis is selected, the analysis will be performed
after the design has been synthesized in the Vivado toolset. If Post
Implementation is selected, the analysis will be performed after the
design is implemented in the Vivado toolset.

##### Analysis Type  
Two selections are provided: Timing or Resource. After generation is
completed, a Timing Analyzer table or Resource Analyzer table is
launched.

##### Launch  
Launches the Timing Analyzer or Resource Analyzer table, depending on
the selection of Analyzer type. This will only work if you already ran
analysis on the Simulink model and haven't changed the Simulink model
since the last run.

##### Remote IP cache  
If selected, your design will access an IP cache whenever a Vitis Model
Composer compilation performs Vivado synthesis as part of the
compilation. If the compilation generates an IP instance for synthesis,
and the Vivado synthesis tool generates synthesis output products, the
tools create an entry in the cache area. If a new customization of the
IP is created which has identical properties, the tools will copy the
synthesis outputs from the cache to the design’s output directory
instead of synthesizing the IP instance again. Accessing the disk cache
speeds up the iterative design process. IP caching is described in HDL
Library.

##### Create interface document  
When this check box is selected and the Generate button is activated for
netlisting, Vitis Model Composer creates an HTM document that describes
the design being netlisted. This document is placed in a documentation
subfolder under the netlist folder.

##### Clear cache  
Clicking this button clears the remote IP cache. Clearing the cache
saves disk space (the IP Cache can grow large, especially if your design
uses many IP modules).

#### HDL Hardware Flow  
To generate the hardware image, specify the platform in the Target pane
and select the Create Testbench option in the HDL Settings panel. The
HDL hardware flow is only supported for Versal® devices.

##### Generate Hardware Validation Code  
When enabled, Vitis Model Composer generates code to be used for
hardware validation.

##### HW System Type  
Choose between Baremetal or Linux hardware validation flow.

##### Target  
Specify the target for hardware validation flow.

##### Common SW Dir  
Provide the path to the folder containing the Petalinux common images.
This option is only enabled when a Linux HW System Type is selected.

##### Target SDK Dir  
Provide the path to the folder containing the target SDK. This option is
only enabled when a Linux HW System Type is selected.

##### Generate (BOOT.BIN/SD card image) after code generation  
When enabled, a BOOT.BIN (for baremetal HW system) or SD card image (for
Linux HW system) will be generated after code generation.

#### HLS Settings  
##### Target  
Select IP Catalog to export the design to the Vivado IP Catalog. After
C/C++ code generation, Vitis High-Level Synthesis (HLS) is invoked to
synthesize the C code and create a project that can be exported as an IP
to the Vivado IP Catalog. Select HLS C++ code to compile the design
model into C++ code.

##### FPGA clock frequency  
Specifies the clock frequency in MHz for the targeted device. This
frequency is passed to the downstream tool flow.

##### Throughput factor  
Specifies the number of samples processed per clock to increase the
throughput. A larger factor increases hardware resource usage. The
throughput factor must be between 1 and 16.

##### Create testbench and run (C simulation/RTL cosimulation)  
If selected, Vitis Model Composer runs simulation and generates test
vectors while generating code.

##### Testbench stack size (MBytes)  
This parameter prompts you to enter a larger stack size. When Create and
run testbench is enabled, the Testbench stack size option specifies the
size of the testbench stack frame during C simulation (CSIM).
Occasionally, the default stack frame size of 10 MB allocate for
execution of the testbench may be insufficient to run the test, due to
large arrays allocated on the stack and/or deep nesting of subsystems.
Typically when this happens, the test would fail with a segmentation
fault and an associated error message. In such a case you can increase
the size of the stack frame and rerun the test.

#### HLS Hardware Flow  
To generate the hardware image, specify the platform in the Target pane
and select the Create Testbench option in the HLS Settings panel.
Generate Hardware Validation Code.

When enabled, Vitis Model Composer generates code to be used for
hardware validation.

##### HW System Type  
Choose between Baremetal or Linux hardware validation flow.

##### Target  
Specify the target for hardware validation flow.

##### Common SW Dir  
Provide the path to the folder containing the Petalinux common images.
This option is only enabled when a Linux HW System Type is selected.

##### Target SDK Dir  
Provide the path to the folder containing the target SDK. This option is
only enabled when a Linux HW System Type is selected.

##### Generate (BOOT.BIN/SD card image) after code generation  
When enabled, a BOOT.BIN (for baremetal HW system) or SD card image (for
Linux HW system) will be generated after code generation.

#### Code Generation  
Select a subsystem containing blocks from the AI Engine, HDL, or HLS
blocksets and specify the corresponding Code Directory. The Code
Directory can be specified by entering the complete directory path or
using the Browse button to provide a path.

##### Settings  
Specify whether the Model Composer Hub block should treat your model as
a legacy System Generator design.


