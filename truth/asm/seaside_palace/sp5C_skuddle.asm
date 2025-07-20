?INCLUDE 'table_0EE000'

!scene_current                  0644

---------------------------------------------

h_sp5C_skuddle [
  h_actor < #1D, #00, #00 >   ;00
]

---------------------------------------------

e_sp5C_skuddle {
    LDA #$0010
    TSB $12
    COP [13] ( &code_0AE6DA )
    BRA code_0AE6E2
}

code_0AE6DA {
    LDA #$2000
    TSB $10
    COP [C1]
    RTL 
}

code_0AE6E2 {
    COP [21] ( #02, &code_0AE74C )
    COP [9B] ( @code_0AE90D )
    COP [82] ( #1D, #43 )
    COP [89]
    BRA code_0AE6E2
}

---------------------------------------------

h_sp5C_ceiling_skuddle [
  h_actor < #1D, #02, #23 >   ;00
]

---------------------------------------------

e_sp5C_ceiling_skuddle {
    LDA #$0010
    TSB $12
    LDA $scene_current
    CMP #$005C
    BEQ code_0AE709
    CMP #$005D
    BNE code_0AE711
}

code_0AE709 {
    COP [D0] ( #70, #00, &code_0AE711 )
    COP [E0]
}

code_0AE711 {
    COP [21] ( #05, &code_0AE717 )
    RTL 
}

code_0AE717 {
    COP [A2] ( @func_0AE8B6, #$0301 )
    LDA #$2000
    TRB $10
    LDA $16
    STA $7F100E, X
    LDA $06C2
    SEC 
    SBC #$0020
    LSR 
    ASL 
    STA $16
    COP [C1]
    LDA $16
    INC 
    INC 
    STA $16
    CMP $7F100E, X
    BEQ code_0AE743
    RTL 
}

code_0AE743 {
    LDA #$0302
    TRB $10
    COP [A9]
    COP [C2]
}

code_0AE74C {
    LDA #$6000
    TRB $12
    STZ $24
    COP [2C] ( &code_0AE759, &code_0AE76F )
}

code_0AE759 {
    COP [2A] ( #$0000, &code_0AE763, &code_0AE763, &code_0AE769 )
}

code_0AE763 {
    COP [C8] ( &code_0AE787 )
    BRA code_0AE74C
}

code_0AE769 {
    COP [C8] ( &code_0AE7AA )
    BRA code_0AE74C
}

code_0AE76F {
    COP [2B] ( #$0000, &code_0AE779, &code_0AE779, &code_0AE77F )
}

code_0AE779 {
    COP [C8] ( &code_0AE7CD )
    BRA code_0AE74C
}

code_0AE77F {
    COP [C8] ( &code_0AE7F0 )
    BRA code_0AE74C
}

---------------------------------------------

func_0AE785 {
    COP [C2]
}

code_0AE787 {
    COP [2B] ( #$0000, &code_0AE791, &code_0AE791, &code_0AE79D )
}

code_0AE791 {
    JSR $&sub_0AE89E
    COP [14] ( #FF, #FF, &code_0AE79D )
    JMP $&code_0AE857
}

code_0AE79D {
    JSR $&sub_0AE89E
    COP [14] ( #FF, #01, &code_0AE7A8 )
    BRA code_0AE810
}

code_0AE7A8 {
    COP [C2]
}

code_0AE7AA {
    COP [2B] ( #$0000, &code_0AE7B4, &code_0AE7B4, &code_0AE7C0 )
}

code_0AE7B4 {
    JSR $&sub_0AE89E
    COP [14] ( #01, #FF, &code_0AE7C0 )
    JMP $&code_0AE87D
}

code_0AE7C0 {
    JSR $&sub_0AE89E
    COP [14] ( #01, #01, &func_0AE785 )
    BRA code_0AE836
}

---------------------------------------------

func_0AE7CB {
    COP [C2]
}

code_0AE7CD {
    COP [2A] ( #$0000, &code_0AE7D7, &code_0AE7D7, &code_0AE7E2 )
}

code_0AE7D7 {
    JSR $&sub_0AE89E
    COP [14] ( #FF, #FF, &code_0AE7E2 )
    BRA code_0AE857
}

code_0AE7E2 {
    JSR $&sub_0AE89E
    COP [14] ( #01, #FF, &code_0AE7EE )
    JMP $&code_0AE87D
}

code_0AE7EE {
    COP [C2]
}

code_0AE7F0 {
    COP [2A] ( #$0000, &code_0AE7FA, &code_0AE7FA, &code_0AE805 )
}

code_0AE7FA {
    JSR $&sub_0AE89E
    COP [14] ( #FF, #01, &code_0AE805 )
    BRA code_0AE810
}

code_0AE805 {
    JSR $&sub_0AE89E
    COP [14] ( #01, #01, &func_0AE7CB )
    BRA code_0AE836
}

code_0AE810 {
    COP [9B] ( @code_0AE8EA )
    LDA #$0100
    TSB $10
    LDA #$4000
    TSB $12
    COP [8D] ( #1D )
    COP [AC] ( #42, #41 )
    COP [C1]
    COP [8C] ( #02 )
    LDA #$0100
    TRB $10
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AE836 {
    COP [9B] ( @code_0AE8FE )
    LDA #$0100
    TSB $10
    COP [8D] ( #1D )
    COP [AC] ( #42, #41 )
    COP [C1]
    COP [8C] ( #02 )
    LDA #$0100
    TRB $10
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AE857 {
    COP [9B] ( @code_0AE8C2 )
    LDA #$0100
    TSB $10
    LDA #$4000
    TSB $12
    COP [8D] ( #1D )
    COP [AC] ( #42, #40 )
    COP [C1]
    COP [8C] ( #02 )
    LDA #$0100
    TRB $10
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AE87D {
    COP [9B] ( @code_0AE8D6 )
    LDA #$0100
    TSB $10
    COP [8D] ( #1D )
    COP [AC] ( #42, #40 )
    COP [C1]
    COP [8C] ( #02 )
    LDA #$0100
    TRB $10
    COP [C1]
    COP [89]
    COP [C5]
}

---------------------------------------------

sub_0AE89E {
    INC $24
    LDA $24
    CMP #$0004
    BCS code_0AE8A8
    RTS 
}

code_0AE8A8 {
    PLA 
    COP [9B] ( @code_0AE90D )
    COP [82] ( #1D, #43 )
    COP [89]
    COP [C5]
}

---------------------------------------------

func_0AE8B6 {
    COP [88] ( @table_0EE000 )

  code_0AE8BB:
    COP [80] ( #31 )
    COP [89]
    BRA code_0AE8BB
}

code_0AE8C2 {
    LDA #$2000
    TRB $10
    LDA #$0301
    TSB $10
    LDA #$6000
    TSB $12
    COP [8D] ( #1E )
    BRA code_0AE91C
}

code_0AE8D6 {
    LDA #$2000
    TRB $10
    LDA #$0301
    TSB $10
    LDA #$2000
    TSB $12
    COP [8D] ( #1E )
    BRA code_0AE91C
}

code_0AE8EA {
    LDA #$2000
    TRB $10
    LDA #$0301
    TSB $10
    LDA #$4000
    TSB $12
    COP [8D] ( #1E )
    BRA code_0AE91C
}

code_0AE8FE {
    LDA #$2000
    TRB $10
    LDA #$0301
    TSB $10
    COP [8D] ( #1E )
    BRA code_0AE91C
}

code_0AE90D {
    LDA #$2000
    TRB $10
    LDA #$0301
    TSB $10
    COP [8D] ( #1E )
    BRA code_0AE920
}

code_0AE91C {
    COP [AC] ( #42, #42 )
}

code_0AE920 {
    COP [C1]
    COP [8B]
    LDA $08
    STZ $08
    STA $26
    COP [C1]
    LDY $24
    LDA $0010, Y
    BIT #$0080
    BNE code_0AE941
    DEC $26
    BMI code_0AE93B
    RTL 
}

code_0AE93B {
    LDA $2A
    BEQ code_0AE941
    BRA code_0AE920
}

code_0AE941 {
    COP [E0]
}