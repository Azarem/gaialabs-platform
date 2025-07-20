?BANK 09
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'
?INCLUDE 'ec11_countdown'


---------------------------------------------

h_ec11_button_voice [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_ec11_button_voice {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]

  code_09BCEC:
    LDA #$00FF
    STA $7F0026, X
    COP [58] ( &code_09BCFF )
    COP [80] ( #0F )
    COP [89]
    COP [C1]
    RTL 
}

code_09BCFF {
    LDA #$0200
    TSB $10
    COP [D1] ( #$0113, #01, &code_09BD25 )
    COP [D0] ( #02, #00, &code_09BD25 )
    COP [D0] ( #01, #01, &code_09BD39 )
    COP [80] ( #11 )
    COP [89]
    COP [BF] ( &widestring_09BD58 )
    COP [CC] ( #03 )
    BRA code_09BD2A
}

code_09BD25 {
    COP [80] ( #11 )
    COP [89]
}

code_09BD2A {
    COP [80] ( #12 )
    COP [89]
    LDA #$0200
    TRB $10
    COP [C4] ( @code_09BCEC )
}

code_09BD39 {
    COP [CE] ( #02 )
    COP [80] ( #11 )
    COP [89]
    COP [32] ( #13 )
    COP [33]
    COP [CD] ( #$0113 )
    COP [08] ( #$0F0F )
    COP [BF] ( &widestring_09BD92 )
    COP [07] ( #16 )
    COP [C1]
    RTL 
}

widestring_09BD58 `[DEF][TPL:2]Wait! I told you,[N]you [LU1:98]to push them[N]at the [LU1:CD]time![FIN][JMP:&widestring_09BE70+M]`

widestring_09BD92 `[PAU:1E][DEF][TPL:2]Stop![N]The [LU2:58]is open!![FIN]Go in!![END]`