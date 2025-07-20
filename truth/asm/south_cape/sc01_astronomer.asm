

---------------------------------------------

h_sc01_astronomer [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_astronomer {
    COP [C0] ( &code_0488F6 )
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [85] ( #09, #03, #11 )
    COP [8A]
    COP [87] ( #09, #04, #11, #12 )
    COP [8A]
    COP [85] ( #09, #05, #11 )
    COP [8A]
    COP [86] ( #06, #02, #11 )
    COP [8A]
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [82] ( #07, #12 )
    COP [89]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [86] ( #07, #0C, #12 )
    COP [8A]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [87] ( #08, #03, #12, #12 )
    COP [8A]
    COP [85] ( #08, #06, #12 )
    COP [8A]
    COP [86] ( #07, #05, #12 )
    COP [8A]
    COP [85] ( #09, #06, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_0488F6 {
    COP [BF] ( &widestring_0488FB )
    RTL 
}

widestring_0488FB `[DEF]My astronomer friend[N][LU1:D4][LU1:C8]very[N]strange: a star is[N][LU2:45]the Earth.[END]`