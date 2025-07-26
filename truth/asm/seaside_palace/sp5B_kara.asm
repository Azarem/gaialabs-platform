
?INCLUDE 'func_00C7FA'

---------------------------------------------

h_sp5B_kara [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_sp5B_kara {
    COP [D0] ( #70, #01, &code_068657 )
    COP [A0] ( @func_00C7FA, #$0000, #$0000, #$2800 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_068659 )

  code_06863B:
    COP [85] ( #20, #04, #12 )
    COP [8A]
    COP [84] ( #1C, #78 )
    COP [8A]
    COP [85] ( #21, #04, #11 )
    COP [8A]
    COP [84] ( #1D, #78 )
    COP [8A]
    BRA code_06863B
}

code_068657 {
    COP [E0]
}

code_068659 {
    COP [BF] ( &widestring_06865E )
    RTL 
}

widestring_06865E `[TPL:A][TPL:1][LU1:25][N]Will...Where... [N][LU1:65]is it...??[PAL:0][END]`