.model small
.stack 100h
.data
arr1 db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arr2 dw 197, 256, 99, 8088, 510, 634, -1
sum1 db 0
sum2 dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 0
    lea si, arr1 ;arr1의 주소로 SI 초기화
    mov cx, 10 ;arr1의 길이가 10이니까

arrSum1:
    add al, [si]
    inc si
    loop arrSum1 ;cx=0일 때까지 돌아간다.
    mov sum1, al

    mov ax, 0 ;a register 초기화
    lea si, arr2 ;주소 초기화

arrSum2:
    add ax, [si]
    add si, 2
    mov bx, [si]
    cmp bx, -1 ;특정 조건 검사 - 마지막 원소인 -1인지를 검사
    loopne arrSum2
    mov sum2, ax

    mov ax, 4c00h
    int 21h
main endp
end main