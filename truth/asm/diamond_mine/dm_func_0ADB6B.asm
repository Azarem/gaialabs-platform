
?INCLUDE 'chunk_00E683'
?INCLUDE 'table_0EE000'

!player_actor                   09AA

---------------------------------------------

dm_func_0ADB6B {
    COP [5B] ( #$0010 )
    COP [C8] ( &code_0ADC25 )
    LDA #$8008
    STA $7F000A, X
    LDA #$0001
    STA $7F0014, X
    COP [A2] ( @func_00E6A6, #$2000 )
    LDA $player_actor
    STA $0024, Y
    COP [C2]
    LDA #$003B
    STA $24
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    COP [CA] ( #1E )
    COP [C1]
    COP [8B]
    JSR $&dm_sub_0ADD27
    BCC code_0ADBB1
    COP [5D] ( &code_0ADC4C )
}

code_0ADBB1 {
    COP [CB]
    COP [B4]
    COP [C1]
    COP [8B]
    DEC $24
    BMI code_0ADBC8
    JSR $&dm_sub_0ADD27
    BCS code_0ADBC3
    RTL 
}

code_0ADBC3 {
    COP [5D] ( &code_0ADC4C )
    RTL 
}

code_0ADBC8 {
    PHX 
    LDX $06
    LDA $7F002C, X
    STA $0000
    LDA $7F002E, X
    PLX 
    STA $7F0012, X
    LDA $0000
    STA $7F0010, X
    ORA $7F0012, X
    BNE code_0ADBEF
    LDA #$0001
    STA $7F0010, X
}

code_0ADBEF {
    COP [A9]

  code_0ADBF1:
    COP [C1]
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $7F0010, X
    STA $7F002C, X
    LDA $7F0012, X
    STA $7F002E, X
    DEC $24
    BMI code_0ADBF1
    JSR $&dm_sub_0ADD27
    BCC code_0ADC1B
    COP [5D] ( &code_0ADC4E )
}

code_0ADC1B {
    LDA $10
    BIT #$4000
    BNE code_0ADC23
    RTL 
}

code_0ADC23 {
    COP [E0]
}

code_0ADC25 {
    COP [88] ( @table_0EE000 )
    COP [A5] ( @code_0ADC45, #00, #00, #$0202 )
    COP [07] ( #1E )
    LDA #$0080
    TSB $12
    COP [80] ( #08 )
    COP [89]
    COP [DA] ( #03 )
    COP [C5]
}

code_0ADC45 {
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0ADC4C {
    COP [A9]
}

code_0ADC4E {
    COP [80] ( #2A )
    COP [89]
    COP [E0]
}

---------------------------------------------

dm_sub_0ADD27 {
    LDA $14
    EOR $7F100C, X
    BIT #$0010
    BNE code_0ADD4B
    LDA $16
    EOR $7F100E, X
    BIT #$0010
    BNE code_0ADD4B
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    CLC 
    RTS 
}

code_0ADD4B {
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    SEC 
    RTS 
}