?INCLUDE 'table_0EE000'


---------------------------------------------

code_0ADA52 {
    COP [C8] ( &code_0ADB19 )
    COP [B9]
    COP [80] ( #2E )
    COP [89]

  code_0ADA5D:
    COP [82] ( #2B, #0B )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADA5D
}

code_0ADA69 {
    COP [C8] ( &code_0ADB19 )
    COP [B9]
    COP [80] ( #30 )
    COP [89]

  code_0ADA74:
    COP [83] ( #2D, #0A, #09 )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADA74
}

code_0ADA81 {
    COP [C8] ( &code_0ADB19 )
    LDA #$0002
    TSB $12
    COP [BB]
    COP [B9]
    COP [80] ( #30 )
    COP [89]

  code_0ADA93:
    COP [83] ( #2D, #09, #09 )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADA93
}

code_0ADAA0 {
    COP [C8] ( &code_0ADB19 )
    COP [80] ( #2F )
    COP [89]

  code_0ADAA9:
    COP [81] ( #2C, #0C )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADAA9
}

code_0ADAB5 {
    COP [C8] ( &code_0ADB19 )
    LDA #$0002
    TSB $12
    COP [BB]
    COP [80] ( #2F )
    COP [89]

  code_0ADAC5:
    COP [81] ( #2C, #0B )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADAC5
}

code_0ADAD1 {
    COP [C8] ( &code_0ADB19 )
    COP [80] ( #30 )
    COP [89]

  code_0ADADA:
    COP [83] ( #2D, #0A, #0A )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADADA
}

code_0ADAE7 {
    COP [C8] ( &code_0ADB19 )
    LDA #$0002
    TSB $12
    COP [BB]
    COP [80] ( #30 )
    COP [89]

  code_0ADAF7:
    COP [83] ( #2D, #09, #0A )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADAF7
}

code_0ADB04 {
    COP [C8] ( &code_0ADB19 )
    COP [80] ( #2E )
    COP [89]

  code_0ADB0D:
    COP [82] ( #2B, #0C )
    COP [89]
    COP [C8] ( &code_0ADB2D )
    BRA code_0ADB0D
}

code_0ADB19 {
    COP [B6] ( #30 )
    COP [88] ( @table_0EE000 )
    COP [C2]
    LDA #$2000
    TRB $10
    COP [07] ( #20 )
    COP [C5]
}

code_0ADB2D {
    LDA $10
    BIT #$4000
    BNE code_0ADB36
    COP [C5]
}

code_0ADB36 {
    COP [E0]
}