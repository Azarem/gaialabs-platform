
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_av6C_villagers5 [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_av6C_villagers5 {
    JSL $@func_06B9F2
    COP [C0] ( &code_06CD7A )
    LDA #$0200
    TSB $12

  code_06CD57:
    COP [85] ( #10, #02, #14 )
    COP [8A]
    COP [84] ( #0C, #20 )
    COP [8A]
    COP [85] ( #10, #04, #13 )
    COP [8A]
    COP [84] ( #0C, #20 )
    COP [8A]
    COP [85] ( #10, #02, #14 )
    COP [8A]
    BRA code_06CD57
}

code_06CD7A {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06CD85 )
}

code_list_06CD85 [
  &code_06CD8B   ;00
  &code_06CD90   ;01
  &code_06CD95   ;02
]

code_06CD8B {
    COP [BF] ( &widestring_06CD9A )
    RTL 
}

code_06CD90 {
    COP [BF] ( &widestring_06CDD4 )
    RTL 
}

code_06CD95 {
    COP [BF] ( &widestring_06CE56 )
    RTL 
}

widestring_06CD9A `[TPL:A]I dance to remember [N][LU1:F7]it feels [LU1:A5]to be [N]human. But... [END]`

widestring_06CDD4 `[TPL:B]We are expressionless,[N]but Ishtar painted us[N][LU1:F0]faces overflowing[N][LU1:F0][LU1:9A]kindness.[FIN]After that, [LU1:C1][N]wanting to be painted [N]flocked [LU2:74][END]`

widestring_06CE56 `[TPL:A]I [LU2:BB]to dance [LU1:F0]the [N]person in [LU1:D7]picture. [END]`