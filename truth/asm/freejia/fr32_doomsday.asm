

---------------------------------------------

h_fr32_doomsday [
  h_actor < #35, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_doomsday {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05BE66 )
    COP [C1]
    RTL 
}

code_05BE66 {
    COP [BF] ( &widestring_05BE6B )
    RTL 
}

widestring_05BE6B `[DEF][LU2:38]a [LU1:95][LU1:C2][LU1:EF][N][LU1:79][LU1:8E]above... Then [N]mankind [LU1:EF]die out. [FIN]I [LU1:82][LU1:A4]who made[N]the prediction, but it's[N]all a lie! I do this[N]to forget.[END]`