

---------------------------------------------

func_06B9F2 {
    LDA $0E
    AND #$000F
    STA $24
    LDA #$2000
    STA $0E
    LDA #$2000
    TRB $10
    LDA #$1000
    TSB $10
    RTL 
}