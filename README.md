# Reverse Engineering and Program Analysis - Exam Tasks

## Task no.1

Contents: Write the flowchart from Figure 1 in x86_64 assembly language. The input P of the algorithm is connected to the ebx register, the input R to the edx register, the output n to the eax register. All numbers are treated as signed integers.

![image](https://github.com/user-attachments/assets/50081ea3-567a-4436-9a3d-d67f2f21ec0c)

## Task no.2

Write a subroutine in x86_64 assembler that, for an input in the rax and rbx registers denoting the beginning and end of the search range, returns the sum of all values ​​divisible by 8 from this mutually closed range. The result is to be returned in the rax register. All numbers are treated as signed integers.

## Task no.3

Convert code written in Intel x86_64 syntax to GNU AS syntax

```
    mov ebx, 8
label1:
  mov BYTE PTR [eax], bl
  inc eax
  dec ebx
  jz label1
  mov ecx, DWORD PTR [eax*2+4]
   loop label1
   test eax, eax
  ret
```
## Task no.4

Modify the following hexadecimal code from the disassembler so that this part of the program always returns a value of 0 in the eax register regardless of the value entering the code, preserving the current number of bytes and trying to limit the number of changes to a minimum. Instruction length hints: xor eax, eax to 33C0 ; mov eax, 0 to B800000000 ; nop to 90.

```
83F87A cmp eax, 7ah
 7708 ja next
 83F861 cmp eax, 61h
 7203 jb next
 83E820 sub eax, 20h
dalej:
 C3 ret
```
## Task no. 5

Modify the disassembler code below, preserving the current number of bytes and trying to limit the number of changes to a minimum, so that the result of the prodprogram placed in the rax register always has a value greater than 0.

```
8A06 mov al, byte ptr [rsi]
8A17 mov dl, byte ptr [rdi]
3AC2 cmp al, dl
750D jne dalej
48FFC6 inc rsi
48FFC7 inc rdi
E2F0 loop agn
4833C0 xor rax, rax
EB10 jmp finisz
 next:
7308 jae rup
4833C0 xor rax, rax
48FFC8 dec rax
EB06 jmp finisz
 rup:
4833C0 xor rax, rax
48FFC0 inc rax
 finish:
C3 ret
```
## Task no. 6

Modify Java ByteCode so that this disassembled program fragment always returns 1 on the stack regardless of the method parameter values.

Descriptor #7 points to the method

java/lang/String.compareToIgnoreCase:(Ljava/lang/String;)

Ofs. Byte string | Decoded instruction

```
0: 2A aload_0
 1: 2B aload_1
 2: B60007 invokevirtual #7
 5: 9A0007 ifne 12
 8: 04 iconst_1
 9: A70004 goto 13
 12: 03 iconst_0
 13: AC ireturn
```

# Task no.7

Modify the MSIL intermediate code so that this disassembled program fragment always prints values ​​from 0 to 8 to the screen (as below) regardless of the value entered by the user.

Remember to make as few modifications as possible to the original code.

The output of the program, -> means user input to the terminal, <- means

the program prints data to the terminal: -> 4

<- 0 Lorem ipsum
<- 1 Lorem ipsum
<- 2 Lorem ipsum
<- 3 Lorem ipsum

Ofs. | Byte string Decoded |instruction
```
IL_0000: 28 0700000A call string [mscorlib]System.Console::ReadLine()
IL_0005: 28 0800000A call int32 [mscorlib]System.Convert::ToInt32(string)
IL_000a: 0A stloc.0
IL_000b: 16 ldc.i4.0
IL_000c: 0B stloc.1
IL_000d: 2B 14 br.s IL_0023
IL_000f: 07 ldloc.1
IL_0010: 17 ldc.i4.1
IL_0011: 58 add
IL_0012: 0B stloc.1
IL_0013: 72 01000070 ldstr "{0} Lorem ipsum"
IL_0018: 07 ldloc.1
IL_0019: 8C 0C000001 box [mscorlib]System.Int32
IL_001e: 28 0900000A call void [mscorlib]System.Console::WriteLine(string, object)
IL_0023: 07 ldloc.1
IL_0024: 06 ldloc.0
IL_0025: 32 EE blt.s IL_000f
IL_0021: 16 ldc.i4.0
IL_0022: 2A ret
IL_0023: 00 nop
```
