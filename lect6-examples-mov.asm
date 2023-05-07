;레지스터 간 데이터 전송
mov cl, bl
mov ch, bl
mov dx, cx

;레지스터와 세그먼트 레지스터 간 데이터 전송
mov ds, ax
mov bx, es

;피연산자 정의
.data
bytefld db ?
wordfld dw ?

;적재 - 메모리 to 레지스터
mov ch, bytefld
mov cx, wordfld

;저장 - 레지스터 to 메모리
mov bytefld, ch
mov wordfld, cx

;피연산자 정의
.data
sregData1 dw ?
sregData2 dw 1234h

;세그먼트 레지스터와 메모리 간 데이터 전송
mov sregData1, ds
mov es, sregData2