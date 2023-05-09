.model small
.stack 100h
.data
str1 db 'Hello, World', 0dh, 0ah, '$'
str2 db 'I like cats', 0dh, 0ah, '$'
str3 db 'I like 8086', 0dh, 0ah, '$'

.code
main proc far
    mov ax, @data
    mov ds, ax

    lea dx, str1
    push dx
    lea dx, str2
    push dx
    lea dx, str3
    push dx ;매개변수로 전달

call threeStr
    mov ax, 4c00h
    int 21h
main endp

threeStr proc near
    push bp
    mov bp, sp ;Base Pointer를 활용해 매개변수에 접근하고자 SP와 BP의 값을 같게 해준다.
    push ax
    push dx ;보존하기 위해 push

    mov ah, 9h
    mov dx, [bp+8]
    int 21h
    mov dx, [bp+6]
    int 21h
    mov dx, [bp+4]
    int 21h

    pop dx
    pop ax
    pop bp ;push 역순으로 pop해서 값을 가져온다.
    ret 6
threeStr endp

end main