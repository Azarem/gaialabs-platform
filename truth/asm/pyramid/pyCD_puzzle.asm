
?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A

---------------------------------------------

h_pyCD_puzzle [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyCD_puzzle {
    PHX 
    LDY #$0000

  code_08CBA1:
    LDA $0B28, Y
    BMI code_08CBBA
    TAX 
    SEP #$20
    LDA $@binary_08CB94, X
    PHX 
    PHA 
    TYA 
    LSR 
    TAX 
    PLA 
    STA $7EA065, X
    PLX 
    REP #$20
}

code_08CBBA {
    INY 
    INY 
    CPY #$000C
    BNE code_08CBA1
    PLX 

  code_08CBC2:
    COP [D0] ( #D1, #01, &code_08CC09 )
    COP [C1]
    LDY #$0000

  code_08CBCD:
    LDA $0B28, Y
    BMI code_08CBDB
    INY 
    INY 
    CPY #$000C
    BNE code_08CBCD
    BRA code_08CBDC
}

code_08CBDB {
    RTL 
}

code_08CBDC {
    LDY #$0000
    LDA #$0000

  code_08CBE2:
    CMP $0B28, Y
    BNE code_08CC0B
    INY 
    INY 
    INC 
    CMP #$0006
    BNE code_08CBE2
    COP [CC] ( #D1 )
    COP [08] ( #$0F0F )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [BF] ( &widestring_08CD0B )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_08CC09 {
    COP [E0]
}

code_08CC0B {
    COP [07] ( #12 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_08CCC4 )
    LDA $0B28
    CLC 
    ADC #$001E
    JSL $@func_03EF97
    BCC code_08CC2B
    JMP $&code_08CCB7
}

code_08CC2B {
    LDA #$FFFF
    STA $0B28
    COP [4B] ( #05, #06, #87 )
    LDA $0B2A
    CLC 
    ADC #$001E
    JSL $@func_03EF97
    BCS code_08CCB7
    LDA #$FFFF
    STA $0B2A
    COP [4B] ( #06, #06, #87 )
    LDA $0B2C
    CLC 
    ADC #$001E
    JSL $@func_03EF97
    BCS code_08CCB7
    LDA #$FFFF
    STA $0B2C
    COP [4B] ( #07, #06, #87 )
    LDA $0B2E
    CLC 
    ADC #$001E
    JSL $@func_03EF97
    BCS code_08CCB7
    LDA #$FFFF
    STA $0B2E
    COP [4B] ( #08, #06, #87 )
    LDA $0B30
    CLC 
    ADC #$001E
    JSL $@func_03EF97
    BCS code_08CCB7
    LDA #$FFFF
    STA $0B30
    COP [4B] ( #09, #06, #87 )
    LDA $0B32
    CLC 
    ADC #$001E
    JSL $@func_03EF97
    BCS code_08CCB7
    LDA #$FFFF
    STA $0B32
    COP [4B] ( #0A, #06, #87 )
    LDA #$EFF0
    TRB $joypad_mask_std
    JMP $&code_08CBC2
}

code_08CCB7 {
    COP [BF] ( &widestring_08CD37 )
    LDA #$EFF0
    TRB $joypad_mask_std
    JMP $&code_08CBC2
}

widestring_08CCC4 `[DEF]Nothing happened...[N][LU1:30][LU2:B0]arranged[N]wrong. Try it again[N][LU1:8E]the beginning.[END]`

widestring_08CD0B `[DEF][TPL:0]There was a sound from[N][LU1:BE]the entrance![PAL:0][END]`

widestring_08CD37 `[DEF][CLR]Oh, no! [LU1:68]inventory[N]is full, you [LU1:78]take[N]all of it![END]`

---------------------------------------------

binary_08CB94 #8485868C8D8E