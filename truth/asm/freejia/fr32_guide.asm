
?INCLUDE 'town_door'
?INCLUDE 'table_0EDA00'

---------------------------------------------

h_fr32_guide [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_guide {
    COP [D0] ( #57, #01, &code_05B203 )
    COP [A0] ( @code_05B315, #$0278, #$0230, #$1000 )
    COP [D0] ( #64, #01, &code_05B1F1 )
    COP [D2] ( #02, #01 )
    COP [85] ( #08, #04, #02 )
    COP [8A]
    COP [86] ( #06, #02, #11 )
    COP [8A]
    COP [80] ( #02 )
    COP [89]
    COP [BF] ( &widestring_05B225 )
    COP [CE] ( #02 )
    COP [D2] ( #03, #01 )
    COP [81] ( #09, #11 )
    COP [89]
    COP [82] ( #07, #02 )
    COP [89]
    COP [85] ( #09, #09, #01 )
    COP [8A]
    COP [86] ( #07, #06, #02 )
    COP [8A]
    COP [81] ( #09, #11 )
    COP [89]
}

code_05B1F1 {
    COP [80] ( #04 )
    COP [89]
    COP [25] ( #28, #25 )
    COP [C0] ( &code_05B21B )
    COP [0B]
    COP [C1]
    RTL 
}

code_05B203 {
    COP [A0] ( @e_town_door, #$0278, #$0230, #$1000 )
    COP [C0] ( &code_05B220 )
    COP [25] ( #29, #24 )
    COP [0B]
    COP [C1]
    RTL 
}

code_05B21B {
    COP [BF] ( &widestring_05B2D3 )
    RTL 
}

code_05B220 {
    COP [BF] ( &widestring_05B2DC )
    RTL 
}

widestring_05B225 `[TPL:E][LU1:32][LU1:62]a cute couple.[N][LU2:14]you decided where[N][LU1:FF]staying tonight?[FIN][TPL:1][LU1:25]No. [N]Not yet. [LU2:3F][LU1:AB][N]for someone. [FIN][TPL:6][LU1:32][LU1:63]well.[N]Why not base your[N]search here?[FIN][TPL:1][LU1:25][LU1:1D]settled! [N]I'm exhausted!![PAL:0][END]`

widestring_05B2D3 `[DEF][LU1:63][LU1:79]in.[END]`

widestring_05B2DC `[DEF][LU2:2A]tourists have[N]avoided [LU1:D6]town...[N]Business is terrible.[END]`

code_05B315 {
    COP [88] ( @table_0EDA00 )
    COP [80] ( #01 )
    COP [89]
    COP [0B]
    COP [D2] ( #05, #01 )
    COP [06] ( #0E )
    COP [0C]
    COP [E0]
}