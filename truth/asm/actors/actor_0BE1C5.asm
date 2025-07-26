
?INCLUDE 'chunk_008000'
?INCLUDE 'chunk_03BAE1'

---------------------------------------------

h_actor_0BE1C5 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_actor_0BE1C5 {
    LDA $0654
    BNE code_0BE1CE
    RTL 
}

code_0BE1CE {
    BPL code_0BE1D1
    RTL 
}

code_0BE1D1 {
    LDA #$0085
    STA $24
    LDY #$8000
    BRA code_0BE1DE
}

---------------------------------------------

func_0BE1DB {
    LDY #$0000
}

code_0BE1DE {
    SEP #$20
    LDA $24
    PHA 
    PLB 
    REP #$20
    BRA code_0BE1EB
    REP #$20
    PLA 
}

code_0BE1EB {
    LDA #$BF02
    CMP $0000, Y
    BEQ code_0BE204
    INY 
    BNE code_0BE1EB
    LDA $24
    INC 
    STA $24
    CMP #$000C
    BNE func_0BE1DB

  code_0BE200:
    NOP 
    NOP 
    BRA code_0BE200
}

code_0BE204 {
    LDA $0002, Y
    INY 
    JSR $&sub_0BE22E
    BCS code_0BE1EB
    PHA 
    PHB 
    TYA 
    STA $0100
    LDA $01, S
    STA $0102
    PLB 
    PLA 
    INY 
    INY 
    INY 
    PHY 
    TAY 
    SEP #$20
    JSL $@func_00817D
    REP #$20
    JSL $@sub_03E255
    PLY 
    BRA code_0BE1EB
}

---------------------------------------------

sub_0BE22E {
    CMP #$8000
    BCC code_0BE235
    CLC 
    RTS 
}

code_0BE235 {
    SEC 
    RTS 
}