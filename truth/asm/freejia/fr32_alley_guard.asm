
!player_x_pos                   09A2
!player_speed_ew                09B2

---------------------------------------------

h_fr32_alley_guard [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_alley_guard {
    COP [C0] ( &code_05B7B6 )

  code_05B7A0:
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    LDA #$FFFB
    STA $player_speed_ew
    COP [DA] ( #1D )
    COP [CE] ( #01 )
    BRA code_05B7A0
}

code_05B7B6 {
    LDA $player_x_pos
    CMP $14
    BCS code_05B7C2
    COP [BF] ( &widestring_05B7CA )
    RTL 
}

code_05B7C2 {
    COP [BF] ( &widestring_05B7E6 )
    COP [CC] ( #01 )
    RTL 
}

widestring_05B7CA `[DEF]Children [LU1:82]come[N][LU2:74]Go home.[END]`

widestring_05B7E6 `[DEF]This kid! [LU1:65]did [N]you [LU1:79]from?! [N]Go [LU2:75]Go home!! [END]`