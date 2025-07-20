?INCLUDE 'actor_00E4DB'

!player_actor                   09AA

---------------------------------------------

h_ec0C_ribber [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_ec0C_ribber {
    COP [27] ( #08 )
    COP [B6] ( #30 )
    COP [C2]

  code_0A8277:
    COP [23]
    STA $7F0010, X
    LDA $7F0012, X
    BMI code_0A82C5
    INC 
    AND #$0003
    STA $7F0012, X
    COP [58] ( &code_0A82B6 )
    COP [21] ( #04, &code_0A82B6 )

  code_0A8294:
    LDA $7F0010, X
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0A82A4 )
}

code_list_0A82A4 [
  &code_0A82E0   ;00
  &code_0A8313   ;01
  &code_0A8346   ;02
  &code_0A8379   ;03
]

---------------------------------------------

func_0A82AC {
    COP [C2]
    COP [23]
    STA $7F0010, X
    BRA code_0A8294
}

code_0A82B6 {
    COP [58] ( #$0000 )
    COP [43]
    LDA #$FFFF
    STA $7F0012, X
    COP [C1]
}

code_0A82C5 {
    COP [2C] ( &code_0A82CB, &code_0A82D5 )
}

code_0A82CB {
    COP [2A] ( #$0008, &code_0A82E0, &code_0A82D5, &code_0A8313 )
}

code_0A82D5 {
    COP [2B] ( #$0008, &code_0A8346, &code_0A82DF, &code_0A8379 )
}

code_0A82DF {
    RTL 
}

code_0A82E0 {
    LDA $7F0010, X
    AND #$0001
    BEQ code_0A82EE
    COP [21] ( #02, &code_0A83AC )
}

code_0A82EE {
    COP [17] ( &func_0A82AC )
    COP [81] ( #07, #12 )
    COP [89]
    LDA $7F0012, X
    BEQ code_0A8301
    JMP $&code_0A8277
}

code_0A8301 {
    COP [CA] ( #02 )
    COP [80] ( #0B )
    COP [89]
    COP [21] ( #04, &code_0A82B6 )
    COP [CB]
    JMP $&code_0A8277
}

code_0A8313 {
    LDA $7F0010, X
    AND #$0001
    BEQ code_0A8321
    COP [21] ( #02, &code_0A83D0 )
}

code_0A8321 {
    COP [18] ( &func_0A82AC )
    COP [81] ( #87, #11 )
    COP [89]
    LDA $7F0012, X
    BEQ code_0A8334
    JMP $&code_0A8277
}

code_0A8334 {
    COP [CA] ( #02 )
    COP [80] ( #8B )
    COP [89]
    COP [21] ( #04, &code_0A82B6 )
    COP [CB]
    JMP $&code_0A8277
}

code_0A8346 {
    LDA $7F0010, X
    AND #$0001
    BEQ code_0A8354
    COP [21] ( #02, &code_0A83F4 )
}

code_0A8354 {
    COP [15] ( &func_0A82AC )
    COP [82] ( #05, #12 )
    COP [89]
    LDA $7F0012, X
    BEQ code_0A8367
    JMP $&code_0A8277
}

code_0A8367 {
    COP [CA] ( #02 )
    COP [80] ( #0A )
    COP [89]
    COP [21] ( #04, &code_0A82B6 )
    COP [CB]
    JMP $&code_0A8277
}

code_0A8379 {
    LDA $7F0010, X
    AND #$0001
    BEQ code_0A8387
    COP [21] ( #02, &code_0A8418 )
}

code_0A8387 {
    COP [16] ( &func_0A82AC )
    COP [82] ( #03, #11 )
    COP [89]
    LDA $7F0012, X
    BEQ code_0A839A
    JMP $&code_0A8277
}

code_0A839A {
    COP [CA] ( #02 )
    COP [80] ( #09 )
    COP [89]
    COP [21] ( #04, &code_0A82B6 )
    COP [CB]
    JMP $&code_0A8277
}

code_0A83AC {
    COP [58] ( #$0000 )
    COP [80] ( #1A )
    COP [89]
    COP [A5] ( @code_0A843E, #F8, #E0, #$0200 )
    COP [B0] ( #04, #00 )
    COP [80] ( #1B )
    COP [89]
    COP [84] ( #02, #20 )
    COP [8A]
    JMP $&code_0A82EE
}

code_0A83D0 {
    COP [58] ( #$0000 )
    COP [80] ( #9A )
    COP [89]
    COP [A5] ( @code_0A843E, #08, #E0, #$0200 )
    COP [B0] ( #03, #00 )
    COP [80] ( #9B )
    COP [89]
    COP [84] ( #82, #20 )
    COP [8A]
    JMP $&code_0A8321
}

code_0A83F4 {
    COP [58] ( #$0000 )
    COP [80] ( #18 )
    COP [89]
    COP [A5] ( @code_0A843E, #00, #D0, #$0200 )
    COP [B0] ( #00, #04 )
    COP [80] ( #19 )
    COP [89]
    COP [84] ( #01, #20 )
    COP [8A]
    JMP $&code_0A8354
}

code_0A8418 {
    COP [58] ( #$0000 )
    COP [80] ( #16 )
    COP [89]
    COP [A5] ( @code_0A843C, #00, #E0, #$0200 )
    COP [B0] ( #00, #03 )
    COP [80] ( #17 )
    COP [89]
    COP [84] ( #00, #20 )
    COP [8A]
    JMP $&code_0A8387
}

code_0A843C {
    COP [B2]
}

code_0A843E {
    COP [5B] ( #$0010 )
    LDA #$0080
    TSB $12
    COP [07] ( #1E )
    COP [84] ( #1C, #02 )
    COP [8A]
    COP [B4]
    COP [84] ( #1C, #02 )
    COP [8A]
    LDA $player_actor
    STA $24
    LDA #$001C
    STA $0028, X
    LDA #$0001
    STA $7F0014, X
    SEP #$20
    LDA #$^e_actor_00E4DB
    PHA 
    REP #$20
    LDA #$&e_actor_00E4DB-1
    PHA 
    RTL 
}