
?INCLUDE 'dark_space'

---------------------------------------------

h_gw88_actor_07BDE8 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_gw88_actor_07BDE8 {
    COP [D1] ( #$0174, #01, &code_07BE09 )
    COP [C1]
    LDA $0A9F
    AND #$00FF
    CMP #$003F
    BEQ code_07BE00
    RTL 
}

code_07BE00 {
    COP [32] ( #74 )
    COP [33]
    COP [CD] ( #$0174 )
}

code_07BE09 {
    COP [A0] ( @code_08D6B5, #$01C8, #$0280, #$2B00 )
    LDA #$0001
    STA $0024, Y
    LDA #$2000
    STA $000E, Y
    COP [E0]
}