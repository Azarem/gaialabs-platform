?INCLUDE 'chunk_03BAE1'

!player_actor                   09AA

---------------------------------------------

e_actor_00E155 {
    COP [C6] ( &e_actor_00E155 )
    COP [C2]
    COP [40] ( #$0031, &code_00E162 )

  code_00E161:
    RTL 
}

code_00E162 {
    COP [21] ( #0F, &code_00E168 )
    RTL 
}

code_00E168 {
    COP [2A] ( #$000F, &code_00E1DF, &code_00E172, &code_00E1DF )
}

code_00E172 {
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_00E1B1
    BPL code_00E183
    EOR #$FFFF
    INC 
}

code_00E183 {
    LSR 
    STA $7F0010, X
    JSL $@func_03F0CA
    CMP #$0000
    BNE code_00E1AF
    COP [C1]
    LDY $04
    LDA $0016, Y
    SEC 
    SBC #$0002
    STA $0016, Y
    STA $16
    LDA $7F0010, X
    BEQ code_00E1AF
    DEC 
    STA $7F0010, X
    BEQ code_00E1AF
    RTL 
}

code_00E1AF {
    COP [C5]
}

code_00E1B1 {
    LSR 
    STA $7F0010, X
    JSL $@func_03F0CA
    CMP #$0001
    BNE code_00E1DD
    COP [C1]
    LDY $04
    LDA $0016, Y
    CLC 
    ADC #$0002
    STA $0016, Y
    STA $16
    LDA $7F0010, X
    BEQ code_00E1DD
    DEC 
    STA $7F0010, X
    BEQ code_00E1DD
    RTL 
}

code_00E1DD {
    COP [C5]
}

code_00E1DF {
    COP [2B] ( #$000F, &code_00E161, &code_00E1E9, &code_00E161 )
}

code_00E1E9 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_00E228
    BPL code_00E1FA
    EOR #$FFFF
    INC 
}

code_00E1FA {
    LSR 
    STA $7F0010, X
    JSL $@func_03F0CA
    CMP #$0003
    BNE code_00E226
    COP [C1]
    LDY $04
    LDA $0014, Y
    SEC 
    SBC #$0002
    STA $0014, Y
    STA $14
    LDA $7F0010, X
    BEQ code_00E226
    DEC 
    STA $7F0010, X
    BEQ code_00E226
    RTL 
}

code_00E226 {
    COP [C5]
}

code_00E228 {
    LSR 
    STA $7F0010, X
    JSL $@func_03F0CA
    CMP #$0002
    BNE code_00E254
    COP [C1]
    LDY $04
    LDA $0014, Y
    CLC 
    ADC #$0002
    STA $0014, Y
    STA $14
    LDA $7F0010, X
    BEQ code_00E254
    DEC 
    STA $7F0010, X
    BEQ code_00E254
    RTL 
}

code_00E254 {
    COP [C5]
}