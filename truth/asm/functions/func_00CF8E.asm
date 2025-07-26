
---------------------------------------------

func_00CF8E {
    COP [CA] ( #78 )
    COP [23]
    AND #$0003
    SEC 
    SBC #$0001
    PHA 
    CLC 
    ADC $06C2
    STA $06C2
    PLA 
    CLC 
    ADC $06C4
    STA $06C4
    COP [CB]
    COP [E0]
}