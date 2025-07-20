?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'


---------------------------------------------

h_ec12_skull_chaser [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_ec12_skull_chaser {
    COP [B7] ( #0C )
    COP [B6] ( #30 )
    COP [27] ( #08 )
    COP [57] ( @code_0A853E )
    COP [C2]

  code_0A8489:
    COP [2C] ( &code_0A848F, &code_0A8499 )
}

code_0A848F {
    COP [2A] ( #$0008, &code_0A84BC, &code_0A8499, &code_0A84DC )
}

code_0A8499 {
    COP [2B] ( #$0008, &code_0A84FC, &code_0A84A3, &code_0A851D )
}

code_0A84A3 {
    RTL 
}

---------------------------------------------

code_0A84A4 {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0A84B4 )
}

code_list_0A84B4 [
  &code_0A84BC   ;00
  &code_0A84DC   ;01
  &code_0A84FC   ;02
  &code_0A851D   ;03
]

code_0A84BC {
    COP [17] ( &code_0A84A4 )
    COP [8D] ( #07 )
    COP [AA] ( #02 )
    COP [C1]
    COP [8C] ( #02 )
    COP [C2]
    STZ $2C
    COP [17] ( &code_0A84A4 )
    COP [AA] ( #02 )
    COP [C1]
    COP [89]
    BRA code_0A8489
}

code_0A84DC {
    COP [18] ( &code_0A84A4 )
    COP [8D] ( #87 )
    COP [AA] ( #01 )
    COP [C1]
    COP [8C] ( #02 )
    COP [C2]
    STZ $2C
    COP [18] ( &code_0A84A4 )
    COP [AA] ( #01 )
    COP [C1]
    COP [89]
    BRA code_0A8489
}

code_0A84FC {
    COP [15] ( &code_0A84A4 )
    COP [8D] ( #05 )
    COP [AB] ( #02 )
    COP [C1]
    COP [8C] ( #02 )
    COP [C2]
    STZ $2E
    COP [15] ( &code_0A84A4 )
    COP [AB] ( #02 )
    COP [C1]
    COP [89]
    JMP $&code_0A8489
}

code_0A851D {
    COP [16] ( &code_0A84A4 )
    COP [8D] ( #03 )
    COP [AB] ( #01 )
    COP [C1]
    COP [8C] ( #02 )
    COP [C2]
    STZ $2E
    COP [16] ( &code_0A84A4 )
    COP [AB] ( #01 )
    COP [C1]
    COP [89]
    JMP $&code_0A8489
}

code_0A853E {
    COP [9C] ( @code_0A854C, #$0300 )
    COP [C3] ( @code_0A8563, #$0002 )
}

code_0A854C {
    COP [07] ( #06 )
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    LDA #$0002
    TSB $10
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

code_0A8563 {
    COP [B7] ( #00 )
    COP [B6] ( #30 )
    COP [57] ( $000000 )
    LDA #$&stats_01ABF0+44
    STA $7F0020, X
    LDA $@stats_01ABF0+44
    AND #$00FF
    STA $7F0026, X
    LDA #$0340
    TRB $10
    COP [BC] ( #00, #E0 )

  code_0A8589:
    LDA $7F0010, X
    AND #$0003
    BNE code_0A8598
    COP [84] ( #0D, #0C )
    COP [8A]
}

code_0A8598 {
    LDA $7F0010, X
    INC 
    STA $7F0010, X
    COP [2A] ( #$0000, &code_0A85AB, &code_0A85AB, &code_0A85D1 )
}

code_0A85AB {
    COP [2B] ( #$0000, &code_0A85B5, &code_0A85B5, &code_0A85C3 )
}

code_0A85B5 {
    COP [83] ( #0C, #29, #02 )
    COP [89]
    COP [80] ( #0C )
    COP [89]
    BRA code_0A8589
}

code_0A85C3 {
    COP [83] ( #0C, #29, #01 )
    COP [89]
    COP [80] ( #0C )
    COP [89]
    BRA code_0A8589
}

code_0A85D1 {
    COP [2B] ( #$0000, &code_0A85DB, &code_0A85DB, &code_0A85E9 )
}

code_0A85DB {
    COP [83] ( #0C, #2B, #02 )
    COP [89]
    COP [80] ( #0C )
    COP [89]
    BRA code_0A8589
}

code_0A85E9 {
    COP [83] ( #0C, #2B, #01 )
    COP [89]
    COP [80] ( #0C )
    COP [89]
    BRA code_0A8589
}