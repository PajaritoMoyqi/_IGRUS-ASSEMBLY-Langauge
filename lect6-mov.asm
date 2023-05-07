.model small
.stack 100h
.data
wordVar1 dw 1234h
wordVar2 dw 0000h
arr1 db 0abh, 0cdh

.code
main proc
    mov ax, @data
    mov ds, ax ;데이터 세그먼트 초기화

    mov ax, 0
    mov bx, 0
    mov cx, 0 ;임의 데이터로 값 초기화

    mov al, byte ptr wordVar1 ;34
    mov al, byte ptr wordVar1 + 1 ;12
    mov byte ptr wordVar2, 0ffh ;ff
    mov byte ptr wordVar2+1, 0aah ;aa
    mov bx, wordVar2 ;aaff
    mov cx, word ptr arr1 ;cdab

    mov ax, 4c00h
    int 21h ;프로세스 종료
main endp
end main