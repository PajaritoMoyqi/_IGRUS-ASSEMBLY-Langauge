.model small
.stack 100h
.data
var1 db 11110000b ;binary

.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    ;AND
    mov al, var1
    and al, 11111111b ;아무 변화가 없음
    mov al, var1
    and al, 00000000b ;모든 bit turn off
    ;하나의 bit만 꺼주고 싶으면 그 bit가 있는 자리만 0으로 하고 나머지를 1로 해서 and를 취함
    ;위와 같은 기능을 bit masking이라고 한다.

    ;OR
    mov al, var1
    or al, 11111111b
    mov al, var1
    or al, 00000000b
    ;or는 bit를 켜줄 때 쓸 수 있겠죠?

    ;XOR
    mov al, var1
    xor al, 11111111b
    mov al, var1
    xor al, 00000000b
    xor al, al ;다 0으로 채워지는군!
    
    ;NOT
    not al

    mor ax, 4c00h
    int 21h
main endp
end main