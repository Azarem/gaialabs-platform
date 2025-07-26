
?INCLUDE 'nv_actor_0881A5'

---------------------------------------------

h_nvAC_erik [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_nvAC_erik {
    COP [D0] ( #B6, #01, &code_0885A1 )
    COP [D0] ( #CF, #01, &code_0885A1 )
    COP [D0] ( #B2, #01, &code_0885C5 )
    COP [D0] ( #AF, #01, &code_0885A3 )
    COP [D0] ( #AD, #01, &code_0885A1 )
    COP [D0] ( #AC, #01, &code_088589 )
    COP [D2] ( #AC, #01 )
    COP [DA] ( #1F )
    COP [87] ( #08, #08, #02, #14 )
    COP [8A]
    COP [81] ( #08, #02 )
    COP [89]
    COP [86] ( #07, #04, #02 )
    COP [8A]
}

code_088589 {
    COP [25] ( #0B, #11 )
    COP [80] ( #03 )
    COP [89]
    COP [0B]
    COP [D2] ( #AD, #01 )
    COP [0C]
    COP [86] ( #07, #05, #02 )
    COP [8A]
}

code_0885A1 {
    COP [E0]
}

code_0885A3 {
    COP [25] ( #0A, #10 )
    COP [80] ( #2F )
    COP [89]
    COP [0B]
    COP [D2] ( #05, #01 )
    COP [9C] ( @code_0881AE, #$1002 )
    COP [80] ( #02 )
    COP [89]
    COP [C0] ( &code_0885D7 )
    COP [C1]
    RTL 
}

code_0885C5 {
    COP [25] ( #12, #0B )
    COP [80] ( #04 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_0885D7 )
    COP [C1]
    RTL 
}

code_0885D7 {
    COP [BF] ( &widestring_0885DC )
    RTL 
}

widestring_0885DC `[TPL:E][TPL:3]Erik: This tribe is so [N]small. They [LU1:98][LU2:7A][N]so [LU1:B6]to starvation. [FIN]Brothers, sisters... [N]husbands, wives... [N]How do [LU2:AB]cope?[PAL:0][END]`