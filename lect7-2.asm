.model small
.stack 100h
.data
byteVar1 db 60h

.code
main proc
    mov ax, @data
    mov ds, ax

    ;부호 없는 바이트 정수의 곱셈
    mov al, 80h
    mul byteVar1 ;ax=3000h

    ;부호 있는 바이트 정수의 곱셈
    mov al, 80h
    imul byteVar1 ;ax=0d000h

    ;부호 없는 워드 정수의 곱셈
    mov ax, 1000
    mov bx, 12
    mul bx ;ax=2ff0h, dx=0000h

    ;부호 있는 워드 정수의 곱셈
    mov ax, 5
    mov bx, -1
    imul bx ;ax=0fffbh, dx=0ffffh

.286
    mov dx, 0 ;초기화
    mov ax, 5
    imul ax, -1 ;ax=0fffbh, dx=0000h
    ;dx에는 영향이 없다!!!

    ;부호 없는 정수의 나눗셈
    mov ax, 8700h
    mov bl, 0c7h
    div bl ;ah=85h, al=0adh

    ;부호 있는 정수의 나눗셈
    mov ax, 779h ;양수
    mov bl, 87h ;음수
    idiv bl ;ah=62, al=f1

    mov ax, 4c00h
    int 21h
main endp
end main