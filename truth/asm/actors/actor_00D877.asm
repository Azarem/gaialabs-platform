?INCLUDE 'func_00DB8A'
?INCLUDE 'player_character'
?INCLUDE 'table_01B086'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

e_actor_00D877 {
    LDA $7F002A, X
    BIT #$0020
    BNE code_00D885
    LDA #$0008
    TSB $10
}

code_00D885 {
    LDA #$0008
    TSB $12
    LDA $12
    BIT #$0010
    BNE code_00D8C6
    PHX 
    LDY $24
    LDA $0014, Y
    STA $7F0010, X
    STA $14
    LDA $0016, Y
    STA $7F0012, X
    STA $16
    TYX 
    LDA $7F101C, X
    PLX 
    STA $7F101C, X
    LDA $0028, X
    CMP #$0004
    BCS code_00D8C6
    PEA $&func_00D904-1
    DEC 
    BMI code_00D8D6
    DEC 
    BMI code_00D8E0
    DEC 
    BMI code_00D8ED
    BRA code_00D8FA
}

code_00D8C6 {
    COP [DA] ( #0F )
    LDA $10
    BIT #$0400
    BEQ code_00D8D3
    JMP $&func_00D9EB
}

code_00D8D3 {
    JMP $&code_00D988
}

code_00D8D6 {
    LDA #$6000
    TRB $12
    SEC 
    JSR $&sub_00DA47
    RTS 
}

code_00D8E0 {
    LDA #$6000
    TRB $12
    COP [AF] ( #01 )
    SEC 
    JSR $&sub_00DA47
    RTS 
}

code_00D8ED {
    LDA #$6000
    TRB $12
    COP [AF] ( #01 )
    CLC 
    JSR $&sub_00DA47
    RTS 
}

code_00D8FA {
    LDA #$6000
    TRB $12
    CLC 
    JSR $&sub_00DA47
    RTS 
}

---------------------------------------------

func_00D904 {
    COP [C2]
    COP [CA] ( #10 )
    LDY $24
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    COP [CB]
    LDA $10
    BIT #$0400
    BEQ code_00D921
    JMP $&func_00D9EB
}

code_00D921 {
    LDA $10
    BIT #$0008
    BEQ code_00D988
    LDA $26
    BNE code_00D95B
    LDA $7F0012, X
    SEC 
    SBC $16
    BEQ code_00D988
    BPL code_00D93B
    EOR #$FFFF
    INC 
}

code_00D93B {
    BIT #$000F
    BNE code_00D945
    JSR $&sub_00DA13
    BCC code_00D988
}

code_00D945 {
    LDX $24
    LDA $002C, X
    BNE code_00D94F
    STZ $0008, X
}

code_00D94F {
    LDA #$0000
    STA $002E, X
    STA $7F002E, X
    BRA code_00D98A
}

code_00D95B {
    LDA $7F0010, X
    SEC 
    SBC $14
    BEQ code_00D988
    BPL code_00D96A
    EOR #$FFFF
    INC 
}

code_00D96A {
    BIT #$000F
    BNE code_00D974
    JSR $&sub_00DA13
    BCC code_00D988
}

code_00D974 {
    LDX $24
    LDA $002E, X
    BNE code_00D97E
    STZ $0008, X
}

code_00D97E {
    LDA #$0000
    STA $002C, X
    STA $7F002C, X
}

code_00D988 {
    LDX $24
}

code_00D98A {
    LDA $7F0026, X
    BNE code_00D9D0
    LDA $0010, X
    BIT #$0040
    BNE code_00D9E7
    ORA #$0040
    STA $0010, X
    LDA $7F1004, X
    BEQ code_00D9BC
    STA $0000, X
    LDA $7F1006, X
    STA $0002, X
    LDA #$0000
    STA $0008, X
    STA $002C, X
    STA $002E, X
    BRA code_00D9E7
}

code_00D9BC {
    LDA #$*func_00DB8A
    STA $0002, X
    LDA #$&func_00DB8A
    STA $0000, X
    LDA #$0000
    STA $0008, X
    BRA code_00D9E7
}

code_00D9D0 {
    LDA $7F1000, X
    BEQ code_00D9E0
    STA $0000, X
    LDA #$0000
    STA $7F1000, X
}

code_00D9E0 {
    LDA #$FFF4
    STA $7F0028, X
}

code_00D9E7 {
    TDC 
    TAX 
    COP [E0]
}

---------------------------------------------

func_00D9EB {
    PHX 
    LDX $player_actor
    LDA $player_flags
    BIT #$0A00
    BNE code_00DA03
    LDA #$*code_02C3C8
    STA $0002, X
    LDA #$&code_02C3C8
    STA $0000, X
}

code_00DA03 {
    LDA #$FFE2
    STA $7F0028, X
    PLX 
    LDA #$0F00
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

sub_00DA13 {
    STA $0000
    PEA $&sub_00DA41-1
    LDA $7F101C, X
    BNE code_00DA26
    LDA $0000
    CMP #$0030
    RTS 
}

code_00DA26 {
    DEC 
    BNE code_00DA30
    LDA $0000
    CMP #$0020
    RTS 
}

code_00DA30 {
    DEC 
    BNE code_00DA3A
    LDA $0000
    CMP #$0040
    RTS 
}

code_00DA3A {
    LDA $0000
    CMP #$0040
    RTS 
}

---------------------------------------------

sub_00DA41 {
    CLC 
    BNE code_00DA45
    RTS 
}

code_00DA45 {
    SEC 
    RTS 
}

---------------------------------------------

sub_00DA47 {
    PEA $&sub_00DA66-1
    LDA $7F101C, X
    BNE code_00DA54
    LDY #$0044
    RTS 
}

code_00DA54 {
    DEC 
    BNE code_00DA5B
    LDY #$0046
    RTS 
}

code_00DA5B {
    DEC 
    BNE code_00DA62
    LDY #$0046
    RTS 
}

code_00DA62 {
    LDY #$0046
    RTS 
}

---------------------------------------------

sub_00DA66 {
    LDA $&table_01B086, Y
    BCS code_00DA73
    STA $2C
    LDA #$0001
    STA $26
    RTS 
}

code_00DA73 {
    STA $2E
    STZ $26
    RTS 
}