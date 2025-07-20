?INCLUDE 'chunk_028000'


---------------------------------------------

h_mu62_hope_statue1 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mu62_hope_statue1 {
    COP [CC] ( #78 )
    COP [C0] ( &code_0698B2 )
    COP [D2] ( #79, #01 )
    COP [E0]
}

code_0698B2 {
    JSL $@func_02A10A
    BCS code_0698CC
    COP [D4] ( #12, &code_0698CD )
    COP [CC] ( #79 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_0698D2 )
}

code_0698CC {
    RTL 
}

code_0698CD {
    COP [BF] ( &widestring_069925 )
    RTL 
}

widestring_0698D2 `[DEF][SFX:0][DLY:9][LU1:67][LU1:8F]the [N][LU1:48]of Hope! [N][PAU:3C][DLY:2]The [LU1:48]of Hope... [N][PAU:1E]Was [LU1:D9]a room [N][LU1:F0]the [LU1:CD]name...?[PAU:5A][END]`

widestring_069925 `[DEF][LU1:67][LU1:8F]the [LU1:48][N]of Hope! But [LU1:FE][N][LU1:A0]is full! [END]`

---------------------------------------------

h_mu62_hope_statue2 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mu62_hope_statue2 {
    COP [C0] ( &code_06995A )
    COP [D2] ( #7F, #01 )
    COP [E0]
}

code_06995A {
    JSL $@func_02A10A
    BCS code_069974
    COP [D4] ( #12, &code_0698CD )
    COP [CC] ( #7F )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_069975 )
}

code_069974 {
    RTL 
}

widestring_069975 `[DEF][SFX:0][DLY:9][LU1:67][LU1:8F]the [N][LU1:48]of Hope! [N][PAU:3C][DLY:2]The [LU1:48]of Hope... [N][PAU:1E]Was [LU1:D9][LU1:6E]room[N][LU1:F0]the [LU1:CD]name...?[PAU:5A][END]`