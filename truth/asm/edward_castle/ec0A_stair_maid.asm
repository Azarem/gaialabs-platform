
---------------------------------------------

h_ec0A_stair_maid [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_stair_maid {
    COP [C0] ( &code_04C808 )
    COP [0B]
    COP [C1]
    RTL 
}

code_04C808 {
    COP [D0] ( #21, #01, &code_04C813 )
    COP [BF] ( &widestring_04C818 )
    RTL 
}

code_04C813 {
    COP [BF] ( &widestring_04C85A )
    RTL 
}

widestring_04C818 `[DEF]So [LU1:FF]Will.[N]You [LU1:F2]summoned by[N][LU1:27]Edward?[FIN]Be careful [LU1:F6]you[N][LU2:87][LU1:F0]him.[END]`

widestring_04C85A `[DEF]Are you [LU1:93]to [LU1:E7][N][LU1:26]out of the castle?[FIN][LU1:D]let the [LU1:27]find[N]you... [LU1:3B][LU1:E7][N][LU2:57]of the Princess.[END]`