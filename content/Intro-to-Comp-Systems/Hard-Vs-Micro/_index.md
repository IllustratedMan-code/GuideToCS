+++
title = "HardWiredVsMicroProgrammed;"
author = ["David Lewis"]
draft = false
subpage = false
hide = "nav"
+++

## Intro {#intro}

Describes a "big Picture" of computer systems through an example of a "simple" computer.
This computer is **Big Endian** (reads the leftmost (most significant) bit first)


## The Basic Computer {#the-basic-computer}


### Two Principal functional parts {#two-principal-functional-parts}

-   Data path section where processing occurs
-   Control section decodes instructions and
    leaves control sequence for Data path section


### Two types of control units {#two-types-of-control-units}

-   Hard wired controllers
-   Micro programmed controllers


### <a id="org3b5a5aa"></a>figure 1 {#figure-1}

![](The_Basic_Computer/Figure1.JPG)
![](/ox-hugo/figure1.png)


#### Description of figure 1 {#description-of-figure-1}

Data Path Sections

<!--list-separator-->

-  Single 12-bit-wide bus

    exchanges information between pairs of registers

<!--list-separator-->

-  Registers + 256 X 12 bit RAM

    controlled by 16 control signals

    <!--list-separator-->

    -  Load(L) signals

        Active L **clocks** _or loads_ bus contents into register
        on next **rising pulse** from the system clock

    <!--list-separator-->

    -  Enabled(E) signals

        Active E signal enables the **tristate** outputs of the register
        or makes contents of register available to bus

    <!--list-separator-->

    -  _register tranfer from_ example

        Contents of Register A to B

        -   Requires EA signal (contents of A can be read by bus)
        -   Requires LB signal (contents of bus can be moved into B)


#### Arithmetic-Logic-Unit (ALU) {#arithmetic-logic-unit--alu}

