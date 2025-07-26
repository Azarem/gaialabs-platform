
?INCLUDE 'func_00C7FA'

---------------------------------------------

h_sp5B_neil [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_sp5B_neil {
    COP [D0] ( #70, #01, &code_068985 )
    COP [A0] ( @func_00C7FA, #$0000, #$0000, #$2800 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_068987 )

  code_068969:
    COP [85] ( #18, #04, #12 )
    COP [8A]
    COP [84] ( #14, #78 )
    COP [8A]
    COP [85] ( #19, #04, #11 )
    COP [8A]
    COP [84] ( #15, #78 )
    COP [8A]
    BRA code_068969
}

code_068985 {
    COP [E0]
}

code_068987 {
    COP [BF] ( &widestring_06898C )
    RTL 
}

widestring_06898C `[TPL:A][TPL:6][LU1:36][N]Uhhhn. Uhhhn.[PAL:0][END]`