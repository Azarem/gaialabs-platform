?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00F3C9'


---------------------------------------------

head_09A915 [
  h_actor < #15, #00, #20 >   ;00
]

---------------------------------------------

func_09A918 {
    LDA #$0008
    TSB $12
    COP [D0] ( #DE, #01, &code_09A99F )
    COP [C1]
    COP [21] ( #01, &code_09A92B )
    RTL 
}

code_09A92B {
    COP [CC] ( #DE )
    COP [A2] ( @code_09A9A1, #$0102 )
    LDA #$04B0
    STA $24

  code_09A93A:
    COP [2D]
    STA $0000
    COP [D9] ( #$0000, &code_list_09A945 )
}

code_list_09A945 [
  &code_09A955   ;00
  &code_09A959   ;01
  &code_09A95F   ;02
  &code_09A963   ;03
  &code_09A969   ;04
  &code_09A96D   ;05
  &code_09A973   ;06
  &code_09A977   ;07
]

code_09A955 {
    DEC $16
    BRA code_09A97D
}

code_09A959 {
    DEC $16
    INC $14
    BRA code_09A97D
}

code_09A95F {
    INC $14
    BRA code_09A97D
}

code_09A963 {
    INC $16
    INC $14
    BRA code_09A97D
}

code_09A969 {
    INC $16
    BRA code_09A97D
}

code_09A96D {
    INC $16
    DEC $14
    BRA code_09A97D
}

code_09A973 {
    DEC $14
    BRA code_09A97D
}

code_09A977 {
    DEC $16
    DEC $14
    BRA code_09A97D
}

code_09A97D {
    DEC $24
    BEQ code_09A986
    COP [C4] ( @code_09A93A )
}

code_09A986 {
    COP [BF] ( &widestring_09AA1B )
    LDA #$0060
    STA $7F0018, X
    LDA #$0030
    STA $7F001A, X
    COP [52] ( #00, #01, #FF )
    COP [53]
}

code_09A99F {
    COP [E0]
}

code_09A9A1 {
    LDA #$0030
    TSB $12
    LDA #$&stats_01ABF0+190
    STA $7F0020, X
    LDA $@stats_01ABF0+190
    AND #$00FF
    STA $7F0026, X
    COP [88] ( @table_0EE000 )
    COP [8D] ( #33 )
    LDA #$0000
    STA $7F0010, X
    LDA #$0040
    STA $7F0012, X

  code_09A9CE:
    COP [58] ( &code_09A9F5 )

  code_09A9D2:
    COP [8B]
    LDA $2A
    BEQ code_09A9D2
    LDA $08
    STZ $08
    STA $26

  code_09A9DE:
    LDY $24
    JSL $@func_00F3C9
    LDA $7F0010, X
    INC 
    STA $7F0010, X
    COP [C2]
    DEC $26
    BPL code_09A9DE
    BRA code_09A9D2
}

code_09A9F5 {
    LDA #$00FF
    STA $7F0026, X
    COP [BF] ( &widestring_09AA02 )
    BRA code_09A9CE
}

widestring_09AA02 `[DEF][TPL:2][LU2:15][LU1:62]are you doing!![PAL:0][END]`

widestring_09AA1B `[DEF][TPL:2][LU1:9]here, or the[N]demon [LU1:EF]get you![PAL:0][END]`