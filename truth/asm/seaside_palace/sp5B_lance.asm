?INCLUDE 'func_00C7FA'


---------------------------------------------

h_sp5B_lance [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_sp5B_lance {
    COP [D0] ( #70, #01, &code_068929 )
    COP [A0] ( @func_00C7FA, #$0000, #$0000, #$2800 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_06892B )

  code_06890D:
    COP [85] ( #08, #04, #12 )
    COP [8A]
    COP [84] ( #04, #78 )
    COP [8A]
    COP [85] ( #09, #04, #11 )
    COP [8A]
    COP [84] ( #05, #78 )
    COP [8A]
    BRA code_06890D
}

code_068929 {
    COP [E0]
}

code_06892B {
    COP [BF] ( &widestring_068930 )
    RTL 
}

widestring_068930 `[TPL:A][TPL:4]Lance: [N]Uhhhn. Uhhhn.[PAL:0][END]`