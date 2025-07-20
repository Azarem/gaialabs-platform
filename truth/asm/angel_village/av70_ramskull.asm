?INCLUDE 'table_0EE000'


---------------------------------------------

h_av70_ramskull [
  h_actor < #1A, #00, #00 >   ;00
]

---------------------------------------------

e_av70_ramskull {
    COP [0B]
    LDA #$0011
    TSB $12
    COP [5B] ( #$0008 )

  code_0AF0D5:
    COP [27] ( #08 )
    COP [80] ( #1A )
    COP [89]
    COP [84] ( #1B, #03 )
    COP [8A]
    COP [A5] ( @code_0AF102, #FC, #F4, #$0200 )
    COP [A5] ( @code_0AF0FD, #04, #F4, #$0200 )
    COP [84] ( #1A, #02 )
    COP [8A]
    BRA code_0AF0D5
}

code_0AF0FD {
    LDA #$4000
    TSB $12
}

code_0AF102 {
    COP [5B] ( #$0010 )
    COP [A2] ( @code_0AF137, #$2200 )
    LDA #$0002
    STA $0008, Y
    COP [A2] ( @code_0AF137, #$2200 )
    LDA #$0004
    STA $0008, Y
    COP [07] ( #1E )
    COP [88] ( @table_0EE000 )

  code_0AF128:
    COP [81] ( #08, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AF128
    COP [E0]
}

code_0AF137 {
    COP [88] ( @table_0EE000 )
    COP [C2]
    LDA #$2000
    TRB $10
    COP [AC] ( #04, #00 )

  code_0AF147:
    COP [B1]
    COP [80] ( #26 )
    COP [89]
    BRA code_0AF147
}