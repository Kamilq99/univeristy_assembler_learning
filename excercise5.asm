agn:
8A06            ; mov al, byte ptr [rsi]
8A17            ; mov dl, byte ptr [rdi]
3AC2            ; cmp al, dl
750D            ; jne next
48FFC6          ; inc rsi
48FFC7          ; inc rdi
E2F0            ; loop agn
48FFC0          ; inc rax             ; Instead of xor rax, rax, we increment rax
EB10            ; jmp finish
dalej:
7308            ; jae rup
48FFC0          ; inc rax             ; Instead of xor rax, rax, we increment rax
48FFC8          ; dec rax
EB06            ; jmp finish
rup:
48FFC0          ; inc rax             ; Instead of xor rax, rax, we increment raxfinisz:
C3              ; ret
