
?INCLUDE 'chunk_03BAE1'

!player_actor                   09AA

---------------------------------------------

e_actor_00E256 {
    COP [C6] ( &e_actor_00E256 )
    COP [C2]
    COP [40] ( #$0031, &code_00E263 )

  code_00E262:
    RTL 
}

code_00E263 {
    COP [21] ( #0F, &code_00E269 )
    RTL 
}

code_00E269 {
    LDY $04
    LDA $0010, Y
    BIT #$0080
    BEQ code_00E27F
    LDA $0012, Y
    BIT #$0010
    BNE code_00E27F
    NOP 
    NOP 
    NOP 
    RTL 
}

code_00E27F {
    COP [2A] ( #$000F, &code_00E30C, &code_00E289, &code_00E30C )
}

code_00E289 {
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_00E2D3
    BPL code_00E29A
    EOR #$FFFF
    INC 
}

code_00E29A {
    CMP #$0020
    BCC code_00E2D1
    JSL $@func_03F0CA
    CMP #$0000
    BNE code_00E2D1
    COP [14] ( #00, #FF, &code_00E2D1 )
    COP [0C]
    LDA $16
    SEC 
    SBC #$0010
    STA $16
    COP [0B]
    COP [07] ( #2C )
    JSR $&sub_00E399
    COP [CA] ( #10 )
    LDY $04
    LDA $0016, Y
    DEC 
    STA $0016, Y
    COP [CB]
    JSR $&sub_00E3AC
}

code_00E2D1 {
    COP [C5]
}

code_00E2D3 {
    CMP #$0020
    BCC code_00E30A
    JSL $@func_03F0CA
    CMP #$0001
    BNE code_00E30A
    COP [14] ( #00, #01, &code_00E30A )
    COP [0C]
    LDA $16
    CLC 
    ADC #$0010
    STA $16
    COP [0B]
    COP [07] ( #2C )
    JSR $&sub_00E399
    COP [CA] ( #10 )
    LDY $04
    LDA $0016, Y
    INC 
    STA $0016, Y
    COP [CB]
    JSR $&sub_00E3AC
}

code_00E30A {
    COP [C5]
}

code_00E30C {
    COP [2B] ( #$000F, &code_00E262, &code_00E316, &code_00E262 )
}

code_00E316 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_00E360
    BPL code_00E327
    EOR #$FFFF
    INC 
}

code_00E327 {
    CMP #$0020
    BCC code_00E35E
    JSL $@func_03F0CA
    CMP #$0003
    BNE code_00E35E
    COP [14] ( #FF, #00, &code_00E35E )
    COP [0C]
    LDA $14
    SEC 
    SBC #$0010
    STA $14
    COP [0B]
    COP [07] ( #2C )
    JSR $&sub_00E399
    COP [CA] ( #10 )
    LDY $04
    LDA $0014, Y
    DEC 
    STA $0014, Y
    COP [CB]
    JSR $&sub_00E3AC
}

code_00E35E {
    COP [C5]
}

code_00E360 {
    CMP #$0020
    BCC code_00E397
    JSL $@func_03F0CA
    CMP #$0002
    BNE code_00E397
    COP [14] ( #01, #00, &code_00E397 )
    COP [0C]
    LDA $14
    CLC 
    ADC #$0010
    STA $14
    COP [0B]
    COP [07] ( #2C )
    JSR $&sub_00E399
    COP [CA] ( #10 )
    LDY $04
    LDA $0014, Y
    INC 
    STA $0014, Y
    COP [CB]
    JSR $&sub_00E3AC
}

code_00E397 {
    COP [C5]
}

---------------------------------------------

sub_00E399 {
    LDY $04
    LDA $0012, Y
    PHA 
    ORA #$0010
    STA $0012, Y
    PLA 
    AND #$0010
    STA $24
    RTS 
}

---------------------------------------------

sub_00E3AC {
    LDY $04
    LDA $0012, Y
    AND #$FFEF
    ORA $24
    STA $0012, Y
    RTS 
}