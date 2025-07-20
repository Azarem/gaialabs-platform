?BANK 05
?INCLUDE 'dark_space'


---------------------------------------------

h_dm40_hidden_dark_space [
  h_actor < #24, #00, #20 >   ;00
]

---------------------------------------------

e_dm40_hidden_dark_space {
    COP [D1] ( #$0132, #01, &code_05D62D )
    COP [D3] ( #$0132, #01 )
}

code_05D62D {
    COP [9C] ( @code_08D6B5, #$2B00 )
    LDA #$0001
    STA $0024, Y
    LDA #$2000
    STA $000E, Y
    COP [E0]
}