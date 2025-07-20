?INCLUDE 'func_00CFEF'
?INCLUDE 'table_0EE000'

!scene_current                  0644
!player_actor                   09AA

---------------------------------------------

h_pyD9_actor_08C4EA [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyD9_actor_08C4EA {
    COP [9C] ( @code_08C607, #$2000 )

  code_08C5D4:
    COP [DA] ( #3B )
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    CMP #$0060
    BEQ code_08C5E9
    INC 
    STA $0026, Y
    RTL 
}

code_08C5E9 {
    COP [DA] ( #3B )
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    BEQ code_08C5FB
    DEC 
    STA $0026, Y
    RTL 
}

code_08C5FB {
    COP [07] ( #15 )
    COP [9C] ( @func_00CFEF, #$2000 )
    BRA code_08C5D4
}

code_08C607 {
    PHX 
    LDY $player_actor
    LDA $0014, Y
    STA $0000
    LDA $0016, Y
    SEC 
    SBC #$0008
    STA $0002
    LDY #$1060
    LDA $0026, Y
    CLC 
    ADC $0002
    STA $0002
    LDX #$0000

  code_08C62B:
    LDA $@array_08C6BC, X
    AND #$00FF
    CMP #$00FF
    BNE code_08C63A
    JMP $&code_08C6BA
}

code_08C63A {
    CMP $scene_current
    BNE code_08C6B1
    LDA $@array_08C6BC+1, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0000
    BCS code_08C6B1
    LDA $@array_08C6BC+2, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0002
    BCS code_08C6B1
    LDA $@array_08C6BC+3, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0000
    BCC code_08C6B1
    LDA $@array_08C6BC+4, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC #$0008
    CMP $0002
    BCC code_08C6B1
    TXA 
    TYX 
    TAY 
    PLX 
    PHY 
    COP [9C] ( @code_08C697, #$0200 )
    PLY 
    PHX 
    TXA 
    TYX 
    TAY 
    JMP $&code_08C6B1
}

code_08C697 {
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [88] ( @table_0EE000 )
    COP [8D] ( #00 )
    COP [DA] ( #01 )
    COP [E0]
}

code_08C6B1 {
    TXA 
    CLC 
    ADC #$0005
    TAX 
    JMP $&code_08C62B
}

code_08C6BA {
    PLX 
    RTL 
}

---------------------------------------------

array_08C6BC [
  unk11 < #D9, #20, #01, #28, #0D >   ;00
  unk11 < #D9, #30, #01, #38, #0C >   ;01
  unk11 < #D9, #40, #01, #44, #0D >   ;02
  unk11 < #D9, #50, #01, #5E, #0D >   ;03
  unk11 < #D9, #66, #01, #6A, #0D >   ;04
  unk11 < #DB, #1C, #01, #38, #0D >   ;05
  unk11 < #DB, #40, #01, #48, #0D >   ;06
  unk11 < #DB, #50, #01, #60, #11 >   ;07
  unk11 < #DB, #66, #01, #6C, #0F >   ;08
]