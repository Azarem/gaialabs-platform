?BANK 0B
?INCLUDE 'chunk_00E683'

!player_actor                   09AA

---------------------------------------------

e_aw_actor_0BBEE9 {
    LDA $24
    STA $7F100C, X
    LDA $14
    SEC 
    SBC #$0020
    BRA code_0BBF03
}

code_0BBEF7 {
    LDA $24
    STA $7F100C, X
    LDA $14
    CLC 
    ADC #$0020
}

code_0BBF03 {
    STA $7F0018, X
    COP [23]
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $7F0018, X
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    COP [22] ( #17, #01 )
    LDA #$8017
    STA $7F000A, X
    LDA #$0001
    STA $7F0014, X
    COP [A2] ( @func_00E6A6, #$2000 )
    TYA 
    STA $7F0012, X
    LDA $player_actor
    STA $0024, Y
    COP [C2]

  code_0BBF45:
    LDA $7F0012, X
    TAY 
    LDA $player_actor
    STA $0024, Y
    COP [C8] ( &code_0BBF64 )
    LDA $7F0012, X
    TAY 
    LDA $26
    STA $0024, Y
    COP [C8] ( &code_0BBF64 )
    BRA code_0BBF45
}

code_0BBF64 {
    LDA #$&loc_0BBF75
    STA $7F001E, X
    COP [23]
    AND #$0001
    INC 
    STA $7F0014, X

  loc_0BBF75:
    COP [8B]
    LDA $2A
    BEQ loc_0BBF75
    LDA $08
    STA $24
    STZ $08
    COP [C2]
    DEC $24
    BMI code_0BBF88
    RTL 
}

code_0BBF88 {
    COP [CB]
    COP [C5]
}