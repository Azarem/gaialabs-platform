
!player_flags                   09AE

---------------------------------------------

func_00CFAE {
    LDA #$1000
    TSB $12
    STZ $26
    COP [CA] ( #78 )
    LDA $player_flags
    BIT #$0100
    BNE code_00CFE0
    LDA $06C4
    SEC 
    SBC $26
    STA $06C4
    COP [23]
    AND #$0003
    STA $26
    PHA 
    CLC 
    ADC $06C2
    STA $06C2
    PLA 
    CLC 
    ADC $06C4
    STA $06C4
}

code_00CFE0 {
    COP [CB]
    COP [C2]
    LDA $06C4
    SEC 
    SBC $26
    STA $06C4
    COP [E0]
}