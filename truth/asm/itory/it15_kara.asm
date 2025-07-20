
!joypad_mask_std                065A

---------------------------------------------

h_it15_kara [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_it15_kara {
    COP [D0] ( #4B, #01, &code_04E110 )
    COP [D0] ( #37, #01, &code_04E112 )
    COP [D0] ( #2B, #00, &code_04E08B )
    COP [D0] ( #3B, #01, &code_04E110 )
    COP [25] ( #41, #27 )
    BRA code_04E0F1
}

code_04E08B {
    COP [D0] ( #26, #00, &code_04E110 )
    COP [D2] ( #01, #01 )
    COP [CA] ( #10 )
    LDA $16
    SEC 
    SBC #$0010
    STA $16
    COP [CB]
    COP [D2] ( #02, #01 )
    COP [80] ( #15 )
    COP [89]
    COP [BF] ( &widestring_04E124 )
    COP [CC] ( #03 )
    LDA #$0800
    TSB $10
    COP [81] ( #19, #11 )
    COP [89]
    COP [82] ( #16, #11 )
    COP [89]
    COP [81] ( #19, #01 )
    COP [89]
    COP [86] ( #16, #02, #01 )
    COP [8A]
    COP [85] ( #19, #06, #01 )
    COP [8A]
    COP [82] ( #16, #11 )
    COP [89]
    COP [85] ( #19, #02, #01 )
    COP [8A]
    COP [86] ( #17, #05, #12 )
    COP [8A]
    COP [81] ( #19, #11 )
    COP [89]
}

code_04E0F1 {
    COP [80] ( #15 )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #05, #01 )
    COP [BF] ( &widestring_04E175 )
    COP [86] ( #17, #04, #02 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04E110 {
    COP [E0]
}

code_04E112 {
    COP [25] ( #49, #27 )
    COP [0B]
    COP [C0] ( &code_04E11F )
    COP [C1]
    RTL 
}

code_04E11F {
    COP [BF] ( &widestring_04E196 )
    RTL 
}

widestring_04E124 `[TPL:E][TPL:1][LU1:25][N]I [LU1:78]help it. [N]My feet hurt. [FIN][TPL:2][LU1:2A]Oh, OK.[N][LU1:63][LU1:79][LU1:F0]me.[N][LU1:1F]show you my house.[PAL:0][END]`

widestring_04E175 `[TPL:E][TPL:1][LU1:25]Lilly, wait. [N][LU1:1F]go, too.[PAL:0][END]`

widestring_04E196 `[TPL:E][TPL:1][LU1:25]I [LU1:A4]you [N][LU1:82][LU1:BA]me.....[PAL:0][END]`