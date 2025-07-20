
!camera_bounds_y                06DC

---------------------------------------------

h_wa78_actor_0781BE [
  h_actor < #00, #00, #2B >   ;00
]

---------------------------------------------

e_wa78_actor_0781BE {
    LDA #$1000
    TSB $12
    LDA #$0400
    STA $camera_bounds_y
    COP [D2] ( #8D, #01 )
    LDA $06C2
    STA $16

  code_0781D5:
    LDA #$0000
    STA $7F000A, X

  code_0781DC:
    PHX 
    LDA $7F000A, X
    TAX 
    LDA $@binary_078238, X
    STA $0000
    LDA $@binary_078238+1, X
    STA $0002
    PLX 
    LDA #$0000
    SEP #$20
    LDA $0000
    BPL code_0781FE
    XBA 
    DEC 
    XBA 
}

code_0781FE {
    REP #$20
    STA $7F0010, X
    LDA $0002
    AND #$00FF
    BEQ code_0781D5
    STA $7F0012, X
    COP [C1]
    LDA $7F0012, X
    BEQ code_07822C
    DEC 
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC $06C2
    STA $06C2
    STA $06C4
    RTL 
}

code_07822C {
    LDA $7F000A, X
    INC 
    INC 
    STA $7F000A, X
    BRA code_0781DC
}

---------------------------------------------

binary_078238 #0104020403030403050206020702080209040A020B020C020D020E030F0310041104113C110410040F030E030D020C020B020A02090408020702060205020403030302040104003C0000