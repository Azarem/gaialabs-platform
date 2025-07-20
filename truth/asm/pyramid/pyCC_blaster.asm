?INCLUDE 'actor_00E4DB'
?INCLUDE 'table_0EE000'

!player_actor                   09AA

---------------------------------------------

h_pyCC_blaster [
  h_actor < #1B, #00, #00 >   ;00
]

---------------------------------------------

e_pyCC_blaster {
    LDA #$0011
    TSB $12
    COP [58] ( &code_0BC807 )

  code_0BC7A4:
    COP [27] ( #0D )
    COP [DA] ( #77 )
    COP [2A] ( #$0000, &code_0BC7B4, &code_0BC7B4, &code_0BC7C1 )
}

code_0BC7B4 {
    COP [9E] ( @code_0BC7CE, #$FFF4, #$FFF0, #$0200 )
    BRA code_0BC7A4
}

code_0BC7C1 {
    COP [9E] ( @code_0BC7CE, #$000C, #$FFF0, #$0200 )
    BRA code_0BC7A4
}

code_0BC7CE {
    COP [5B] ( #$0010 )
    COP [88] ( @table_0EE000 )
    COP [BC] ( #00, #02 )
    COP [80] ( #2A )
    COP [89]
    COP [BC] ( #00, #FA )
    COP [80] ( #08 )
    COP [89]
    LDA $player_actor
    STA $24
    LDA #$0008
    STA $0028, X
    LDA #$0001
    STA $7F0014, X
    SEP #$20
    LDA #$^e_actor_00E4DB
    PHA 
    REP #$20
    LDA #$&e_actor_00E4DB-1
    PHA 
    RTL 
}

code_0BC807 {
    COP [2A] ( #$0000, &code_0BC811, &code_0BC811, &code_0BC816 )
}

code_0BC811 {
    COP [8D] ( #1A )
    BRA code_0BC819
}

code_0BC816 {
    COP [8D] ( #9A )
}

code_0BC819 {
    COP [CA] ( #1E )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]

  code_0BC82A:
    COP [27] ( #0D )
    COP [2A] ( #$0000, &code_0BC837, &code_0BC837, &code_0BC84A )
}

code_0BC837 {
    COP [9E] ( @code_0BC85D, #$FFF4, #$FFF0, #$0200 )
    COP [84] ( #1A, #04 )
    COP [8A]
    BRA code_0BC82A
}

code_0BC84A {
    COP [9E] ( @code_0BC85D, #$000C, #$FFF0, #$0200 )
    COP [84] ( #9A, #04 )
    COP [8A]
    BRA code_0BC82A
}

code_0BC85D {
    COP [5B] ( #$0010 )
    COP [88] ( @table_0EE000 )
    COP [BC] ( #00, #02 )
    COP [80] ( #2A )
    COP [89]
    COP [BC] ( #00, #FA )
    COP [80] ( #03 )
    COP [89]
    LDA $player_actor
    STA $24
    LDA #$0003
    STA $0028, X
    LDA #$0003
    STA $7F0014, X
    SEP #$20
    LDA #$^e_actor_00E4DB
    PHA 
    REP #$20
    LDA #$&e_actor_00E4DB-1
    PHA 
    RTL 
}