section .text
extern print
global sort

; Bubble Sort 
sort:
    enter 0, 0          ; Start Stack Frame
    mov EDX, [EBP+8]    ; EDX = int *v (Right-pusher)
    mov ECX, [EBP+12]   ; ECX = size (Right-pusher)
    dec ECX             ; ECX = size - 1 (Máximo dos indices que serão acessados)

    push EBX            ; Saving EBX

    cmp ECX, 1          ; Se size = 0 ou size = 1 não precisa ordenar!
    jle end             ; Jump para o final.

    mov EAX, 0          ; Zerando EAX (Contador do Loop Externo = i)

    jmp loop1

loop1:                  ; Loop externo
    mov EBX, 0          ; Zerando EBX (Contador do Loop Interno = j)

    .loop2:

        push ECX
        push EAX
        mov ECX, [EDX+EBX*4]        ; = v[j]   (Acesso a memória)
        mov EAX, [EDX+EBX*4 + 4]    ; = v[j+1] (Acesso a memória)

        cmp ECX, EAX
        jle .endLoop2

        mov [EDX+EBX*4], EAX        ; SWAP
        mov [EDX+EBX*4 + 4], ECX

    .endLoop2:

        pop EAX                 ; Recupera os valores de ECX e EAX
        pop ECX

        inc EBX                 ; Avança contador do Loop Interno (j++)

        cmp EBX, ECX            ; Se j < size - 1 continua
        jne .loop2
                                ; Se não continua a rodar...
                                
    inc EAX                     ; Avança contador do Loop Externo (i++)
    cmp EAX, ECX                ; Se i < size - 1 volta pro loop1
    jne loop1

    jmp end                     ; Se não acabou.

end:
    inc ECX             ; ECX = size -1 + 1 = size
    pop EBX             ; EBX é recuperado

    push ECX            ; Passagem de parametros para o módulo em 'C' (Right-pusher)
    push EDX

    call print          ; Chamando o Módulo em 'C'
    
    leave               ; Reverte as ações do ENTER
    ret                 ; Retoma para o código em 'C'