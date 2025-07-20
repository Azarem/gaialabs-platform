
!joypad_mask_std                065A

---------------------------------------------

h_ec0A_left_guard [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_left_guard {
    COP [D0] ( #21, #01, &code_04C04B )
    COP [C0] ( &code_04C05D )
    COP [D0] ( #3F, #01, &code_04BFFD )
    LDA #$CFF0
    TSB $joypad_mask_std
}

code_04BFFD {
    COP [85] ( #21, #07, #11 )
    COP [8A]
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [D0] ( #3F, #01, &code_04C023 )
    COP [BF] ( &widestring_04C115 )
    COP [CC] ( #3F )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04C023 {
    COP [84] ( #1C, #08 )
    COP [8A]
    COP [85] ( #20, #1B, #12 )
    COP [8A]
    COP [84] ( #1C, #08 )
    COP [8A]
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [85] ( #21, #14, #11 )
    COP [8A]
    BRA code_04BFFD
}

code_04C04B {
    COP [C0] ( &code_04C062 )
    COP [25] ( #06, #27 )
    COP [0B]
    COP [80] ( #1A )
    COP [89]
    COP [C1]
    RTL 
}

code_04C05D {
    COP [BF] ( &widestring_04C067 )
    RTL 
}

code_04C062 {
    COP [BF] ( &widestring_04C0AF )
    RTL 
}

widestring_04C067 `[TPL:A]This is [LU1:27]Edward's[N]castle.[FIN]Go to the second[N][LU2:65]if you [LU1:F1]to[N][LU2:87][LU1:27]Edward.[END]`

widestring_04C0AF `[TPL:B]Ah! [LU1:1D]you![FIN][LU1:67]escaped[N][LU1:8E]the prison...[FIN]Trust [LU1:F7]I say. Run[N][LU1:8E][LU1:D6]castle. It'd[N]be [LU1:DE]if King[N][LU1:11][LU1:8F]you here.[END]`

widestring_04C115 `[TPL:A][LU1:45]This is King[N]Edward's castle. I must[N]report [LU1:D6]intrusion.[FIN][DLG:3,6][SIZ:D,3][TPL:0]Will shows the letter[N]to the guard.[FIN][TPL:A][PAL:0][LU1:45]A guest of the[N]King? I'm sorry, you[N]may pass.[END]`