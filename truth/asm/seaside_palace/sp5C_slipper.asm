
!scene_current                  0644

---------------------------------------------

h_sp5C_slipper [
  h_actor < #19, #00, #03 >   ;00
]

---------------------------------------------

e_sp5C_slipper {
    COP [13] ( &code_0AE473 )
    LDA $scene_current
    CMP #$005C
    BNE code_0AE47B
    COP [D0] ( #70, #00, &code_0AE47B )
    COP [E0]
}

code_0AE473 {
    LDA #$2000
    TSB $10
    COP [C1]
    RTL 
}

code_0AE47B {
    COP [BC] ( #F8, #00 )
    LDA #$0080
    TSB $12
    COP [27] ( #08 )

  code_0AE487:
    COP [21] ( #05, &code_0AE4A5 )
    LDA #$0009
    STA $08
    RTL 
}

---------------------------------------------

func_0AE492 {
    COP [59] ( #$0000 )
    COP [80] ( #1C )
    COP [89]
    LDA #$0300
    TSB $10
    COP [C4] ( @code_0AE487 )
}

code_0AE4A5 {
    LDA #$0300
    TRB $10
    COP [80] ( #1A )
    COP [89]

  code_0AE4AF:
    COP [80] ( #1B )
    COP [89]
    LDA $10
    BIT #$4000
    BNE func_0AE492
    COP [21] ( #03, &code_0AE4F0 )
    COP [21] ( #06, &code_0AE4DF )
    COP [C6] ( &code_0AE4AF )
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AE4D7 )
}

code_list_0AE4D7 [
  &code_0AE5C8   ;00
  &code_0AE611   ;01
  &code_0AE641   ;02
  &code_0AE692   ;03
]

code_0AE4DF {
    COP [59] ( #$0000 )
    COP [84] ( #20, #03 )
    COP [8A]
    COP [8D] ( #27 )
    INC $24
    BRA code_0AE4F6
}

code_0AE4F0 {
    COP [59] ( &code_0AE539 )
    STZ $24
}

code_0AE4F6 {
    COP [23]
    AND #$0003
    BNE code_0AE505
    LDA $0411
    LSR 
    BCS code_0AE521
    BRA code_0AE50B
}

code_0AE505 {
    COP [2C] ( &code_0AE50B, &code_0AE521 )
}

code_0AE50B {
    COP [2A] ( #$0000, &code_0AE515, &code_0AE515, &code_0AE51B )
}

code_0AE515 {
    COP [C8] ( &code_0AE5C8 )
    BRA code_0AE4AF
}

code_0AE51B {
    COP [C8] ( &code_0AE611 )
    BRA code_0AE4AF
}

code_0AE521 {
    COP [2B] ( #$0000, &code_0AE52B, &code_0AE52B, &code_0AE532 )
}

code_0AE52B {
    COP [C8] ( &code_0AE641 )
    JMP $&code_0AE4AF
}

code_0AE532 {
    COP [C8] ( &code_0AE692 )
    JMP $&code_0AE4AF
}

code_0AE539 {
    COP [C1]
    COP [89]
    COP [21] ( #04, &code_0AE545 )
    JMP $&code_0AE4AF
}

code_0AE545 {
    COP [35]
    CMP #$0000
    BNE code_0AE56C
    COP [CA] ( #02 )
    COP [16] ( &code_0AE562 )
    COP [14] ( #FF, #01, &code_0AE562 )
    COP [AB] ( #11 )
    COP [C1]
    COP [89]
    COP [CB]
}

code_0AE562 {
    COP [8D] ( #27 )
    COP [C8] ( &code_0AE674 )
    JMP $&code_0AE4AF
}

code_0AE56C {
    DEC 
    BNE code_0AE58B
    COP [CA] ( #02 )
    COP [14] ( #FE, #00, &code_0AE581 )
    COP [AA] ( #12 )
    COP [C1]
    COP [89]
    COP [CB]
}

code_0AE581 {
    COP [8D] ( #27 )
    COP [C8] ( &code_0AE629 )
    JMP $&code_0AE4AF
}

code_0AE58B {
    DEC 
    BNE code_0AE5AE
    COP [CA] ( #02 )
    COP [15] ( &code_0AE5A4 )
    COP [14] ( #FF, #FF, &code_0AE5A4 )
    COP [AB] ( #12 )
    COP [C1]
    COP [89]
    COP [CB]
}

code_0AE5A4 {
    COP [8D] ( #27 )
    COP [C8] ( &code_0AE6B0 )
    JMP $&code_0AE4AF
}

code_0AE5AE {
    COP [CA] ( #02 )
    COP [18] ( &code_0AE5BE )
    COP [AA] ( #11 )
    COP [C1]
    COP [89]
    COP [CB]
}

code_0AE5BE {
    COP [8D] ( #27 )
    COP [C8] ( &code_0AE5F7 )
    JMP $&code_0AE4AF
}

code_0AE5C8 {
    LDA $24
    BNE code_0AE5F7
    COP [14] ( #FE, #00, &code_0AE5E0 )
    COP [AA] ( #12 )
    COP [C1]
    COP [89]
    COP [21] ( #04, &code_0AE5C8 )
    COP [C5]
}

code_0AE5E0 {
    STZ $2C
    COP [C2]
    COP [23]
    AND #$0003
    BEQ code_0AE5F5
    COP [2B] ( #$0000, &code_0AE641, &code_0AE641, &code_0AE692 )
}

code_0AE5F5 {
    COP [C5]
}

code_0AE5F7 {
    STZ $24
    COP [C2]
    COP [AA] ( #08 )
    COP [CA] ( #04 )
    COP [14] ( #FE, #00, &code_0AE60D )
    COP [C1]
    COP [8B]
    COP [CB]
}

code_0AE60D {
    STZ $2C
    COP [C5]
}

code_0AE611 {
    LDA $24
    BNE code_0AE629
    COP [18] ( &code_0AE627 )
    COP [AA] ( #11 )
    COP [C1]
    COP [89]
    COP [21] ( #04, &code_0AE611 )
    COP [C5]
}

code_0AE627 {
    BRA code_0AE5E0
}

code_0AE629 {
    STZ $24
    COP [C2]
    COP [AA] ( #07 )
    COP [CA] ( #04 )
    COP [18] ( &code_0AE63D )
    COP [C1]
    COP [8B]
    COP [CB]
}

code_0AE63D {
    STZ $2C
    COP [C5]
}

code_0AE641 {
    LDA $24
    BNE code_0AE674
    COP [15] ( &code_0AE65D )
    COP [14] ( #FF, #FF, &code_0AE65D )
    COP [AB] ( #12 )
    COP [C1]
    COP [89]
    COP [21] ( #04, &code_0AE641 )
    COP [C5]
}

code_0AE65D {
    STZ $2E
    COP [C2]
    COP [23]
    AND #$0003
    BEQ code_0AE672
    COP [2A] ( #$0000, &code_0AE5C8, &code_0AE5C8, &code_0AE611 )
}

code_0AE672 {
    COP [C5]
}

code_0AE674 {
    STZ $24
    COP [C2]
    COP [AB] ( #08 )
    COP [CA] ( #04 )
    COP [15] ( &code_0AE68E )
    COP [14] ( #FF, #FF, &code_0AE68E )
    COP [C1]
    COP [8B]
    COP [CB]
}

code_0AE68E {
    STZ $2E
    COP [C5]
}

code_0AE692 {
    LDA $24
    BNE code_0AE6B0
    COP [16] ( &code_0AE6AE )
    COP [14] ( #FF, #01, &code_0AE6AE )
    COP [AB] ( #11 )
    COP [C1]
    COP [89]
    COP [21] ( #04, &code_0AE692 )
    COP [C5]
}

code_0AE6AE {
    BRA code_0AE65D
}

code_0AE6B0 {
    STZ $24
    COP [AB] ( #07 )
    COP [CA] ( #04 )
    COP [16] ( &code_0AE6C8 )
    COP [14] ( #FF, #01, &code_0AE6C8 )
    COP [C1]
    COP [8B]
    COP [CB]
}

code_0AE6C8 {
    STZ $2E
    COP [C5]
}