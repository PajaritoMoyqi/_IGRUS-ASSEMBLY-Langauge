.model small
.stack 100h
.data
byteArr db 1, 2, 3, 4, 5, 6, 7
sum db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 0
    mov si, 0
    add al, [byteArr+si]
    inc si
    add al, [byteArr+si]
    inc si
    add al, [byteArr+si]
    inc si
    add al, byteArr[si]
    inc si
    add al, byteArr[si]
    inc si
    add al, byteArr[si]
    inc si
    add al, byteArr[si]
    mov sum, al
    dec al
    neg al

    mov 4c00h
    int 21h
main endp
end main
    