
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_av6B_villagers3 [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_av6B_villagers3 {
    LDA $0E
    AND #$0030
    LSR 
    LSR 
    LSR 
    LSR 
    CLC 
    ADC $28
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_06CBD3 )
    COP [0B]
    COP [C1]
    RTL 
}

code_06CBD3 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06CBDE )
}

code_list_06CBDE [
  &code_06CBE4   ;00
  &code_06CBE9   ;01
  &code_06CBE4   ;02
]

code_06CBE4 {
    COP [BF] ( &widestring_06CBEE )
    RTL 
}

code_06CBE9 {
    COP [BF] ( &widestring_06CC22 )
    RTL 
}

widestring_06CBEE `[TPL:A][LU1:1D][LU1:70][LU1:D4][LU1:D7][N]we are the form [LU1:A1][N]which humans evolve. [END]`

widestring_06CC22 `[TPL:B][LU1:1F]show you the way to[N]the studio. Remember it.[FIN]Go [LU1:F0]the wind. [FIN]If you [LU1:A9]at which [N]way the torch flame [N]bends,[N]you'll understand.[FIN]Down the [LU2:5C]street,[N][LU1:DC][LU1:F4]the wind[N]blows, to [LU1:F4]you can[N][LU1:9B]the waterfall.[FIN]Then [LU1:A9]for the place[N][LU1:F4]the sound of the[N]waterfall is loud.[FIN][LU2:17]studio is[N]in front. Be careful.[END]`