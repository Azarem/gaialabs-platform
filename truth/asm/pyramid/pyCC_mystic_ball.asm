?INCLUDE 'sg_actors_0ADA52'
?INCLUDE 'func_00DB8A'
?INCLUDE 'actor_00DA78'
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_00DDF2'


---------------------------------------------

h_pyCE_mystic_ball1 [
  h_actor < #0F, #00, #00 >   ;00
]

---------------------------------------------

e_pyCE_mystic_ball1 {
    COP [57] ( @code_0BC6E7 )
    LDA #$0010
    TSB $12

  code_0BC5B0:
    COP [27] ( #07 )

  code_0BC5B3:
    LDA $10
    BIT #$4000
    BNE code_0BC5B0
    COP [C6] ( &code_0BC5C8 )
    COP [2B] ( #$0018, &code_0BC5C8, &code_0BC655, &code_0BC5C8 )
}

code_0BC5C8 {
    COP [C2]
    COP [17] ( &code_0BC5D9 )
    COP [81] ( #0F, #12 )
    COP [89]
    BRA code_0BC5B3
}

---------------------------------------------

func_0BC5D6 {
    COP [27] ( #07 )
}

code_0BC5D9 {
    LDA $10
    BIT #$4000
    BNE func_0BC5D6
    COP [C6] ( &code_0BC5EE )
    COP [2B] ( #$0018, &code_0BC5EE, &code_0BC655, &code_0BC5EE )
}

code_0BC5EE {
    COP [C2]
    COP [18] ( &code_0BC5B3 )
    COP [81] ( #0F, #11 )
    COP [89]
    BRA code_0BC5D9
}

---------------------------------------------

h_pyCC_mystic_ball2 [
  h_actor < #0F, #00, #00 >   ;00
]

---------------------------------------------

e_pyCC_mystic_ball2 {
    COP [57] ( @code_0BC6E7 )
    LDA #$0010
    TSB $12

  code_0BC609:
    COP [27] ( #07 )

  code_0BC60C:
    LDA $10
    BIT #$4000
    BNE code_0BC609
    COP [C6] ( &code_0BC621 )
    COP [2B] ( #$0018, &code_0BC621, &code_0BC655, &code_0BC621 )
}

code_0BC621 {
    COP [C2]
    COP [15] ( &code_0BC632 )
    COP [82] ( #0F, #12 )
    COP [89]
    BRA code_0BC60C
}

---------------------------------------------

func_0BC62F {
    COP [27] ( #07 )
}

code_0BC632 {
    LDA $10
    BIT #$4000
    BNE func_0BC62F
    COP [C6] ( &code_0BC647 )
    COP [2B] ( #$0018, &code_0BC647, &code_0BC655, &code_0BC647 )
}

code_0BC647 {
    COP [C2]
    COP [16] ( &code_0BC60C )
    COP [82] ( #0F, #11 )
    COP [89]
    BRA code_0BC632
}

code_0BC655 {
    COP [2A] ( #$0000, &code_0BC6BF, &code_0BC6BF, &code_0BC697 )
}

---------------------------------------------

h_pyCC_mystic_ball3 [
  h_actor < #0F, #00, #00 >   ;00
]

---------------------------------------------

e_pyCC_mystic_ball3 {
    COP [57] ( @code_0BC6E7 )
    LDA #$0010
    TSB $12

  code_0BC66C:
    COP [C6] ( &code_0BC67A )
    COP [2B] ( #$0010, &code_0BC67A, &code_0BC681, &code_0BC67A )
}

code_0BC67A {
    COP [80] ( #0F )
    COP [89]
    BRA code_0BC66C
}

code_0BC681 {
    COP [35]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BC68F )
}

code_list_0BC68F [
  &code_0BC67A   ;00
  &code_0BC697   ;01
  &code_0BC67A   ;02
  &code_0BC6BF   ;03
]

code_0BC697 {
    COP [CA] ( #05 )
    COP [9E] ( @code_0BC70D, #$000A, #$FFF6, #$0300 )
    COP [23]
    AND #$000F
    STA $08
    COP [C2]
    COP [CB]
    COP [9E] ( @code_0ADAB5, #$000A, #$FFF6, #$2200 )
    COP [C2]
    COP [C5]
}

code_0BC6BF {
    COP [CA] ( #05 )
    COP [9E] ( @code_0BC70D, #$FFF6, #$FFF6, #$0300 )
    COP [23]
    AND #$000F
    STA $08
    COP [C2]
    COP [CB]
    COP [9E] ( @code_0ADAA0, #$FFF6, #$FFF6, #$2200 )
    COP [C2]
    COP [C5]
}

code_0BC6E7 {
    COP [80] ( #19 )
    COP [89]
    LDA $0AEC
    CMP #$0001
    BNE code_0BC6F9
    COP [C7] ( @func_00DB8A )
}

code_0BC6F9 {
    COP [C8] ( &code_0BC738 )
    COP [9C] ( @e_actor_00DA78, #$0020 )
    LDA $7F0010, X
    STA $0026, Y
    COP [E0]
}

code_0BC70D {
    COP [88] ( @table_0EE000 )
    COP [23]
    AND #$0007
    SEC 
    SBC #$0003
    CLC 
    ADC $16
    STA $16
    LDA $0410
    LSR 
    LSR 
    AND #$0007
    SEC 
    SBC #$0003
    CLC 
    ADC $14
    STA $14
    COP [80] ( #02 )
    COP [89]
    COP [E0]
}

code_0BC738 {
    COP [07] ( #06 )
    SED 
    LDA $0AEE
    SEC 
    SBC #$0001
    STA $0AEE
    CLD 
    LDA $0AEC
    DEC 
    STA $0AEC
    STA $7F0010, X
    COP [AC] ( #00, #00 )
    LDA #$0000
    STA $7F002C, X
    STA $7F002E, X
    COP [D8]
    LDA $7F002A, X
    BIT #$0008
    BEQ code_0BC76E
    COP [0C]
}

code_0BC76E {
    LDA $7F0024, X
    BEQ code_0BC796
    JSL $@func_00B4F6
    BCS code_0BC796
    LDA $7F0024, X
    JSL $@func_00B4E0
    COP [A5] ( @func_00DDF2, #00, #00, #$0342 )
    PHX 
    LDA $7F0024, X
    TYX 
    STA $7F0024, X
    PLX 
}

code_0BC796 {
    COP [C5]
}