
?INCLUDE 'chunk_008000'
?INCLUDE 'reward_table_01AADE'

!scene_current                  0644
!player_flags                   09AE

---------------------------------------------

h_actor_00C2BB [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_actor_00C2BB {
    PHX 
    SEP #$20
    LDX #$0000
    LDA $scene_current

  code_00C2C7:
    CMP $@array_00C312, X
    BEQ code_00C2D3
    INX 
    INX 
    INX 
    INX 
    BRA code_00C2C7
}

code_00C2D3 {
    REP #$20
    TXA 
    STX $20
    PLX 
    LSR 
    LSR 
    JSL $@func_00B05E
    BCS code_00C30C
    COP [C1]
    LDA $player_flags
    BIT #$0020
    BNE code_00C2EC
    RTL 
}

code_00C2EC {
    PHX 
    LDX $20
    LDA $@array_00C312+1, X
    STA $0004
    JSR $&sub_00C33E
    PLX 
    LDA $0ACA
    SEC 
    SBC $0ACE
    STA $0B22
    LDA $20
    LSR 
    LSR 
    JSL $@func_00B069
}

code_00C30C {
    COP [C1]
    NOP 
    NOP 
    NOP 
    RTL 
}

---------------------------------------------

array_00C312 [
  unk5 < #29, #0C, #29, #00 >   ;00
  unk5 < #55, #3D, #55, #00 >   ;01
  unk5 < #67, #5A, #67, #00 >   ;02
  unk5 < #8A, #6D, #8A, #00 >   ;03
  unk5 < #DD, #A0, #DD, #00 >   ;04
  unk5 < #F8, #00, #00, #00 >   ;05
  unk5 < #29, #00, #00, #00 >   ;06
  unk5 < #29, #00, #00, #00 >   ;07
  unk5 < #29, #00, #00, #00 >   ;08
  unk5 < #29, #00, #00, #00 >   ;09
  unk5 < #29, #00, #00, #00 >   ;0A
]

---------------------------------------------

sub_00C33E {
    XBA 
    AND #$00FF
    STA $000E
    LDA $0004
    AND #$00FF
    TAY 
    SEP #$20
    BRA code_00C353

  code_00C350:
    SEP #$20
    INY 
}

code_00C353 {
    LDA $&reward_table_01AADE, Y
    BNE code_00C360
    INY 
    CPY $000E
    BCC code_00C353
    BRA code_00C394
}

code_00C360 {
    REP #$20
    AND #$00FF
    STA $0004
    TYA 
    PHY 
    JSL $@func_00B496
    PLY 
    BCS code_00C350
    PHY 
    TYA 
    JSL $@func_00B4A1
    PLY 
    LDA $0004
    PEA $&code_00C350-1
    DEC 
    BNE code_00C385
    INC $0ACA
    RTS 
}

code_00C385 {
    DEC 
    BNE code_00C38C
    INC $0ADE
    RTS 
}

code_00C38C {
    DEC 
    BEQ code_00C390
    RTS 
}

code_00C390 {
    INC $0ADC
    RTS 
}

code_00C394 {
    REP #$20
    RTS 
}