?INCLUDE 'inventory_spritemap'
?INCLUDE 'chunk_008000'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'chunk_028000'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00F3C9'

!scene_next                     0642
!joypad_mask_std                065A
!BG1SC                          2107
!BG2SC                          2108
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_actor_00CD59 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_actor_00CD59 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [BC] ( #08, #08 )
    COP [88] ( @table_108000 )
    SEP #$20
    LDA #$08
    STA $BG1SC
    LDA #$0C
    STA $BG2SC
    LDA #$13
    STA $_TM
    LDA #$11
    STA $_TS
    LDA #$82
    STA $CGWSEL
    LDA #$02
    STA $CGADSUB
    REP #$20
    STZ $0676
    LDA $0E
    STA $24
    BIT #$0010
    BEQ code_00CD9D
    COP [BC] ( #00, #F8 )
}

code_00CD9D {
    LDA #$2000
    STA $0E
    PHX 
    LDA $24
    AND #$000F
    ASL 
    ASL 
    TAX 
    LDA $@binary_00CE97, X
    AND #$00FF
    JSL $@func_00B4B7
    BCC code_00CDBB
    JMP $&code_00CE7B
}

code_00CDBB {
    LDA $@binary_00CE97+2, X
    AND #$00FF
    CMP $0AAC
    BEQ code_00CDCA
    JMP $&code_00CE93
}

code_00CDCA {
    LDA $@binary_00CE97, X
    AND #$00FF
    JSL $@func_00B4BE
    LDA $@binary_00CE97+1, X
    AND #$00FF
    STA $28
    STZ $2A
    PLX 
    JSL $@func_03CA55
    LDA #$0001
    STA $26

  code_00CDEA:
    COP [9C] ( @func_00CEAF, #$1802 )
    LDA $26
    CLC 
    ADC #$0020
    STA $26
    STA $0026, Y
    CMP #$0101
    BNE code_00CDEA
    TYA 
    STA $26
    LDA #$00B4
    STA $0AAC
    COP [C1]
    DEC $0AAC
    BEQ code_00CE46
    JSL $@func_02A10A
    BCC code_00CE18
    RTL 
}

code_00CE18 {
    LDA #$0000
    STA $0AAC
    COP [DA] ( #0F )
    COP [08] ( #$2525 )
    COP [C2]
    PHX 
    LDX $26
    LDA $7F0012, X
    PLX 
    CMP #$0000
    BEQ code_00CE35
    RTL 
}

code_00CE35 {
    LDA #$2000
    TRB $10
    COP [CA] ( #3C )
    COP [9C] ( @func_00CEFF, #$1802 )
    COP [CB]
}

code_00CE46 {
    LDA $0B12
    STA $scene_next
    LDA $0B08
    ASL 
    ASL 
    ASL 
    ASL 
    STA $064C
    LDA $0B0C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $064E
    LDA #$0003
    STA $0650
    LDA $0B10
    STA $0652
    LDA #$0303
    STA $064A
    LDA #$0002
    STA $0648
    COP [C1]
    RTL 
}

code_00CE7B {
    LDA $@binary_00CE97+1, X
    AND #$00FF
    STA $28
    STZ $2A
    PLX 
    JSL $@func_03CA55
    LDA #$2000
    TRB $10
    COP [C1]
    RTL 
}

code_00CE93 {
    PLX 
    COP [C1]
    RTL 
}

---------------------------------------------

binary_00CE97 #F83A0000F93B0100FA3C0200FB3D0300FC3E0400FD3F0500

---------------------------------------------

func_00CEAF {
    COP [B6] ( #30 )
    COP [88] ( @table_0EE000 )
    COP [8D] ( #02 )
    LDA #$00FC
    STA $7F0012, X
    LDA $26
    STA $7F0010, X

  code_00CEC7:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_00CEC7
    LDA $08
    INC 
    STA $26
    STZ $08
    COP [C1]
    DEC $26
    BMI code_00CEC7
    LDY $24
    JSL $@func_00F3C9
    LDA $7F0010, X
    CLC 
    ADC #$0004
    STA $7F0010, X
    LDA $7F0012, X
    BEQ code_00CEFD
    SEC 
    SBC #$0002
    STA $7F0012, X
    RTL 
}

code_00CEFD {
    COP [E0]
}

---------------------------------------------

func_00CEFF {
    LDA $0036
    AND #$0003
    BNE code_00CF27
    COP [23]
    AND #$000F
    SEC 
    SBC #$0008
    CLC 
    ADC $14
    STA $14
    LDA $16
    SEC 
    SBC #$0008
    STA $16
    COP [88] ( @table_0EE000 )
    COP [80] ( #02 )
    COP [89]
}

code_00CF27 {
    COP [E0]
}