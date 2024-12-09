section .data
    msg db 'Wynik: %d', 10, 0  ; Message to be printed (example, not used here)

section .bss
    n resd 1  ; Variable to store the result

section .text
    global _start

_start:
    ; Assume input values P and R are already in EBX and EDX, respectively.

    ; n = P
    mov eax, ebx         ; Copy the value of P (in EBX) to EAX (n = P)
    ; m = R
    mov ecx, edx         ; Copy the value of R (in EDX) to ECX (m = R)

    ; Compare if n > m
    cmp eax, ecx         ; Compare n (EAX) with m (ECX)
    jg greater           ; Jump to "greater" if n > m

    ; If n <= m, perform m = m - n
    sub ecx, eax         ; Subtract n from m (m = m - n)
    jmp end_program      ; Jump to the end of the program

greater:
    ; If n > m, perform n = n - m
    sub eax, ecx         ; Subtract m from n (n = n - m)

end_program:
    ; The result is in EAX
    ; Convert the number in EAX to an ASCII string

    ; Prepare the buffer for conversion
    mov edi, n           ; Address of variable n (buffer to store the result)
    mov ecx, 10          ; Division by 10 (decimal base)
    call int_to_ascii    ; Call the function to convert integer to ASCII

    ; Print the result
    mov ebx, 1           ; File descriptor (stdout)
    mov edx, 10          ; Length of the data (assuming max 10 characters)
    mov ecx, n           ; Address of the buffer containing the result
    mov eax, 4           ; System call number for "write"
    int 0x80             ; Perform the system call

    ; Exit the program
    mov eax, 1           ; System call number for "exit"
    xor ebx, ebx         ; Exit code 0
    int 0x80             ; Perform the system call

; Function to convert a number in EAX to an ASCII string
int_to_ascii:
    ; Preserve the original values of registers
    push eax
    push ecx
    push edx

    mov edx, 0           ; Clear EDX (used for storing the remainder)
convert_loop:
    xor edx, edx         ; Clear EDX (needed before DIV)
    div ecx              ; Divide EAX by 10 (remainder goes to EDX)
    add dl, '0'          ; Convert remainder to ASCII
    dec edi              ; Decrement buffer pointer
    mov [edi], dl        ; Store the ASCII character in the buffer
    test eax, eax        ; Check if EAX is 0 (no more digits to process)
    jnz convert_loop     ; If not zero, repeat the division

    ; Restore the original values of registers
    pop edx
    pop ecx
    pop eax
    ret                  ; Return from the function
