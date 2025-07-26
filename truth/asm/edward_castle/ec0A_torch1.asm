
?INCLUDE 'table_0EDA00'

---------------------------------------------

h_ec0A_torch1 [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_ec0A_torch1 {
    COP [D0] ( #21, #00, &code_04BFB8 )
    COP [BC] ( #04, #03 )
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #06 )
    COP [23]
    AND #$0007
    STA $08
    COP [C2]

  code_04BFAE:
    COP [27] ( #02 )
    COP [80] ( #06 )
    COP [89]
    BRA code_04BFAE
}

code_04BFB8 {
    COP [E0]
}