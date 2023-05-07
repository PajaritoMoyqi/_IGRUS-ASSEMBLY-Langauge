.model small
.stack 100h
.data
byte1 db 25h ;양수
byte2 db 0f0h ;음수

.code
main proc
    mov ax, @data
    mov ds, ax ;데이터 세그먼트 초기화

    mov ax, 0
    mov bx, 0 ;임의 데이터로 값 초기화

.386
    movzx ax, byte1
    movzx bx, byte2
    movsx ax, byte1
    movsx bx, byte2

    mov ax, 4c00h
    int 21h ;프로세스 종료
main endp
end main