A circuit capable of adding or subtracting two 12 bit numbers
When the first bit of the Accumulator(ACC) is 1 ([Negative Flag](#org3af2bb1))
it is considered a negative number (represented using 2s compliment)

-   Two input registers
    -   Accumulator (ACC)
    -   Register B
-   Two control signals
    -   Add (A)
    -   Subtract (S)


#### RAM memory {#ram-memory}

<!--list-separator-->

-  Registers

    <!--list-separator-->

    -  <a id="orge811df4"></a>Memory Address Register (MAR)

        Register where address from memory is temporarily stored

    <!--list-separator-->

    -  <a id="org56eac2c"></a>Memory Data Register (MDR)

        Register where data (**word**) corresponding to the address in **MAR** is temporarily stored

<!--list-separator-->

-  Control Signals

    <!--list-separator-->

    -  Read (R)

        copies **Word** stored in RAM at address specified by **MAR** to **MDR**

    <!--list-separator-->

    -  Write (W)

        copies contents (**Word**) of **MDR** to RAM at address specified by **MAR**

<!--list-separator-->

-  Steps to write and read data to the RAM

    <!--list-separator-->

    -  Read

        1.  8-bit address is stored in register **MAR**
        2.  Active **R** signal is supplied to the RAM
        3.  Data is copied from RAM at address specified by **MAR** to **MDR** register

    <!--list-separator-->

    -  Write

        1.  8-bit address is stored in register **MAR**
        2.  a **Word** is stored in register **MDR**
        3.  Active **W** signal is supplied to RAM
        4.  Data is copied from **MDR** to RAM at address specified by **MAR**

    <!--list-separator-->

    -  Note about I/O implementation

        In this specific computer design, all I/O devices are **memory mapped**
        This means that several memory locations are reserved for the I/O devices
        writing and reading to these I/O devices works in the same way as any other location
        in the ram.


#### <a id="orga687585"></a>Program Counter (PC) Register {#program-counter--pc--register}

<!--list-separator-->

-  Increment Program Counter (IP) control signal

    When **PC** recieves an **IP** signal it increments contents of **PC** by 1

<!--list-separator-->

-  Instruction Register (IR)

    Holds the instruction that is about to be executed and provides
    opcode to the controller/sequencer


## Computer's Instruction Set {#computer-s-instruction-set}

A set of all instructions that the computer can process.


### Instruction {#instruction}

A 12-bit **word** made up of a 4-bit **opcode** and an 8-bit **operand** address


#### operation code (opcode) {#operation-code--opcode}

specifies the action to be taken by the computer


#### operand {#operand}

The data that the opcode operates on.
Located at a memory location specified by the 8 bit address in the instruction.


### <a id="orgfdc941d"></a>Table 1 {#table-1}

{{< figure src="/ox-hugo/table1.png" >}}


#### Table 1 description {#table-1-description}

<!--list-separator-->

-  Op-Code

    The base 10 identity of the 4 bit code(in this computer) at the beginning of every instruction.
    Specifies the _action_ that will be performed, such as loading, moving values.
    Not shown is the [Fetch Instruction](#org0ae2679) (an instruction used to load the next instruction) and
    can be thought of as having the opcode 0000, but it really doesn't require one (in Hard-Wired)

<!--list-separator-->

-  Opcode are specified in assembly by the **Mnemonic**

    The Mnemonic makes the assembly code much more human readable

    -   LDA (Load accumlulator(ACC)) is equivalent to op-code 0001
    -   STA (Store ACC) is equivalent to op-code 0002
    -   The codes 8(1000) - 15(1111) are all equivalent to the HLT Mnemonic

<!--list-separator-->

-  Register Transfers

    This column shows how data is transferred from one register to another until the
    action specified by the opcode has been accomplished.

    -   LDA 00100010 is an example instruction
        LDA (Loads data from RAM to accumlulator register)
        by following the steps required to access data from RAM
        1.  MAR <-- IR moves (copies) the contents of the Instruction Register([IR](#org762501b)) to the Memory Address Register
        2.  MDR <-- RAM(MAR) moves the data at address specified by MAR to the MDR register
        3.  ACC <-- MDR moves the contents of MDR to ACC
        4.  ACC <-- RAM is then accomplished.

<!--list-separator-->

-  Active Control Signals

    This column shows the signals that are required (power to signal pin)
    to perform the specified register transfers. Signal Pins are shown in [Figure 1](#org3b5a5aa)

    -   MAR <-- IR requires the EI (enable instruction register) and the LM (Load MAR) signals
    -   MDR <-- RAM(MAR) requires the R (read) signal


## Hard-Wired Control Unit {#hard-wired-control-unit}


### <a id="org1bc72ce"></a>Figure 2 {#figure-2}

{{< figure src="/ox-hugo/figure2.png" >}}


#### Description of Figure 2 {#description-of-figure-2}

Internal organization of a hard-wired control unit
A hard wired version of our example computer.
A control unit consists of a Ring counter, an instruction decoder, and a Control matrix

<!--list-separator-->

-  <a id="org762501b"></a>Instruction Register (IR)

    Contains the current instruction (opcode + operand)
    The instruction register sends the Op-code (first 4 bits) to the instruction decoder.
    Each line to the Instruction Decoder represents a bit of the opcode.

<!--list-separator-->

-  Instruction Decoder

    1.  Receives the opcode sent to it by the IR
    2.  Interprets the opcode as a specific signal.
    3.  Sends a signal to the control matrix corresponding to the opcode from the IR
        Each line to the Control matrix represents a different signal (a set of pins)

    [Figure 4](#org5d26f99)

<!--list-separator-->

-  <a id="org3af2bb1"></a>Negative Flag

    The leading bit ("negative flag") of the ACC register is fed into the control matrix allowing for
    Boolean logic within the control matrix.

<!--list-separator-->

-  <a id="org7ca5cf6"></a>Ring Counter

    Six **Consecutive** active signals that cycle continuously with every beat of the system clock

    -   **Ring Pulse** or **Ring Counter Pulse**
        When the signal becomes active (ring pulse T0 means when T0 becomes active)

    [A useful article about ring counters](https://www.electronics-tutorials.ws/sequential/seq%5F6.html)
    [Table 2](#org1390f1d)

<!--list-separator-->

-  Control Matrix

    Most important part of the control unit
    The control matrix sends out signals to every register in the computer as shown in [Figure 1](#org3b5a5aa)
    and facilitates all of the instructions listed in [Table 1](#orgfdc941d) using those signals.


### <a id="orgc943bda"></a>Figure 3 {#figure-3}

 A visualization of the inner workings of the ring counter
![](/ox-hugo/figure3.png)


### <a id="org5d26f99"></a>Figure 4 {#figure-4}

A visualization of the inner working of the Instruction Decoder.
Shows how each opcode corresponds to an output line.
![](/ox-hugo/figure4.png)


### <a id="org1390f1d"></a>Table 2 {#table-2}

Times at which each **Control Signal** must be active in order to execute
the hard-wired Basic Computer's instructions.
![](/ox-hugo/table2.png)


#### <a id="org0ae2679"></a>Fetch instruction {#fetch-instruction}

The fetch instruction is executed every time the [Ring Counter](#org7ca5cf6) loops. This facilitates the
next instruction being sent to the Control unit. This instruction is actually executed
during the same ring counter loop as any other instructions. So when an opcode is sent to
the control matrix, fetch is executed **And** whatever instruction is specified by the opcode.
This ensures that the next instruction is fetched by the end of the ring counter loop.


#### How does the computer choose which signals to use for an opcode? {#how-does-the-computer-choose-which-signals-to-use-for-an-opcode}

-   LM signal for example, the signal to load data into MAR according to [Figure 1](#org3b5a5aa)
    LM has a T3 on the LDA and SDA Rows and a T0 on the Fetch row
    1.  An AND operation is performed between each Tx and its instruction signal (in the column).
    2.  An OR operation is performed between each AND operation.
    3.  As this can be represented with **bits** (1s or 0s) These operations can be simplified to an
        arithmetic expression **LM = T0 + T3\*LDA + T3\*STA**. T0 does not need an AND because the
        fetch instruction is executed every ring counter cycle.
    4.  According to the expression: LM is active when T0 is active and when T3 and (LDA or STA) is active

-   JN(jump negative) Row
    All Tx in this row have an AND operation with the value of NF([Negative Flag](#org3af2bb1))
    as well as the instruction signal JN. This provides another level of conditional logic
    based on the value of the ACC negative flag. The arithmetic expression for the LP column is:
    **LP = T3\*JN\*NF + T3\*JMP(Jump)**
-   A list of all the conditional expressions for the control signals (where \* = AND, + = OR)
    is located in [Figure 6](#orgec3a547)


### <a id="org38c6cd1"></a>Figure 5 {#figure-5}

A hard wired example of how the control matrix would work
![](/ox-hugo/figure5.png)


### <a id="orgec3a547"></a>Figure 6 {#figure-6}

A list of possible conditional expressions for the example computer.
![](/ox-hugo/figure6.png)


## Micro-programmed Control Unit {#micro-programmed-control-unit}

In the Hard Wired control unit example, the signals that come from the control matrix do so because of
an actual circuit that is wired to perform the conditional logic shown in [Figure 5](#org38c6cd1). In a **Micro-Programmed**
**Control Unit** an opcode is sent to the Control unit where it fetches a list of **Micro-Instructions** that
together perform the instruction from a memory. The control unit can be thought of as a Computer within a computer.


### Micro-routine {#micro-routine}

A **micro-routine** is a set of **Micro-Instructions** that implement an **instruction**.


#### Micro-Instruction {#micro-instruction}

Similar to the instruction in a hard-wired computer, the micro-instruction operates on the
hard wired circuits within the control unit. A micro-instruction is composed of bits that might
correspond to a control signal(LM for example).


### Figure 7 {#figure-7}

A block diagram of an example micro-programmed control unit.
![](/ox-hugo/figure7.png)


#### 32 X 24 Control ROM(Read-only memory) {#32-x-24-control-rom--read-only-memory}

-   32 24-bit long **Micro-Instructions**
    can be stored in the ROM memory
    A **Word** is 24 bits in the context of the micro-programmable Control unit
-   Micro-instructions in this example are composed of two fields
    1.  16-bit control signal field
        Each bit corresponds to a control signal
    2.  8-bit next-address field
        address(in ROM) of next micro-instruction to be executed. which permits additional Boolean logic
        shown in [Figure 8](#orga6c5037).
-   Micro-instructions(**Words**) from the Control ROM are fed into the micro-instruction register.


#### 24-bit Micro-instruction Register {#24-bit-micro-instruction-register}

-   analogous to the external computer's [Instruction Register](#org762501b).
-   16 signal lines are the same as the lines coming from the control matrix in [Figure 2](#org1bc72ce)
    and are connected to the signal pins shown in [Figure 1](#org3b5a5aa).
-   triggered by a falling clock edge [See this article about signal edges](https://en.wikipedia.org/wiki/Signal%5Fedge)


#### micro-counter register {#micro-counter-register}

-   Analogous to the external computer's [Program counter Register](#orga687585)
-   recieves input from the **Multiplexer**
-   triggered by a rising clock edge. [signal edges](https://en.wikipedia.org/wiki/Signal%5Fedge)


#### Multiplexer (data selector) {#multiplexer--data-selector}

Chooses between 3 values to send to the micro-counter register

1.  Output of Address ROM
2.  Output from Current Address Incrementer
3.  Address stored in next-address field of the current micro-instruction (CRJA)
4.  The conditional logic is shown in the description of [Figure 8](#orga6c5037)


#### 16 X 5 Address ROM {#16-x-5-address-rom}

Fed by outer computer's [Instruction Register](#org762501b).
The contents of the Instruction Register can be found in [Table 3](#orgd888731)

-   maps opcode of external computer's instruction to starting address of corresponding micro-routine.
    The first Micro-Instruction of the routine
-   Address zero of Address ROM contains address of fetch routine in the Control ROM
-   Other addresses in ROM correspond to the opcodes(external computer) in [Table 1](#orgfdc941d)
    addresses are of micro-routines in Control ROM


#### Note about signal edges {#note-about-signal-edges}

The micro-counter is triggered by a rising clock edge (along with all operations in data path in [Figure 1](#org3b5a5aa)).
The Micro-instruction register is triggered by a falling clock edge. In a series of steps:

1.  micro-counter is triggered (positive edge), presenting the new Micro-instruction address to the control ROM
2.  Previous micro-instruction is converted to signals which are sent to external system
3.  control ROM presents micro-instruction **Word** to micro-instruction register
4.  Micro-instruction register is triggered (negative edge) causing it to receive the micro-instruction **Word**


### <a id="orgd888731"></a>Table 3 {#table-3}

Mapping of Op-codes to the contents of the Address ROM in the Control Unit
![](/ox-hugo/table3.png)


#### Example using the ADD instruction {#example-using-the-add-instruction}

ADD instruction has the 3 opcode which maps to the 09 micro-routine start address.
The address is then goes to the multiplexer -> micro-counter -> Control ROM -> Micro-instruction register


### <a id="orga6c5037"></a>Figure 8 {#figure-8}

Next address field of the micro-instruction register.
![](The_Basic_Computer/Figure8.jpg)

-   CD is condition bit
    when CD is 1 (MAP is zero) the multiplexer's select lines produce a 00 or a 10 (binary)
    based on the [Negative Flag](#org3af2bb1) of the ACC register (of external computer). 00
    00 selects incrementer address, 10 selects CRJA address
-   MAP causes next microinstruction to be obtained from address ROM
    When the MAP bit is 1 (Multiplexer's select line produce a 01(binary) (selects the address ROM))
-   HLT stops clock, terminating execution of activities in the entire computer
-   CRJA (5 bits) is the control ROM jump address field (next-address field).
    When (CD, MAP is 0) then multiplexer's select lines produce a 10(binary), selecting the CRJA field
    as the address to the next micro-instruction (in Control ROM).
    -   With no branches, (CD=0, MAP=0, CRJA = address of next instruction in routine)
    -   Last micro-instruction in the fetch routine should have map=1 to take an instruction from the address ROM
    -   The last micro-instruction in a routine should have 00000(binary) as its CRJA field, CD=0, MAP=0
        branching back to the fetch micro-routine.


### <a id="org15a692e"></a>Table 4 {#table-4}

A micro-program (set of all micro-routines) that implements described instruction set from
When loaded into Control ROM

{{< figure src="/ox-hugo/table4.png" >}}


#### Microroutine Name (Mnemonic) {#microroutine-name--mnemonic}

The functional shortened name of each operation specified by the op-codes (Load Accumulator = LDA = 1)
Used in assembly programming.


#### Columns Micro-Instruction Address to Address of Next Micro-Instruction {#columns-micro-instruction-address-to-address-of-next-micro-instruction}

When taken together, forms the raw contents (changing hexadecimal to binary) of the Micro Control ROM

<!--list-separator-->

-  Address-ROM Address (Op-code)

    input of instruction from external computer that is equivalent to
    first address of Micro-instruction in micro-routine.

<!--list-separator-->

-  Micro-Instruction Address

    Micro-Instruction addresses (2 bits) listed sequentially as part of a micro-routine

    -   LDA micro-routine = Opcode 1
        1.  03
        2.  04
        3.  05

<!--list-separator-->

-  Control Signal Field

    Same order of signals (bits) as the in [Table 2](#org1390f1d)
    bits are equivalent to signals which are equivalent to pins.

<!--list-separator-->

-  CD

    Conditional bit, when 1 causes multiplexer to depend on value of [NF](#org3af2bb1) if MAP bit is 0

<!--list-separator-->

-  MAP

    When MAP bit is 1, multiplexer sends address of the first Micro-Instruction for the next micro-routine

<!--list-separator-->

-  Halt

    When HLT bit is 1, the Micro-Instruction Register will trigger the HALT signal, stopping the clock.

<!--list-separator-->

-  Address of Next micro-instruction

    Only matters if HLT and MAP are not 1 (arbitrary values). The Micro-Instruction Address of the next
    Micro-Instruction in a non-branching program. Refer to description of [Figure 8](#orga6c5037) for more explanation.


#### Comment {#comment}

This column provides a simple explanation for what happens in the micro-programmable control unit
after each Micro-Instruction.


### Fetch micro-routine {#fetch-micro-routine}

-   Control ROM addresses 0, 1, 2 (3 Micro-Instructions)
    1.  Micro-Instruction 0
        -   Activates control Signal bits EP, LM
        -   Moves data from the [Program Counter Register](#orga687585) to the [Memory Access Register](#orge811df4)
        -   MAR now contains address in RAM of the next instruction
        -   CD and MAP bits are zero, next Micro-Instruction corresponds to the address
            in the CRJA field (Micro-Instruction 1)
    2.  Micro-Instruction 1
        -   Activates control Signal bit R
        -   Reads the data at adress MAR into [Memory Data Register](#org56eac2c) from RAM
        -   CD and MAP bits are zero, use CRJA field again (Micro-Instruction 2)
    3.  Micro-Instruction 2
        -   Activates control Signal bits ED, LI, IP
        -   ED, LI moves the **Word** from MDR to the [Instruction Register](#org762501b)
        -   IP increments the PC Register
        -   New instruction is in IR
        -   PC now points to the next instruction
        -   MAP is now 1, so the next micro-instruction is from Address ROM (specified by op-code)
    4.  Signal pin description is in [Figure 1](#org3b5a5aa)


### JN micro-routine {#jn-micro-routine}

-   Control ROM addresses 0F, 10, 11
    1.  Micro-Instruction 0F
        -   Does nothing except set the CD bit to 1
        -   Execution of the next micro-instruction now depends on value of [Negative Flag](#org3af2bb1)
        -   If NF is 0, increments Micro Program counter 0F + 1 = 10, Micro-Instruction 10
        -   If NF is 1, uses CRJA field (Micro-Instruction 11)
    2.  Micro-Instruction 10
        -   Does nothing (no set signal bits)
        -   MAP, CD = 0, uses CRJA field (Micro-Instruction 00 (Fetch routine))
        -   [PC](#orga687585) is not altered, so next instruction is executed normally
    3.  Micro-Instruction 11
        -   Activates Control Signal Bits EI, LP
        -   Moves contents of [IR](#org762501b)(least significan eight bits) to [PC](#orga687585)
        -   Next Instruction at location corresponding to value of the least significant 8 bits of IR
        -   Control of the computer is transferred to the "Jump address"


## Hard-Wired vs. Micro-programmed Computers {#hard-wired-vs-dot-micro-programmed-computers}

-   Large majority of computers today are micro-programmed
-   Micro-programmed computers are much more flexible
    you don't have to make a new computer to change instruction set, only alter Control ROM
-   Changing the firmware is the same as changing the contents of the Control ROM
-   Hard-Wired architecture can not be easily(almost impossible) changed
    New architecture has do be designed at the hardware level (can't add new instructions easily)
-   Hard-Wired computers are faster (micro-program doesn't have to react to input)
    and can be easier to manufacture (cheaper).


## Old figures {#old-figures}

![](The_Basic_Computer/Figure1.JPG)
![](The_Basic_Computer/Figure2.GIF)
![](The_Basic_Computer/Figure3.GIF)
![](The_Basic_Computer/Figure4.GIF)
![](The_Basic_Computer/Figure5.GIF)
![](The_Basic_Computer/Figure6.png)
![](The_Basic_Computer/Figure7.GIF)
![](The_Basic_Computer/Figure8.jpg)
![](The_Basic_Computer/Table1.png)
![](The_Basic_Computer/Table2.png)
![](The_Basic_Computer/Table3.png)
![](The_Basic_Computer/Table4.png)
