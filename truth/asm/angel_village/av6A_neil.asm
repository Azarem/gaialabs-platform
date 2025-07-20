

---------------------------------------------

h_av6A_neil [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_av6A_neil {
    COP [D0] ( #8D, #01, &av6A_neil_destroy )
    COP [D0] ( #A9, #01, &code_06C065 )
    COP [D0] ( #8C, #01, &code_06C056 )
    COP [C0] ( &code_06C0CD )
    COP [0B]
    COP [C1]
    RTL 
}

code_06C056 {
    COP [25] ( #0F, #0E )
    COP [0B]
    COP [0C]
    COP [85] ( #19, #04, #01 )
    COP [8A]
}

code_06C065 {
    COP [25] ( #17, #0E )
    COP [80] ( #15 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_06C077 )
    COP [C1]
    RTL 
}

code_06C077 {
    COP [BF] ( &widestring_06C10D )
    COP [BE] ( #02, #01, &code_list_06C081 )
}

code_list_06C081 [
  &code_06C087   ;00
  &code_06C08C   ;01
  &code_06C087   ;02
]

code_06C087 {
    COP [BF] ( &widestring_06C136 )
    RTL 
}

code_06C08C {
    COP [BF] ( &widestring_06C15C )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0002
    STA $0D64
    LDA #$0003
    STA $0D66
    LDA #$0004
    STA $0D68
    LDA #$0005
    STA $0D6A
    LDA #$0404
    STA $064A
    COP [65] ( #$0384, #$0164, #00, #11 )
    COP [26] ( #78, #$0250, #$0370, #06, #$4500 )
    RTL 
}

code_06C0CD {
    COP [BF] ( &widestring_06C0D2 )
    RTL 
}

widestring_06C0D2 `[TPL:A][TPL:6][LU1:36]I [LU1:DA]the Angels [N]are descendants of the [N]Mu people.[PAL:0][END]`

widestring_06C10D `[TPL:A][TPL:6][LU1:36]Can we go now? [N] Yes [N] [LU2:42]a minute `

widestring_06C136 `[CLR][LU1:36][N]There's no hurry. [N]Take [LU1:FE]time.[PAL:0][END]`

widestring_06C15C `[CLR][LU1:36][N]I [LU1:DA][LU1:9F][LU1:ED]hot [N]in the Floating City. [FIN]Everyone be careful not[N]to get heat stroke.[PAL:0][END]`

---------------------------------------------

av6A_neil_destroy {
    COP [E0]
}