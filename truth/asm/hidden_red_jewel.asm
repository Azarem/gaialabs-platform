?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'


---------------------------------------------

h_hidden_red_jewel [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_hidden_red_jewel {
    COP [C0] ( &code_00C681 )
    COP [88] ( @table_0EE000 )
    COP [8D] ( #00 )
    COP [C1]
    RTL 
}

code_00C681 {
    LDA $0E
    CLC 
    ADC #$0080
    JSL $@func_00B489
    BCS code_00C6A5
    COP [D4] ( #01, &code_00C6A1 )
    COP [BF] ( &widestring_00C6A6 )
    LDA $0E
    CLC 
    ADC #$0080
    JSL $@func_00B481
    RTL 
}

code_00C6A1 {
    COP [BF] ( &widestring_00C6BF )
}

code_00C6A5 {
    RTL 
}

widestring_00C6A6 `[DLG:3,11][SIZ:D,3]You [LU1:8F]a Red Jewel![END]`

widestring_00C6BF `[DLG:3,11][SIZ:D,3]You [LU1:8F]a Jewel but[N][LU1:FE][LU1:A0]is full.[END]`