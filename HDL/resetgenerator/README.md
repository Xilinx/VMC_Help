# Reset Generator

The Reset Generator block captures the user's reset signal that is
running at the system sample rate, and produces one or more downsampled
reset signal(s) running at the rates specified on the block.

![](./Images/block.png)

The downsampled reset signals are synchronized in the same way as they
are during startup. The RDY output signal indicates when the downsampled
resets are no longer asserted after the input reset is detected.

## Block Parameters Dialog Box

The block parameters dialog box shown below can be invoked by
double-clicking the icon in your Simulink® model.

Figure: Block Parameters

  
![](./Images/hlx1649233212209.png)  

You specify the design sample rates in MATLAB® vector format as shown
above. Any number of outputs can be specified.
