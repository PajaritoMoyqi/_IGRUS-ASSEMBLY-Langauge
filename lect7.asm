.model small
.stack 100h
.data
byteVar1 db 10h
byteVar2 db 90h
wordVar1 dw 8000h ;-32768

.code
main proc
    mov ax, @data
    mov ds, ax

    ;ZF=1이 되는 경우
    mov ax, 
    mov al, 10h
    add al, 30h
    sub al, 40h ;al=0

    ;CF=1이 되는 경우
    ;SF역시 1이다
    mov al, 0f0h
    mov bl, 0c0h
    add al, bl ;al=0b0h

    ;캐리가 포함된 덧셈과 뺄셈
    adc al, 10h ;그냥 더했으면 0b0h + 10h로 0c0h가 되었겠지만, carry도 더해주어 0c1h가 된다
    stc ;인위적으로 carry flag를 1로 set
    ;carry가 위의 adc에 의해서 0이 되었으므로 다시 1로 set
    sbb al, 10h ;al=0b0h

    ;SF=1이 되는 경우(NG)
    ;80h는 -128이다
    mov al, 0
    add al, byteVar1 ;al=10h
    sub al, byteVar2 ;al=80h

    ;CF=1, OF=1 (CY, OV)
    cbw ;ax=0ff80h
    add ax, wordVar1 ;ax=7f80h

    mov ax, 4c00h
    int 21h
main endp
end main