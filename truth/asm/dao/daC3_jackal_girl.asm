
---------------------------------------------

h_daC3_jackal_girl [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_jackal_girl {
    COP [0B]
    COP [C0] ( &code_08ACD1 )
    COP [C1]
    RTL 
}

code_08ACD1 {
    COP [BF] ( &widestring_08ACE0 )
    COP [0A] ( #7F )
    COP [BF] ( &widestring_08AD0C )
    COP [0A] ( #01 )
    RTL 
}

widestring_08ACE0 `[DEF]The [LU2:6C]silently offers[N]one sheet of paper.[FIN]`

widestring_08AD0C `[CLR][DLY:4]There was a picture [N]of a jackal! [FIN][DLY:0][TPL:0]A shiver ran down my [N]spine. It was a warning [N][LU1:8E]the Jackal, who had[N][LU1:70]stalking us....[PAL:0][END]`