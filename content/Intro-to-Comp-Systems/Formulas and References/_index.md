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


## Circuit reference {#circuit-reference}

-   Logic Gates
    ![](/ox-hugo/logicGates.png)
-   Full Adder

{{< figure src="/ox-hugo/fullAdder.png" >}}


## Computer Arithmetic {#computer-arithmetic}


## Memory + Cache {#memory-plus-cache}

-   [Main Memory and Organization](https://upscfever.com/upsc-fever/en/gatecse/en-gatecse-chp166.html#:~:text=Memory%20Connection%20to%20CPU,through%20its%20chip%20select%20inputs.&text=When%2001%2C%20the%20second%20RAM,is%20selected%2C%20and%20so%20on) : credit to Robbie Schad
-   [Cache Notes](/ox-hugo/notes_cache.pdf)


## MIPS {#mips}

-   [Mips Theory](/ox-hugo/MIPS-Theory.pdf)
-   [Mips Reference from Berkeley](https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS%5Fhelp.html)
-   [Mips Reference from Cburch](http://www.cburch.com/cs/330/reading/mips-ref.pdf)
-   [MIPS DATAPATH](/ox-hugo/mips-datapath.png)
-   [MIPS PIPELINED DATAPATH](/ox-hugo/mips-datapath-pipelined.png)
