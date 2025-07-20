?INCLUDE 'sFE_proc_03A940'
?INCLUDE 'pr_actor_0BCF52'
?INCLUDE 'pr_thinkers'

!M7SEL                          211A

---------------------------------------------

h_pr8C_prologue1 [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_pr8C_prologue1 {
    LDA #$0800
    STA $064A
    COP [D0] ( #F4, #00, &code_0BCAAF )
    COP [A0] ( @code_0BCAB1, #$016E, #$03E8, #$1800 )
    COP [DA] ( #00 )
    COP [A0] ( @code_0BCAB1, #$0166, #$041A, #$1800 )
    COP [DA] ( #02 )
    COP [A0] ( @code_0BCAB1, #$01A4, #$03F0, #$1800 )
    COP [DA] ( #00 )
    COP [A0] ( @code_0BCAB1, #$01A0, #$040C, #$1800 )
    COP [DA] ( #04 )
    COP [A0] ( @code_0BCAB1, #$01D2, #$03FC, #$1800 )
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
    COP [9A] ( @code_0BCABF, #$2800 )
    COP [A0] ( @code_0BCF8F, #$0038, #$0030, #$2000 )
    LDA #$&spritestring_0BD044
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [DB] ( #$01DF )
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [DA] ( #77 )
    COP [A0] ( @code_0BCF8F, #$003C, #$0020, #$2000 )
    LDA #$&spritestring_0BD06D
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [C1]
    RTL 
}

code_0BCAAF {
    COP [E0]
}

code_0BCAB1 {
    COP [81] ( #8B, #11 )
    COP [89]
    COP [D0] ( #01, #00, &code_0BCAB1 )
    COP [E0]
}

code_0BCABF {
    LDA #$03FC
    STA $24
    LDA #$0000
    STA $06BE
    LDA #$0360
    STA $06C2
    LDA #$0080
    STA $00CA
    LDA #$03E0
    STA $00CC
    LDA #$0280
    STA $00B6
    LDA #$0020
    STA $00B8
    STZ $00BC
    COP [C1]
    LDA $06BE
    INC 
    AND #$03FF
    STA $06BE
    CLC 
    ADC #$0080
    STA $00CA
    DEC $24
    BMI code_0BCB03
    RTL 
}

code_0BCB03 {
    COP [CC] ( #01 )
    COP [C1]
    INC $00BC
    DEC $00B6
    LDA $00B6
    CMP #$0180
    BEQ code_0BCB1C
    CMP #$00D0
    BEQ code_0BCB22
    RTL 
}

code_0BCB1C {
    COP [3C] ( @e_pr_thinker_0BD039 )
    RTL 
}

code_0BCB22 {
    COP [CE] ( #F4 )
    LDA #$0808
    STA $064A
    COP [CF] ( #$017C )
    COP [CF] ( #$017D )
    COP [CF] ( #$017E )
    COP [CF] ( #$017F )
    COP [26] ( #8D, #$0000, #$0000, #00, #$4400 )
    COP [C1]
    DEC $00B6
    INC $00BC
    RTL 
}

---------------------------------------------

spritestring_0BD044 ~The world was in[N]an age of [N]exploration.~

---------------------------------------------

spritestring_0BD06D ~Looking for new[N]lands,[N]man uncovered the[N]relics of ancient[N]cultures.~