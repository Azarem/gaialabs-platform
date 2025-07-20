

---------------------------------------------

h_dm3F_elevator_door [
  h_actor < #35, #01, #30 >   ;00
]

---------------------------------------------

e_dm3F_elevator_door {
    COP [BC] ( #08, #FE )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D661 )
    COP [D2] ( #69, #01 )
    COP [32] ( #7B )
    COP [33]
    COP [CD] ( #$017B )
    COP [E0]
}

code_05D661 {
    COP [D7] ( #0F, &code_05D66B )
    COP [BF] ( &widestring_05D676 )
    RTL 
}

code_05D66B {
    COP [CC] ( #69 )
    COP [D5] ( #0F )
    COP [BF] ( &widestring_05D696 )
    RTL 
}

widestring_05D676 `[DEF]There's one keyhole[N]in [LU1:D6]door.[END]`

widestring_05D696 `[DEF]You [LU2:BB]the[N][LU2:5E]key![END]`