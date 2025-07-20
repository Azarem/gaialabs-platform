

---------------------------------------------

h_nvAE_erik [
  h_actor < #03, #00, #30 >   ;00
]

---------------------------------------------

e_nvAE_erik {
    COP [D0] ( #B6, #01, &code_089771 )
    COP [D0] ( #CF, #01, &code_08975A )
    COP [D2] ( #BF, #01 )
    COP [D2] ( #C0, #01 )
    COP [D2] ( #C1, #01 )
    COP [DA] ( #59 )
    LDA #$2000
    TRB $10
    COP [86] ( #07, #03, #02 )
    COP [8A]
}

code_08975A {
    COP [25] ( #08, #0A )
    LDA #$2000
    TRB $10
    COP [80] ( #03 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_089773 )
    COP [C1]
    RTL 
}

code_089771 {
    COP [E0]
}

code_089773 {
    COP [BF] ( &widestring_089778 )
    RTL 
}

widestring_089778 `[DEF][TPL:3]Erik: The traders [N]knew [LU1:D9]was no food [N]here, and led [N]the [LU1:7D]away. [FIN]A [LU1:DE]story.[PAL:0][END]`