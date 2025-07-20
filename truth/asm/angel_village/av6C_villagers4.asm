?INCLUDE 'func_06B9F2'


---------------------------------------------

h_av6C_villagers4 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_av6C_villagers4 {
    JSL $@func_06B9F2
    COP [C0] ( &code_06CA43 )
    LDA #$0200
    TSB $12

  code_06CA20:
    COP [85] ( #09, #02, #14 )
    COP [8A]
    COP [84] ( #05, #20 )
    COP [8A]
    COP [85] ( #09, #04, #13 )
    COP [8A]
    COP [84] ( #05, #20 )
    COP [8A]
    COP [85] ( #09, #02, #14 )
    COP [8A]
    BRA code_06CA20
}

code_06CA43 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06CA4E )
}

code_list_06CA4E [
  &code_06CA52   ;00
  &code_06CA57   ;01
]

code_06CA52 {
    COP [BF] ( &widestring_06CA5C )
    RTL 
}

code_06CA57 {
    COP [BF] ( &widestring_06CA71 )
    RTL 
}

widestring_06CA5C `[TPL:A][LU1:3D][LU2:73]love[N]to dance.[END]`

widestring_06CA71 `[TPL:A]The picture on [LU1:D7]wall[N]was painted by Ishtar.[FIN]But the model in the [N]painting was lost. [END]`