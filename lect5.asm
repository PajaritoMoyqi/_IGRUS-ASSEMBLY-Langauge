.model small ;메모리 모델을 "small"로 지정. 어셈블러에게 작성되는 프로그램의 코드와 데이터의 크기를 알려주기 위해 쓴다.
.stack 100h ;스택의 크기는 100byte를 사용할 것을 알려준다.
.data ;데이터 세그먼트
stdInfo db '12345678 Pajarito', '$'
; 기능코드 9번인 문자열 출력 루틴은 문자열 마지막을 나타내기 위해 '$' 기호를 넣어줄 것을 지시한다.

.code ;코드 세그먼트
    main proc ;main 프로시저의 코드 작성 시작
    mov ax, @data
    mov ds, ax ;DS register에 데이터 세그먼트의 시작주소를 초기화한다.

    lea dx, stdInfo ;문자열 시작주소를 DX register에 적재한다.
    mov ah, 9h ;문자열 출력해주세요.
    int 21h ;ah register에 담긴 값을 ISR(인터럽트 서비스 루틴)에 알려준다.

    mov ax, 4c00h
    int 21h
main endp

end main