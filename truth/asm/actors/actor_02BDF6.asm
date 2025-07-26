
---------------------------------------------

e_actor_02BDF6 {
    COP [8D] ( #05 )
    BRA code_02BDFE
}

---------------------------------------------

e_actor_02BDFB {
    COP [8D] ( #06 )
}

code_02BDFE {
    JSR $&sub_02BE55

  code_02BE01:
    COP [8B]
    LDA $2A
    BEQ code_02BE01
    LDA $08
    STZ $08
    STA $26

  code_02BE0D:
    COP [C2]
    LDY $04
    JSR $&sub_02BE1A
    DEC $26
    BPL code_02BE0D
    BRA code_02BE01
}

---------------------------------------------

sub_02BE1A {
    LDA $7F0000, X
    STA $14
    LDA $7F0002, X
    STA $7F0000, X
    LDA $7F000E, X
    STA $7F0002, X
    LDA $0014, Y
    STA $7F000E, X
    LDA $7F0018, X
    STA $16
    LDA $7F001A, X
    STA $7F0018, X
    LDA $7F0004, X
    STA $7F001A, X
    LDA $0016, Y
    STA $7F0004, X
    RTS 
}

---------------------------------------------

sub_02BE55 {
    LDA $14
    STA $7F0000, X
    STA $7F0002, X
    STA $7F000E, X
    LDA $16
    STA $7F0018, X
    STA $7F001A, X
    STA $7F0004, X
    RTS 
}