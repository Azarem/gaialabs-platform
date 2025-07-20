
!scene_current                  0644

---------------------------------------------

widestring_058000 `An [LU1:8A]who sought [N]the Incan [LU1:19]Ship...? [FIN]`

---------------------------------------------

h_gs2B_actor_058027 [
  h_actor < #00, #00, #2B >   ;00
]

---------------------------------------------

e_gs2B_actor_058027 {
    LDA $scene_current
    CMP #$002D
    BCC code_058041
    CMP #$002F
    BCS code_058041
    LDA $06C4
    SEC 
    SBC #$0020
    STA $06C4
}

code_058041 {
    LDA #$0000
    STA $7F000A, X

  code_058048:
    PHX 
    LDA $7F000A, X
    TAX 
    LDA $@binary_0580B0, X
    STA $0000
    LDA $@binary_0580B0+1, X
    STA $0002
    PLX 
    LDA #$0000
    SEP #$20
    LDA $0000
    BPL code_05806A
    XBA 
    DEC 
    XBA 
}

code_05806A {
    REP #$20
    STA $7F0010, X
    LDA $0002
    AND #$00FF
    BEQ code_058041
    STA $7F0012, X
    COP [C1]
    LDA $7F0012, X
    BEQ code_0580A4
    DEC 
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC $06C4
    STA $06C4
    LDA $scene_current
    CMP #$002F
    BEQ code_05809D
    RTL 
}

code_05809D {
    LDA $06C4
    STA $06C2
    RTL 
}

code_0580A4 {
    LDA $7F000A, X
    INC 
    INC 
    STA $7F000A, X
    BRA code_058048
}

---------------------------------------------

binary_0580B0 #010100030101000301010002010100020101000101010001010100010101000101040101000101010001010100010101000101010002010100020101000301010003003CFF010003FF010003FF010002FF010002FF010001FF010001FF010001FF010001FF04FF010001FF010001FF010001FF010001FF010002FF010002FF010003FF010003003C0000

---------------------------------------------

code_05F859 {
    LDA $06C2
    STA $16

  code_05F85E:
    LDA #$0000
    STA $7F000A, X

  code_05F865:
    PHX 
    LDA $7F000A, X
    TAX 
    LDA $@binary_0580B0, X
    STA $0000
    LDA $@binary_0580B0+1, X
    STA $0002
    PLX 
    LDA #$0000
    SEP #$20
    LDA $0000
    BPL code_05F887
    XBA 
    DEC 
    XBA 
}

code_05F887 {
    REP #$20
    STA $7F0010, X
    LDA $0002
    AND #$00FF
    BEQ code_05F85E
    STA $7F0012, X
    COP [C1]
    LDA $7F0012, X
    BEQ code_05F8B3
    DEC 
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC $16
    STA $16
    STA $06C2
    RTL 
}

code_05F8B3 {
    LDA $7F000A, X
    INC 
    INC 
    STA $7F000A, X
    JMP $&code_05F865
}