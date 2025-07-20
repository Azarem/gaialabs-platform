
!effect_bounds_x                0694
!effect_bounds_y                0698

---------------------------------------------

h_dm41_actor_0AA4E2 [
  h_actor < #34, #02, #10 >   ;00
]

---------------------------------------------

e_dm41_actor_0AA4E2 {
    LDA #$0002
    STA $7F0018, X
    LDA #$0001
    STA $7F001A, X
    BRA code_0AA51D
}

---------------------------------------------

h_dm41_actor_0AA4F5 [
  h_actor < #34, #02, #10 >   ;00
]

---------------------------------------------

e_dm41_actor_0AA4F5 {
    COP [BC] ( #05, #00 )
    LDA #$0000
    STA $7F0018, X
    LDA #$0001
    STA $7F001A, X
    BRA code_0AA51D
}

---------------------------------------------

h_dm41_actor_0AA50C [
  h_actor < #34, #02, #10 >   ;00
]

---------------------------------------------

e_dm41_actor_0AA50C {
    LDA #$0001
    STA $7F0018, X
    LDA #$0000
    STA $7F001A, X
}

code_0AA51D {
    LDA $14
    STA $7F0010, X
    LDA $16
    STA $7F0012, X
    COP [C1]
    LDA $7F0010, X
    CLC 
    ADC $7F0018, X
    STA $7F0010, X
    SEC 
    SBC $06C0
    CLC 
    ADC $06BE
    STA $14
    LDA $7F0012, X
    CLC 
    ADC $7F001A, X
    STA $7F0012, X
    SEC 
    SBC $06C4
    CLC 
    ADC $06C2
    STA $16
    LDA $14
    BMI code_0AA56C
    CMP $effect_bounds_x
    BCS code_0AA589
    LDA $16
    BMI code_0AA56C
    CMP $effect_bounds_y
    BCS code_0AA589
    RTL 
}

code_0AA56C {
    LDA $7F0018, X
    BPL code_0AA57A
    EOR #$FFFF
    INC 
    STA $7F0018, X
}

code_0AA57A {
    LDA $7F001A, X
    BPL code_0AA588
    EOR #$FFFF
    INC 
    STA $7F001A, X
}

code_0AA588 {
    RTL 
}

code_0AA589 {
    LDA $7F0018, X
    BMI code_0AA597
    EOR #$FFFF
    INC 
    STA $7F0018, X
}

code_0AA597 {
    LDA $7F001A, X
    BMI code_0AA5A5
    EOR #$FFFF
    INC 
    STA $7F001A, X
}

code_0AA5A5 {
    RTL 
}