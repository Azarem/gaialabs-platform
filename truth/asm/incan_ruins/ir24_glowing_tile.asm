

---------------------------------------------

h_ir24_glowing_tile [
  h_actor < #00, #00, #23 >   ;00
]

---------------------------------------------

e_ir24_glowing_tile {
    COP [D1] ( #$0112, #01, &code_09C6A7 )

  code_09C678:
    LDA #$0258
    STA $7F0010, X
    COP [C1]
    COP [45] ( #14, #17, #17, #1A, &code_09C68E )
    COP [C4] ( @code_09C678 )
}

code_09C68E {
    LDA $7F0010, X
    DEC 
    BEQ code_09C69A
    STA $7F0010, X
    RTL 
}

code_09C69A {
    COP [08] ( #$0F0F )
    COP [32] ( #12 )
    COP [33]
    COP [CD] ( #$0112 )
}

code_09C6A7 {
    COP [E0]
}