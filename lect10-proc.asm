.model small
.stack 100h
.data
str1 db 'Hello world', 0dh, 0ah, '$'

.code
main proc far
    mov ax, @data
    mov ds, ax

    call nearPrint ;IP
    call farPrint ;CS+IP
    
    mov ax, 4c00h
    int 21h
main endp

nearPrint proc near
    push ax ;스택에 ax 값 보존
    lea dx, str1
    
    mov ah, 9h
    int 21h

    pop ax ;ax의 값을 다시 복구
    ret ;RETN
nearPrint endp

farPrint proc far
    push ax
    lea dx, str1
    
    mov ah, 9h
    int 21h

    pop ax
    ret ;RETF
farPrint endp

endmain