.data
bytea db 22h
      db 35h ;22 35
      ;앞에 bytea와 같은 참조값이 없을 뿐이지, 이렇게 해도 저장은 된다.
      ;참조하고 싶을 때는 bytea+1로 하면 될 터다.
      ;"bytea db 22h, 35h"와 기능은 같음
worda dw 2672h ;72 26
;현재 메모리 상태 - 22 35 72 26

.code
    ; ...
    add bl, byte ptr worda+1 ;bl += bytea ptr worda+1
    ;worda는 little-endian 방식으로 저장되어 72, 26 순서이므로 여기선 worda+1이 26을 가리킨다.
    ;하지만 크기가 word 크기로 되어 있기 때문에(dw) 그걸 byte로 변환해주고자 byte ptr을 해주었다.
    mov byte ptr worda, 05 ;05는 크기가 몇인지 모른다. byte 데이터인지 word 데이터인지 모른다.
    ;word 크기라면 0005로 인식되고, byte 크기라면 05로 저장될 것이다.
    ;크기가 불분명하여 명시해주게 된 것이다. "05는 byte 크기를 갖습니다!"
    mov ax, word ptr bytea ;byte 크기의 데이터를 word에 load하여야 하므로
    ;ax에는 22 35를 참조해서 넣어버린다.
    ;그런데 메모리상에는 하위 byte에서 상위 byte 순으로 저장하다 보니 ax에는 3522h가 저장된다
    call far ptr [bx] ;근거리 주소와 원거리 주소를 배우고 나중에 합시다.
