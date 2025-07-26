
---------------------------------------------

h_na49_erik [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_na49_erik {
    COP [0B]
    COP [C0] ( &code_05E2C9 )
    COP [D2] ( #01, #01 )
    COP [86] ( #0F, #05, #12 )
    COP [8A]
    COP [80] ( #0B )
    COP [89]
    COP [D2] ( #05, #01 )
    COP [82] ( #0F, #12 )
    COP [89]
    COP [85] ( #10, #03, #12 )
    COP [8A]
    COP [80] ( #0C )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_05E2C9 {
    COP [BF] ( &widestring_05E2CE )
    RTL 
}

widestring_05E2CE `[TPL:A][TPL:3]Erik: Seth [LU1:EF]be [N]pleased [LU1:F6]he [N]sees [LU1:D6]invention...[END]`