.model small
.stack 100h
.data
var1 db 11011010b
varb db 10010011b

.386
;1 이상의 즉시값을 이동할 비트수로 사용하고자
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    mov al, var1
    ror al, 4

    mov al, var1
    rcr al, 4

    mov al, var2
    rol al, 3

    mov al, var2
    rcl al, 3

    mov ax, 4c00h
    int 21h
main endp
end main