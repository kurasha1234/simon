.section .text

.globl compare_sequences
compare_sequences:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi
    movl 12(%ebp), %edi
    movl 16(%ebp), %ecx
    xorl %edx, %edx
    xorl %eax, %eax

.L_loop:
    cmpl %ecx, %edx
    jge .L_match

    movzbl (%esi,%edx,1), %al
    movzbl (%edi,%edx,1), %bl
    cmpb %al, %bl
    jne .L_end

    incl %edx
    jmp .L_loop

.L_match:
    movl $1, %eax

.L_end:
    popl %ebp
    ret

.globl get_random_char
get_random_char:
    pushl %ebp
    movl %esp, %ebp

    rdtsc
    xorl %edx, %edx
    movl $4, %ecx
    divl %ecx

    addb $65, %al
    movzbl %al, %eax

    popl %ebp
    ret

.globl delay
delay:
    pushl %ecx
    pushl %eax
    movl $50000000, %ecx

.L_delay:
    decl %ecx
    jnz .L_delay

    popl %eax
    popl %ecx
    ret
