
---------------------------------------------

h_dm3F_elevator_sign [
  h_actor < #36, #01, #10 >   ;00
]

---------------------------------------------

e_dm3F_elevator_sign {
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D6B9 )
    COP [C1]
    RTL 
}

code_05D6B9 {
    COP [BF] ( &widestring_05D6BE )
    RTL 
}

widestring_05D6BE `[DEF](Elevator Entrance)[N]Use [LU1:D7][LU2:58]to[N]get to the elevator.[END]`