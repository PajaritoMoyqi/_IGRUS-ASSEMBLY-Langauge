.model small
.stack 100h
.data
var1 db 11001010b

.386 ;이동할 비트 수를 1보다 크게 지정하려고
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    mov al, var1
    shl al, 1
    shl al, 2

    mov cl, 4
    sal al, cl ;shl과 sal은 동일하다.

    mov ax, 1
    shl ax, 5 ;2의 n승을 곱할 때 쓰인다. mul보다 더 빠르다.

    mov al, var1
    shr al, 4
    mov al, var1
    sar al, 4

    mov ax, 4c00h
    int 21h
main endp
end main