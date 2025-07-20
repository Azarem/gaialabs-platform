

---------------------------------------------

head_07A08C [
  h_actor < #22, #00, #10 >   ;00
]

---------------------------------------------

func_07A08F {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_07A0A2 )
    COP [C1]
    COP [80] ( #22 )
    COP [89]
    RTL 
}

code_07A0A2 {
    COP [BF] ( &widestring_07A0A7 )
    RTL 
}

widestring_07A0A7 `[DEF]A crazy old man [LU1:80][N][LU2:73]two [LU2:C6]ago. He [N][LU1:A3]talked on [LU1:6B][N]the Tower of Babel. [END]`