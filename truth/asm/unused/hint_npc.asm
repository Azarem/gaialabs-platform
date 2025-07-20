

---------------------------------------------

h_hint_npc1 [
  h_actor < #05, #00, #30 >   ;00
]

---------------------------------------------

e_hint_npc1 {
    LDA $0E
    STA $26
    LDA #$2000
    STA $0E
    BRA code_09A0F9
}

---------------------------------------------

h_hint_npc2 [
  h_actor < #05, #00, #30 >   ;00
]

---------------------------------------------

e_hint_npc2 {
    LDA $0E
    STA $26
    LDA #$2000
    STA $0E
    COP [8D] ( #85 )
    LDA #$0002
    TSB $12
}

code_09A0F9 {
    COP [BC] ( #F8, #00 )
    COP [9E] ( @code_09A38D, #$0000, #$FFD0, #$1800 )
    COP [9E] ( @code_09A3A0, #$0000, #$FFD0, #$1800 )
    COP [BC] ( #F8, #01 )
    COP [C0] ( &code_09A123 )
    LDA #$0000
    STA $24
    COP [C1]
    RTL 
}

code_09A123 {
    LDA #$FFFF
    STA $24
    LDA $26
    STA $0000
    COP [D9] ( #$0000, &code_list_09A133 )
}

code_list_09A133 [
  &code_09A149   ;00
  &code_09A14F   ;01
  &code_09A155   ;02
  &code_09A15B   ;03
  &code_09A161   ;04
  &code_09A167   ;05
  &code_09A16D   ;06
  &code_09A173   ;07
]

---------------------------------------------

func_09A143 {
    LDA #$0000
    STA $24
    RTL 
}

code_09A149 {
    COP [BF] ( &widestring_09A179 )
    BRA func_09A143
}

code_09A14F {
    COP [BF] ( &widestring_09A17B )
    BRA func_09A143
}

code_09A155 {
    COP [BF] ( &widestring_09A1F0 )
    BRA func_09A143
}

code_09A15B {
    COP [BF] ( &widestring_09A240 )
    BRA func_09A143
}

code_09A161 {
    COP [BF] ( &widestring_09A28A )
    BRA func_09A143
}

code_09A167 {
    COP [BF] ( &widestring_09A2CB )
    BRA func_09A143
}

code_09A16D {
    COP [BF] ( &widestring_09A319 )
    BRA func_09A143
}

code_09A173 {
    COP [BF] ( &widestring_09A355 )
    BRA func_09A143
}

widestring_09A179 `[DEF][END]`

widestring_09A17B `[DEF]Defeat the enemies[N]in a certain area to get[N]an increase in attack [N][LU1:C2]and a jewel.[FIN]You [LU1:B2]defeat all of[N]the demons...[END]`

widestring_09A1F0 `[DEF][LU1:22][LU1:EF]appear if [N]you defeat an enemy. [N]If you [LU1:78]reach [LU1:E6][N]use the Flute's power. [END]`

widestring_09A240 `[DEF]You [LU1:BA]DP to use the[N][LU1:C]Power...[FIN][LU1:68]DP increases as you[N]collect [LU1:C]Jewels...[END]`

widestring_09A28A `[DEF]You [LU1:BA]to jump to[N]continue, but you must[N]stop once in a while...[END]`

widestring_09A2CB `[DEF]There are [LU1:B6]cracks in [N]the Pyramid. He who [N][LU1:AA]down on the block [N][LU2:65][LU1:EF]sink...[END]`

widestring_09A319 `[DEF]This is a fight to the[N]finish. Act [LU1:74]you[N]are acted upon...[END]`

widestring_09A355 `[DEF]The stalks are connected[N]by the [LU1:C2]of the[N][LU2:C0]droplets...[END]`

code_09A38D {
    COP [8D] ( #05 )
    COP [DA] ( #3B )
    COP [80] ( #05 )
    COP [89]
    COP [C1]
    COP [80] ( #06 )
    COP [89]
    RTL 
}

code_09A3A0 {
    COP [8D] ( #07 )

  code_09A3A3:
    COP [C1]
    LDY $24
    LDA $0024, Y
    BNE code_09A3AD
    RTL 
}

code_09A3AD {
    LDA $06F8
    BNE code_09A3B3
    RTL 
}

code_09A3B3 {
    COP [23]
    AND #$0003
    DEC 
    BEQ code_09A3C9
    DEC 
    BEQ code_09A3D4
    COP [80] ( #07 )
    COP [89]
    COP [C1]
    COP [8B]
    BRA code_09A3A3
}

code_09A3C9 {
    COP [80] ( #08 )
    COP [89]
    COP [C1]
    COP [8B]
    BRA code_09A3A3
}

code_09A3D4 {
    COP [80] ( #09 )
    COP [89]
    COP [C1]
    COP [8B]
    BRA code_09A3A3
}