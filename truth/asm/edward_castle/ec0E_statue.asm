
?INCLUDE 'actor_00E256'

---------------------------------------------

h_ec0E_statue [
  h_actor < #36, #00, #10 >   ;00
]

---------------------------------------------

e_ec0E_statue {
    LDA #$0200
    TSB $12
    COP [D0] ( #21, #00, &code_0A8847 )
    COP [C0] ( &code_0A8853 )
}

code_0A8847 {
    COP [0B]
    COP [A2] ( @e_actor_00E256, #$2300 )
    COP [C1]
    RTL 
}

code_0A8853 {
    COP [BF] ( &widestring_0A8858 )
    RTL 
}

widestring_0A8858 `[DLG:3,11][SIZ:D,4][TPL:0]This has the [LU1:CD]shape[N]as the [LU1:C9][LU1:8E]the[N]seaside cave...[PAL:0][END]`