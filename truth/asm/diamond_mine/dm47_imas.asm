
?INCLUDE 'dm_actor_05D49E'

---------------------------------------------

h_dm47_imas [
  h_actor < #28, #00, #10 >   ;00
]

---------------------------------------------

e_dm47_imas {
    COP [D0] ( #5E, #01, &dm47_imas_destroy )
    COP [9C] ( @e_dm_actor_05D49E, #$0100 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D0BF )
    COP [0B]
    COP [C1]
    LDY $06
    LDA $0010, Y
    BIT #$0040
    BNE code_05D0B6
    RTL 
}

code_05D0B6 {
    COP [C0] ( &code_05D0C4 )
    COP [C1]
    RTL 
}

dm47_imas_destroy {
    COP [E0]
}

code_05D0BF {
    COP [BF] ( &widestring_05D0C9 )
    RTL 
}

code_05D0C4 {
    COP [BF] ( &widestring_05D0E3 )
    RTL 
}

widestring_05D0C9 `[DEF][TPL:5]Imas:[N]Cut the chain![PAL:0][END]`

widestring_05D0E3 `[DEF][TPL:5]Imas: Thank [LU2:C7][N]All [LU1:B1][LU1:E0]in our [N][LU2:72]country [LU1:98][N]grown strange. [FIN][LU1:3D][LU1:98][LU2:B3]to [N]stone. Some are sick [N][LU1:F0]unknown diseases...[PAL:0][END]`