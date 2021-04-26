+++
title = "Useful formulas and references"
author = ["David Lewis"]
draft = false
+++

## Hard Drives {#hard-drives}

[Hard Drive Website](https://www.gatevidyalay.com/magnetic-disk-secondary-memory-coa/)
[Hard Drive Document from nitin](/ox-hugo/MagneticDisk.pdf)


### Formulas {#formulas}

-   `Disk access time` = Seek Time + Rotational delay + Transfer time + Controller overhead + Queuing delay
-   `Average Disk Access` Time = Average seek time + Average rotational delay + Transfer time + Controller overhead + Queuing delay
-   `Average Seek Time` = 1/3 \* Time taken for one full stroke
    -   (Time taken to move from track 1 to track 1 + Time taken to move from track 1 to last track)/2
    -   {0 + (k-1)t}/2
    -   (k-1)t/2
-   `Average Rotational Latency` = 1/2 \* Time taken for one full rotation
-   `Capacity of disk pack` = Total number of surfaces \* Number of tracks per surface \* Number of sectors per track \* storage capacity of one sector
-   `Formatting Overhead` = Number of sectors \* Overhead per sector
-   `Formatted Disk Space` = Total disk space or capacity - formatting overhead
-   `Recording density or storage density` = Capacity of track / circumference of the track
-   `Track Capacity` = Recording density of the track \* Circumference of the track
-   `Data Transfer Rate` = Number of heads \* Bytes that can be read in one full rotation \* Number of rotations in one second = Number of heads \* Capacity of one track \* Number of rotations in one second
-   Tracks per surface = (Outer radius - Inner radius) / Inter Track gap


## Circuit reference {#circuit-reference}

-   Logic Gates
    ![](/ox-hugo/logicGates.png)
-   Full Adder

{{< figure src="/ox-hugo/fullAdder.png" >}}


## Computer Arithmetic {#computer-arithmetic}

[Computer arithemetic document from nitin](</ox-hugo/Computer Arithemtic.pdf>)


## Memory + Cache {#memory-plus-cache}

-   [Main Memory and Organization](https://upscfever.com/upsc-fever/en/gatecse/en-gatecse-chp166.html#:~:text=Memory%20Connection%20to%20CPU,through%20its%20chip%20select%20inputs.&text=When%2001%2C%20the%20second%20RAM,is%20selected%2C%20and%20so%20on) : credit to Robbie Schad
-   [Cache Notes](/ox-hugo/notes_cache.pdf)
-   [Direct Mapping Examples](</ox-hugo/Direct Mapping Examples.pdf>)
-   [Fully Associative Mapping Examples](</ox-hugo/Fully Associative Mapping Examples.pdf>)
-   [Set Associate Mapping Examples](</ox-hugo/Set Associative Mapping Examples.pdf>)


### Formulas {#formulas}


#### Direct mapped cache {#direct-mapped-cache}

-   physical address size (bits) = TAG + Line Number + Block/Line Offset
-   \\(\text{MM(size in bytes)} = 2^{\text{number Of Bits In Physical Address}} \* 2^3\\)
-   \\(\text{BlockOffset(size in bytes)} = 2^{\text{Bits In Block Offset}} \* 2^3 \\)
-   \\(\text{number of lines} = 2^{\text{bits in line number}} = \frac{\text{Cache size}}{\text{Line Size}} \\)
-   \\(\text{tag directory size} = \text{number of lines in cache \* Number of bits in tag} = \text{Number of Tags} \* \text{Tag size} \\)


#### Set Associative Mapped cache {#set-associative-mapped-cache}

-   physical address size (bits) = TAG + Set Number + Block/line Offset
-   \\(2^\text{Set Number (bits)} = \frac{\text{Lines in cache}}{\text{Number of sets}}\\)


#### Fully associative cache {#fully-associative-cache}

-   physical address size (bits) = TAG + Block offset


## Pipelining {#pipelining}

[pipelining document from nitin](</ox-hugo/Pipelining in Computer Architecture.pdf>)


### Formulas {#formulas}

-   \\(\text{Speed Up (S)} = \frac{\text{Non-pipelined execution time}}{\text{Pipelined execution time}}\\)
-   \\(\text{Efficiency} = \frac{\text{Speed Up}}{\text{Number of stages in Pipelined Architecture}}\\)
-   \\(\text{Efficiency} = \frac{\text{Number of boxes utilized in phase time diagram}}{\text{Number of boxes in phase time diagram}}\\)
-   \\(\text{Throughput} = \frac{\text{Number of instructions executed}}{\text{Total time taken}}\\)
-   Non-pipelined execution time = Total number of instructions \* Time taken to execute one instruction = n \* k clock cycles
-   Pipelined execution time

    = Time taken to execute first instruction + Time take to execute remaining instructions

    = 1 \* k clock cycles + (n-1) \* 1 clock cycle

    = (k + n-1) clock cycles
-   `Cycle time` = Maximum delay due to any stage + Delay due to its register
-   `delay due to its register` = `latch delay`
-   pipeline time for x tasks = Time taken for 1st task + Time taken for remaining tasks

    = number of phases \* cycle time + (total tasks -1) \* cycle time


## MIPS {#mips}

-   [Mips Theory](/ox-hugo/MIPS-Theory.pdf)
-   [Mips Reference from Berkeley](https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS%5Fhelp.html)
-   [Mips Reference from Cburch](http://www.cburch.com/cs/330/reading/mips-ref.pdf)
-   [MIPS DATAPATH](/ox-hugo/mips-datapath.png)
-   [MIPS PIPELINED DATAPATH](/ox-hugo/mips-datapath-pipelined.png)
