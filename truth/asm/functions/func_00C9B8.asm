
?INCLUDE 'table_0EE000'

---------------------------------------------

func_00C9B8 {
    COP [CA] ( #08 )
    COP [DA] ( #03 )
    COP [9C] ( @code_00C9C9, #$0302 )
    COP [CB]
    COP [E0]
}

code_00C9C9 {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [B6] ( #30 )
    COP [23]
    AND #$001F
    SEC 
    SBC #$0010
    CLC 
    ADC $14
    STA $14
    COP [23]
    AND #$001F
    SEC 
    SBC #$0010
    CLC 
    ADC $16
    STA $16
    COP [08] ( #$0F0F )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}