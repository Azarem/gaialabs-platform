
!player_y_pos                   09A4

---------------------------------------------

h_sc01_guard [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_guard {
    COP [D0] ( #27, #01, &code_04859B )
    COP [0B]
    COP [C1]
    LDA $player_y_pos
    CMP #$00B0
    BCS code_048573
    COP [0C]
    COP [0D] ( #FF, #FF )
    COP [0D] ( #FE, #FF )
    COP [81] ( #08, #12 )
    COP [89]
    COP [82] ( #07, #12 )
    COP [89]
    COP [81] ( #08, #14 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [D0] ( #35, #01, &code_048574 )
    COP [C0] ( &code_0485A4 )
    COP [C1]
}

code_048573 {
    RTL 
}

code_048574 {
    COP [C0] ( &code_0485A9 )
    COP [D2] ( #27, #01 )
    COP [10] ( #17, #06 )
    COP [10] ( #18, #06 )
    COP [81] ( #09, #13 )
    COP [89]
    COP [82] ( #06, #11 )
    COP [89]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
}

code_04859B {
    COP [0B]
    COP [C0] ( &code_0485B1 )
    COP [C1]
    RTL 
}

code_0485A4 {
    COP [BF] ( &widestring_0485B6 )
    RTL 
}

code_0485A9 {
    COP [BF] ( &widestring_048612 )
    COP [CC] ( #27 )
    RTL 
}

code_0485B1 {
    COP [BF] ( &widestring_048647 )
    RTL 
}

widestring_0485B6 `[DEF]Hold it! [LU2:20][LU1:87][N]are prowling [LU1:6D][N][LU1:BF]the town. [FIN][LU2:7][LU1:FE]teacher warn[N]you not to [LU1:AC]town[N][LU1:F8][LU1:FE]parents?[END]`

widestring_048612 `[DEF][LU1:27][LU1:11]has summoned[N]you to the castle?[N][LU1:63][LU1:A3]be careful.[END]`

widestring_048647 `[DEF]Be careful.[END]`