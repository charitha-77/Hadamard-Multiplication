        section .text
        global  alt_sum

alt_sum:
        push rdi                       ; pointer to mat
        push rdx                       ; number of rows/ columns of the matrix (n)
        push r11
        push r12

; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Perform matrix alternate summation of elements in matrix and return the sum

; ; TODO - Fill your code here performing the matrix alternate summation in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){sum += (-1)^(i+j)*mat1[i][j];}}


; ; End of code to be filled

mov r15, 0        ;i=0
mov rax, 0 
loop_i:
       cmp r15, rdx 
       jae return 
       jmp loop_j1 
continue:
       add r15, 1 
       jmp loop_i
loop_j1:
       mov r14, 0
loop_j: 
       cmp r14, rdx
       jae continue
       mov r11, r14
       add r11, r15
       and r11, 1
       jz even
       jmp odd
even:
       mov rbx, rdi
       mov r10, r15
       imul r10, r9
       add r10, r14
       shl r10, 3
       add rbx, r10
       add rax, [rbx]
       add r14, 1
       ; imul r12, -1
       jmp loop_j
odd:
       mov rbx, rdi
       mov r10, r15
       imul r10, r9
       add r10, r14
       shl r10, 3
       add rbx, r10
       sub rax, [rbx]
       add r14, 1
       ; imul r12, -1
       jmp loop_j

return:
        pop r12
        pop r11
        pop rdx
        pop rdi
        ret
