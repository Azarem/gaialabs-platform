?INCLUDE 'chunk_03BAE1'

!WRMPYA                         4202
!WRMPYB                         4203
!RDMPYL                         4216

---------------------------------------------

h_pr8C_proc_03A6BA [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_pr8C_proc_03A6BA {
    PHD 
    LDA #$0000
    TCD 
    LDA $0036
    LSR 
    BCS code_03A6CA
    JMP $&code_03A784
}

code_03A6CA {
    LDA #$0060
    STA $WRMPYA
    LDA #$00E0
    STA $06
    LDA #$001F
    STA $08
    LDA $B6
    LSR 
    STA $0E
    LDA #$0400
    SEC 
    SBC $0E
    ASL 
    STA $0E
    ASL 
    ASL 
    ASL 
    ASL 
    STA $00
    LDX #$001E
    LDA #$E07F
    STA $7E8D02, X
    LDA #$0000
    STA $7E8D04, X

  code_03A6FF:
    STZ $04
    STZ $02
    SEP #$20
    LDA $00
    STA $WRMPYB
    REP #$20
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $RDMPYL
    STA $02
    SEP #$20
    LDA $01
    STA $WRMPYB
    REP #$20
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $RDMPYL
    CLC 
    ADC $03
    STA $03
    SEP #$20
    LDA $04
    BNE code_03A732
    LDA #$01
}

code_03A732 {
    STA $7E8D00, X
    CLC 
    ADC $08
    STA $08
    BCS code_03A76F
    LDA $06
    STA $7E8D01, X
    INC 
    STA $06
    REP #$20
    LDA $00
    SEC 
    SBC $0E
    STA $00
    DEX 
    DEX 
    BPL code_03A6FF
    INX 
    INX 

  code_03A755:
    TXY 
    PLA 
    TCD 
    TAX 
    SEP #$20
    LDA #$32
    XBA 
    LDA #$7E
    REP #$20
    PHA 
    TYA 
    CLC 
    ADC #$8D00
    TAY 
    PLA 
    JSL $@func_03E173
    RTL 
}

code_03A76F {
    LDA $7E8D00, X
    SEC 
    SBC $08
    STA $7E8D00, X
    LDA $06
    STA $7E8D01, X
    REP #$20
    BRA code_03A755
}

code_03A784 {
    LDA #$0060
    STA $WRMPYA
    LDA #$00E0
    STA $06
    LDA #$001F
    STA $08
    LDA $B6
    LSR 
    STA $0E
    LDA #$0400
    SEC 
    SBC $0E
    ASL 
    STA $0E
    ASL 
    ASL 
    ASL 
    ASL 
    STA $00
    LDX #$001E
    LDA #$E07F
    STA $7E8E02, X
    LDA #$0000
    STA $7E8E04, X

  code_03A7B9:
    STZ $04
    STZ $02
    SEP #$20
    LDA $00
    STA $WRMPYB
    REP #$20
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $RDMPYL
    STA $02
    SEP #$20
    LDA $01
    STA $WRMPYB
    REP #$20
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $RDMPYL
    CLC 
    ADC $03
    STA $03
    SEP #$20
    LDA $04
    BNE code_03A7EC
    LDA #$01
}

code_03A7EC {
    STA $7E8E00, X
    CLC 
    ADC $08
    STA $08
    BCS code_03A829
    LDA $06
    STA $7E8E01, X
    INC 
    STA $06
    REP #$20
    LDA $00
    SEC 
    SBC $0E
    STA $00
    DEX 
    DEX 
    BPL code_03A7B9
    INX 
    INX 

  code_03A80F:
    TXY 
    PLA 
    TCD 
    TAX 
    SEP #$20
    LDA #$32
    XBA 
    LDA #$7E
    REP #$20
    PHA 
    TYA 
    CLC 
    ADC #$8E00
    TAY 
    PLA 
    JSL $@func_03E173
    RTL 
}

code_03A829 {
    LDA $7E8E00, X
    SEC 
    SBC $08
    STA $7E8E00, X
    LDA $06
    STA $7E8E01, X
    REP #$20
    BRA code_03A80F
}