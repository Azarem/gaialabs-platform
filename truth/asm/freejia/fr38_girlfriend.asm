

---------------------------------------------

h_fr38_girlfriend [
  h_actor < #0D, #00, #10 >   ;00
]

---------------------------------------------

e_fr38_girlfriend {
    COP [C0] ( &code_05BABD )
    COP [BC] ( #04, #00 )
    COP [27] ( #01 )
    COP [DA] ( #1D )
    COP [8D] ( #10 )
    COP [AA] ( #14 )
    COP [C1]
    COP [8B]
    COP [C2]
    COP [C1]
    COP [8B]
    COP [C2]
    COP [AA] ( #00 )
    COP [80] ( #0C )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_05BABD {
    COP [BF] ( &widestring_05BAC2 )
    RTL 
}

widestring_05BAC2 `[DEF]He had [LU1:C8][N]in his eye... [N]Ha ha ha. [END]`