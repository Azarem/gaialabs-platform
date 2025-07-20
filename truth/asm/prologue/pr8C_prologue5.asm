?INCLUDE 'pr_actor_0BCF52'
?INCLUDE 'pr_thinkers'
?INCLUDE 'sFE_proc_03A940'

!M7SEL                          211A

---------------------------------------------

h_pr8C_prologue5 [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_pr8C_prologue5 {
    COP [D0] ( #F4, #01, &code_0BCEBB )
    COP [A0] ( @code_0BCF8F, #$0038, #$0038, #$2000 )
    LDA #$&spritestring_0BD272
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    SEP #$20
    STZ $M7SEL
    REP #$20
    COP [3C] ( @code_03A985 )
    TXA 
    TYX 
    TAY 
    LDA #$0804
    STA $7F000E, X
    TXA 
    TYX 
    TAY 
    COP [9A] ( @code_0BCEBD, #$2800 )
    COP [C1]
    RTL 
}

code_0BCEBB {
    COP [E0]
}

code_0BCEBD {
    LDA #$0200
    STA $00B6
    LDA #$0020
    STA $00B8
    STZ $00BC
    LDA #$0280
    STA $06BE
    LDA #$0300
    STA $06C2
    LDA #$0300
    STA $00CA
    LDA #$0380
    STA $00CC
    COP [C1]
    LDA $06C2
    CMP #$0040
    BEQ code_0BCF00
    SEC 
    SBC #$0002
    STA $06C2
    AND #$03FF
    CLC 
    ADC #$0080
    STA $00CC
    RTL 
}

code_0BCF00 {
    COP [C1]
    LDA $06C2
    CMP #$FFD8
    BEQ code_0BCF1F
    SEC 
    SBC #$0001
    STA $06C2
    AND #$03FF
    CLC 
    ADC #$0080
    STA $00CC
    DEC $00B6
    RTL 
}

code_0BCF1F {
    COP [DA] ( #3B )
    COP [CA] ( #82 )
    DEC $00B6
    COP [CB]
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [CA] ( #64 )
    DEC $00B6
    COP [CB]
    LDA #$0008
    STA $064A
    COP [26] ( #FC, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    DEC $00B6
    BEQ code_0BCF4F
    RTL 
}

code_0BCF4F {
    COP [C1]
    RTL 
}

---------------------------------------------

spritestring_0BD272 ~No one thought[N]these ruins would[N]bring about[N]disaster...~