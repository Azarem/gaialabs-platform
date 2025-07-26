
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'

---------------------------------------------

h_floor_button [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_floor_button {
    LDA $0E
    STA $24
    LDA #$2000
    STA $0E
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]
    LDA #$0031
    TSB $12

  code_00CA1F:
    LDA #$00FF
    STA $7F0026, X
    COP [58] ( &code_00CA2D )
    COP [C1]
    RTL 
}

code_00CA2D {
    LDA $24
    JSL $@func_00B4BE
    COP [80] ( #10 )
    COP [89]
    COP [DA] ( #0F )
    COP [80] ( #0F )
    COP [89]
    BRA code_00CA1F
}