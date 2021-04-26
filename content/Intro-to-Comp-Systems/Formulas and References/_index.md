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


## Memory + Cache {#memory-plus-cache}

-   [Main Memory and Organization](https://upscfever.com/upsc-fever/en/gatecse/en-gatecse-chp166.html#:~:text=Memory%20Connection%20to%20CPU,through%20its%20chip%20select%20inputs.&text=When%2001%2C%20the%20second%20RAM,is%20selected%2C%20and%20so%20on) : credit to Robbie Schad
-   [Cache Notes](/ox-hugo/notes_cache.pdf)
-   [Direct Mapping Examples](</ox-hugo/Direct Mapping Examples.pdf>)
-   [Fully Associative Mapping Examples](</ox-hugo/Fully Associative Mapping Examples.pdf>)
-   [Set Associate Mapping Examples](</ox-hugo/Set Associative Mapping Examples.pdf>)


### Formulas {#formulas}

-   physical address size (bits) = TAG + Line Number + Block/Line Offset


#### Direct mapped cache {#direct-mapped-cache}

-   \\(\text{MM(size in bytes)} = 2^{\text{number Of Bits In Physical Address}} \* 2^3\\)
-   \\(\text{BlockOffset(size in bytes)} = 2^{\text{Bits In Block Offset}} \* 2^3 \\)
-


## MIPS {#mips}

-   [Mips Theory](/ox-hugo/MIPS-Theory.pdf)
-   [Mips Reference from Berkeley](https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS%5Fhelp.html)
-   [Mips Reference from Cburch](http://www.cburch.com/cs/330/reading/mips-ref.pdf)
-   [MIPS DATAPATH](/ox-hugo/mips-datapath.png)
-   [MIPS PIPELINED DATAPATH](/ox-hugo/mips-datapath-pipelined.png)
