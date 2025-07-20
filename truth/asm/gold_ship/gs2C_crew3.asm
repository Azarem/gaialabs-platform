

---------------------------------------------

h_gs2C_crew3 [
  h_actor < #0D, #00, #10 >   ;00
]

---------------------------------------------

e_gs2C_crew3 {
    COP [C0] ( &code_058348 )

  code_05830C:
    COP [82] ( #0E, #11 )
    COP [89]
    COP [85] ( #11, #02, #11 )
    COP [8A]
    COP [82] ( #0F, #12 )
    COP [89]
    COP [0B]
    COP [84] ( #0C, #3C )
    COP [8A]
    COP [0C]
    COP [82] ( #0E, #11 )
    COP [89]
    COP [85] ( #10, #02, #12 )
    COP [8A]
    COP [82] ( #0F, #12 )
    COP [89]
    COP [0B]
    COP [84] ( #0D, #3C )
    COP [8A]
    COP [0C]
    BRA code_05830C
}

code_058348 {
    COP [BF] ( &widestring_05834D )
    RTL 
}

widestring_05834D `[DEF]The Queen is in her [N]stateroom. [LU1:3B]show [N]her [LU1:D7][LU1:FF]OK. [END]`