

---------------------------------------------

h_dc30_dog [
  h_actor < #48, #00, #10 >   ;00
]

---------------------------------------------

e_dc30_dog {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05AA89 )
    COP [0B]

  code_05AA7A:
    COP [CE] ( #01 )
    COP [D2] ( #01, #01 )
    COP [84] ( #48, #10 )
    COP [8A]
    BRA code_05AA7A
}

code_05AA89 {
    COP [BF] ( &widestring_05AA91 )
    COP [CC] ( #01 )
    RTL 
}

widestring_05AA91 `[DEF]Woof woof!![END]`