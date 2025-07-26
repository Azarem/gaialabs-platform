
?INCLUDE 'table_0EE000'

!player_actor                   09AA
!player_flags                   09AE
!_TM                            212C
!_TS                            212D

---------------------------------------------

h_sE7_actor_0CEDC5 [
  h_actor < #00, #10, #29 >   ;00
]

---------------------------------------------

e_sE7_actor_0CEDC5 {
    COP [9B] ( @code_0CEE9B )
    LDA #$0002
    STA $0AD4
    LDY $player_actor
    LDA #$&func_0CED4C
    STA $0000, Y
    LDA #$*func_0CED4C
    STA $0002, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    COP [23]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0CEDFE )
}

code_list_0CEDFE [
  &code_0CEE0E   ;00
  &code_0CEE0E   ;01
  &code_0CEE17   ;02
  &code_0CEE17   ;03
  &code_0CEE20   ;04
  &code_0CEE20   ;05
  &code_0CEE29   ;06
  &code_0CEE29   ;07
]

code_0CEE0E {
    COP [9C] ( @code_0CEE3E, #$0902 )
    BRA code_0CEE32
}

code_0CEE17 {
    COP [9C] ( @code_0CEE43, #$0902 )
    BRA code_0CEE32
}

code_0CEE20 {
    COP [9C] ( @code_0CEE48, #$0902 )
    BRA code_0CEE32
}

code_0CEE29 {
    COP [9C] ( @code_0CEE4D, #$0902 )
    BRA code_0CEE32
}

code_0CEE32 {
    COP [23]
    AND #$0007
    CLC 
    ADC #$0010
    STA $08
    RTL 
}

code_0CEE3E {
    COP [8D] ( #00 )
    BRA code_0CEE50
}

code_0CEE43 {
    COP [8D] ( #01 )
    BRA code_0CEE50
}

code_0CEE48 {
    COP [8D] ( #02 )
    BRA code_0CEE50
}

code_0CEE4D {
    COP [8D] ( #03 )
}

code_0CEE50 {
    COP [5B] ( #$0080 )
    LDA #$0030
    TSB $12
    COP [23]
    STA $14
    CMP #$006A
    BCC code_0CEE67
    CMP #$008A
    BCC code_0CEE99
}

code_0CEE67 {
    LDA #$FFC0
    STA $16
    LDA #$0000
    STA $7F0018, X
    LDA $0410
    LSR 
    BCS code_0CEE82
    LDA #$000B
    STA $7F001A, X
    BRA code_0CEE89
}

code_0CEE82 {
    LDA #$0009
    STA $7F001A, X
}

code_0CEE89 {
    COP [B1]
    COP [80] ( #FF )
    COP [89]
    LDA $16
    BMI code_0CEE89
    CMP #$0180
    BCC code_0CEE89
}

code_0CEE99 {
    COP [E0]
}

code_0CEE9B {
    SEP #$20
    LDA #$15
    STA $_TM
    LDA #$00
    STA $_TS
    REP #$20
    RTL 
}

---------------------------------------------

func_0CED4C {
    LDA #$0008
    TRB $10
    COP [8F] ( #1B )
    LDA $0E
    ORA #$8000
    STA $0E
    LDA #$007A
    STA $14
    LDA #$00BB
    STA $16
    LDA #$0384
    STA $26

  code_0CED6A:
    COP [8B]
    LDA $2A
    BEQ code_0CED6A
    LDA $08
    STZ $08
    STA $24

  code_0CED76:
    COP [C2]
    DEC $26
    BMI code_0CED82
    DEC $24
    BPL code_0CED76
    BRA code_0CED6A
}

code_0CED82 {
    COP [91] ( #1B, #08 )
    COP [89]
    COP [9C] ( @code_0CEDAB, #$0300 )
    LDA $16
    BPL code_0CED82
    BPL code_0CED99
    EOR #$FFFF
    INC 
}

code_0CED99 {
    CMP #$0030
    BCC code_0CED82
    COP [26] ( #E8, #$0000, #$0000, #80, #$2100 )
    COP [C1]
    RTL 
}

code_0CEDAB {
    COP [88] ( @table_0EE000 )
    COP [23]
    AND #$000F
    SEC 
    SBC #$0008
    CLC 
    ADC $14
    STA $14
    COP [80] ( #02 )
    COP [89]
    COP [E0]
}