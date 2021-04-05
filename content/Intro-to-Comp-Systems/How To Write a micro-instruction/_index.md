+++
title = "How to write a micro-instruction"
author = ["David Lewis"]
draft = false
+++

A micro-instruction is just a binary (often converted to hex) number that represents a list of control signals, and points to the next micro-instruction.  Micro-instructions can be changed by changing the  A set of micro-instructions forms a micro-routine (otherwise known as an instruction).


## Control signals {#control-signals}

To understand the micro-instruction, you must understand what the control signals do. I will be referencing the Hard vs Micro [pathways]({{< relref "hardvmicro#pathways" >}})
It has LA (load accumulator), and EA (enable accumulator) signals. They are essentially just wires connected to the control unit (referenced by the 16 coming out of CONTROL) Each register also generally has a clock signal (CLK), but that is connected directly to the clock circuit and is not required for the micro-instructions. The naming system for the signals is somewhat arbitrary but usually follows the pattern (L, E) (register). This is subverted somewhat by the ALU, but that will most likely be directly defined. The other main difference is the inclusion of I, which just means increment.


### Load (L) {#load--l}

A load signal allows the contents of a register to be changed by the state of the bus (a collection of wires). This signal must be paired with an E signal to do anything.


### Enable (E) {#enable--e}

An enable signal changes the state of the bus to match the contents of the register. Say a register contains the value 1111, when the enable signal is used for that register, the contents of the bus will now be 1111. This signal must be paired with a L signal to do anything.


## Micro-instructions {#micro-instructions}

A micro-instruction is a binary number composed of several `fields` stored at a specific address in the ROM (read only memory) of the control unit.


### Control field {#control-field}

This is just a binary representation of the signals. In the hard vs micro document, the letters are signals are abbreviated into the following order:

-   ILELAWLELELEASEL
    Expanded: IP LP EP LM R W LD ED LI EI LA EA A S E

A micro instruction will generally contain a pair of signals (L E) that transfers the contents of one register into another. The contents of the enabled register moves into the loaded register through the bus. A 1 means that the signal is on while a 0 means the signal is off.


### Next Address field {#next-address-field}

This field has 4 different sub fields. it is used to determine the next micro instruction.


#### CD {#cd}

CD (short for condition) is used for conditional logic. This bit makes the next micro-instruction depend on the value of the negative flag. This is generally off, unless you want conditional logic, see [JN micro-routine]({{< relref "hardvmicro#JN" >}})


#### MAP {#map}

the map bit uses the next micro-instruction in the control ROM, see [Fetch micro-routine]({{< relref "hardvmicro#FETCH" >}}) . This is generally off.


#### CRJA field {#crja-field}

This field consists of an address in the control ROM


## LDA micro-routine {#lda-micro-routine}

Here is a step by step on how to write this instruction with micro-instructions.

1.  Find out where the data is coming from.
2.  Map out the sub-steps:
    1.  IR -> MAR
    2.  RAM -> MDR
    3.  MDR -> ACC
3.  determine the signals for each substep:
    1.  EI, LM
    2.  R
    3.  ED, LA
4.  Link the micro-instructions with the next address field.
    1.  address of next micro-instruction (04) in this case
    2.  address of next micro-instruction (05) in this case
    3.  link back to fetch (00) in this case
5.  Write the codes!
    1.  (0001000001000000)(0)(0)(0)(0100)
    2.  (0000010000000000)(0)(0)(0)(0101)
    3.  (0000000010010000)(0)(0)(0)(0000)
6.  Optional convert to hex
    1.  82004
    2.  20005
    3.  4800
