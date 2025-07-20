?INCLUDE 'table_0EE000'


---------------------------------------------

func_00D718 {
    LDA #$2000
    TSB $10
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [DA] ( #0B )
    COP [A4] ( @code_00D74E, #E7, #D8, #$0700 )
    COP [DA] ( #02 )
    COP [A4] ( @code_00D772, #19, #E8, #$0700 )
    COP [DA] ( #04 )
    COP [A4] ( @code_00D74E, #E7, #F8, #$0700 )
    COP [DA] ( #62 )
    COP [E0]
}

code_00D74E {
    LDA #$0001
    TSB $10
    COP [83] ( #15, #2D, #2F )
    COP [89]
    LDA #$0001
    TRB $10
    LDA #$0002
    TSB $10
    COP [83] ( #15, #2E, #30 )
    COP [89]
    LDA #$0002
    TRB $10
    BRA code_00D74E
}

code_00D772 {
    LDA #$0001
    TSB $10
    COP [83] ( #15, #2E, #2F )
    COP [89]
    LDA #$0001
    TRB $10
    LDA #$0002
    TSB $10
    COP [83] ( #15, #2D, #30 )
    COP [89]
    LDA #$0002
    TRB $10
    BRA code_00D772
}