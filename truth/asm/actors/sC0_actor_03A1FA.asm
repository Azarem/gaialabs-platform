?INCLUDE 'sFE_proc_03A940'
?INCLUDE 'thinker_00B7D6'

!joypad_mask_std                065A
!INIDISP                        2100
!M7SEL                          211A
!_TM                            212C
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_sC0_actor_03A1FA [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sC0_actor_03A1FA {
    LDA #$FFF0
    TSB $joypad_mask_std
    SEP #$20
    STZ $M7SEL
    LDA #$01
    STA $_TM
    STA $CGADSUB
    LDA #$82
    STA $CGWSEL
    REP #$20
    COP [3C] ( @code_03A985 )
    PHX 
    TYX 
    LDA #$0804
    STA $7F000E, X
    PLX 
    COP [99] ( @code_03A22E )
    COP [C1]
    RTL 
}

code_03A22E {
    LDA #$0800
    TSB $10
    LDA #$0170
    STA $06BE
    LDA #$01D0
    STA $06C2
    LDA #$01F0
    STA $00CA
    LDA #$0250
    STA $00CC
    LDA #$001C
    STA $00B8
    LDA #$0130
    STA $00BC
    COP [3C] ( @e_thinker_00B7D6 )
    COP [C1]
    INC $00BC
    LDA $0036
    AND #$0001
    BEQ code_03A26A
    RTL 
}

code_03A26A {
    LDA $00B8
    CMP #$0080
    BEQ code_03A277
    INC 
    STA $00B8
    RTL 
}

code_03A277 {
    COP [C1]
    LDA $00BC
    AND #$01FF
    BEQ code_03A285
    INC $00BC
    RTL 
}

code_03A285 {
    COP [DA] ( #77 )
    COP [C1]
    LDA $00B8
    CMP #$0060
    BEQ code_03A2A6
    DEC 
    STA $00B8
    INC $00B6
    INC $06C2
    INC $06C2
    INC $00CC
    INC $00CC
    RTL 
}

code_03A2A6 {
    COP [CA] ( #FF )
    DEC $06C2
    DEC $00CC
    COP [CB]
    COP [CA] ( #80 )
    DEC $06C2
    DEC $00CC
    COP [CB]
    COP [CA] ( #7F )
    DEC $06C2
    DEC $00CC
    LDA $7F0014, X
    AND #$0078
    LSR 
    LSR 
    LSR 
    SEP #$20
    STA $INIDISP
    REP #$20
    COP [CB]
    COP [26] ( #BF, #$00F8, #$00C0, #00, #$2200 )
    LDA #$0001
    STA $0648
    LDA #$0400
    STA $064A
    COP [C1]
    RTL 
}