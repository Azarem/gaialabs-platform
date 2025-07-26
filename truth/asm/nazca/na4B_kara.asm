
---------------------------------------------

h_na4B_kara [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_na4B_kara {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_05ED46 )
    COP [0C]
    COP [85] ( #21, #08, #01 )
    COP [8A]
    COP [82] ( #1E, #01 )
    COP [89]
    COP [85] ( #21, #02, #01 )
    COP [8A]
    COP [80] ( #1D )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05ED4B )
    LDA #$0200
    TSB $12
    COP [D2] ( #05, #01 )
    LDA #$0200
    TRB $12
    COP [0C]
    COP [86] ( #1E, #09, #01 )
    COP [8A]
    COP [85] ( #20, #05, #02 )
    COP [8A]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05ED53 )
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [25] ( #13, #09 )
    COP [80] ( #1B )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05ED46 )
    COP [D2] ( #08, #01 )
    COP [80] ( #1C )
    COP [89]
    COP [D2] ( #09, #01 )
    COP [C0] ( &code_05ED5B )
    COP [0C]
    COP [86] ( #1E, #09, #01 )
    COP [8A]
    COP [85] ( #21, #06, #01 )
    COP [8A]
    COP [86] ( #1E, #08, #01 )
    COP [8A]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [D2] ( #0C, #01 )
    COP [80] ( #1A )
    COP [89]
    LDA #$0800
    TSB $10
    COP [D2] ( #0D, #01 )
    COP [81] ( #20, #12 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [C1]
    RTL 
}

code_05ED46 {
    COP [BF] ( &widestring_05ED60 )
    RTL 
}

code_05ED4B {
    COP [BF] ( &widestring_05EDA1 )
    COP [CC] ( #05 )
    RTL 
}

code_05ED53 {
    COP [BF] ( &widestring_05EE15 )
    COP [CC] ( #06 )
    RTL 
}

code_05ED5B {
    COP [BF] ( &widestring_05EE7C )
    RTL 
}

widestring_05ED60 `[DEF][TPL:1][LU1:25]It [LU1:B2][N]be [LU1:95]to paint [N][LU1:CE]a [LU1:9C]painting on [N]a natural canvas.[PAL:0][END]`

widestring_05EDA1 `[DEF][TPL:1][LU1:25][LU1:61]you [LU1:A9]at [N]it [LU1:D6]way, [LU1:9F][LU1:A5][N]the white lines at an [N]athletic event. [FIN][LU1:30]the [LU1:6F]Nazca[N][LU1:C1]ran the 100 yard[N]dash here.[END]`

widestring_05EE15 `[DEF][TPL:1][LU1:25]This is the [N][LU1:A]stomach. If [N]you dig here, you [N]might [LU1:90]eggs. [FIN][LU1:1D]a joke (laughs).[N][LU1:D]be so serious.[END]`

widestring_05EE7C `[DEF][TPL:1][LU1:25][N][LU1:62]an exciting [N]experience...[PAL:0][END]`