
---------------------------------------------

h_na4B_erik [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_na4B_erik {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_05F269 )
    COP [0C]
    COP [86] ( #0F, #03, #12 )
    COP [8A]
    COP [81] ( #10, #12 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [0B]
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [25] ( #14, #09 )
    COP [80] ( #0B )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05F26E )
    COP [D2] ( #08, #01 )
    COP [80] ( #0C )
    COP [89]
    COP [D2] ( #09, #01 )
    COP [C0] ( &code_05F273 )
    COP [0C]
    COP [86] ( #0E, #09, #01 )
    COP [8A]
    COP [85] ( #11, #05, #01 )
    COP [8A]
    COP [86] ( #0E, #07, #01 )
    COP [8A]
    COP [82] ( #0E, #11 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_05F269 {
    COP [BF] ( &widestring_05F278 )
    RTL 
}

code_05F26E {
    COP [BF] ( &widestring_05F29F )
    RTL 
}

code_05F273 {
    COP [BF] ( &widestring_05F2C7 )
    RTL 
}

widestring_05F278 `[DEF][TPL:3]Erik: [N][LU1:1D]scary... [LU1:1F]stay [N][LU1:F0]Neil.[PAL:0][END]`

widestring_05F29F `[DEF][TPL:3]Erik: [N][LU1:64][LU1:93]to [N]happen? [LU1:1D]exciting![PAL:0][END]`

widestring_05F2C7 `[DEF][TPL:3]Erik:[N][LU1:64][LU1:93]to[N]happen... [LU1:1D]exciting![PAL:0][END]`