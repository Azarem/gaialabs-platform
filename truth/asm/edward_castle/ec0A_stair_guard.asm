

---------------------------------------------

h_ec0A_stair_guard [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_stair_guard {
    COP [0B]
    COP [D0] ( #21, #01, &code_04C32A )
    COP [C0] ( &code_04C336 )
    COP [D2] ( #19, #01 )
    COP [0C]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [85] ( #21, #02, #13 )
    COP [8A]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_04C32A {
    COP [C0] ( &code_04C346 )
    LDA #$0200
    TSB $12
    COP [C1]
    RTL 
}

code_04C336 {
    COP [D0] ( #19, #01, &code_04C341 )
    COP [BF] ( &widestring_04C34B )
    RTL 
}

code_04C341 {
    COP [BF] ( &widestring_04C379 )
    RTL 
}

code_04C346 {
    COP [BF] ( &widestring_04C3B4 )
    RTL 
}

widestring_04C34B `[DEF][LU1:27][LU1:11]is having[N]breakfast. [LU2:42]a while,[N][LU2:B6]enter.[END]`

widestring_04C379 `[DEF]The interview room is[N][LU1:74][LU2:C7]Climb the[N]stairs to [LU2:87]the king.[END]`

widestring_04C3B4 `[DEF]Zzzzzz...Zzzzzz...[END]`