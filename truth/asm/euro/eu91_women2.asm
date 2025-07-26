
?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

---------------------------------------------

h_eu91_women2 [
  h_actor < #2A, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_women2 {
    JSL $@func_06B9F2
    COP [C0] ( &code_07CA87 )
    LDA #$002A
    STA $7F0026, X
    JSL $@func_00C718

  code_07CA7B:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_07CA7B
}

code_07CA87 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07CA92 )
}

code_list_07CA92 [
  &code_07CA9C   ;00
  &code_07CAA1   ;01
  &code_07CA9C   ;02
  &code_07CAA6   ;03
  &code_07CAAB   ;04
]

code_07CA9C {
    COP [BF] ( &widestring_07CAB0 )
    RTL 
}

code_07CAA1 {
    COP [BF] ( &widestring_07CAE0 )
    RTL 
}

code_07CAA6 {
    COP [BF] ( &widestring_07CB09 )
    RTL 
}

code_07CAAB {
    COP [BF] ( &widestring_07CB60 )
    RTL 
}

widestring_07CAB0 `[DEF]There are [LU1:B6]back[N]alleys between the[N][LU2:77]in town.[END]`

widestring_07CAE0 `[DEF]There are [N][LU1:B6][LU1:C1]confined [N][LU1:EA]the shrine. [END]`

widestring_07CB09 `[DEF]Luggage is piled up in[N]the [LU1:7C][LU1:BC]door.[FIN][LU1:4A]you hear[N]groans [LU1:8E]the luggage[N][LU2:B0]moving. Odd...[END]`

widestring_07CB60 `[DEF]I saw that. There are [N][LU1:B6][LU1:C1]confined [N][LU1:EA]the school. [END]`