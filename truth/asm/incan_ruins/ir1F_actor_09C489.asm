
---------------------------------------------

h_ir1F_actor_09C489 [
  h_actor < #00, #00, #23 >   ;00
]

---------------------------------------------

e_ir1F_actor_09C489 {
    COP [D0] ( #3C, #01, &code_09C4B0 )
    COP [C1]
    LDA $0A00
    AND #$001E
    CMP #$001E
    BEQ code_09C4A0
    RTL 
}

code_09C4A0 {
    COP [08] ( #$0F0F )
    COP [32] ( #08 )
    COP [33]
    COP [CD] ( #$0108 )
    COP [CC] ( #3C )
}

code_09C4B0 {
    COP [E0]
}