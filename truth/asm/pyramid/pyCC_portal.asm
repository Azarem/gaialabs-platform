
?INCLUDE 'py_actor_08B6F4'

!player_actor                   09AA

---------------------------------------------

h_pyCC_portal [
  h_actor < #1C, #01, #20 >   ;00
]

---------------------------------------------

e_pyCC_portal {
    COP [D0] ( #FC, #01, &code_08CD93 )
    COP [BC] ( #08, #0C )
    COP [D2] ( #D1, #01 )
    LDA #$1000
    TSB $10
    LDA #$2000
    TRB $10
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08CD95 )
    COP [C1]
    RTL 
}

code_08CD93 {
    COP [E0]
}

code_08CD95 {
    COP [BF] ( &widestring_08CDDA )
    COP [BE] ( #02, #02, &code_list_08CD9F )
}

code_list_08CD9F [
  &code_08CDA5   ;00
  &code_08CDA5   ;01
  &code_08CDAA   ;02
]

code_08CDA5 {
    COP [BF] ( &widestring_08CE10 )
    RTL 
}

code_08CDAA {
    COP [BF] ( &widestring_08CE10 )
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [9C] ( @e_py_actor_08B6F4, #$1800 )
    LDA #$0303
    STA $0648
    LDA #$0303
    STA $064A
    COP [26] ( #DD, #$00F8, #$01B0, #00, #$2200 )
    COP [C1]
    RTL 
}

widestring_08CDDA `[DEF]The mummified queen of[N]the [LU1:3F]appears.[N] Quit[N] Jump in`

widestring_08CE10 `[CLD]`