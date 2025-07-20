?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'


---------------------------------------------

h_wa78_moving_woman [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_moving_woman {
    JSL $@func_06B9F2
    COP [C0] ( &code_07840F )
    LDA #$000A
    STA $7F0026, X
    JSL $@func_00C718

  code_078403:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_078403
}

code_07840F {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07841A )
}

code_list_07841A [
  &code_07841C   ;00
]

code_07841C {
    COP [D0] ( #96, #01, &code_078427 )
    COP [BF] ( &widestring_07842C )
    RTL 
}

code_078427 {
    COP [BF] ( &widestring_07846A )
    RTL 
}

widestring_07842C `[DEF][SFX:10][LU1:66]This is[N][LU2:43]The [LU2:77]are[N]built on rafts. We like[N]to [LU1:B5]around.[END]`

widestring_07846A `[DEF][SFX:10]Woman:[N]A [LU2:C4]in pink[N]chanted over[N][LU1:D7]lotus leaf.[END]`