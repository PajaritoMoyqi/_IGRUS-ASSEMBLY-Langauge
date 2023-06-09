.model small
.stack 100h
.data
var1 db 10h
var2 db 20h

onEqual db "EQUAL!", 0dh, 0ah, '$'
notEqual db "NOT EQUAL!", 0dh, 0ah, '$'
;0dh, 0ah는 합쳐져서 개행을 의미하는 ASCII 코드가 된다.

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, var1
    cmp al, var2
    je eq1
    lea dx, notEqual
    jmp next1
eq1:
    lea dx, onEqual
next1:
    mov ah, 9h
    int 21h

    mov al, var1
    cmp al, 10h
    je eq2
    lea dx, notEqual
    jmp next2
eq2:
    lea dx, onEqual
next2:
    int 21h

    mov ax, 4c00h
    int 21h
main endp
end main