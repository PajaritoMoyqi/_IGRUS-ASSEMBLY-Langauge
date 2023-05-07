.model small
.stack 100h
.data
byteVar1 db 10h
byteVar2 db 20h
wordVar1 dw 8086h
wordVar2 dw ?

byteArr db 12h, 34h, 56h, 78h, 9ah, 0bch
wordArr dw 1020h, 3040h, 8086h, 8088h

.code
main code
    mov ax, @data
    mov ds, ax

    ;즉시 값(imm)
    mov ax, 0
    mov bx, 0
    mov ax, 0ffffh
    mov al, 10h

    ;레지스터
    mov bx, ax

    ;직접주소
    mov ax, 0
    mov ax, wordVar1
    mov al, byteVar1
    mov wordVar2, ax

    ;변위가 추가된 직접주소
    mov ax, 0
    mov al, byteArr+2
    mov al, byteArr[3]
    mov ax, wordArr ;ax=1020h (byte 크기에 맞게 잘 더해줘야 한다)
    mov ax, wordArr+2 ;ax=3040h
    mov ax, wordArr+4 ;ax=8086h

    ;간접주소, 간접주소에 변위가 추가되는 경우
    mov ax, 0
    lea bx, byteArr ;오프셋 주소 적재
    mov al, [bx] ;al=12h
    mov al, [bx+1] ;al=34h
    mov al, [bx+2] ;al=56h

    mov bx, offset wordArr
    mov ax, [bx] ;ax=1020h
    mov ax, [bx+2] ;ax=3040h
    mov ax, [bx+4] ;ax=8086h

    ;인덱스 주소
    mov ax, 0
    mov bx, 0
    mov si, 0
    mov al, [byteArr+si] ;byteArr[0]과 같다
    inc si ;1 증가
    mov al, [si+byteArr]
    inc si
    mov al, byteArr[si]
    inc si
    lea bx, byteArr
    mov al, [bx+si]
    mov al, [bx+si+1] ;displacement까지 추가
    mov al, [bx+si+2]
    mov al, [bx+si-1]
    mov al, [bx+si-2]

    mov ax, 4c00h
    int 21h
main endp
end main