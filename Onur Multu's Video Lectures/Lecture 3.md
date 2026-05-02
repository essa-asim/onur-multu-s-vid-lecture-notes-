# Lecture 3: Sequential Logic

more about combinational circuits — continuing from previous lecture...

---

## Comparators
Used to compare two binary values (equal or not, sometimes greater/less).  
XNOR gate can act as equality detector (outputs 1 when both inputs same).

---

## Tri-State Buffer
Has 3 outputs: 0, 1, and high impedance (Z).  
Used when multiple devices share a line (bus) without interfering.

---

## Priority Circuit
Gives priority to one input over others.  
Useful in encoders / interrupt systems.

---

## Sequential Logic Circuits

### Cross-Coupled Inverters
Two inverters connected together -> can store 1 bit.  
Basic memory idea.

---

### R-S Latch 
Set (S) and Reset (R) inputs.  
Stores 1 bit, but has invalid state (both inputs active).

---

### D Latch
Improved version of R-S latch (no invalid state).  
Stores value of D when enabled.

---

### Registers
Collection of flip-flops.  
Used to store multiple bits in CPU.

---

### Memory
Stores data using addresses.  
Read = give address -> get stored value.

---

### Lookup Table (LUT)
Stores precomputed outputs.  
Used a lot in FPGAs.

---

### Finite State Machine (FSM)
System with limited states and transitions.  
Used in control logic.

---

### Synchronous vs Asynchronous
Synchronous -> uses clock  
Asynchronous -> no clock, changes immediately

---

## ALU (Arithmetic Logic Unit)
Performs arithmetic + logic operations.  
Built using combinational circuits (adders, etc.)

---
