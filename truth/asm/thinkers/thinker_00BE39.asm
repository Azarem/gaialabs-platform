
---------------------------------------------

h_thinker_00BE39 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_00BE39 {
    PHX 
    LDX #$0000
    LDY #$0010

  code_00BE42:
    LDA #$0090
    STA $7E7000, X
    LDA #$7100
    STA $7E7001, X
    INX 
    INX 
    INX 
    DEY 
    BPL code_00BE42
    LDX #$0000
    LDY #$0010

  code_00BE5C:
    LDA #$0000
    STA $7E7100, X
    INX 
    INX 
    DEY 
    BPL code_00BE5C
    PLX 
    COP [01] ( $7E7000, #21 )
    COP [C2]
    COP [CC] ( #FF )
    COP [C1]
    COP [01] ( $7E7000, #21 )
    COP [D0] ( #FF, #00, &e_thinker_00BE39 )
    RTL 
}