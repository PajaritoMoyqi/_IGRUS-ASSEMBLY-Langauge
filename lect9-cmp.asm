.model small
.stack 100h
.data
var1 db 10h
var2 db 20h
var3 db 5h

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, var1
    sub al, var2

    mov al, var1
    sub al, var1

    mov al, var1
    sub al, var3

    mov al, var1
    cmp al, var2
    cmp al, var1
    cmp al, var3

    mov ax, 4c00h
    int 21h
main endp
end main