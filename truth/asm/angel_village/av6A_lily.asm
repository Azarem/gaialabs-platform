
---------------------------------------------

h_av6A_lily [
  h_actor < #23, #00, #10 >   ;00
]

---------------------------------------------

e_av6A_lily {
    COP [D0] ( #8D, #01, &av6A_lily_destroy )
    COP [D0] ( #8C, #01, &code_06C2A6 )
    COP [C0] ( &code_06C2B8 )
    COP [0B]
    COP [C1]
    RTL 
}

code_06C2A6 {
    COP [25] ( #1A, #0E )
    COP [0B]
    COP [C0] ( &code_06C2B3 )
    COP [C1]
    RTL 
}

code_06C2B3 {
    COP [BF] ( &widestring_06C2F8 )
    RTL 
}

code_06C2B8 {
    COP [BF] ( &widestring_06C2BD )
    RTL 
}

widestring_06C2BD `[TPL:A][TPL:2][LU1:2A]Why do angels [N][LU1:AF]in [LU1:CE]a [LU2:5C][N]place? Feels so gloomy.[PAL:0][END]`

widestring_06C2F8 `[TPL:A][TPL:2][LU1:2A][N][LU1:26][LU1:AA]a  [N][LU1:A7]strange... [FIN]Has [LU1:C8][LU1:9D][N]to Kara? My intuition [N]is usually good.[PAL:0][END]`

---------------------------------------------

av6A_lily_destroy {
    COP [E0]
}