# Grand Assignment – RISC-V Assembly Programming

## Student Information

**Name:** Essa Asim

---

## Overview

This repository contains the solutions for the Grand Assignment implemented in **RISC-V Assembly Language** using the **Venus RISC-V Simulator**. The assignment demonstrates core concepts of assembly programming, including procedures, recursion, stack management, instruction decoding, and basic RISC-V architecture.

## Repository Contents

```text
.
├── part1_array.s
├── part2_recursion.s
├── part3_decoder.s
├── part3_answers.md
├── PRIVILEGED_SUMMARY.md
├── EXTENSION_SUMMARY.md
├── README.md
└── .gitignore
```

## Assignment Summary

### Part 1 – Array Processing

Implemented procedures to:

* Calculate the sum of an array
* Find the minimum value
* Find the maximum value
* Count the number of negative elements

### Part 2 – Recursive Programming

Implemented a recursive Fibonacci algorithm with memoization to demonstrate recursion, stack frame management, and efficient reuse of previously computed results.

### Part 3 – Instruction Decoder

Developed a simple RISC-V instruction decoder that extracts the opcode, destination register (RD), source register (RS1), and funct3 fields from 32-bit machine instructions. A separate worksheet (`ENCODING_WORKSHEET.md`) documents the manual decoding process.

### Additional Documentation

* **PRIVILEGED_SUMMARY.md** – Summary of the RISC-V Privileged Architecture, including privilege modes, important CSRs, and trap handling.
* **EXTENSION_SUMMARY.md** – Summary of the RISC-V Vector (RVV) Extension, covering its features, key instructions, advantages, and applications.

## Development Environment

* **Simulator:** Venus RISC-V Simulator
* **ISA:** RV32I Assembly Language

## References

* RISC-V Instruction Set Manual
* RISC-V Privileged Architecture Specification
* RISC-V Vector Extension Specification
