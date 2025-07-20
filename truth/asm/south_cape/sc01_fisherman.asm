?INCLUDE 'hidden_red_jewel'

!player_y_pos                   09A4

---------------------------------------------

h_sc01_fisherman [
  h_actor < #22, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_fisherman {
    LDA #$0200
    TSB $12
    COP [23]
    CMP #$00F8
    BCS code_0483AA
    CMP #$00C8
    BCS code_048393
    COP [C0] ( &code_0483E7 )
    COP [25] ( #06, #2F )
    COP [0B]
    COP [BC] ( #04, #00 )
    BRA code_0483D0
}

code_048393 {
    COP [C0] ( &code_0483EC )
    COP [25] ( #0B, #33 )
    COP [BB]
    LDA #$0002
    TSB $12
    COP [0B]
    COP [BC] ( #FC, #00 )
    BRA code_0483D0
}

code_0483AA {
    COP [D0] ( #D7, #01, &code_048393 )
    COP [C0] ( &code_0483F1 )
    COP [25] ( #29, #30 )
    COP [9E] ( @e_sc01_pot, #$FFF0, #$0000, #$1000 )
    COP [BB]
    LDA #$0002
    TSB $12
    COP [0B]
    COP [BC] ( #FC, #FE )
}

code_0483D0 {
    COP [C1]
    COP [80] ( #22 )
    COP [89]
    LDA $player_y_pos
    CMP #$0250
    BCC code_0483E3
    COP [CC] ( #00 )
    RTL 
}

code_0483E3 {
    COP [CE] ( #00 )
    RTL 
}

code_0483E7 {
    COP [BF] ( &widestring_0483F6 )
    RTL 
}

code_0483EC {
    COP [BF] ( &widestring_04840F )
    RTL 
}

code_0483F1 {
    COP [BF] ( &widestring_048436 )
    RTL 
}

widestring_0483F6 `[DEF]Gosh.[N]I [LU1:78]pull it up...[END]`

widestring_04840F `[DEF][LU1:12]if I [LU1:B5]to[N][LU1:6E]place[N]I [LU1:78]pull it up...[END]`

widestring_048436 `[DEF]He lifted the[N][LU1:C7]teapot.[END]`

---------------------------------------------

e_sc01_pot {
    LDA #$0200
    TSB $12
    COP [80] ( #3E )
    COP [89]
    COP [0B]
    COP [C0] ( &code_048462 )
    COP [C1]
    RTL 
}

code_048462 {
    COP [D0] ( #D7, #01, &code_048474 )
    COP [D4] ( #01, &code_048475 )
    COP [BF] ( &widestring_048479 )
    COP [CC] ( #D7 )
}

code_048474 {
    RTL 
}

code_048475 {
    JML $@code_00C6A1
}

widestring_048479 `[DLG:3,11][SIZ:D,3][LU1:67]found[N]a Red Jewel![END]`