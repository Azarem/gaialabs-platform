?BANK 0B

?INCLUDE 'binary_0BACB4'
?INCLUDE 'func_00F3C9'
?INCLUDE 'chunk_00E683'
?INCLUDE 'aw_actor_0BBEE9'

!player_actor                   09AA

---------------------------------------------

e_py_actor_0BABB3 {
    COP [DA] ( #07 )
    LDA #$2000
    TRB $10
    COP [8D] ( #0E )

  code_0BABBE:
    COP [DA] ( #03 )
    COP [07] ( #26 )
    LDY $24
    LDA $0010, Y
    BIT #$2000
    BEQ code_0BABBE
    COP [80] ( #0E )
    COP [89]
    LDY $24
    LDA $0026, Y
    AND #$0007
    PHX 
    TAX 
    INC 
    STA $0026, Y
    LDA $@binary_0BACB4, X
    PLX 
    AND #$00FF
    STA $7F0010, X
    LDA #$000A
    STA $7F0012, X
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    LDA #$0000
    STA $7F0000, X

  code_0BAC07:
    COP [8B]
    LDA $2A
    BEQ code_0BAC07
    LDA $08
    STA $26
    STZ $08
    LDA $7F0000, X
    CMP #$0006
    BCS code_0BAC2D
    INC 
    STA $7F0000, X

  code_0BAC21:
    JSL $@code_00F3D3
    COP [C2]
    DEC $26
    BPL code_0BAC21
    BRA code_0BAC07
}

code_0BAC2D {
    COP [80] ( #0E )
    COP [89]
    LDA $24
    STA $26
    COP [A2] ( @func_00E6A6, #$2000 )
    TYA 
    STA $7F0012, X
    LDA #$800E
    STA $7F000A, X
    LDA #$0001
    STA $7F0014, X
    LDA $player_actor
    STA $0024, Y
    COP [C2]

  code_0BAC58:
    LDA $7F0012, X
    TAY 
    LDA $player_actor
    STA $0024, Y
    COP [C8] ( &code_0BBF64 )
    LDA $7F0012, X
    TAY 
    PHX 
    LDX $26
    LDA $7F1016, X
    PLX 
    STA $0024, Y
    COP [C8] ( &code_0BBF64 )
    BRA code_0BAC58
}