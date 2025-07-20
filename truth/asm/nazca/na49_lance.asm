

---------------------------------------------

h_na49_lance [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_na49_lance {
    COP [0B]
    COP [C0] ( &code_05E1E9 )
    COP [D2] ( #01, #01 )
    COP [86] ( #07, #05, #12 )
    COP [8A]
    COP [80] ( #03 )
    COP [89]
    COP [D2] ( #03, #01 )
    COP [84] ( #05, #14 )
    COP [8A]
    COP [84] ( #02, #1E )
    COP [8A]
    COP [BF] ( &widestring_05E1EE )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [85] ( #08, #04, #12 )
    COP [8A]
    COP [82] ( #06, #13 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [0D] ( #00, #01 )
    COP [D2] ( #08, #01 )
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [BF] ( &widestring_05E227 )
    COP [CC] ( #6D )
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
    COP [65] ( #$0274, #$0264, #00, #0D )
    COP [26] ( #4B, #$0120, #$0080, #00, #$4400 )
    COP [C1]
    RTL 
}

code_05E1E9 {
    COP [BF] ( &widestring_05E1EE )
    RTL 
}

widestring_05E1EE `[TPL:A][TPL:4]Lance: [LU1:20][LU2:89]had mine [N]on for three weeks.[N]I [LU2:6E]I lose![END]`

widestring_05E227 `[TPL:A][TPL:4]Lance: [LU2:3F]going, too![FIN]We [LU1:82][LU1:F1]Will to be[N]the [LU2:89]one having [N]a [LU1:94]time. [FIN][PAL:0]The group [LU2:C1]to the [N]Nazca Desert...[END]`