

---------------------------------------------

h_gs2C_crew2 [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_gs2C_crew2 {
    COP [C0] ( &code_0582C7 )

  code_05828B:
    COP [82] ( #07, #12 )
    COP [89]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [82] ( #06, #11 )
    COP [89]
    COP [0B]
    COP [84] ( #05, #3C )
    COP [8A]
    COP [0C]
    COP [82] ( #07, #12 )
    COP [89]
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [82] ( #06, #11 )
    COP [89]
    COP [0B]
    COP [84] ( #04, #3C )
    COP [8A]
    COP [0C]
    BRA code_05828B
}

code_0582C7 {
    COP [BF] ( &widestring_0582CC )
    RTL 
}

widestring_0582CC `[DEF][LU1:1D]a happy occasion![N]We [LU1:98]waited for you[N]for [LU1:CE]a [LU1:A6]time![END]`