?INCLUDE 'table_0EE000'
?INCLUDE 'actor_00E155'


---------------------------------------------

func_00DF29 {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [A2] ( @e_actor_00E155, #$2700 )
}

---------------------------------------------

func_00DF38 {
    LDA #$0083
    STA $7F000A, X
    LDA #$0400
    TRB $10
    COP [84] ( #04, #0A )
    COP [8A]
    COP [84] ( #09, #96 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

func_00DF52 {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [A2] ( @e_actor_00E155, #$2700 )
}

---------------------------------------------

func_00DF61 {
    LDA #$0084
    STA $7F000A, X
    LDA #$0400
    TRB $10
    COP [84] ( #05, #0A )
    COP [8A]
    COP [84] ( #0A, #96 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

func_00DF7B {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [A2] ( @e_actor_00E155, #$2700 )
    LDA $0ACA
    LSR 
    LSR 
    CMP $0ACE
    BCC code_00DF99
    LDA #$0020
    BRA code_00DFAA
}

code_00DF99 {
    LDA $0ACA
    LSR 
    CMP $0ACE
    BCC code_00DFA7
    LDA #$0010
    BRA code_00DFAA
}

code_00DFA7 {
    LDA #$0000
}

code_00DFAA {
    STA $26
    COP [23]
    PHX 
    LDX $26
    LDY #$0002

  code_00DFB4:
    CMP $@array_00DFFD, X
    BCC code_00DFC1
    INX 
    INX 
    INX 
    INX 
    DEY 
    BPL code_00DFB4
}

code_00DFC1 {
    LDA $@array_00DFFD+2, X
    DEC 
    PLX 
    PHA 
    RTS 
}

---------------------------------------------

func_00DFC9 {
    LDA #$0085
    STA $7F000A, X
    LDA #$0400
    TRB $10
    COP [84] ( #06, #0A )
    COP [8A]
    COP [84] ( #0B, #96 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

func_00DFE3 {
    LDA #$0086
    STA $7F000A, X
    LDA #$0400
    TRB $10
    COP [84] ( #22, #B4 )
    COP [8A]
    COP [84] ( #35, #3C )
    COP [8A]
    COP [E0]
}

---------------------------------------------

array_00DFFD [
  unk1 < #$000F, &func_00DFE3 >   ;00
  unk1 < #$003C, &func_00DFC9 >   ;01
  unk1 < #$0099, &func_00DF61 >   ;02
  unk1 < #$0100, &func_00DF38 >   ;03
  unk1 < #$0019, &func_00DFC9 >   ;04
  unk1 < #$004C, &func_00DF38 >   ;05
  unk1 < #$0099, &func_00DFE3 >   ;06
  unk1 < #$0100, &func_00DF61 >   ;07
  unk1 < #$000C, &func_00DF61 >   ;08
  unk1 < #$0033, &func_00DF38 >   ;09
  unk1 < #$007F, &func_00DFC9 >   ;0A
  unk1 < #$0100, &func_00DFE3 >   ;0B
]