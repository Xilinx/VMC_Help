# FIFO
This block allows specification of the FIFO depth on a particular path.
  
![](./Images/block.png)  

## Library

AI Engine/Interfaces

## Description

This block allows specification of the FIFO depth on a particular path.
Specifying the FIFO depth value can help avoid deadlock or stalling by
creating more buffering in the paths. This block does not affect
functional simulation and will only impact the generated graph code. You
can also set location constraints for the FIFO block using the
Constraint manager. FIFOs can be either stream FIFOs, DMA FIFOs, or a
combination of the two.

## Parameters

#### FIFO Depth (32-bit words)  
Should be a positive integer value and the default value is 0.

## References
To learn more about FIFO and different types of FIFOs click [here](https://docs.xilinx.com/r/en-US/ug1079-ai-engine-kernel-coding/FIFO-Depth).
