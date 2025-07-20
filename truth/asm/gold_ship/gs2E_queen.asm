
!_TM                            212C

---------------------------------------------

h_gs2E_queen [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_gs2E_queen {
    COP [D0] ( #4F, #01, &code_058A0F )
    COP [9C] ( @code_058B07, #$2000 )
}

code_058A0F {
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_058A1D )
    COP [C1]
    RTL 
    COP [C1]
    RTL 
}

code_058A1D {
    COP [D0] ( #4E, #01, &code_058A2B )
    COP [BF] ( &widestring_058A30 )
    COP [CC] ( #4E )
    RTL 
}

code_058A2B {
    COP [BF] ( &widestring_058A30+M )
    RTL 
}

widestring_058A30 `[TPL:B][TPL:3][LU1:1E]Queen:[N][LU1:18]You have[N][LU2:96]safely.[FIN]As you [LU1:F2]told, [N][LU2:BC]now [LU1:20][LU1:70][N]guarding the Mystic [N][LU1:48]of the Wind. [FIN]That's the [LU1:C9]you [N][LU1:F2]awarded [N]by the spirits. [FIN][::][TPL:B][TPL:3][LU1:1D]in the jewel box in [N]the storehouse below, [N]Look for yourself.[PAL:0][END]`

code_058B07 {
    COP [C1]
    SEP #$20
    LDA #$15
    STA $_TM
    REP #$20
    COP [D0] ( #4F, #01, &code_058B19 )
    RTL 
}

code_058B19 {
    COP [E0]
}