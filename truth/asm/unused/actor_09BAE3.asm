
?INCLUDE 'table_0EE000'

---------------------------------------------

h_actor_09BAE3 [
  h_actor < #00, #00, #03 >   ;00
]

---------------------------------------------

e_actor_09BAE3 {
    COP [88] ( @table_0EE000 )
    LDA #$0000
    STA $28

  code_09BAF0:
    COP [C1]
    COP [8B]
    LDA $0656
    BIT #$0080
    BNE code_09BAFD
    RTL 
}

code_09BAFD {
    LDA $28
    INC 
    CMP #$0033
    BCC code_09BB08
    LDA #$0000
}

code_09BB08 {
    STA $28
    STZ $2A
    LDA #$0080
    TSB $0658
    COP [C2]
    BRA code_09BAF0
    RTL 
}