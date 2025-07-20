?INCLUDE 'chunk_03BAE1'

!player_actor                   09AA

---------------------------------------------

h_thinker_00BF89 [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00BF89 {
    COP [D9] ( #$0AD4, &code_list_00BF91 )
}

code_list_00BF91 [
  &code_00BF99   ;00
  &code_00BFA0   ;01
  &code_00BFA7   ;02
  &code_00BFAE   ;03
]

code_00BF99 {
    COP [37] ( #0B )
    COP [39]
    BRA func_00BFB5
}

code_00BFA0 {
    COP [37] ( #0C )
    COP [39]
    BRA func_00BFB5
}

code_00BFA7 {
    COP [37] ( #23 )
    COP [39]
    BRA func_00BFB5
}

code_00BFAE {
    COP [37] ( #0C )
    COP [39]
    BRA func_00BFB5
}

---------------------------------------------

func_00BFB5 {
    LDA $7F000E, X
    AND #$F7FF
    STA $7F000E, X
    COP [C2]
    PHD 
    LDA #$0000
    TCD 
    LDA $0656
    BIT #$8000
    BEQ code_00BFD2
    JMP $&code_00BFD4
}

code_00BFD2 {
    PLD 
    RTL 
}

code_00BFD4 {
    JSL $@func_03F0CA
    BCC code_00BFDC
    PLD 
    RTL 
}

code_00BFDC {
    STA $09EE
    LDY $player_actor
    PHP 
    REP #$20
    AND #$00FF
    BEQ code_00BFF2
    DEC 
    BEQ code_00C00C
    DEC 
    BEQ code_00C026
    BRA code_00C040
}

code_00BFF2 {
    LDA $0014, Y
    STA $18
    LDA $0016, Y
    INC 
    STA $1C
    JSR $&sub_00C133
    BEQ code_00C05A
    LDA $0016, X
    SEC 
    SBC $1C
    BMI code_00C05D
    BRA code_00C06A
}

code_00C00C {
    LDA $0014, Y
    STA $18
    LDA $0016, Y
    DEC 
    STA $1C
    JSR $&sub_00C133
    BEQ code_00C05A
    LDA $1C
    SEC 
    SBC $0016, X
    BMI code_00C05D
    BRA code_00C06A
}

code_00C026 {
    LDA $0014, Y
    DEC 
    STA $18
    LDA $0016, Y
    STA $1C
    JSR $&sub_00C133
    BEQ code_00C05A
    LDA $18
    SEC 
    SBC $0014, X
    BMI code_00C05D
    BRA code_00C06A
}

code_00C040 {
    LDA $0014, Y
    INC 
    STA $18
    LDA $0016, Y
    STA $1C
    JSR $&sub_00C133
    BEQ code_00C05A
    LDA $0014, X
    SEC 
    SBC $18
    BMI code_00C05D
    BRA code_00C06A
}

code_00C05A {
    PLP 
    PLD 
    RTL 
}

code_00C05D {
    LDA $7F000A, X
    BNE code_00C066
    JMP $&code_00C0DE
}

code_00C066 {
    TXA 
    TCD 
    BRA code_00C07F
}

code_00C06A {
    LDA #$8000
    TSB $0658
    LDA $7F000A, X
    BEQ code_00C0EA
    TXA 
    TCD 
    LDA $12
    BIT #$0200
    BEQ code_00C097
}

code_00C07F {
    SEP #$20
    PHK 
    PEA $&code_00C0DE-1
    LDA $02
    PHA 
    REP #$20
    LDA $7F000A, X
    DEC 
    PHA 
    LDA #$8000
    TSB $0658
    RTL 
}

code_00C097 {
    SEP #$20
    LDA #$7E
    STA $0404
    LDY #$3410
    LDA #$00
    STA $0405
    REP #$20
    LDA #$002F
    JSR $0402
    TDC 
    TAX 
    SEP #$20
    LDA #$7F
    STA $0405
    REP #$20
    LDA #$002F
    JSR $0402
    TDC 
    TAX 
    JSR $&sub_00C182
    STA $28
    STZ $2A
    JSL $@func_03CA55
    SEP #$20
    PHK 
    PEA $&func_00C0ED-1
    LDA $02
    PHA 
    REP #$20
    LDA $7F000A, X
    DEC 
    PHA 
    RTL 
}

code_00C0DE {
    LDA #$8000
    TRB $0656
    LDA #$8000
    TSB $0658
}

code_00C0EA {
    PLP 
    PLD 
    RTL 
}

---------------------------------------------

func_00C0ED {
    TXY 
    LDA $06
    PHA 
    SEP #$20
    LDA #$7E
    STA $0405
    LDX #$3410
    LDA #$00
    STA $0404
    REP #$20
    LDA #$002F
    JSR $0402
    TDC 
    TAY 
    SEP #$20
    LDA #$7F
    STA $0404
    REP #$20
    LDA #$002F
    JSR $0402
    TDC 
    TAX 
    LDA $06
    BNE code_00C123
    LDA $01, S
    STA $06
}

code_00C123 {
    PLA 
    LDA #$8000
    TRB $0656
    LDA #$8000
    TSB $0658
    PLP 
    PLD 
    RTL 
}

---------------------------------------------

sub_00C133 {
    LDA #$0020
    STA $02
    STZ $00
    STZ $04
    LDA $0056
    BRA code_00C144

  code_00C141:
    LDA $0006, X
}

code_00C144 {
    TAX 
    BEQ code_00C17F
    LDA $0010, X
    BIT #$1000
    BEQ code_00C141
    LDA $0014, X
    SEC 
    SBC $18
    BPL code_00C15B
    EOR #$FFFF
    INC 
}

code_00C15B {
    CMP #$0010
    BCS code_00C141
    STA $00
    LDA $0016, X
    SEC 
    SBC $1C
    BPL code_00C16E
    EOR #$FFFF
    INC 
}

code_00C16E {
    CMP #$0010
    BCS code_00C141
    ADC $00
    CMP $02
    BCS code_00C141
    STA $02
    STX $04
    BRA code_00C141
}

code_00C17F {
    LDX $04
    RTS 
}

---------------------------------------------

sub_00C182 {
    LDA $09EE
    AND #$00FF
    BIT #$0002
    BNE code_00C193
    INC 
    AND #$0001
    BRA code_00C199
}

code_00C193 {
    INC 
    AND #$0001
    INC 
    INC 
}

code_00C199 {
    STA $09EE
    LDA $28
    DEC 
    DEC 
    AND #$FFF8
    INC 
    INC 
    CLC 
    ADC $09EE
    RTS 
}