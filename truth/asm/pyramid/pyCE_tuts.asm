
!player_actor                   09AA

---------------------------------------------

h_pyCE_tuts [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_pyCE_tuts {
    LDA #$0180
    TSB $12
    LDA #$1010
    STA $20
    LDA #$0428
    STA $22
    COP [A2] ( @code_0BC529, #$2000 )

  code_0BC3B6:
    COP [27] ( #07 )

  code_0BC3B9:
    LDA $10
    BIT #$4000
    BNE code_0BC3B6
    COP [21] ( #04, &code_0BC4B1 )
    COP [2C] ( &code_0BC3CB, &code_0BC417 )
}

code_0BC3CB {
    COP [2A] ( #$0000, &code_0BC3D5, &code_0BC3D5, &code_0BC3F6 )
}

code_0BC3D5 {
    COP [CA] ( #02 )
    COP [17] ( &code_0BC465 )
    COP [81] ( #05, #02 )
    COP [89]
    COP [17] ( &code_0BC465 )
    COP [81] ( #15, #02 )
    COP [89]
    COP [2C] ( &code_0BC3F2, &code_0BC417 )
}

code_0BC3F2 {
    COP [CB]
    BRA code_0BC3B9
}

code_0BC3F6 {
    COP [CA] ( #03 )
    COP [18] ( &code_0BC465 )
    COP [81] ( #85, #01 )
    COP [89]
    COP [18] ( &code_0BC465 )
    COP [81] ( #95, #01 )
    COP [89]
    COP [2C] ( &code_0BC413, &code_0BC417 )
}

code_0BC413 {
    COP [CB]
    BRA code_0BC3B9
}

code_0BC417 {
    COP [2B] ( #$0000, &code_0BC421, &code_0BC421, &code_0BC443 )
}

code_0BC421 {
    COP [CA] ( #03 )
    COP [15] ( &code_0BC465 )
    COP [82] ( #04, #02 )
    COP [89]
    COP [15] ( &code_0BC465 )
    COP [82] ( #14, #02 )
    COP [89]
    COP [2C] ( &code_0BC3CB, &code_0BC43E )
}

code_0BC43E {
    COP [CB]
    JMP $&code_0BC3B9
}

code_0BC443 {
    COP [CA] ( #03 )
    COP [16] ( &code_0BC465 )
    COP [82] ( #03, #01 )
    COP [89]
    COP [16] ( &code_0BC465 )
    COP [82] ( #13, #01 )
    COP [89]
    COP [2C] ( &code_0BC3CB, &code_0BC460 )
}

code_0BC460 {
    COP [CB]
    JMP $&code_0BC3B9
}

code_0BC465 {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BC475 )
}

code_list_0BC475 [
  &code_0BC47D   ;00
  &code_0BC48A   ;01
  &code_0BC497   ;02
  &code_0BC4A4   ;03
]

code_0BC47D {
    COP [17] ( &code_0BC465 )
    COP [81] ( #05, #02 )
    COP [89]
    JMP $&code_0BC3B9
}

code_0BC48A {
    COP [18] ( &code_0BC465 )
    COP [81] ( #95, #01 )
    COP [89]
    JMP $&code_0BC3B9
}

code_0BC497 {
    COP [15] ( &code_0BC465 )
    COP [82] ( #14, #02 )
    COP [89]
    JMP $&code_0BC3B9
}

code_0BC4A4 {
    COP [16] ( &code_0BC465 )
    COP [82] ( #13, #01 )
    COP [89]
    JMP $&code_0BC3B9
}

code_0BC4B1 {
    COP [C2]
    COP [35]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BC4C1 )
}

code_list_0BC4C1 [
  &code_0BC497   ;00
  &code_0BC4F9   ;01
  &code_0BC4A4   ;02
  &code_0BC4C9   ;03
]

code_0BC4C9 {
    COP [80] ( #06 )
    COP [89]
    COP [80] ( #10 )
    COP [89]
    LDA $14
    CLC 
    ADC #$FFD0
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$0008
    TSB $10
    COP [22] ( #11, #03 )
    LDA #$0008
    TRB $10
    COP [80] ( #12 )
    COP [89]
    JMP $&code_0BC3B9
}

code_0BC4F9 {
    COP [80] ( #86 )
    COP [89]
    COP [80] ( #90 )
    COP [89]
    LDA $14
    CLC 
    ADC #$0030
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$0008
    TSB $10
    COP [22] ( #91, #03 )
    LDA #$0008
    TRB $10
    COP [80] ( #92 )
    COP [89]
    JMP $&code_0BC3B9
}

code_0BC529 {
    LDY $24
    LDA $0010, Y
    AND #$FFEF
    STA $0010, Y
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDY $player_actor
    LDA $0010, Y
    BIT #$0140
    BEQ code_0BC54A
    RTL 
}

code_0BC54A {
    LDY $24
    LDA $0028, Y
    AND #$000F
    CMP #$0006
    BCC code_0BC558
    RTL 
}

code_0BC558 {
    STA $0000
    COP [D9] ( #$0000, &code_list_0BC561 )
}

code_list_0BC561 [
  &code_0BC56D   ;00
  &code_0BC575   ;01
  &code_0BC57D   ;02
  &code_0BC56D   ;03
  &code_0BC575   ;04
  &code_0BC57D   ;05
]

code_0BC56D {
    COP [35]
    CMP #$0002
    BEQ code_0BC597
    RTL 
}

code_0BC575 {
    COP [35]
    CMP #$0000
    BEQ code_0BC597
    RTL 
}

code_0BC57D {
    LDY $24
    LDA $000E, Y
    BIT #$4000
    BNE code_0BC58F
    COP [35]
    CMP #$0003
    BEQ code_0BC597
    RTL 
}

code_0BC58F {
    COP [35]
    CMP #$0001
    BEQ code_0BC597
    RTL 
}

code_0BC597 {
    LDY $24
    LDA $0010, Y
    ORA #$0010
    STA $0010, Y
    RTL 
}