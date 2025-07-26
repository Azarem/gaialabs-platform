
?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'table_0EDA00'
?INCLUDE 'func_00F3C9'
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btE4_kara [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_btE4_kara {
    COP [0B]
    COP [C0] ( &code_098DEA )
    COP [D2] ( #0E, #01 )
    COP [C0] ( #$0000 )
    JSL $@func_03F0CA
    EOR #$0001
    CLC 
    ADC #$001A
    STA $28
    STZ $2A
    COP [9C] ( @code_098F01, #$1802 )
    COP [9C] ( @code_098F0A, #$1802 )
    COP [9C] ( @code_098F13, #$1802 )
    COP [9C] ( @code_098F1C, #$1802 )
    COP [9C] ( @code_098F25, #$1802 )
    COP [9C] ( @code_098F2E, #$1802 )
    LDY $player_actor
    LDA #$*func_08F5F9
    STA $0002, Y
    LDA #$&func_08F5F9
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #1A, #01 )
    LDA #$2000
    TSB $10
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_098DA2
    RTL 
}

code_098DA2 {
    COP [BF] ( &widestring_098EB8 )
    COP [CC] ( #0A )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    LDY $player_actor
    LDA #$*func_098F7E
    STA $0002, Y
    LDA #$&func_098F7E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    LDA #$0200
    TSB $06EE
    COP [DB] ( #$00EF )
    LDA #$0404
    STA $064A
    COP [26] ( #E7, #$0050, #$0090, #00, #$1100 )
    COP [C1]
    RTL 
}

code_098DEA {
    COP [D0] ( #0F, #01, &code_098DF5 )
    COP [BF] ( &widestring_098DFD )
    RTL 
}

code_098DF5 {
    COP [BF] ( &widestring_098E17 )
    COP [CC] ( #0E )
    RTL 
}

widestring_098DFD `[DEF][TPL:1][LU1:25][N].................[PAL:0][END]`

widestring_098E17 `[DEF][TPL:0][DLY:0][LU1:61]Will and [LU1:26][N]joined and became one [N][LU1:F0]the Light Knight, a [N][LU1:95][LU1:C2]was born... [FIN]The Knights [LU1:F2][LU1:75][N]forth. The [LU1:C]Knight's [N]ultimate power, the [N][LU2:10]was released![PAL:0][END]`

widestring_098EB8 `[TPL:D][TPL:4][DLY:0][LU1:68]battle [LU1:EF]change[N]the [LU2:6B]of humanity.[FIN]Now you [LU1:B2]go[N]to the comet!![PAL:0][END]`

code_098F01 {
    LDA #$0000
    STA $7F0010, X
    BRA code_098F35
}

code_098F0A {
    LDA #$002A
    STA $7F0010, X
    BRA code_098F35
}

code_098F13 {
    LDA #$0054
    STA $7F0010, X
    BRA code_098F35
}

code_098F1C {
    LDA #$0080
    STA $7F0010, X
    BRA code_098F35
}

code_098F25 {
    LDA #$00AA
    STA $7F0010, X
    BRA code_098F35
}

code_098F2E {
    LDA #$00D4
    STA $7F0010, X
}

code_098F35 {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #0A )
    LDA #$0001
    STA $7F0012, X
    COP [C1]
    LDA $player_actor
    STA $24
    LDY $24
    JSL $@func_00F3C9
    LDA $7F0010, X
    CLC 
    ADC #$0002
    STA $7F0010, X
    LDA $7F0012, X
    CMP #$0080
    BEQ code_098F6B
    INC 
    STA $7F0012, X
}

code_098F6B {
    COP [D0] ( #0A, #01, &code_098F72 )
    RTL 
}

code_098F72 {
    COP [88] ( @table_0EE000 )
    COP [80] ( #1E )
    COP [89]
    COP [E0]
}

---------------------------------------------

func_098F7E {
    LDA #$0008
    TRB $10
    COP [8F] ( #1C )
    COP [89]
    COP [B9]

  code_098F8A:
    COP [91] ( #1B, #08 )
    COP [89]
    BRA code_098F8A
}