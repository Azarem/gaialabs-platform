
---------------------------------------------

h_av69_erik [
  h_actor < #0B, #00, #18 >   ;00
]

---------------------------------------------

e_av69_erik {
    COP [D0] ( #8D, #01, &av69_erik_destroy )
    COP [D0] ( #75, #01, &av69_erik_destroy )
    COP [D2] ( #01, #01 )
    COP [DA] ( #1D )
    COP [86] ( #0F, #05, #12 )
    COP [8A]
    COP [81] ( #11, #11 )
    COP [89]
    COP [86] ( #0F, #04, #12 )
    COP [8A]
    COP [84] ( #0C, #1E )
    COP [8A]
    COP [80] ( #0A )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [85] ( #10, #02, #12 )
    COP [8A]
    COP [82] ( #0E, #11 )
    COP [89]
    COP [86] ( #0F, #02, #13 )
    COP [8A]
}

av69_erik_destroy {
    COP [E0]
}