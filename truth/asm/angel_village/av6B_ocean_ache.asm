
?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

---------------------------------------------

h_av6B_ocean_ache [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_av6B_ocean_ache {
    JSL $@func_06B9F2
    COP [C0] ( &code_06C6FC )
    LDA #$0002
    STA $7F0026, X
    JSL $@func_00C718

  code_06C6F0:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_06C6F0
}

code_06C6FC {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06C707 )
}

code_list_06C707 [
  &code_06C70F   ;00
  &code_06C70F   ;01
  &code_06C70F   ;02
  &code_06C70F   ;03
]

code_06C70F {
    COP [BF] ( &widestring_06C714 )
    RTL 
}

widestring_06C714 `[TPL:9]I [LU1:82][LU1:A4][LU1:F6]we[N][LU1:CB][LU1:B1]here.[FIN]But [LU1:F6]I [LU1:A9]at the [N]ocean, my heart aches. [END]`