
---------------------------------------------

h_ec0E_barrier1 [
  h_actor < #3C, #10, #00 >   ;00
]

---------------------------------------------

e_ec0E_barrier1 {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [86] ( #3E, #04, #12 )
    COP [8A]
    COP [85] ( #3E, #04, #11 )
    COP [8A]
    COP [0B]
    COP [D2] ( #01, #00 )
    COP [0C]
    COP [85] ( #3E, #04, #12 )
    COP [8A]
    COP [86] ( #3E, #04, #11 )
    COP [8A]
    BRA e_ec0E_barrier1
}

---------------------------------------------

h_ec0E_barrier2 [
  h_actor < #3C, #10, #00 >   ;00
]

---------------------------------------------

e_ec0E_barrier2 {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [86] ( #3E, #02, #12 )
    COP [8A]
    COP [DA] ( #1F )
    COP [85] ( #3E, #02, #11 )
    COP [8A]
    COP [0B]
    COP [D2] ( #01, #00 )
    COP [0C]
    COP [85] ( #3E, #02, #12 )
    COP [8A]
    COP [DA] ( #1F )
    COP [86] ( #3E, #02, #11 )
    COP [8A]
    BRA e_ec0E_barrier2
}

---------------------------------------------

h_ec0E_barrier3 [
  h_actor < #3C, #10, #00 >   ;00
]

---------------------------------------------

e_ec0E_barrier3 {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [85] ( #3E, #02, #12 )
    COP [8A]
    COP [DA] ( #1F )
    COP [86] ( #3E, #02, #12 )
    COP [8A]
    COP [0B]
    COP [D2] ( #01, #00 )
    COP [0C]
    COP [86] ( #3E, #02, #11 )
    COP [8A]
    COP [DA] ( #1F )
    COP [85] ( #3E, #02, #11 )
    COP [8A]
    BRA e_ec0E_barrier3
}

---------------------------------------------

h_ec0E_barrier4 [
  h_actor < #3C, #10, #00 >   ;00
]

---------------------------------------------

e_ec0E_barrier4 {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [85] ( #3E, #04, #12 )
    COP [8A]
    COP [86] ( #3E, #04, #12 )
    COP [8A]
    COP [0B]
    COP [D2] ( #01, #00 )
    COP [0C]
    COP [86] ( #3E, #04, #11 )
    COP [8A]
    COP [85] ( #3E, #04, #11 )
    COP [8A]
    BRA e_ec0E_barrier4
}