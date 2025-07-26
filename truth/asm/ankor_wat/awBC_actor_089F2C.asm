
?INCLUDE 'sp5D_fountain'

!camera_bounds_x                06DA
!camera_bounds_y                06DC

---------------------------------------------

h_awBC_actor_089F2C [
  h_actor < #31, #02, #0B >   ;00
]

---------------------------------------------

e_awBC_actor_089F2C {
    COP [9C] ( @code_069502, #$2800 )
    LDA #$FFFF
    STA $24
    STA $26
    COP [C1]
    LDA $14
    BMI code_089F60
    CMP $camera_bounds_x
    BCS code_089F67
    LDA $16
    BMI code_089F6E
    CMP $camera_bounds_y
    BCS code_089F75

  code_089F51:
    LDA $14
    CLC 
    ADC $24
    STA $14
    LDA $16
    CLC 
    ADC $26
    STA $16
    RTL 
}

code_089F60 {
    LDA #$0001
    STA $24
    BRA code_089F51
}

code_089F67 {
    LDA #$FFFF
    STA $24
    BRA code_089F51
}

code_089F6E {
    LDA #$0001
    STA $26
    BRA code_089F51
}

code_089F75 {
    LDA #$FFFF
    STA $26
    BRA code_089F51
}