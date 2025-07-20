?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'


---------------------------------------------

h_av6B_villagers2 [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_av6B_villagers2 {
    JSL $@func_06B9F2
    COP [C0] ( &code_06CAEC )
    LDA #$000A
    STA $7F0026, X
    JSL $@func_00C718

  code_06CAE0:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_06CAE0
}

code_06CAEC {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06CAF7 )
}

code_list_06CAF7 [
  &code_06CAFD   ;00
  &code_06CB02   ;01
  &code_06CAFD   ;02
]

code_06CAFD {
    COP [BF] ( &widestring_06CB07 )
    RTL 
}

code_06CB02 {
    COP [BF] ( &widestring_06CB5E )
    RTL 
}

widestring_06CB07 `[TPL:A]We [LU1:98]no emotions...[FIN][LU1:20]neither laughed[N]nor cried [LU2:A4]the day[N]I was born.[FIN]I [LU1:A3]survive...[END]`

widestring_06CB5E `[TPL:A][LU1:39]a [LU1:9A][LU2:C4] [N]named [LU1:26][LU1:80][LU2:74][FIN]Ishtar praised her[N]beauty. Then she went[N]to his studio.[END]`