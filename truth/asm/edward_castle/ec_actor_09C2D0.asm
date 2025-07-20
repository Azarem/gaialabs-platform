

---------------------------------------------

h_ec_actor_09C2D0 [
  h_actor < #18, #00, #23 >   ;00
]

---------------------------------------------

e_ec_actor_09C2D0 {
    COP [C1]
    COP [21] ( #02, &code_09C2DB )
    RTL 
}

code_09C2DB {
    LDA #$0000
    STA $7F0010, X
    BRA code_09C2EB
}

---------------------------------------------

func_09C2E4 {
    LDA #$0001
    STA $7F0010, X
}

code_09C2EB {
    COP [BC] ( #08, #00 )
    COP [9C] ( @code_09C333, #$0301 )
    LDA $16
    SEC 
    SBC #$0100
    STA $16
    LDA #$2000
    TRB $10
    COP [B2]
    COP [86] ( #18, #02, #0F )
    COP [8A]
    COP [08] ( #$1515 )
    COP [B4]
    LDA #$0100
    TRB $10
    COP [82] ( #18, #35 )
    COP [89]
    LDA #$0100
    TSB $10
    COP [B3]
    LDA $7F0010, X
    BNE code_09C32E
    COP [0B]
    BRA code_09C330
}

code_09C32E {
    COP [11]
}

code_09C330 {
    COP [C1]
    RTL 
}

code_09C333 {
    COP [84] ( #1F, #03 )
    COP [8A]
    COP [E0]
}