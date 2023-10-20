        section .text
        global hadarmard_prod

hadarmard_prod:
        push rdi                       ; pointer to mat1
        push rdx                       ; pointer to mat2
        push r8                        ; pointer to mat3
        push r9                        ; number of rows/ columns of the matrix (n)
        push r11
        push r12


; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Compute hadarmard product of of mat1, mat2 and save the result in mat3
; ; Note : mat1, mat2 and mat3 here are not the same as one given in problem statement.
; ; They are just placeholders for any three matrices using this functionality.

; ; TODO - Fill your code here performing the hadarmard product in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){mat3[j][i] = mat1[j][i] * mat2[j][i];}}

; ; End of code to be filled

mov r15, 0        ;i=0
loop_i:
       cmp r15, r9 
       jae return 
       jmp loop_j1 
continue:
       add r15, 1 
       jmp loop_i
loop_j1:
       mov r14, 0
loop_j: 
       cmp r14, r9
       jae continue
       mov rbx, rdi
       mov r10, r14
       imul r10, r9
       add r10, r15
       shl r10, 3
       add rbx, r10
       mov r13, [rbx]
       mov rbx, rdx
       mov r10, r14
       imul r10, r9
       add r10, r15
       shl r10, 3
       add rbx, r10
       mov r12, [rbx]
       imul r13, r12
       mov rbx, r8
       mov r10, r14
       imul r10, r9
       add r10, r15
       shl r10, 3
       add rbx, r10
       mov [rbx], r13
       add r14, 1
       jmp loop_j

return:
        pop r12
        pop r11
        pop r9
        pop r8
        pop rdx
        pop rdi
        ret
