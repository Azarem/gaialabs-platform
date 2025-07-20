?INCLUDE 'table_0EE000'


---------------------------------------------

h_ec0D_canal_worm [
  h_actor < #22, #08, #20 >   ;00
]

---------------------------------------------

e_ec0D_canal_worm {
    LDA #$0011
    TSB $12

  code_0A8008:
    COP [27] ( #18 )
    LDA #$2000
    TSB $10
    COP [DA] ( #77 )
    LDA #$2000
    TRB $10
    COP [A2] ( @code_0A8264, #$0301 )
    LDA #$2000
    TSB $10
    COP [DA] ( #3F )
    LDA #$2000
    TRB $10
    COP [80] ( #22 )
    COP [89]
    COP [A2] ( @code_0A825C, #$0301 )
    COP [30] ( #00, #F0, #04, &code_0A80D1 )
    COP [80] ( #23 )
    COP [89]
    COP [30] ( #00, #F0, #05, &code_0A80EC )
    COP [80] ( #24 )
    COP [89]
    COP [30] ( #00, #F0, #06, &code_0A8107 )
    COP [80] ( #25 )
    COP [89]
    COP [30] ( #00, #F0, #07, &code_0A8122 )
    COP [80] ( #26 )
    COP [89]
    COP [30] ( #00, #F0, #00, &code_0A813D )
    COP [80] ( #27 )
    COP [89]
    COP [30] ( #00, #F0, #01, &code_0A8158 )
    COP [80] ( #28 )
    COP [89]
    COP [30] ( #00, #F0, #02, &code_0A8173 )
    COP [80] ( #29 )
    COP [89]
    COP [30] ( #00, #F0, #03, &code_0A818E )
    COP [80] ( #2A )
    COP [89]
    JMP $&code_0A80C3
}

---------------------------------------------

func_0A809B {
    COP [80] ( #23 )
    COP [89]

  code_0A80A0:
    COP [80] ( #24 )
    COP [89]

  code_0A80A5:
    COP [80] ( #25 )
    COP [89]

  code_0A80AA:
    COP [80] ( #26 )
    COP [89]

  code_0A80AF:
    COP [80] ( #27 )
    COP [89]

  code_0A80B4:
    COP [80] ( #A8 )
    COP [89]

  code_0A80B9:
    COP [80] ( #A9 )
    COP [89]

  code_0A80BE:
    COP [80] ( #AA )
    COP [89]
}

code_0A80C3 {
    COP [84] ( #2B, #04 )
    COP [8A]
    COP [80] ( #35 )
    COP [89]
    JMP $&code_0A8008
}

code_0A80D1 {
    COP [80] ( #2B )
    COP [89]
    COP [A5] ( @code_0A81A9, #00, #D8, #$0202 )
    COP [B0] ( #00, #03 )
    COP [84] ( #2B, #02 )
    COP [8A]
    JMP $&code_0A80A0
}

code_0A80EC {
    COP [80] ( #2C )
    COP [89]
    COP [A5] ( @code_0A81A9, #FC, #D8, #$0202 )
    COP [B0] ( #04, #03 )
    COP [84] ( #2C, #02 )
    COP [8A]
    JMP $&code_0A80A5
}

code_0A8107 {
    COP [80] ( #2D )
    COP [89]
    COP [A5] ( @code_0A81A9, #F8, #D8, #$0202 )
    COP [B0] ( #04, #00 )
    COP [84] ( #2D, #02 )
    COP [8A]
    JMP $&code_0A80AA
}

code_0A8122 {
    COP [80] ( #2E )
    COP [89]
    COP [A5] ( @code_0A81A9, #FC, #D8, #$0200 )
    COP [B0] ( #04, #04 )
    COP [84] ( #2E, #02 )
    COP [8A]
    JMP $&code_0A80AF
}

code_0A813D {
    COP [80] ( #2F )
    COP [89]
    COP [A5] ( @code_0A81A9, #00, #D8, #$0200 )
    COP [B0] ( #00, #04 )
    COP [84] ( #2F, #02 )
    COP [8A]
    JMP $&code_0A80B4
}

code_0A8158 {
    COP [80] ( #B0 )
    COP [89]
    COP [A5] ( @code_0A81A9, #04, #D8, #$0200 )
    COP [B0] ( #03, #04 )
    COP [84] ( #B0, #02 )
    COP [8A]
    JMP $&code_0A80B9
}

code_0A8173 {
    COP [80] ( #B1 )
    COP [89]
    COP [A5] ( @code_0A81A9, #08, #D8, #$0202 )
    COP [B0] ( #03, #00 )
    COP [84] ( #B1, #02 )
    COP [8A]
    JMP $&code_0A80BE
}

code_0A818E {
    COP [80] ( #B2 )
    COP [89]
    COP [A5] ( @code_0A81A9, #04, #D8, #$0202 )
    COP [B0] ( #03, #03 )
    COP [84] ( #B2, #02 )
    COP [8A]
    JMP $&code_0A80C3
}

code_0A81A9 {
    LDA #$0080
    TSB $12
    COP [A5] ( @code_0A8250, #00, #00, #$0300 )
    LDA $0010, Y
    ORA $10
    STA $0010, Y
    COP [5B] ( #$0010 )
    COP [A2] ( @func_0A822B, #$2200 )
    LDA #$0002
    JSR $&sub_0A8200
    COP [A2] ( @func_0A822B, #$2200 )
    LDA #$0003
    JSR $&sub_0A8200
    COP [88] ( @table_0EE000 )
    COP [B6] ( #30 )
    COP [07] ( #1E )
    COP [84] ( #08, #02 )
    COP [8A]
    COP [B4]

  code_0A81F0:
    COP [B1]
    COP [80] ( #08 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A81F0
    COP [E0]
}

---------------------------------------------

sub_0A8200 {
    STA $0008, Y
    LDA $0010, Y
    ORA $10
    STA $0010, Y
    LDA $2C
    STA $002C, Y
    LDA $2E
    STA $002E, Y
    PHX 
    LDA $7F0018, X
    PHA 
    LDA $7F001A, X
    TYX 
    STA $7F001A, X
    PLA 
    STA $7F0018, X
    PLX 
    RTS 
}

---------------------------------------------

func_0A822B {
    LDA #$2000
    TRB $10
    COP [B6] ( #30 )
    COP [88] ( @table_0EE000 )
    COP [84] ( #26, #02 )
    COP [8A]
    COP [B4]

  code_0A8240:
    COP [B1]
    COP [80] ( #26 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8240
    COP [E0]
}

code_0A8250 {
    COP [88] ( @table_0EE000 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0A825C {
    COP [84] ( #34, #09 )
    COP [8A]
    COP [E0]
}

code_0A8264 {
    COP [84] ( #33, #06 )
    COP [8A]
    COP [E0]
}