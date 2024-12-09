section .text
    global sum_divisible_by_8

sum_divisible_by_8:
    ; we assume that rax contains the start of the range and rbx contains the end of the range

    ; initialize sum to 0
    xor rax, rax         ; rax = 0, this will store the sum

    ; find the first number >= rax that is divisible by 8
    mov rcx, rbx         ; rcx = end of range (rbx)
    mov rdx, 8           ; rdx = divisor (8)

    ; calculate the first multiple of 8 >= rax
    ; if rax % 8 != 0, adjust rax to the next multiple of 8
    test rdi, rdi
    jg a%%start
