?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'


---------------------------------------------

h_eu91_men2 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_men2 {
    JSL $@func_06B9F2
    COP [C0] ( &code_07C94C )
    LDA #$0002
    STA $7F0026, X
    JSL $@func_00C718

  code_07C940:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_07C940
}

code_07C94C {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07C957 )
}

code_list_07C957 [
  &code_07C961   ;00
  &code_07C966   ;01
  &code_07C96B   ;02
  &code_07C966   ;03
  &code_07C966   ;04
]

code_07C961 {
    COP [BF] ( &widestring_07C970 )
    RTL 
}

code_07C966 {
    COP [BF] ( &widestring_07C9DB )
    RTL 
}

code_07C96B {
    COP [BF] ( &widestring_07C9FF )
    RTL 
}

widestring_07C970 `[DEF]The [LU1:BD]day, a man [N][LU2:54]the Jackal[N]was asking questions. [FIN]He had the [LU1:A9]of [N]evil. I [LU1:DA][N]he was chasing someone.[END]`

widestring_07C9DB `[DEF]The [LU2:8D]of Rolek[N]lives in [LU1:D6]mansion.[END]`

widestring_07C9FF `[DEF]The [LU1:E2]has changed.[N]Rolek's sudden growth[N]has [LU1:75]many[N][LU2:86]to the town.[FIN]There is something[N][LU2:51]the success.[END]`