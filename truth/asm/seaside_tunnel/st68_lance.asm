

---------------------------------------------

h_st68_lance [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_st68_lance {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06AEBF )
}

code_list_06AEBF [
  &code_06AEC5   ;00
  &code_06AEF0   ;01
  &code_06AEF2   ;02
]

code_06AEC5 {
    COP [D2] ( #01, #01 )
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_06AEFE )
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [85] ( #09, #03, #11 )
    COP [8A]
    COP [80] ( #02 )
    COP [89]
    COP [C1]
    RTL 
}

code_06AEF0 {
    COP [E0]
}

code_06AEF2 {
    COP [25] ( #18, #1D )
    COP [80] ( #03 )
    COP [89]
    COP [C1]
    RTL 
}

code_06AEFE {
    COP [BF] ( &widestring_06AF03 )
    RTL 
}

widestring_06AF03 `[TPL:A][TPL:4]Lance: [N]I [LU1:F9]how far [LU1:D6][N]tunnel goes...[PAL:0][END]`