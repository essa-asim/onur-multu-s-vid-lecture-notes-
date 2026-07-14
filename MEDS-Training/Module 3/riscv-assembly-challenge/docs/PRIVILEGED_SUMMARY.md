# RISC-V Privileged Architecture Summary

## Introduction

The RISC-V Privileged Architecture defines how the processor manages operating systems, exceptions, interrupts, memory protection, and privileged execution. Unlike the unprivileged ISA, which specifies instructions available to normal programs, the privileged architecture introduces privilege levels and Control and Status Registers (CSRs) that enable system software to control processor behavior.

---

# Privilege Levels

RISC-V supports three primary privilege modes.

## Machine Mode (M-mode)

Machine mode is the highest privilege level and is implemented in every RISC-V processor. It has unrestricted access to all processor resources and is responsible for system initialization, interrupt handling, exception processing, and low-level hardware management.

Typical responsibilities include:

* Booting the processor
* Configuring interrupts
* Managing memory protection
* Handling traps
* Initializing lower privilege modes

---

## Supervisor Mode (S-mode)

Supervisor mode is primarily used by operating systems such as Linux. It provides controlled access to hardware resources while remaining below Machine mode.

Responsibilities include:

* Process scheduling
* Virtual memory management
* System calls
* Device management
* Memory protection

Supervisor mode relies on Machine mode for initialization and certain privileged operations.

---

## User Mode (U-mode)

User mode is the least privileged execution mode. Regular application programs execute in this mode.

Applications running in User mode cannot directly:

* Modify system configuration
* Access privileged CSRs
* Configure interrupts
* Manage memory protection

Whenever privileged services are required, User mode generates an exception or system call, allowing the operating system to handle the request.

---

# Important Control and Status Registers (CSRs)

## mstatus

The **mstatus** register stores the current processor status.

It contains information such as:

* Current privilege mode
* Global interrupt enable bits
* Previous privilege mode
* Previous interrupt state

The processor automatically updates this register during trap entry and trap return.

---

## mtvec

The **mtvec** register stores the address of the machine trap handler.

Whenever an exception or interrupt occurs, program execution jumps to the address stored in **mtvec**.

---

## mepc

The **mepc** register stores the address of the instruction that caused an exception or interrupt.

After servicing the trap, execution resumes from the address stored in **mepc** using the `mret` instruction.

---

## mcause

The **mcause** register records the reason for entering the trap handler.

Examples include:

* Illegal instruction
* Environment call (ECALL)
* Load/store access fault
* Timer interrupt
* External interrupt

Software examines **mcause** to determine the appropriate response.

---

## mtval

The **mtval** register provides additional information about certain exceptions.

Examples include:

* Faulting memory address
* Illegal instruction value

Its contents depend on the specific trap.

---

# Trap Handling Process

Trap handling follows these steps:

1. An exception or interrupt occurs.
2. The processor saves the current program counter into **mepc**.
3. The cause of the trap is stored in **mcause**.
4. Additional fault information may be stored in **mtval**.
5. The processor switches to Machine mode.
6. Execution jumps to the address stored in **mtvec**.
7. The trap handler services the exception or interrupt.
8. The `mret` instruction restores the previous execution context and resumes the interrupted program.

---

# Conclusion

The RISC-V Privileged Architecture provides the mechanisms required for operating systems and firmware to manage processor execution safely and efficiently. Privilege modes enforce security boundaries, while CSRs such as **mstatus**, **mtvec**, **mepc**, **mcause**, and **mtval** provide the information necessary for trap handling, interrupt management, and system control. Together, these features enable reliable execution of modern operating systems on RISC-V processors.

---

# References

1. RISC-V International. *The RISC-V Privileged Architecture Specification*. https://docs.riscv.org/reference/isa/priv/priv-index.html
