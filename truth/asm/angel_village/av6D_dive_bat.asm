
?INCLUDE 'func_0AA43F'

!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_av6D_dive_bat [
  h_actor < #0F, #00, #00 >   ;00
]

---------------------------------------------

e_av6D_dive_bat {
    COP [57] ( @code_0AEF2E )
    LDA #$2000
    TSB $12
    COP [5B] ( #$0020 )
    BRA code_0AEEB6
}

---------------------------------------------

code_0AEEB2 {
    COP [68] ( &code_0AEEE3 )
}

code_0AEEB6 {
    COP [27] ( #0F )
    COP [80] ( #0F )
    COP [89]
    LDA $16
    STA $26
    LDA $player_y_pos
    SEC 
    SBC $16
    BPL code_0AEECB
    RTL 
}

code_0AEECB {
    CMP #$0100
    BCC code_0AEED1
    RTL 
}

code_0AEED1 {
    LDA $player_x_pos
    SEC 
    SBC $14
    BPL code_0AEEDD
    EOR #$FFFF
    INC 
}

code_0AEEDD {
    CMP #$0040
    BCC code_0AEEE3
    RTL 
}

code_0AEEE3 {
    COP [2A] ( #$0000, &code_0AEEED, &code_0AEEED, &code_0AEEF2 )
}

code_0AEEED {
    COP [8D] ( #11 )
    BRA code_0AEEFA
}

code_0AEEF2 {
    COP [8D] ( #91 )
    LDA #$4000
    TSB $12
}

code_0AEEFA {
    COP [63] ( #04, #09, #00 )

  code_0AEEFF:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    COP [64]
    COP [AA] ( #02 )
    LDA $16
    CMP $26
    BCC code_0AEF1A
    DEC $24
    BMI code_0AEEFF
    RTL 
}

code_0AEF1A {
    LDA #$4000
    TRB $12
    STZ $2C
    LDA #$0000
    STA $7F002E, X
    LDA $26
    STA $16
    BRA code_0AEEB2
}

code_0AEF2E {
    COP [C7] ( @func_0AA43F )
}