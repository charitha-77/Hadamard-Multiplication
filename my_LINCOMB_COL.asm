        section .text
        global lin_comb 

lin_comb: 
        push rdi                       ; pointer to mat1
        push rsi                       ; scaler 1
        push rdx                       ; pointer to mat2
        push rcx                       ; scaler 2
        push r8                        ; pointer to mat3
        push r9                        ; number of rows/ columns of the matrix (n)  
        push r11
        push r12  

; ; 0-indexing on all matrices             
; ; mat1[j][i] = rdi+(r9*j+i)*8        
; ; GOAL - Perform matrix linear combination of mat1, mat2 and save result in mat3
; ; Note : mat1, mat2 and mat3 here are not the same as one given in problem statement.
; ; They are just placeholders for any three matrices using this functionality.

; ; TODO - Fill your code here performing the matrix linear combination in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){mat3[j][i] = s1*mat1[j][i] + s2*mat2[j][i];}}
; ; End of code to be filled

mov r15, 0                   ;i=0
loop_i:
       cmp r15, r9                
       jae return 
       jmp loop_j1 
continue:
       add r15, 1 
       jmp loop_i
loop_j1:
       mov r14, 0             ;j=0
loop_j: 
       cmp r14, r9
       jae continue
       mov r13, rsi           ;r13=s1
       mov rbx, rdi           ;rbx=matrix pointer
       mov r10, r14           
       imul r10, r9
       add r10, r15           
       shl r10, 3             ;r10=(r9*j+i)*8
       add rbx, r10
       imul r13, [rbx]        ;r13=mat1[j][i]*s1
       mov r12, rcx           ;r12=s2
       mov rbx, rdx           ;rbx=pointer to matrix2
       mov r10, r14
       imul r10, r9
       add r10, r15
       shl r10, 3             ;r10=(r9*j+i)*8
       add rbx, r10
       imul r12, [rbx]        ;r12=s2*mat2[j][i]
       add r13, r12           
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
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        ret
