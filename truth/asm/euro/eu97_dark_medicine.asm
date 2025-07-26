
---------------------------------------------

h_eu97_dark_medicine [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_eu97_dark_medicine {
    COP [D0] ( #F1, #01, &code_07CE21 )
    COP [BC] ( #08, #00 )
    COP [A4] ( @code_07CEF4, #00, #EC, #$1000 )
    COP [C0] ( &code_07CDF7 )
    COP [C1]
    RTL 
}

code_07CDF7 {
    COP [BF] ( &widestring_07CE28 )
    COP [BE] ( #02, #02, &code_list_07CE01 )
}

code_list_07CE01 [
  &code_07CE07   ;00
  &code_07CE0C   ;01
  &code_07CE07   ;02
]

code_07CE07 {
    COP [BF] ( &widestring_07CEDD )
    RTL 
}

code_07CE0C {
    LDA $0B1C
    CMP #$0002
    BEQ code_07CE23
    LDA #$0001
    STA $0B1C
    COP [CC] ( #F1 )
    COP [BF] ( &widestring_07CE54 )
}

code_07CE21 {
    COP [E0]
}

code_07CE23 {
    COP [BF] ( &widestring_07CEB6 )
    RTL 
}

widestring_07CE28 `[DEF]That's [LU2:54]Dark[N]Medicine. Try some?[N] Yes[N] No`

widestring_07CE54 `[CLR][TPL:0]The smell makes my[N]nose [LU2:B9]up.[FIN]But [LU1:15][LU1:C]Power[N]has increased![FIN][PAL:0]The [LU1:C]Friar's power[N]is increased![END]`

widestring_07CEB6 `[CLR]The [LU1:C]Friar's power[N]is strong enough![END]`

widestring_07CEDD `[CLR]Really...[N][LU1:D]you [LU1:A5]it?[END]`

code_07CEF4 {
    COP [80] ( #26 )
    COP [89]
    RTL 
}