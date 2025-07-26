
?INCLUDE 'stats_01ABF0'
?INCLUDE 'func_00DF15'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_00DDF2'
?INCLUDE 'func_00DF29'
?INCLUDE 'reward_table_01AADE'
?INCLUDE 'reward_actors'

!scene_current                  0644

---------------------------------------------

func_00DB8A {
    LDA $7F0020, X
    CMP #$&stats_01ABF0
    BNE code_00DB96
    JMP $&code_00DBB6
}

code_00DB96 {
    LDA $7F002A, X
    BIT #$0080
    BNE code_00DBB6
    SED 
    LDA $0AEE
    SEC 
    SBC #$0001
    STA $0AEE
    CLD 
    LDA $0AEC
    DEC 
    STA $0AEC
    STA $7F0010, X
}

code_00DBB6 {
    LDA #$0000
    STA $2C
    STA $2E
    STA $7F002C, X
    STA $7F002E, X
    COP [07] ( #06 )
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [DA] ( #02 )
    LDA $7F0020, X
    CMP #$&stats_01ABF0
    BNE code_00DBE9
    JMP $&code_00DC5F
}

code_00DBE9 {
    LDA $7F002A, X
    BIT #$0080
    BNE code_00DC5F
    COP [D8]
    LDA $scene_current
    JSL $@func_00B496
    BCS code_00DC03
    LDA $7F0010, X
    BEQ code_00DC13
}

code_00DC03 {
    LDA $7F0020, X
    TAY 
    LDA $0003, Y
    AND #$00FF
    BEQ code_00DC13
    JMP $&func_00DD5B
}

code_00DC13 {
    LDA #$2000
    TSB $10
    LDA $7F002A, X
    BIT #$0008
    BEQ code_00DC23
    COP [0C]
}

code_00DC23 {
    LDA $7F0024, X
    BEQ code_00DC54
    JSL $@func_00B4F6
    BCS code_00DC54
    LDA $7F0024, X
    JSL $@func_00B4E0
    COP [A5] ( @func_00DDF2, #00, #00, #$0342 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    PHX 
    LDA $7F0024, X
    TYX 
    STA $7F0024, X
    PLX 
}

code_00DC54 {
    LDA $7F0010, X
    BNE code_00DC5D
    JMP $&func_00DD87
}

code_00DC5D {
    COP [E0]
}

code_00DC5F {
    COP [DA] ( #02 )
    LDA #$2000
    TSB $10
    LDA $7F002A, X
    BIT #$0008
    BEQ code_00DC72
    COP [0C]
}

code_00DC72 {
    COP [DA] ( #05 )
    COP [E0]
}

---------------------------------------------

func_00DD5B {
    DEC 
    BEQ code_00DD63
    DEC 
    BEQ code_00DD6F
    BRA code_00DD7B
}

code_00DD63 {
    COP [A5] ( @func_00DF29, #00, #00, #$0420 )
    JMP $&code_00DC13
}

code_00DD6F {
    COP [A5] ( @func_00DF52, #00, #00, #$0420 )
    JMP $&code_00DC13
}

code_00DD7B {
    COP [A5] ( @func_00DF7B, #00, #00, #$0420 )
    JMP $&code_00DC13
}

---------------------------------------------

func_00DD87 {
    COP [B7] ( #00 )
    LDY $scene_current
    LDA $&reward_table_01AADE, Y
    AND #$00FF
    PHA 
    LDA $scene_current
    JSL $@func_00B496
    BCS code_00DDB3
    COP [B7] ( #00 )
    LDA $01, S
    BEQ code_00DDB3
    LDA #$0080
    TSB $09EC
    PLA 
    DEC 
    BEQ code_00DDB6
    DEC 
    BEQ code_00DDCA
    BRA code_00DDDE
}

code_00DDB3 {
    PLA 
    COP [E0]
}

code_00DDB6 {
    COP [A5] ( @e_hp_increase, #00, #00, #$1000 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [E0]
}

code_00DDCA {
    COP [A5] ( @e_str_increase, #00, #00, #$1000 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [E0]
}

code_00DDDE {
    COP [A5] ( @e_def_increase, #00, #00, #$1000 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [E0]
}