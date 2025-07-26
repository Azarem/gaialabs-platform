
?INCLUDE 'sFE_proc_03A940'

!joypad_mask_std                065A
!M7SEL                          211A
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_s59_actor_03A0AA [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_s59_actor_03A0AA {
    LDA #$FFF0
    TSB $joypad_mask_std
    SEP #$20
    STZ $M7SEL
    LDA #$01
    STA $_TS
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
    COP [99] ( @code_03A120 )
    LDA $06BE
    CLC 
    ADC #$0080
    STA $14
    COP [8D] ( #04 )

  code_03A0E7:
    COP [C1]
    COP [8B]
    LDA $08
    STA $24
    STZ $08
    COP [C1]
    LDA $06C2
    CLC 
    ADC #$00B4
    STA $16
    COP [D0] ( #01, #01, &code_03A109 )
    DEC $24
    BMI code_03A107
    RTL 
}

code_03A107 {
    BRA code_03A0E7
}

code_03A109 {
    COP [C2]
    COP [CA] ( #1E )
    COP [C1]
    COP [8B]
    LDA $06C2
    CLC 
    ADC #$00B4
    STA $16
    COP [CB]
    COP [C1]
    RTL 
}

code_03A120 {
    LDA #$0800
    TSB $10
    LDA #$0258
    STA $24
    LDA $06BE
    CLC 
    ADC #$0080
    STA $00CA
    LDA #$0200
    STA $00B6
    LDA #$0032
    STA $00B8
    STZ $00BC
    COP [C1]
    LDA $06C2
    SEC 
    SBC #$0002
    STA $06C2
    AND #$03FF
    CLC 
    ADC #$0070
    STA $00CC
    DEC $24
    BMI code_03A15E
    RTL 
}

code_03A15E {
    COP [CC] ( #01 )
    COP [CA] ( #3C )
    LDA $06C2
    SEC 
    SBC #$0002
    STA $06C2
    AND #$03FF
    CLC 
    ADC #$0070
    STA $00CC
    COP [CB]
    COP [9C] ( @code_03A1E9, #$2000 )
    COP [63] ( #00, #05, #00 )
    COP [C1]
    COP [64]
    LDA $7F002E, X
    CLC 
    ADC $00B8
    STA $00B8
    CMP #$0500
    BCS code_03A1AF
    LDA $06C2
    SEC 
    SBC #$0002
    STA $06C2
    AND #$03FF
    CLC 
    ADC #$0070
    STA $00CC
    RTL 
}

code_03A1AF {
    LDA #$0001
    STA $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #58, #$0000, #$0000, #80, #$1100 )
    COP [C1]
    COP [64]
    LDA $7F002E, X
    CLC 
    ADC $00B8
    STA $00B8
    LDA $06C2
    SEC 
    SBC #$0002
    STA $06C2
    AND #$03FF
    CLC 
    ADC #$0070
    STA $00CC
    RTL 
}

code_03A1E9 {
    COP [CA] ( #06 )
    COP [23]
    AND #$001C
    STA $08
    COP [07] ( #15 )
    COP [CB]
    COP [E0]
}