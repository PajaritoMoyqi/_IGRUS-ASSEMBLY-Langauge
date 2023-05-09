.model small
.stack 100h
.data
var1 dw 1234h
var2 dw 5678h
var3 dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 1020h
    push var1
    push var2
    push ax

    pop var1 ;pop된 값을 var1에 넣는다는 의미! var1=1020h
    pop var3 ;var3=5678h
    pop var2 ;var2=1234h

    mov ax, var1
    mov bx, var2
    mov cx, var3

    mov ax, 4c00h
    int 21h
main endp
end main