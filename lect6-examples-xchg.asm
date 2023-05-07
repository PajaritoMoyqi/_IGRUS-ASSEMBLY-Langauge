.data
byte1 db 12h
byte2 db 34h

; ...

    mov ax, 0abcdh
    xchg ah, byte1 ;데이터 교환
    xchg al, byte2 ;ax=1234h