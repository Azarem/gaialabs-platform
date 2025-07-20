

---------------------------------------------

h_sc01_worried_woman [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_worried_woman {
    COP [C0] ( &code_048719 )
    COP [0B]
    COP [DA] ( #B3 )
    COP [80] ( #14 )
    COP [89]
    COP [DA] ( #77 )
    COP [80] ( #15 )
    COP [89]
    COP [C3] ( @code_048674, #$053C )
}

code_048674 {
    COP [4B] ( #2C, #0E, #F9 )
    LDA #$0200
    TSB $12
    COP [80] ( #3C )
    COP [89]
    LDA #$0200
    TRB $12
    COP [0C]
    COP [82] ( #2E, #11 )
    COP [89]
    COP [85] ( #30, #10, #12 )
    COP [8A]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [80] ( #2C )
    COP [89]
    COP [DA] ( #1D )
    COP [80] ( #2D )
    COP [89]
    LDA #$0200
    TSB $12
    COP [80] ( #3D )
    COP [89]
    LDA #$0200
    TRB $12
    COP [4B] ( #1C, #0E, #F8 )
    COP [80] ( #14 )
    COP [89]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [80] ( #15 )
    COP [89]
    COP [4B] ( #1C, #0E, #F9 )
    LDA #$0200
    TSB $12
    COP [80] ( #3C )
    COP [89]
    LDA #$0200
    TRB $12
    COP [82] ( #2E, #11 )
    COP [89]
    COP [85] ( #31, #10, #11 )
    COP [8A]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [80] ( #2D )
    COP [89]
    LDA #$0200
    TSB $12
    COP [80] ( #3D )
    COP [89]
    LDA #$0200
    TRB $12
    COP [4B] ( #2C, #0E, #F8 )
    COP [80] ( #15 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_048719 {
    COP [BF] ( &widestring_04871E )
    RTL 
}

widestring_04871E `[DEF]I'm worried. There's[N][LU1:70]a lot of strange[N][LU2:86]lately[N]doing business...[END]`