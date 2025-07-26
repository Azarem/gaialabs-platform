
---------------------------------------------

h_mu5F_cyclops1 [
  h_actor < #00, #10, #01 >   ;00
]

---------------------------------------------

e_mu5F_cyclops1 {
    LDA #$0001
    STA $7F101C, X
    COP [5B] ( #$0008 )
    COP [13] ( &code_0ADDFF )
    COP [BC] ( #F8, #00 )
    COP [0B]

  code_0ADDB6:
    COP [27] ( #08 )
    COP [58] ( &code_0AE101 )
    COP [DA] ( #07 )
    COP [CA] ( #78 )
    COP [21] ( #03, &code_0ADDCD )
    COP [21] ( #06, &code_0ADE50 )
}

code_0ADDCD {
    COP [CB]
    COP [58] ( #$0000 )
    COP [84] ( #01, #02 )
    COP [8A]
    COP [80] ( #03 )
    COP [89]
    LDA #$0110
    TRB $10
    COP [0C]

  code_0ADDE5:
    COP [C6] ( &code_0ADE6C )
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0ADDF7 )
}

code_list_0ADDF7 [
  &func_0ADF29   ;00
  &code_0ADF68   ;01
  &code_0ADFBA   ;02
  &code_0AE008   ;03
]

code_0ADDFF {
    LDA #$2000
    TSB $10
    COP [C1]
    RTL 
}

---------------------------------------------

h_mu5F_cyclops2 [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_mu5F_cyclops2 {
    LDA #$0001
    STA $7F101C, X
    COP [13] ( &code_0ADDFF )
    COP [5B] ( #$0008 )
    LDA #$0010
    TSB $12
    COP [BC] ( #F8, #00 )
    COP [0B]
    COP [58] ( &code_0ADE2C )
    COP [27] ( #08 )
    RTL 
}

code_0ADE2C {
    LDA #$0010
    TSB $10
    LDA #$0010
    TRB $12
    COP [0C]
    BRA code_0ADE50
}

---------------------------------------------

func_0ADE3A {
    COP [80] ( #02 )
    COP [89]
    LDA #$0110
    TSB $10
    COP [0B]
    COP [80] ( #00 )
    COP [89]
    COP [C4] ( @code_0ADDB6 )
}

code_0ADE50 {
    COP [58] ( #$0000 )
    COP [84] ( #01, #02 )
    COP [8A]
    COP [DA] ( #27 )
    COP [80] ( #03 )
    COP [89]
    LDA #$0110
    TRB $10
    COP [0C]

  code_0ADE69:
    COP [27] ( #08 )
}

code_0ADE6C {
    LDA $10
    BIT #$4000
    BNE code_0ADE69
    COP [21] ( #02, &func_0ADE3A )
    COP [2C] ( &code_0ADE7E, &code_0ADE88 )
}

code_0ADE7E {
    COP [2A] ( #$0000, &code_0ADE92, &code_0ADEA5, &code_0ADEA5 )
}

code_0ADE88 {
    COP [2B] ( #$0000, &code_0ADECB, &code_0ADECB, &code_0ADEB8 )
}

code_0ADE92 {
    COP [80] ( #06 )
    COP [89]

  code_0ADE97:
    COP [21] ( #05, &code_0ADEDE )
    COP [C9] ( &func_0ADF29 )
    ASL 
    BCS code_0ADE6C
    BRA code_0ADE97
}

code_0ADEA5 {
    COP [80] ( #86 )
    COP [89]

  code_0ADEAA:
    COP [21] ( #05, &code_0ADEEB )
    COP [C9] ( &code_0ADF68 )
    ASL 
    BCS code_0ADE6C
    BRA code_0ADEAA
}

code_0ADEB8 {
    COP [80] ( #04 )
    COP [89]

  code_0ADEBD:
    COP [21] ( #05, &code_0ADEF9 )
    COP [C9] ( &code_0ADFBA )
    ASL 
    BCS code_0ADE6C
    BRA code_0ADEBD
}

code_0ADECB {
    COP [80] ( #05 )
    COP [89]
    COP [21] ( #05, &code_0ADF07 )
    COP [C9] ( &code_0AE008 )
    ASL 
    BCS code_0ADE6C
    BRA code_0ADECB
}

code_0ADEDE {
    JSR $&sub_0ADF15
    COP [C8] ( &code_0AE0A7 )
    COP [C9] ( &func_0ADF29 )
    BRA code_0ADE6C
}

code_0ADEEB {
    JSR $&sub_0ADF15
    COP [C8] ( &code_0AE0D4 )
    COP [C9] ( &code_0ADF68 )
    JMP $&code_0ADE6C
}

code_0ADEF9 {
    JSR $&sub_0ADF15
    COP [C8] ( &code_0AE047 )
    COP [C9] ( &code_0ADFBA )
    JMP $&code_0ADE6C
}

code_0ADF07 {
    JSR $&sub_0ADF15
    COP [C8] ( &code_0AE074 )
    COP [C9] ( &code_0AE008 )
    JMP $&code_0ADE6C
}

---------------------------------------------

sub_0ADF15 {
    COP [23]
    AND #$0003
    BNE code_0ADF26
    LDA $0B02
    CLC 
    ADC #$0004
    STA $24
    RTS 
}

code_0ADF26 {
    STZ $24
    RTS 
}

---------------------------------------------

func_0ADF29 {
    COP [14] ( #FE, #00, &code_0ADF66 )
    COP [14] ( #FE, #FF, &code_0ADF66 )
    COP [21] ( #03, &code_0ADF5E )
    COP [81] ( #09, #02 )
    COP [89]
    COP [14] ( #FE, #00, &code_0ADF66 )
    COP [14] ( #FE, #FF, &code_0ADF66 )
    COP [81] ( #24, #02 )
    COP [89]
    COP [2A] ( #$0000, &code_0ADF5C, &code_0ADF5C, &code_0ADF64 )
}

code_0ADF5C {
    COP [C5]
}

code_0ADF5E {
    COP [81] ( #09, #02 )
    COP [89]
}

code_0ADF64 {
    COP [E1]
}

code_0ADF66 {
    BRA code_0ADFA5
}

code_0ADF68 {
    COP [14] ( #01, #00, &code_0ADFA5 )
    COP [14] ( #01, #FF, &code_0ADFA5 )
    COP [21] ( #03, &code_0ADF9D )
    COP [81] ( #89, #01 )
    COP [89]
    COP [14] ( #01, #00, &code_0ADFA5 )
    COP [14] ( #01, #FF, &code_0ADFA5 )
    COP [81] ( #A4, #01 )
    COP [89]
    COP [2A] ( #$0000, &code_0ADFA3, &code_0ADF9B, &code_0ADF9B )
}

code_0ADF9B {
    COP [C5]
}

code_0ADF9D {
    COP [81] ( #89, #01 )
    COP [89]
}

code_0ADFA3 {
    COP [E1]
}

code_0ADFA5 {
    COP [C2]
    COP [23]
    AND #$0003
    BEQ code_0ADFB8
    COP [2B] ( #$0000, &code_0AE008, &code_0AE008, &code_0ADFBA )
}

code_0ADFB8 {
    COP [C5]
}

code_0ADFBA {
    COP [16] ( &code_0ADFF3 )
    COP [14] ( #FF, #01, &code_0ADFF3 )
    COP [21] ( #03, &code_0ADFEB )
    COP [82] ( #07, #01 )
    COP [89]
    COP [16] ( &code_0ADFF3 )
    COP [14] ( #FF, #01, &code_0ADFF3 )
    COP [82] ( #22, #01 )
    COP [89]
    COP [2B] ( #$0000, &code_0ADFF1, &code_0ADFE9, &code_0ADFE9 )
}

code_0ADFE9 {
    COP [C5]
}

code_0ADFEB {
    COP [82] ( #07, #01 )
    COP [89]
}

code_0ADFF1 {
    COP [E1]
}

code_0ADFF3 {
    COP [C2]
    COP [23]
    AND #$0003
    BEQ code_0AE006
    COP [2A] ( #$0000, &func_0ADF29, &func_0ADF29, &code_0ADF68 )
}

code_0AE006 {
    COP [C5]
}

code_0AE008 {
    COP [14] ( #00, #FE, &code_0AE045 )
    COP [14] ( #FF, #FE, &code_0AE045 )
    COP [21] ( #03, &code_0AE03D )
    COP [82] ( #08, #02 )
    COP [89]
    COP [14] ( #00, #FE, &code_0AE045 )
    COP [14] ( #FF, #FE, &code_0AE045 )
    COP [82] ( #23, #02 )
    COP [89]
    COP [2B] ( #$0000, &code_0AE03B, &code_0AE03B, &code_0AE043 )
}

code_0AE03B {
    COP [C5]
}

code_0AE03D {
    COP [82] ( #08, #02 )
    COP [89]
}

code_0AE043 {
    COP [E1]
}

code_0AE045 {
    BRA code_0ADFF3
}

code_0AE047 {
    COP [80] ( #0A )
    COP [89]
    COP [9E] ( @code_0AE1DB, #$0000, #$FFF4, #$0202 )
    COP [58] ( &func_0ADE3A )

  code_0AE05B:
    COP [DA] ( #09 )
    DEC $24
    BMI code_0AE0A1
    COP [80] ( #0A )
    COP [89]
    COP [9E] ( @code_0AE1CF, #$0000, #$FFF4, #$0202 )
    BRA code_0AE05B
}

code_0AE074 {
    COP [80] ( #0B )
    COP [89]
    COP [9E] ( @code_0AE1D6, #$0000, #$FFCC, #$0200 )
    COP [58] ( &func_0ADE3A )

  code_0AE088:
    COP [DA] ( #09 )
    DEC $24
    BMI code_0AE0A1
    COP [80] ( #0B )
    COP [89]
    COP [9E] ( @code_0AE1CA, #$0000, #$FFCC, #$0200 )
    BRA code_0AE088
}

code_0AE0A1 {
    COP [58] ( #$0000 )
    COP [C5]
}

code_0AE0A7 {
    COP [80] ( #0C )
    COP [89]
    COP [9E] ( @code_0AE186, #$FFD8, #$FFE8, #$0200 )
    COP [58] ( &func_0ADE3A )

  code_0AE0BB:
    COP [DA] ( #09 )
    DEC $24
    BMI code_0AE0A1
    COP [80] ( #0C )
    COP [89]
    COP [9E] ( @code_0AE17A, #$FFD8, #$FFE8, #$0200 )
    BRA code_0AE0BB
}

code_0AE0D4 {
    COP [80] ( #8C )
    COP [89]
    COP [9E] ( @code_0AE181, #$0028, #$FFE8, #$0200 )
    COP [58] ( &func_0ADE3A )

  code_0AE0E8:
    COP [DA] ( #09 )
    DEC $24
    BMI code_0AE0A1
    COP [80] ( #8C )
    COP [89]
    COP [9E] ( @code_0AE175, #$0028, #$FFE8, #$0200 )
    BRA code_0AE0E8
}

code_0AE101 {
    COP [80] ( #03 )
    COP [89]
    COP [0C]
    LDA #$0110
    TRB $10
    COP [80] ( #2E )
    COP [89]
    COP [07] ( #1E )
    COP [9E] ( @code_0AE22A, #$0000, #$0000, #$0202 )
    COP [9E] ( @code_0AE230, #$0000, #$0000, #$0202 )
    COP [9E] ( @code_0AE236, #$0000, #$0000, #$0202 )
    COP [9E] ( @code_0AE23C, #$0000, #$0000, #$0200 )
    COP [9E] ( @code_0AE242, #$0000, #$0000, #$0202 )
    COP [9E] ( @code_0AE248, #$0000, #$0000, #$0200 )
    COP [9E] ( @code_0AE24E, #$0000, #$0000, #$0202 )
    COP [9E] ( @code_0AE254, #$0000, #$0000, #$0200 )
    COP [80] ( #2F )
    COP [89]
    JMP $&code_0ADDE5
}

code_0AE175 {
    LDA #$4000
    TSB $12
}

code_0AE17A {
    COP [23]
    AND #$0003
    BRA code_0AE189
}

code_0AE181 {
    LDA #$4000
    TSB $12
}

code_0AE186 {
    LDA #$0000
}

code_0AE189 {
    PHA 
    COP [AC] ( #04, #01 )
    LDA #$0080
    TSB $12
    COP [5B] ( #$0010 )
    COP [07] ( #1E )
    PLA 
    STA $0000
    COP [D9] ( #$0000, &code_list_0AE1A4 )
}

code_list_0AE1A4 [
  &code_0AE1AC   ;00
  &code_0AE1B5   ;01
  &code_0AE1BA   ;02
  &code_0AE1AC   ;03
]

code_0AE1AC {
    LDA #$0000
    STA $7F001A, X
    STZ $2E
}

code_0AE1B5 {
    LDA #$2000
    TSB $12
}

code_0AE1BA {
    COP [80] ( #1F )
    COP [89]
    COP [B1]
    LDA $10
    BIT #$4000
    BEQ code_0AE1BA
    COP [E0]
}

code_0AE1CA {
    LDA #$2000
    TSB $12
}

code_0AE1CF {
    COP [23]
    AND #$0003
    BRA code_0AE1DE
}

code_0AE1D6 {
    LDA #$2000
    TSB $12
}

code_0AE1DB {
    LDA #$0000
}

code_0AE1DE {
    PHA 
    COP [AC] ( #02, #03 )
    COP [5B] ( #$0010 )
    LDA #$0080
    TSB $12
    COP [07] ( #1E )
    PLA 
    STA $0000
    COP [D9] ( #$0000, &code_list_0AE1F9 )
}

code_list_0AE1F9 [
  &code_0AE201   ;00
  &code_0AE20F   ;01
  &code_0AE20A   ;02
  &code_0AE201   ;03
]

code_0AE201 {
    LDA #$0000
    STA $7F0018, X
    STZ $2C
}

code_0AE20A {
    LDA #$4000
    TSB $12
}

code_0AE20F {
    COP [84] ( #1F, #03 )
    COP [8A]
    LDA #$0002
    TRB $10

  code_0AE21A:
    COP [B1]
    COP [80] ( #1F )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AE21A
    COP [E0]
}

code_0AE22A {
    COP [AC] ( #04, #00 )
    BRA code_0AE258
}

code_0AE230 {
    COP [AC] ( #03, #00 )
    BRA code_0AE258
}

code_0AE236 {
    COP [AC] ( #00, #03 )
    BRA code_0AE258
}

code_0AE23C {
    COP [AC] ( #00, #04 )
    BRA code_0AE258
}

code_0AE242 {
    COP [AC] ( #02, #01 )
    BRA code_0AE258
}

code_0AE248 {
    COP [AC] ( #02, #02 )
    BRA code_0AE258
}

code_0AE24E {
    COP [AC] ( #01, #01 )
    BRA code_0AE258
}

code_0AE254 {
    COP [AC] ( #01, #02 )
}

code_0AE258 {
    COP [5B] ( #$0010 )
    LDA #$0080
    TSB $12
    COP [84] ( #1F, #02 )
    COP [8A]
    LDA #$0002
    TRB $10
    BRA code_0AE21A
}