?INCLUDE 'func_00C7FA'


---------------------------------------------

h_sp5B_erik [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_sp5B_erik {
    COP [D0] ( #70, #01, &code_0688AF )
    COP [A0] ( @func_00C7FA, #$0000, #$0000, #$2800 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_0688B1 )

  code_068893:
    COP [85] ( #10, #04, #12 )
    COP [8A]
    COP [84] ( #0C, #78 )
    COP [8A]
    COP [85] ( #11, #04, #11 )
    COP [8A]
    COP [84] ( #0D, #78 )
    COP [8A]
    BRA code_068893
}

code_0688AF {
    COP [E0]
}

code_0688B1 {
    COP [BF] ( &widestring_0688B6 )
    RTL 
}

widestring_0688B6 `[TPL:A][TPL:3]Erik: [LU1:62]is [LU1:D6][N]place? [LU1:C]and lonely. [N]Mother, [LU1:D1]me...[PAL:0][END]`