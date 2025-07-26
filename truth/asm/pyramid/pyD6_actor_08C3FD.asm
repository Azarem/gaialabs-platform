
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_pyD6_actor_08C3FD [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_pyD6_actor_08C3FD {
    LDA #$0031
    TSB $12
    COP [12] ( #34, #4B )
    COP [12] ( #35, #4B )
    COP [12] ( #36, #4B )
    COP [12] ( #37, #4B )
    COP [12] ( #38, #4B )
    COP [12] ( #39, #4B )
    COP [12] ( #34, #4C )
    COP [12] ( #35, #4C )
    COP [12] ( #36, #4C )
    COP [12] ( #37, #4C )
    COP [12] ( #38, #4C )
    COP [12] ( #39, #4C )
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]

  code_08C448:
    COP [58] ( &code_08C456 )
    COP [C1]
    LDA #$7FFF
    STA $7F0026, X
    RTL 
}

code_08C456 {
    COP [D0] ( #0F, #00, &code_08C461 )
    COP [C4] ( @code_08C448 )
}

code_08C461 {
    COP [CC] ( #0F )
    COP [80] ( #11 )
    COP [89]
    COP [0F] ( #34, #2B )
    COP [0F] ( #35, #2B )
    COP [0F] ( #36, #2B )
    COP [0F] ( #37, #2B )
    COP [0F] ( #38, #2B )
    COP [0F] ( #39, #2B )
    COP [0F] ( #34, #2C )
    COP [0F] ( #35, #2C )
    COP [0F] ( #36, #2C )
    COP [0F] ( #37, #2C )
    COP [0F] ( #38, #2C )
    COP [0F] ( #39, #2C )
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    CMP #$FE00
    BEQ code_08C4AB
    DEC 
    STA $0026, Y
    RTL 
}

code_08C4AB {
    COP [10] ( #34, #4B )
    COP [10] ( #35, #4B )
    COP [10] ( #36, #4B )
    COP [10] ( #37, #4B )
    COP [10] ( #38, #4B )
    COP [10] ( #39, #4B )
    COP [10] ( #34, #4C )
    COP [10] ( #35, #4C )
    COP [10] ( #36, #4C )
    COP [10] ( #37, #4C )
    COP [10] ( #38, #4C )
    COP [10] ( #39, #4C )
    COP [08] ( #$1515 )
    COP [80] ( #12 )
    COP [89]
    COP [CE] ( #0F )
    JMP $&code_08C448
}