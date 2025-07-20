

---------------------------------------------

h_sc01_girl1 [
  h_actor < #35, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_girl1 {
    LDA #$0200
    TSB $12
    COP [0B]

  code_0480B2:
    COP [C1]

  code_0480B4:
    COP [84] ( #32, #06 )
    COP [8A]
    COP [CC] ( #02 )
    COP [C0] ( &code_0480F0 )
    COP [84] ( #34, #46 )
    COP [8A]
    COP [CE] ( #02 )
    COP [84] ( #34, #1E )
    COP [8A]
    COP [C0] ( &code_0480F5 )
    COP [84] ( #32, #06 )
    COP [8A]
    COP [84] ( #35, #3C )
    COP [8A]
    COP [D0] ( #03, #00, &code_0480B4 )
    COP [C0] ( &code_0480FA )
    COP [D2] ( #03, #00 )
    BRA code_0480B2
}

code_0480F0 {
    COP [BF] ( &widestring_0480FF )
    RTL 
}

code_0480F5 {
    COP [BF] ( &widestring_048112 )
    RTL 
}

code_0480FA {
    COP [BF] ( &widestring_048125 )
    RTL 
}

widestring_0480FF `[DEF][DLY:2]1..2..3..4..5..[END]`

widestring_048112 `[DEF][DLY:2]6..7..8..9..10![END]`

widestring_048125 `[DEF]Mmmm. [LU1:38]me...[END]`