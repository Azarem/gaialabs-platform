
---------------------------------------------

h_fr32_slaver1 [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_slaver1 {
    COP [D0] ( #5A, #01, &code_05B839 )
    COP [0B]
    COP [C0] ( &code_05B83B )

  code_05B825:
    COP [80] ( #21 )
    COP [89]
    COP [D0] ( #5A, #00, &code_05B825 )
    COP [0C]
    COP [85] ( #20, #04, #02 )
    COP [8A]
}

code_05B839 {
    COP [E0]
}

code_05B83B {
    COP [BF] ( &widestring_05B840 )
    RTL 
}

widestring_05B840 `[DEF]Where'd he go...[END]`