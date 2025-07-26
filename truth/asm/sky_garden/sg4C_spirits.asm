
---------------------------------------------

h_sg4C_spirit1 [
  h_actor < #3C, #00, #10 >   ;00
]

---------------------------------------------

e_sg4C_spirit1 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05F36C )
    COP [0B]
    COP [C1]
    COP [80] ( #3C )
    COP [89]
    RTL 
}

code_05F36C {
    COP [BF] ( &widestring_05F371 )
    RTL 
}

widestring_05F371 `[DEF][LU1:31]Tribe:[N]We [LU2:87]again. Ku ku ku.[N][LU1:69]a strong boy[N]to [LU1:98][LU1:79][LU1:D6]far.[END]`

---------------------------------------------

h_sg4C_spirit2 [
  h_actor < #3C, #00, #10 >   ;00
]

---------------------------------------------

e_sg4C_spirit2 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05F3C4 )
    COP [0B]
    COP [C1]
    COP [80] ( #3C )
    COP [89]
    RTL 
}

code_05F3C4 {
    COP [BF] ( &widestring_05F3C9 )
    RTL 
}

widestring_05F3C9 `[DEF][LU1:31]Tribe: This Sky[N]Garden is our mode[N]of transportation.[FIN]There are four [LU1:7][N]Balls in four locations.[N]Find each one in [N]clockwise order... [END]`

---------------------------------------------

h_sg4C_spirit3 [
  h_actor < #3C, #00, #10 >   ;00
]

---------------------------------------------

e_sg4C_spirit3 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05F469 )
    COP [0B]
    COP [C1]
    COP [80] ( #3C )
    COP [89]
    RTL 
}

code_05F469 {
    COP [BF] ( &widestring_05F46E )
    RTL 
}

widestring_05F46E `[DEF][LU1:31]Tribe: Drop off the [N]cliff at the front and [N][LU1:73]to [LU1:90]the [N]up-side down world... [END]`