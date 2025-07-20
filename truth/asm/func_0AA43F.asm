?INCLUDE 'func_00DB8A'
?INCLUDE 'actor_00DA78'
?INCLUDE 'func_00DF15'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_00DDF2'


---------------------------------------------

func_0AA43F {
    LDA $0AEC
    CMP #$0001
    BNE code_0AA460
    LDA #$6000
    TRB $12
    COP [AC] ( #00, #00 )
    LDA #$0000
    STA $7F002C, X
    STA $7F002E, X
    COP [C7] ( @func_00DB8A )
}

code_0AA460 {
    COP [C8] ( &code_0AA474 )
    COP [9C] ( @e_actor_00DA78, #$0020 )
    LDA $7F0010, X
    STA $0026, Y
    COP [E0]
}

code_0AA474 {
    COP [07] ( #03 )
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
    COP [AC] ( #00, #00 )
    LDA #$0000
    STA $7F002C, X
    STA $7F002E, X
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [D8]
    LDA #$2000
    TSB $10
    LDA $7F002A, X
    BIT #$0008
    BEQ code_0AA4B8
    COP [0C]
}

code_0AA4B8 {
    LDA $7F0024, X
    BEQ code_0AA4E0
    JSL $@func_00B4F6
    BCS code_0AA4E0
    LDA $7F0024, X
    JSL $@func_00B4E0
    COP [A5] ( @func_00DDF2, #00, #00, #$0342 )
    PHX 
    LDA $7F0024, X
    TYX 
    STA $7F0024, X
    PLX 
}

code_0AA4E0 {
    COP [C5]
}