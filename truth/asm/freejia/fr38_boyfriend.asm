
---------------------------------------------

h_fr38_boyfriend [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_fr38_boyfriend {
    COP [BC] ( #FC, #00 )
    COP [C0] ( &code_05BB17 )
    COP [27] ( #01 )
    COP [DA] ( #1D )
    COP [8D] ( #09 )
    COP [AA] ( #13 )
    COP [C1]
    COP [8B]
    COP [C2]
    COP [C1]
    COP [8B]
    COP [C2]
    COP [AA] ( #00 )
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_05BB17 {
    COP [BF] ( &widestring_05BB1C )
    RTL 
}

widestring_05BB1C `[DEF]She, uh, was [LU1:A3][N]helping me... [N]Ha ha ha. [END]`