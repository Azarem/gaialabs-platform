

---------------------------------------------

h_awB7_actor_0899AF [
  h_actor < #03, #00, #00 >   ;00
]

---------------------------------------------

e_awB7_actor_0899AF {
    COP [BC] ( #08, #00 )
    COP [C1]
    LDA #$0010
    TRB $10
    COP [45] ( #08, #12, #0A, #14, &code_0899CE )
    COP [45] ( #03, #10, #07, #18, &code_0899D4 )
    RTL 
}

code_0899CE {
    LDA #$0010
    TSB $10
    RTL 
}

code_0899D4 {
    LDA #$0010
    TSB $10
    COP [0F] ( #05, #0F )
    COP [0F] ( #06, #0F )
    COP [9C] ( @code_0899FB, #$2000 )
    COP [81] ( #85, #01 )
    COP [89]
    COP [80] ( #07 )
    COP [89]
    COP [C1]
    COP [80] ( #08 )
    COP [89]
    RTL 
}

code_0899FB {
    LDY $24
    LDA $000E, Y
    AND #$F1FF
    STA $000E, Y
    COP [DA] ( #01 )
    LDY $24
    LDA $000E, Y
    AND #$F1FF
    ORA #$0200
    STA $000E, Y
    COP [DA] ( #01 )
    BRA code_0899FB
}