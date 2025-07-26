
---------------------------------------------

h_sc01_girl2 [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_girl2 {
    COP [C0] ( &code_048166 )

  code_04813B:
    COP [0B]

  code_04813D:
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [85] ( #20, #02, #14 )
    COP [8A]
    COP [0B]
    COP [17] ( &code_048152 )
    BRA code_04813D
}

code_048152 {
    COP [CC] ( #03 )
    COP [0C]
    COP [85] ( #21, #06, #11 )
    COP [8A]
    COP [CE] ( #02 )
    COP [CE] ( #03 )
    BRA code_04813B
}

code_048166 {
    COP [BF] ( &widestring_04816B )
    RTL 
}

widestring_04816B `[DEF][LU1:1D]strange. This [N]game is like[N]"Red Light, [N]Green Lightˮ....[END]`