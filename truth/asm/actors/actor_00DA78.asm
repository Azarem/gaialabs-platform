?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'
?INCLUDE 'reward_table_01AADE'
?INCLUDE 'actor_00E155'

!scene_current                  0644

---------------------------------------------

e_actor_00DA78 {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    LDA #$6000
    TRB $12
    LDA $26
    BNE code_00DAD9
    LDA $scene_current
    JSL $@func_00B496
    BCS code_00DAD9
    LDY $scene_current
    LDA $&reward_table_01AADE, Y
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_00DAA4 )
}

code_list_00DAA4 [
  &code_00DAD9   ;00
  &code_00DAAC   ;01
  &code_00DABB   ;02
  &code_00DACA   ;03
]

code_00DAAC {
    COP [8D] ( #0C )
    LDA #$FFFF
    STA $7F0010, X
    LDA #$0080
    BRA code_00DB0B
}

code_00DABB {
    COP [8D] ( #0D )
    LDA #$FFFF
    STA $7F0010, X
    LDA #$0081
    BRA code_00DB0B
}

code_00DACA {
    COP [8D] ( #0E )
    LDA #$FFFF
    STA $7F0010, X
    LDA #$0082
    BRA code_00DB0B
}

code_00DAD9 {
    LDA $7F0020, X
    TAY 
    LDA $0003, Y
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_00DAED )
}

code_list_00DAED [
  &code_00DB88   ;00
  &code_00DAF5   ;01
  &code_00DAFD   ;02
  &code_00DB05   ;03
]

code_00DAF5 {
    COP [8D] ( #04 )
    LDA #$0083
    BRA code_00DB0B
}

code_00DAFD {
    COP [8D] ( #05 )
    LDA #$0084
    BRA code_00DB0B
}

code_00DB05 {
    COP [8D] ( #06 )
    LDA #$0085
}

code_00DB0B {
    STA $7F000A, X
    LDA $16
    STA $24
    LDA #$0007
    STA $26
    LDA $16
    AND #$FFF0
    STA $16
    BRA code_00DB43
}

---------------------------------------------

func_00DB21 {
    DEC $26
    BPL code_00DB2C
    LDA $24
    INC 
    STA $16
    BRA code_00DB47
}

code_00DB2C {
    PHX 
    TYX 
    LDA $7FC000, X
    PLX 
    AND #$00FF
    CMP #$000E
    BEQ code_00DB47
    LDA $16
    CLC 
    ADC #$0010
    STA $16
}

code_00DB43 {
    COP [13] ( &func_00DB21 )
}

code_00DB47 {
    LDA $16
    STA $7F001A, X
    LDA $14
    STA $7F0018, X
    LDA $24
    STA $16
    COP [22] ( #FF, #04 )
    COP [AC] ( #00, #45 )
    COP [DA] ( #0B )
    COP [A2] ( @e_actor_00E155, #$2300 )

  code_00DB69:
    COP [CA] ( #64 )
    COP [C1]
    COP [8B]
    COP [CB]
    LDA $28
    CMP #$0008
    BCS code_00DB69
    CLC 
    ADC #$0005
    STA $28
    COP [CA] ( #0A )
    COP [C1]
    COP [8B]
    COP [CB]
}

code_00DB88 {
    COP [E0]
}