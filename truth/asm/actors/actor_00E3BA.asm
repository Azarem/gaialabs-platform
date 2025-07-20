?INCLUDE 'chunk_03BAE1'

!player_actor                   09AA

---------------------------------------------

e_actor_00E3BA {
    COP [C6] ( &e_actor_00E3BA )
    COP [C2]
    COP [40] ( #$0031, &code_00E3D3 )
    LDY $04
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16

  code_00E3D2:
    RTL 
}

code_00E3D3 {
    COP [21] ( #0F, &code_00E3D9 )
    RTL 
}

code_00E3D9 {
    COP [2A] ( #$000F, &code_00E45A, &code_00E3E3, &code_00E45A )
}

code_00E3E3 {
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_00E427
    BPL code_00E3F4
    EOR #$FFFF
    INC 
}

code_00E3F4 {
    CMP #$0020
    BCC code_00E425
    LDA $0028, Y
    CMP #$003A
    BNE code_00E425
    JSL $@func_03F0CA
    CMP #$0000
    BNE code_00E425
    COP [14] ( #00, #FF, &code_00E425 )
    COP [BC] ( #00, #F0 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0016, Y
    DEC 
    STA $0016, Y
    COP [CB]
}

code_00E425 {
    COP [C5]
}

code_00E427 {
    CMP #$0020
    BCC code_00E458
    LDA $0028, Y
    CMP #$003B
    BNE code_00E458
    JSL $@func_03F0CA
    CMP #$0001
    BNE code_00E458
    COP [14] ( #00, #01, &code_00E458 )
    COP [BC] ( #00, #10 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0016, Y
    INC 
    STA $0016, Y
    COP [CB]
}

code_00E458 {
    COP [C5]
}

code_00E45A {
    COP [2B] ( #$000F, &code_00E3D2, &code_00E464, &code_00E3D2 )
}

code_00E464 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_00E4A8
    BPL code_00E475
    EOR #$FFFF
    INC 
}

code_00E475 {
    CMP #$0020
    BCC code_00E4A6
    LDA $0028, Y
    CMP #$003D
    BNE code_00E4A6
    JSL $@func_03F0CA
    CMP #$0003
    BNE code_00E4A6
    COP [14] ( #FF, #00, &code_00E4A6 )
    COP [BC] ( #F0, #00 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0014, Y
    DEC 
    STA $0014, Y
    COP [CB]
}

code_00E4A6 {
    COP [C5]
}

code_00E4A8 {
    CMP #$0020
    BCC code_00E4D9
    LDA $0028, Y
    CMP #$003C
    BNE code_00E4D9
    JSL $@func_03F0CA
    CMP #$0002
    BNE code_00E4D9
    COP [14] ( #01, #00, &code_00E4D9 )
    COP [BC] ( #10, #00 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0014, Y
    INC 
    STA $0014, Y
    COP [CB]
}

code_00E4D9 {
    COP [C5]
}