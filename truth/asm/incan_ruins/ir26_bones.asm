
---------------------------------------------

h_ir26_bones [
  h_actor < #2E, #01, #10 >   ;00
]

---------------------------------------------

e_ir26_bones {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_09C7A9 )
    COP [C1]
    RTL 
}

code_09C7A9 {
    COP [BF] ( &widestring_09C7AE )
    RTL 
}

widestring_09C7AE `[DEF][TPL:0]An [LU1:8A]who sought [N]the Incan [LU1:19]Ship...? [FIN]In the skeleton's hand[N]is [LU1:D0]kind of charm.[FIN][PAU:28]Inside it is a scrap of[N]paper [LU1:F0]this[N][LU2:C3]on it.[FIN][PAL:0][SFX:0]Father, [LU2:8E][LU1:79][N][LU1:73]alive. [N]               Nana  [FIN][LU1:61]you [LU1:90]the [LU1:19][N]Ship, buy a Kruk.[N]                 Sabas [END]`