
?INCLUDE 'func_09BB17'

!map_bounds_x                   0692

---------------------------------------------

h_pyD7_actor_08C4EA [
  h_actor < #1D, #01, #03 >   ;00
]

---------------------------------------------

e_pyD7_actor_08C4EA {
    LDA #$0001
    STA $24

  code_08C4F2:
    COP [28] ( #$0378, #$04A0, &code_08C4FC )
    BRA code_08C504
}

code_08C4FC {
    LDA $24
    EOR #$FFFF
    INC 
    STA $24
}

code_08C504 {
    COP [BC] ( #00, #FE )
    LDA $0E
    XBA 
    STA $7F0010, X
    LDA #$2000
    STA $0E
    JSL $@func_09BB17

  code_08C518:
    COP [80] ( #1D )
    COP [89]
    COP [C1]
    COP [21] ( #01, &code_08C525 )
    RTL 
}

code_08C525 {
    COP [80] ( #1E )
    COP [89]
    COP [08] ( #$2C2C )
    JSR $&sub_08C58A
    COP [C8] ( &code_08C549 )
    COP [C2]
    JSL $@func_09BB17
    COP [08] ( #$1515 )
    COP [C1]
    COP [21] ( #01, &code_08C548 )
    BRA code_08C518
}

code_08C548 {
    RTL 
}

code_08C549 {
    LDA $7F0010, X
    STA $26
    LDA $24
    BPL code_08C564
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    DEC 
    STA $0026, Y
    DEC $26
    BEQ code_08C575
    RTL 
}

code_08C564 {
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    INC 
    STA $0026, Y
    DEC $26
    BEQ code_08C575
    RTL 
}

code_08C575 {
    LDA $24
    EOR #$FFFF
    INC 
    STA $24
    COP [C5]
}

---------------------------------------------

h_pyD7_actor_08C57F [
  h_actor < #1D, #01, #03 >   ;00
]

---------------------------------------------

e_pyD7_actor_08C57F {
    LDA #$FFFF
    STA $24
    JMP $&code_08C4F2
}

---------------------------------------------

sub_08C58A {
    PHX 
    PHP 
    SEP #$20
    LDX #$0000
    LDA $0697
    DEC 
    STA $000E

  code_08C598:
    LDY #$000F

  code_08C59B:
    LDA #$0F
    STA $7FC103, X
    STA $7FC20C, X
    REP #$20
    TXA 
    CLC 
    ADC #$0010
    TAX 
    SEP #$20
    DEY 
    BPL code_08C59B
    DEC $000E
    BMI code_08C5C7
    REP #$20
    TXA 
    CLC 
    ADC $map_bounds_x
    CLC 
    ADC #$FF00
    TAX 
    SEP #$20
    BRA code_08C598
}

code_08C5C7 {
    PLP 
    PLX 
    RTS 
}