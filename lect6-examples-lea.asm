.data
datatbl db 25 dup(?)
bytefld db ?

.code
    ...
    lea bx, datatbl
    mov bytefld, [bx]