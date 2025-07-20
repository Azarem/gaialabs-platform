
!joypad_mask_std                065A

---------------------------------------------

h_sc01_house_intro [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sc01_house_intro {
    COP [C1]
    COP [28] ( #$0208, #$00E0, &code_04BC9B )
    COP [28] ( #$0208, #$00DF, &code_04BC9B )
    COP [28] ( #$0128, #$0258, &code_04BCD8 )
    COP [28] ( #$0228, #$0218, &code_04BCE6 )
    COP [28] ( #$0218, #$0178, &code_04BCE6 )
    COP [28] ( #$0298, #$02C0, &code_04BCF4 )
    RTL 
}

code_04BC9B {
    COP [D0] ( #26, #01, &code_04BCA7 )
    COP [D0] ( #21, #01, &code_04BCBF )
}

code_04BCA7 {
    COP [D0] ( #12, #01, &code_04BCB4 )
    COP [CC] ( #12 )
    COP [BF] ( &widestring_04BD1B )
}

code_04BCB4 {
    COP [26] ( #06, #$0058, #$01C0, #00, #$2110 )
    RTL 
}

code_04BCBF {
    COP [26] ( #06, #$0058, #$01C0, #00, #$2110 )
    RTL 
    COP [D0] ( #12, #01, &code_04BCD7 )
    COP [CC] ( #12 )
    COP [BF] ( &widestring_04BD1B )
}

code_04BCD7 {
    RTL 
}

code_04BCD8 {
    COP [D0] ( #13, #01, &code_04BCE5 )
    COP [CC] ( #13 )
    COP [BF] ( &widestring_04BD5F )
}

code_04BCE5 {
    RTL 
}

code_04BCE6 {
    COP [D0] ( #14, #01, &code_04BCF3 )
    COP [CC] ( #14 )
    COP [BF] ( &widestring_04BD9B )
}

code_04BCF3 {
    RTL 
}

code_04BCF4 {
    COP [D0] ( #17, #01, &code_04BD16 )
    COP [D0] ( #16, #00, &code_04BD16 )
    COP [CC] ( #17 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04BE05 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04BD16 {
    COP [C4] ( @e_sc01_house_intro )
}

widestring_04BD1B `[TPL:10][TPL:0]This is my house.[N]The pie [LU1:D7][N][LU1:17]Lola is making[N]smells [LU2:95]great.[PAL:0][END]`

widestring_04BD5F `[TPL:10][TPL:0]This is Lance's house.[N]He lives [LU2:73][LU1:F0]his[N]frail mother.[PAL:0][END]`

widestring_04BD9B `[TPL:10][TPL:0]My friend Erik [N]lives here.[FIN]This is the biggest[N][LU2:70]in [LU1:47]Cape.[N]Will envied [LU1:C1]born[N]to rich families...[PAL:0][END]`

widestring_04BE05 `[TPL:10][TPL:0]It was already [N][LU2:5C]by the [LU1:DF]Will [N][LU1:AE]the cave.[PAL:0][END]`