?INCLUDE 'func_00CF8E'
?INCLUDE 'pyCD_jackal'

!camera_bounds_y                06DC

---------------------------------------------

h_pyCD_flame_statue1 [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_pyCD_flame_statue1 {
    LDA #$0100
    STA $camera_bounds_y
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [BC] ( #F8, #00 )
    COP [D2] ( #01, #01 )
    COP [DA] ( #1D )
    COP [08] ( #$1919 )
    COP [9C] ( @func_00CF8E, #$2000 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #3B )
    LDA #$0800
    TSB $10
    COP [80] ( #1D )
    COP [89]
    COP [9E] ( @code_08B7D0, #$0004, #$FFF0, #$2800 )
    LDA #$0008
    STA $0026, Y
    COP [CC] ( #03 )
    COP [C1]
    RTL 
}

---------------------------------------------

h_pyCD_flame_statue2 [
  h_actor < #9C, #00, #10 >   ;00
]

---------------------------------------------

e_pyCD_flame_statue2 {
    COP [80] ( #9C )
    COP [89]
    COP [0B]
    COP [BC] ( #08, #00 )
    COP [D2] ( #01, #01 )
    COP [DA] ( #59 )
    LDA #$0800
    TSB $10
    COP [80] ( #9D )
    COP [89]
    COP [9E] ( @code_08B7D0, #$FFFC, #$FFF0, #$2800 )
    LDA #$FFF8
    STA $0026, Y
    COP [C1]
    RTL 
}

code_08B7D0 {
    COP [CA] ( #05 )
    COP [9C] ( @func_08B804, #$0B02 )
    COP [DA] ( #03 )
    LDA $14
    CLC 
    ADC $26
    STA $14
    COP [CB]
    COP [E0]
}