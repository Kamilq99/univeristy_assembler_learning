    .text
    .globl _start

_start:
    movl $8, %ebx            # mov ebx, 8

label1:
    movb %bl, (%eax)         # mov BYTE PTR [eax], bl
    incl %eax                # inc eax
    decl %ebx                # dec ebx
    jz label1                # jz label1

    movl 4(%eax, %eax, 2), %ecx   # mov ecx, DWORD PTR [eax*2+4]

    loop label1              # loop label1

    testl %eax, %eax         # test eax, eax
    ret                      # ret
