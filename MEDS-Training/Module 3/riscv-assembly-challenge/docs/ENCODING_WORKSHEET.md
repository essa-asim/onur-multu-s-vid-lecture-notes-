# Part 3 – Instruction Encoding Worksheet

## Instruction 1

**Hex Instruction**

```
0x00A28233
```

**Binary**

```
00000000101000101000001000110011
```

**Field Breakdown**

```
31      25 24   20 19   15 14 12 11    7 6      0
0000000 | 01010 | 00101 | 000 | 00100 | 0110011
```

**Extraction**

```
Opcode = bits[6:0]
       = 0110011₂
       = 0x33
       = 51

RD = bits[11:7]
   = 00100₂
   = 4

Funct3 = bits[14:12]
        = 000₂
        = 0

RS1 = bits[19:15]
    = 00101₂
    = 5
```

**Answer**

* Opcode = **51**
* RD = **4**
* Funct3 = **0**
* RS1 = **5**

---

## Instruction 2

**Hex Instruction**

```
0x00500113
```

**Binary**

```
00000000010100000000000100010011
```

**Field Breakdown**

```
31      20 19   15 14 12 11    7 6      0
000000000101 | 00000 | 000 | 00010 | 0010011
```

**Extraction**

```
Opcode = 0010011₂ = 0x13 = 19

RD = 00010₂ = 2

Funct3 = 000₂ = 0

RS1 = 00000₂ = 0
```

**Answer**

* Opcode = **19**
* RD = **2**
* Funct3 = **0**
* RS1 = **0**

---

## Instruction 3

**Hex Instruction**

```
0x00742423
```

**Binary**

```
00000000011101000010010000100011
```

**Field Breakdown**

```
31      25 24   20 19   15 14 12 11    7 6      0
0000000 | 00111 | 01000 | 010 | 01000 | 0100011
```

**Extraction**

```
Opcode = 0100011₂
       = 0x23
       = 35

RD(bits11:7) = 01000₂ = 8

Funct3 = 010₂ = 2

RS1 = 01000₂ = 8
```

**Answer**

* Opcode = **35**
* RD(bits 11:7) = **8**
* Funct3 = **2**
* RS1 = **8**

---

## Instruction 4

**Hex Instruction**

```
0x00208863
```

**Binary**

```
00000000001000001000100001100011
```

**Field Breakdown**

```
31      25 24   20 19   15 14 12 11    7 6      0
0000000 | 00010 | 00001 | 000 | 10000 | 1100011
```

**Extraction**

```
Opcode = 1100011₂
       = 0x63
       = 99

RD(bits11:7) = 10000₂ = 16

Funct3 = 000₂ = 0

RS1 = 00001₂ = 1
```

**Answer**

* Opcode = **99**
* RD(bits 11:7) = **16**
* Funct3 = **0**
* RS1 = **1**

---

## Instruction 5

**Hex Instruction**

```
0x123452B7
```

**Binary**

```
00010010001101000101001010110111
```

**Field Breakdown**

```
31      20 19   15 14 12 11    7 6      0
000100100011 | 01000 | 101 | 00101 | 0110111
```

**Extraction**

```
Opcode = 0110111₂
       = 0x37
       = 55

RD = 00101₂ = 5

Funct3 = 101₂ = 5

RS1 = 01000₂ = 8
```

**Answer**

* Opcode = **55**
* RD = **5**
* Funct3 = **5**
* RS1 = **8**

---

## Instruction 6

**Hex Instruction**

```
0x010000EF
```

**Binary**

```
00000001000000000000000011101111
```

**Field Breakdown**

```
31      20 19   15 14 12 11    7 6      0
000000010000 | 00000 | 000 | 00001 | 1101111
```

**Extraction**

```
Opcode = 1101111₂
       = 0x6F
       = 111

RD = 00001₂ = 1

Funct3 = 000₂ = 0

RS1 = 00000₂ = 0
```

**Answer**

* Opcode = **111**
* RD = **1**
* Funct3 = **0**
* RS1 = **0**

---
