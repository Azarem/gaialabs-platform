
?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

---------------------------------------------

h_wa78_water_kid [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_water_kid {
    JSL $@func_06B9F2
    COP [C0] ( &code_0784BD )
    LDA #$0012
    STA $7F0026, X
    JSL $@func_00C718

  code_0784B1:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_0784B1
}

code_0784BD {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_0784C8 )
}

code_list_0784C8 [
  &code_0784CA   ;00
]

code_0784CA {
    COP [BF] ( &widestring_0784CF )
    RTL 
}

widestring_0784CF `[DEF][SFX:10]Child:[N]We drink [LU1:D6]water,[N]cook [LU1:F0]it,[N]wash [LU1:F0]it.[END]`