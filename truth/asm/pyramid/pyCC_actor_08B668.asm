
?INCLUDE 'chunk_008000'
?INCLUDE 'dark_space'

---------------------------------------------

h_pyCC_actor_08B668 [
  h_actor < #00, #00, #23 >   ;00
]

---------------------------------------------

e_pyCC_actor_08B668 {
    LDA $0E
    JSL $@func_00B4F6
    BCS code_08B67E
    COP [C1]
    LDA $0E
    JSL $@func_00B4F6
    BCS code_08B67E
    RTL 
}

code_08B67E {
    COP [9C] ( @code_08D6B5, #$2B00 )
    LDA #$2000
    STA $000E, Y
    LDA $0E
    CMP #$0072
    BEQ code_08B69A
    LDA #$0003
    STA $0024, Y
    BRA code_08B6A0
}

code_08B69A {
    LDA #$0001
    STA $0024, Y
}

code_08B6A0 {
    COP [E0]
}