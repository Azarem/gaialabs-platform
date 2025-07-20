?INCLUDE 'func_00DB8A'
?INCLUDE 'sg_actors_0ADA52'

!player_actor                   09AA

---------------------------------------------

h_sg4D_blue_cyber [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_sg4D_blue_cyber {
    LDA #$0011
    TSB $12
    COP [58] ( &code_0AB509 )
    COP [BC] ( #01, #00 )

  code_0AB4C0:
    COP [27] ( #0F )

  code_0AB4C3:
    COP [23]
    AND #$0007
    STA $7F0010, X
    COP [CA] ( #03 )
    COP [BC] ( #FF, #00 )
    COP [C8] ( &func_0ABFC6 )
    COP [C8] ( &code_0ABFED )
    COP [C8] ( &code_0AC014 )
    COP [C8] ( &code_0AC03B )
    COP [C8] ( &code_0AC062 )
    COP [BC] ( #01, #00 )
    COP [C8] ( &code_0AC089 )
    COP [C8] ( &code_0AC0B0 )
    COP [C8] ( &code_0AC0D7 )
    LDA $10
    BIT #$4000
    BNE code_0AB4C0
    LDA #$FFFF
    STA $7F0010, X
    COP [CB]
    BRA code_0AB4C3
}

code_0AB509 {
    LDA $14
    AND #$0007
    BEQ code_0AB514
    COP [BC] ( #FF, #00 )
}

code_0AB514 {
    LDA #$0011
    TRB $12

  code_0AB519:
    COP [58] ( &code_0AB72C )
    COP [2C] ( &code_0AB523, &code_0AB626 )
}

code_0AB523 {
    COP [C2]
    COP [2A] ( #$0000, &code_0AB52F, &code_0AB52F, &code_0AB5AA )
}

code_0AB52F {
    COP [84] ( #02, #0A )
    COP [8A]
    COP [C2]
    COP [C8] ( &code_0AB7C2 )
    COP [C2]
    COP [CA] ( #03 )

  code_0AB540:
    COP [17] ( &code_0AB54E )
    COP [81] ( #05, #12 )
    COP [89]
    COP [CB]
    BRA code_0AB519
}

code_0AB54E {
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB55C )
}

code_list_0AB55C [
  &func_0AB560   ;00
  &code_0AB585   ;01
]

---------------------------------------------

func_0AB560 {
    COP [17] ( &code_0AB566 )
    BRA code_0AB540
}

code_0AB566 {
    COP [C2]
    COP [23]
    AND #$0007
    BNE code_0AB579
    COP [18] ( &code_0AB579 )
    COP [81] ( #85, #11 )
    COP [89]
}

code_0AB579 {
    COP [16] ( &code_0AB585 )
    COP [82] ( #03, #11 )
    COP [89]
    BRA func_0AB560
}

code_0AB585 {
    COP [17] ( &code_0AB58B )
    BRA code_0AB540
}

code_0AB58B {
    COP [C2]
    COP [23]
    BIT #$0007
    BNE code_0AB59E
    COP [18] ( &code_0AB59E )
    COP [81] ( #85, #11 )
    COP [89]
}

code_0AB59E {
    COP [15] ( &func_0AB560 )
    COP [82] ( #04, #12 )
    COP [89]
    BRA func_0AB560
}

code_0AB5AA {
    COP [84] ( #82, #0A )
    COP [8A]
    COP [C2]
    COP [C8] ( &code_0AB7F9 )
    COP [C2]
    COP [CA] ( #03 )

  code_0AB5BB:
    COP [18] ( &code_0AB5CA )
    COP [81] ( #85, #11 )
    COP [89]
    COP [CB]
    JMP $&code_0AB519
}

code_0AB5CA {
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB5D8 )
}

code_list_0AB5D8 [
  &func_0AB5DC   ;00
  &code_0AB601   ;01
]

---------------------------------------------

func_0AB5DC {
    COP [18] ( &code_0AB5E2 )
    BRA code_0AB5BB
}

code_0AB5E2 {
    COP [C2]
    COP [23]
    AND #$0007
    BNE code_0AB5F5
    COP [17] ( &code_0AB5F5 )
    COP [81] ( #05, #12 )
    COP [89]
}

code_0AB5F5 {
    COP [16] ( &code_0AB601 )
    COP [82] ( #03, #11 )
    COP [89]
    BRA func_0AB5DC
}

code_0AB601 {
    COP [18] ( &code_0AB607 )
    BRA code_0AB5BB
}

code_0AB607 {
    COP [C2]
    COP [23]
    BIT #$0007
    BNE code_0AB61A
    COP [17] ( &code_0AB61A )
    COP [81] ( #05, #12 )
    COP [89]
}

code_0AB61A {
    COP [15] ( &func_0AB5DC )
    COP [82] ( #04, #12 )
    COP [89]
    BRA func_0AB5DC
}

code_0AB626 {
    COP [C2]
    COP [2B] ( #$0000, &code_0AB632, &code_0AB632, &code_0AB6AE )
}

code_0AB632 {
    COP [84] ( #01, #0A )
    COP [8A]
    COP [C2]
    COP [C8] ( &code_0AB78B )
    COP [C2]
    COP [CA] ( #03 )

  code_0AB643:
    COP [15] ( &code_0AB652 )
    COP [82] ( #04, #12 )
    COP [89]
    COP [CB]
    JMP $&code_0AB519
}

code_0AB652 {
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB660 )
}

code_list_0AB660 [
  &func_0AB664   ;00
  &code_0AB689   ;01
]

---------------------------------------------

func_0AB664 {
    COP [15] ( &code_0AB66A )
    BRA code_0AB643
}

code_0AB66A {
    COP [C2]
    COP [23]
    AND #$0007
    BNE code_0AB67D
    COP [16] ( &code_0AB5F5 )
    COP [82] ( #03, #11 )
    COP [89]
}

code_0AB67D {
    COP [17] ( &code_0AB689 )
    COP [81] ( #05, #12 )
    COP [89]
    BRA func_0AB664
}

code_0AB689 {
    COP [15] ( &code_0AB68F )
    BRA code_0AB643
}

code_0AB68F {
    COP [C2]
    COP [23]
    BIT #$0007
    BNE code_0AB6A2
    COP [16] ( &code_0AB6A2 )
    COP [82] ( #03, #11 )
    COP [89]
}

code_0AB6A2 {
    COP [18] ( &func_0AB664 )
    COP [81] ( #85, #11 )
    COP [89]
    BRA code_0AB689
}

code_0AB6AE {
    COP [84] ( #00, #0A )
    COP [8A]
    COP [C2]
    COP [C8] ( &code_0AB754 )
    COP [C2]
    COP [CA] ( #03 )
    COP [16] ( &code_0AB6CE )
    COP [82] ( #03, #11 )
    COP [89]
    COP [CB]
    JMP $&code_0AB519
}

code_0AB6CE {
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB6DC )
}

code_list_0AB6DC [
  &func_0AB6E0   ;00
  &code_0AB706   ;01
]

---------------------------------------------

func_0AB6E0 {
    COP [16] ( &code_0AB6E7 )
    JMP $&code_0AB643
}

code_0AB6E7 {
    COP [C2]
    COP [23]
    AND #$0007
    BNE code_0AB6FA
    COP [15] ( &code_0AB5F5 )
    COP [82] ( #04, #12 )
    COP [89]
}

code_0AB6FA {
    COP [17] ( &code_0AB706 )
    COP [81] ( #05, #12 )
    COP [89]
    BRA func_0AB6E0
}

code_0AB706 {
    COP [16] ( &code_0AB70D )
    JMP $&code_0AB643
}

code_0AB70D {
    COP [C2]
    COP [23]
    BIT #$0007
    BNE code_0AB720
    COP [15] ( &code_0AB6A2 )
    COP [82] ( #04, #12 )
    COP [89]
}

code_0AB720 {
    COP [18] ( &func_0AB6E0 )
    COP [81] ( #85, #11 )
    COP [89]
    BRA code_0AB706
}

code_0AB72C {
    COP [43]
    COP [C6] ( &code_0AB519 )
    COP [C1]
    COP [89]
    COP [2D]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB744 )
}

code_list_0AB744 [
  &code_0AB795   ;00
  &code_0AB795   ;01
  &code_0AB803   ;02
  &code_0AB803   ;03
  &code_0AB75E   ;04
  &code_0AB75E   ;05
  &code_0AB7CC   ;06
  &code_0AB7CC   ;07
]

code_0AB754 {
    COP [44] ( #FE, #00, #02, #04, &code_0AB75E )
    COP [C5]
}

code_0AB75E {
    COP [58] ( #$0000 )
    COP [C2]
    COP [8D] ( #06 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0AB830, #$FFF4, #$FFF0, #$0202 )
    COP [9E] ( @code_0AB830, #$000C, #$FFF0, #$0202 )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AB78B {
    COP [44] ( #FE, #FA, #02, #00, &code_0AB795 )
    COP [C5]
}

code_0AB795 {
    COP [58] ( #$0000 )
    COP [C2]
    COP [8D] ( #07 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0AB84F, #$FFF4, #$FFD0, #$0202 )
    COP [9E] ( @code_0AB84F, #$000C, #$FFD0, #$0202 )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AB7C2 {
    COP [44] ( #FC, #FE, #00, #02, &code_0AB7CC )
    COP [C5]
}

code_0AB7CC {
    COP [58] ( #$0000 )
    COP [C2]
    COP [8D] ( #08 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0AB86E, #$FFF3, #$FFE0, #$0202 )
    COP [9E] ( @code_0AB86E, #$FFF3, #$FFE8, #$0202 )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AB7F9 {
    COP [44] ( #00, #FE, #04, #02, &code_0AB803 )
    COP [C5]
}

code_0AB803 {
    COP [58] ( #$0000 )
    COP [C2]
    COP [8D] ( #88 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0AB88F, #$000D, #$FFE0, #$0202 )
    COP [9E] ( @code_0AB88F, #$000D, #$FFE8, #$0202 )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AB830 {
    COP [5B] ( #$0010 )
    COP [82] ( #09, #01 )
    COP [89]
    COP [82] ( #09, #03 )
    COP [89]

  code_0AB840:
    COP [82] ( #09, #05 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AB840
    COP [E0]
}

code_0AB84F {
    COP [5B] ( #$0010 )
    COP [82] ( #0A, #02 )
    COP [89]
    COP [82] ( #0A, #04 )
    COP [89]

  code_0AB85F:
    COP [82] ( #0A, #06 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AB85F
    COP [E0]
}

code_0AB86E {
    COP [5B] ( #$0010 )
    COP [83] ( #0B, #02, #11 )
    COP [89]
    COP [83] ( #0B, #04, #13 )
    COP [89]

  code_0AB880:
    COP [81] ( #0B, #06 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AB880
    COP [E0]
}

code_0AB88F {
    COP [5B] ( #$0010 )
    COP [83] ( #8B, #01, #11 )
    COP [89]
    COP [83] ( #8B, #03, #13 )
    COP [89]

  code_0AB8A1:
    COP [81] ( #8B, #05 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AB8A1
    COP [E0]
}

---------------------------------------------

h_sg4E_red_cyber [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_sg4E_red_cyber {
    LDA #$0011
    TSB $12
    COP [58] ( &code_0AB9AC )
    COP [57] ( @code_0AB96D )

  code_0AB8C1:
    COP [27] ( #0F )
    LDA #$FFFF
    STA $7F0010, X
    COP [C8] ( &func_0ABFC6 )
    COP [C8] ( &code_0ABFED )
    COP [C8] ( &code_0AC014 )
    COP [C8] ( &code_0AC03B )
    COP [C8] ( &code_0AC062 )
    COP [BC] ( #01, #00 )
    COP [C8] ( &code_0AC089 )
    COP [C8] ( &code_0AC0B0 )
    COP [C8] ( &code_0AC0D7 )
    COP [BC] ( #FF, #00 )
    LDA $10
    BIT #$4000
    BNE code_0AB8C1
    COP [84] ( #0C, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &func_0ABFC6 )
    COP [84] ( #0D, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0ABFED )
    COP [84] ( #0E, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0AC014 )
    COP [84] ( #0F, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0AC03B )
    COP [84] ( #10, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0AC062 )
    COP [BC] ( #01, #00 )
    COP [84] ( #8F, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0AC089 )
    COP [84] ( #8E, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0AC0B0 )
    COP [84] ( #8D, #02 )
    COP [8A]
    JSR $&sub_0ADD1E
    COP [C8] ( &code_0AC0D7 )
    COP [BC] ( #FF, #00 )
    JMP $&code_0AB8C1
}

code_0AB96D {
    LDA $7F0010, X
    BNE code_0AB976
    JMP $&code_0AB9A5
}

code_0AB976 {
    PHX 
    STX $0000
    TXA 
    TYX 
    TAY 
    LDX $0006, Y
    LDA $0000
    CMP $7F0012, X
    BNE code_0AB9A4
    LDA #$0000
    STA $7F0012, X
    TXY 
    LDX $0006, Y
    LDA $0000
    CMP $7F0012, X
    BNE code_0AB9A4
    LDA #$0000
    STA $7F0012, X
}

code_0AB9A4 {
    PLX 
}

code_0AB9A5 {
    COP [C2]
    COP [C7] ( @func_00DB8A )
}

code_0AB9AC {
    COP [43]
    LDA $14
    AND #$0007
    BEQ code_0AB9B9
    COP [BC] ( #FF, #00 )
}

code_0AB9B9 {
    LDA #$0011
    TRB $12

  code_0AB9BE:
    COP [58] ( &code_0ABAB1 )
    COP [21] ( #04, &code_0ABA4F )
    COP [23]
    AND #$0003
    BNE code_0AB9E8
    COP [2C] ( &code_0AB9D4, &code_0AB9DE )
}

code_0AB9D4 {
    COP [2A] ( #$0000, &code_0AB9FE, &code_0AB9FE, &code_0ABA13 )
}

code_0AB9DE {
    COP [2B] ( #$0000, &code_0ABA3B, &code_0ABA3B, &code_0ABA27 )
}

code_0AB9E8 {
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB9F6 )
}

code_list_0AB9F6 [
  &code_0ABA01   ;00
  &code_0ABA15   ;01
  &code_0ABA29   ;02
  &code_0ABA3D   ;03
]

code_0AB9FE {
    COP [DA] ( #00 )
}

code_0ABA01 {
    COP [CA] ( #02 )
    COP [17] ( &code_0ABA13 )
    COP [81] ( #05, #12 )
    COP [89]
    COP [CB]
    JMP $&code_0AB9BE
}

code_0ABA13 {
    COP [C2]
}

code_0ABA15 {
    COP [CA] ( #02 )
    COP [18] ( &code_0ABA27 )
    COP [81] ( #85, #11 )
    COP [89]
    COP [CB]
    JMP $&code_0AB9BE
}

code_0ABA27 {
    COP [C2]
}

code_0ABA29 {
    COP [CA] ( #02 )
    COP [16] ( &code_0ABA3B )
    COP [82] ( #03, #11 )
    COP [89]
    COP [CB]
    JMP $&code_0AB9BE
}

code_0ABA3B {
    COP [C2]
}

code_0ABA3D {
    COP [CA] ( #02 )
    COP [15] ( &code_0AB9FE )
    COP [82] ( #04, #12 )
    COP [89]
    COP [CB]
    JMP $&code_0AB9BE
}

code_0ABA4F {
    COP [2C] ( &code_0ABA85, &code_0ABA57 )

  code_0ABA55:
    COP [C2]
}

code_0ABA57 {
    COP [2A] ( #$0000, &code_0ABA72, &code_0ABA72, &code_0ABA61 )
}

code_0ABA61 {
    COP [17] ( &code_0ABA83 )
    COP [81] ( #85, #12 )
    COP [89]
    COP [C8] ( &code_0ABCAE )
    JMP $&code_0AB9BE
}

code_0ABA72 {
    COP [18] ( &code_0ABA83 )
    COP [81] ( #05, #11 )
    COP [89]
    COP [C8] ( &code_0ABC13 )
    JMP $&code_0AB9BE
}

code_0ABA83 {
    COP [C2]
}

code_0ABA85 {
    COP [2B] ( #$0000, &code_0ABAA0, &code_0ABAA0, &code_0ABA8F )
}

code_0ABA8F {
    COP [15] ( &code_0ABA55 )
    COP [82] ( #03, #12 )
    COP [89]
    COP [C8] ( &code_0ABADB )
    JMP $&code_0AB9BE
}

code_0ABAA0 {
    COP [16] ( &code_0ABA55 )
    COP [82] ( #04, #11 )
    COP [89]
    COP [C8] ( &code_0ABB78 )
    JMP $&code_0AB9BE
}

code_0ABAB1 {
    COP [43]
    COP [C6] ( &code_0AB9BE )
    COP [C1]
    COP [89]
    COP [2D]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0ABAC9 )
}

code_list_0ABAC9 [
  &code_0ABBAC   ;00
  &code_0ABBAC   ;01
  &code_0ABCE2   ;02
  &code_0ABCE2   ;03
  &code_0ABB0F   ;04
  &code_0ABB0F   ;05
  &code_0ABC47   ;06
  &code_0ABC47   ;07
]

---------------------------------------------

func_0ABAD9 {
    COP [C5]
}

code_0ABADB {
    COP [44] ( #FD, #00, #03, #06, &code_0ABB0F )
    COP [2A] ( #$0000, &code_0ABAED, &code_0ABAED, &code_0ABAFF )
}

code_0ABAED {
    COP [17] ( &func_0ABAD9 )
    COP [14] ( #FE, #00, &func_0ABAD9 )
    COP [81] ( #03, #02 )
    COP [89]
    BRA code_0ABB0F
}

code_0ABAFF {
    COP [18] ( &func_0ABAD9 )
    COP [14] ( #02, #00, &func_0ABAD9 )
    COP [81] ( #03, #01 )
    COP [89]
}

code_0ABB0F {
    COP [58] ( #$0000 )
    COP [8D] ( #11 )
    COP [C1]
    COP [8C] ( #05 )
    COP [C1]
    COP [07] ( #1F )
    COP [9E] ( @code_0ABD49, #$FFF4, #$FFF0, #$2200 )
    PHX 
    TYX 
    LDA #$FFF4
    STA $7F100C, X
    LDA #$FFEC
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    COP [9E] ( @code_0ABD49, #$000C, #$FFF0, #$2200 )
    PHX 
    TYX 
    LDA #$000C
    STA $7F100C, X
    LDA #$FFEC
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    LDA #$0003
    STA $7F0010, X
    COP [C1]
    LDA $7F0010, X
    BEQ code_0ABB72
    RTL 
}

code_0ABB72 {
    COP [C1]
    COP [89]
    COP [C5]
}

code_0ABB78 {
    COP [44] ( #FD, #FB, #03, #00, &code_0ABBAC )
    COP [2A] ( #$0000, &code_0ABB8A, &code_0ABB8A, &code_0ABB9C )
}

code_0ABB8A {
    COP [17] ( &func_0ABAD9 )
    COP [14] ( #FE, #00, &func_0ABAD9 )
    COP [81] ( #04, #02 )
    COP [89]
    BRA code_0ABBAC
}

code_0ABB9C {
    COP [18] ( &func_0ABAD9 )
    COP [14] ( #02, #00, &func_0ABAD9 )
    COP [81] ( #04, #01 )
    COP [89]
}

code_0ABBAC {
    COP [58] ( #$0000 )
    COP [8D] ( #12 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0ABDBC, #$FFF4, #$FFD0, #$2200 )
    PHX 
    TYX 
    LDA #$FFF4
    STA $7F100C, X
    LDA #$FFDC
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    COP [9E] ( @code_0ABDBC, #$000C, #$FFD0, #$2200 )
    PHX 
    TYX 
    LDA #$000C
    STA $7F100C, X
    LDA #$FFDC
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    LDA #$0003
    STA $7F0010, X
    COP [C1]
    LDA $7F0010, X
    BEQ code_0ABC0D
    RTL 
}

code_0ABC0D {
    COP [C1]
    COP [89]
    COP [C5]
}

code_0ABC13 {
    COP [44] ( #FB, #FE, #00, #02, &code_0ABC47 )
    COP [2B] ( #$0000, &code_0ABC25, &code_0ABC25, &code_0ABC37 )
}

code_0ABC25 {
    COP [15] ( &func_0ABAD9 )
    COP [14] ( #00, #FE, &func_0ABAD9 )
    COP [82] ( #05, #02 )
    COP [89]
    BRA code_0ABC47
}

code_0ABC37 {
    COP [16] ( &func_0ABAD9 )
    COP [14] ( #00, #02, &func_0ABAD9 )
    COP [82] ( #05, #01 )
    COP [89]
}

code_0ABC47 {
    COP [58] ( #$0000 )
    COP [8D] ( #13 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0ABE2F, #$FFF3, #$FFE0, #$2200 )
    PHX 
    TYX 
    LDA #$FFF3
    STA $7F100C, X
    LDA #$FFE0
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    COP [9E] ( @code_0ABE2F, #$FFF3, #$FFE8, #$2200 )
    PHX 
    TYX 
    LDA #$FFF3
    STA $7F100C, X
    LDA #$FFE8
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    LDA #$0003
    STA $7F0010, X
    COP [C1]
    LDA $7F0010, X
    BEQ code_0ABCA8
    RTL 
}

code_0ABCA8 {
    COP [C1]
    COP [89]
    COP [C5]
}

code_0ABCAE {
    COP [44] ( #00, #FE, #05, #02, &code_0ABCE2 )
    COP [2B] ( #$0000, &code_0ABCC0, &code_0ABCC0, &code_0ABCD2 )
}

code_0ABCC0 {
    COP [15] ( &func_0ABAD9 )
    COP [14] ( #00, #FE, &func_0ABAD9 )
    COP [82] ( #85, #02 )
    COP [89]
    BRA code_0ABCE2
}

code_0ABCD2 {
    COP [16] ( &func_0ABAD9 )
    COP [14] ( #00, #02, &func_0ABAD9 )
    COP [82] ( #85, #01 )
    COP [89]
}

code_0ABCE2 {
    COP [58] ( #$0000 )
    COP [8D] ( #93 )
    COP [C1]
    COP [8C] ( #05 )
    COP [07] ( #1F )
    COP [9E] ( @code_0ABEA8, #$000D, #$FFE0, #$2200 )
    PHX 
    TYX 
    LDA #$000D
    STA $7F100C, X
    LDA #$FFE0
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    COP [9E] ( @code_0ABEA8, #$000D, #$FFE8, #$2200 )
    PHX 
    TYX 
    LDA #$000D
    STA $7F100C, X
    LDA #$FFE8
    STA $7F100E, X
    PLA 
    STA $7F0012, X
    TAX 
    LDA #$0003
    STA $7F0010, X
    COP [C1]
    LDA $7F0010, X
    BEQ code_0ABD43
    RTL 
}

code_0ABD43 {
    COP [C1]
    COP [89]
    COP [C5]
}

code_0ABD49 {
    COP [B6] ( #30 )
    COP [5B] ( #$0010 )
    COP [5A] ( &code_0ABD90 )
    COP [5E] ( &code_0ABD90 )
    LDA #$2000
    TRB $10
    COP [82] ( #09, #01 )
    COP [89]
    COP [82] ( #09, #03 )
    COP [89]
    LDY $player_actor
    LDA $14
    SEC 
    SBC $0014, Y
    JSR $&sub_0ABF73
    CLC 
    ADC $14
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0050
    STA $7F001A, X
    COP [22] ( #09, #03 )
    COP [82] ( #09, #01 )
    COP [89]
}

code_0ABD90 {
    COP [5C] ( #$FFED )
    COP [5A] ( #$0000 )

  code_0ABD98:
    LDA $7F0012, X
    BEQ code_0ABDAC
    JSR $&sub_0ABF8F
    BCS code_0ABDA6
    JMP $&code_0ABF1E
}

code_0ABDA6 {
    COP [22] ( #14, #02 )
    BRA code_0ABD98
}

code_0ABDAC {
    COP [86] ( #09, #03, #03 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0ABDAC
    COP [E0]
}

code_0ABDBC {
    COP [B6] ( #30 )
    COP [5B] ( #$0010 )
    COP [5A] ( &code_0ABE03 )
    COP [5E] ( &code_0ABE03 )
    LDA #$2000
    TRB $10
    COP [82] ( #0A, #02 )
    COP [89]
    COP [82] ( #0A, #04 )
    COP [89]
    LDY $player_actor
    LDA $14
    SEC 
    SBC $0014, Y
    JSR $&sub_0ABF73
    CLC 
    ADC $14
    STA $7F0018, X
    LDA $16
    SEC 
    SBC #$0050
    STA $7F001A, X
    COP [22] ( #0A, #03 )
    COP [82] ( #0A, #01 )
    COP [89]
}

code_0ABE03 {
    COP [5C] ( #$FFED )
    COP [5A] ( #$0000 )

  code_0ABE0B:
    LDA $7F0012, X
    BEQ code_0ABE1F
    JSR $&sub_0ABF8F
    BCS code_0ABE19
    JMP $&code_0ABF1E
}

code_0ABE19 {
    COP [22] ( #15, #02 )
    BRA code_0ABE0B
}

code_0ABE1F {
    COP [86] ( #0A, #03, #04 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0ABE1F
    COP [E0]
}

code_0ABE2F {
    COP [B6] ( #30 )
    COP [5B] ( #$0010 )
    COP [5A] ( &code_0ABE7C )
    COP [5E] ( &code_0ABE7C )
    LDA #$2000
    TRB $10
    COP [83] ( #0B, #02, #11 )
    COP [89]
    COP [83] ( #0B, #04, #13 )
    COP [89]
    LDY $player_actor
    LDA $16
    SEC 
    SBC $0030
    SEC 
    SBC $0016, Y
    JSR $&sub_0ABF73
    CLC 
    ADC $16
    STA $7F001A, X
    LDA $14
    SEC 
    SBC #$0050
    STA $7F0018, X
    COP [22] ( #0B, #03 )
    COP [81] ( #0B, #01 )
    COP [89]
}

code_0ABE7C {
    COP [5C] ( #$FFED )
    COP [5A] ( #$0000 )

  code_0ABE84:
    LDA $7F0012, X
    BEQ code_0ABE98
    JSR $&sub_0ABF8F
    BCS code_0ABE92
    JMP $&code_0ABF1E
}

code_0ABE92 {
    COP [22] ( #16, #02 )
    BRA code_0ABE84
}

code_0ABE98 {
    COP [85] ( #0B, #03, #04 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0ABE98
    COP [E0]
}

code_0ABEA8 {
    COP [B6] ( #30 )
    COP [5B] ( #$0010 )
    COP [5A] ( &code_0ABEF5 )
    COP [5E] ( &code_0ABEF5 )
    LDA #$2000
    TRB $10
    COP [83] ( #8B, #01, #11 )
    COP [89]
    COP [83] ( #8B, #03, #13 )
    COP [89]
    LDY $player_actor
    LDA $16
    SEC 
    SBC $0030
    SEC 
    SBC $0016, Y
    JSR $&sub_0ABF73
    CLC 
    ADC $16
    STA $7F001A, X
    LDA $14
    CLC 
    ADC #$0050
    STA $7F0018, X
    COP [22] ( #8B, #03 )
    COP [81] ( #8B, #01 )
    COP [89]
}

code_0ABEF5 {
    COP [5C] ( #$FFED )
    COP [5A] ( #$0000 )

  code_0ABEFD:
    LDA $7F0012, X
    BEQ code_0ABF0E
    JSR $&sub_0ABF8F
    BCC code_0ABF1E
    COP [22] ( #96, #02 )
    BRA code_0ABEFD
}

code_0ABF0E {
    COP [85] ( #8B, #03, #03 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0ABF0E
    COP [E0]
}

code_0ABF1E {
    LDA $7F0012, X
    BEQ code_0ABF70
    PHX 
    TAX 
    LDA $7F0010, X
    LSR 
    STA $7F0010, X
    TXY 
    PLX 
    LDA $0014, Y
    SEC 
    SBC $14
    STA $7F100C, X
    LDA $0016, Y
    SEC 
    SBC $16
    STA $7F100E, X

  code_0ABF45:
    LDA $0014, Y
    SEC 
    SBC $7F100C, X
    STA $14
    LDA $0016, Y
    SEC 
    SBC $7F100E, X
    STA $16
    COP [C2]
    PHX 
    LDA $7F0012, X
    BEQ code_0ABF70
    TAX 
    LDA $7F0010, X
    TXY 
    PLX 
    CMP #$0000
    BNE code_0ABF45
    COP [E0]
}

code_0ABF70 {
    PLX 
    COP [E0]
}

---------------------------------------------

sub_0ABF73 {
    BMI code_0ABF82
    CMP #$0010
    BCC code_0ABF7D
    LDA #$0008
}

code_0ABF7D {
    EOR #$FFFF
    INC 
    RTS 
}

code_0ABF82 {
    EOR #$FFFF
    INC 
    CMP #$0010
    BCC code_0ABF8E
    LDA #$0008
}

code_0ABF8E {
    RTS 
}

---------------------------------------------

sub_0ABF8F {
    LDA $7F0012, X
    TAY 
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $7F0018, X
    CMP $14
    BNE code_0ABFB8
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $7F001A, X
    CMP $16
    SEC 
    BEQ code_0ABFB6
    RTS 
}

code_0ABFB6 {
    CLC 
    RTS 
}

code_0ABFB8 {
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $7F001A, X
    SEC 
    RTS 
}

---------------------------------------------

func_0ABFC6 {
    COP [80] ( #0C )
    COP [89]
    LDA $7F0010, X
    CMP #$0004
    BNE code_0ABFEB
    COP [84] ( #0C, #08 )
    COP [8A]
    COP [9E] ( @code_0ADA52, #$0000, #$FFD9, #$2202 )
    COP [84] ( #0C, #02 )
    COP [8A]
}

code_0ABFEB {
    COP [C5]
}

code_0ABFED {
    COP [80] ( #0D )
    COP [89]
    LDA $7F0010, X
    CMP #$0005
    BNE code_0AC012
    COP [84] ( #0D, #08 )
    COP [8A]
    COP [9E] ( @code_0ADA69, #$FFFA, #$FFD9, #$2202 )
    COP [84] ( #0D, #02 )
    COP [8A]
}

code_0AC012 {
    COP [C5]
}

code_0AC014 {
    COP [80] ( #0E )
    COP [89]
    LDA $7F0010, X
    CMP #$0006
    BNE code_0AC039
    COP [84] ( #0E, #08 )
    COP [8A]
    COP [9E] ( @code_0ADAA0, #$FFF5, #$FFDA, #$2202 )
    COP [84] ( #0E, #02 )
    COP [8A]
}

code_0AC039 {
    COP [C5]
}

code_0AC03B {
    COP [80] ( #0F )
    COP [89]
    LDA $7F0010, X
    CMP #$0007
    BNE code_0AC060
    COP [84] ( #0F, #08 )
    COP [8A]
    COP [9E] ( @code_0ADAD1, #$FFF9, #$FFD0, #$2200 )
    COP [84] ( #0F, #02 )
    COP [8A]
}

code_0AC060 {
    COP [C5]
}

code_0AC062 {
    COP [80] ( #10 )
    COP [89]
    LDA $7F0010, X
    CMP #$0000
    BNE code_0AC087
    COP [84] ( #10, #08 )
    COP [8A]
    COP [9E] ( @code_0ADB04, #$0000, #$FFD0, #$2200 )
    COP [84] ( #10, #02 )
    COP [8A]
}

code_0AC087 {
    COP [C5]
}

code_0AC089 {
    COP [80] ( #8F )
    COP [89]
    LDA $7F0010, X
    CMP #$0001
    BNE code_0AC0AE
    COP [84] ( #8F, #08 )
    COP [8A]
    COP [9E] ( @code_0ADAE7, #$0007, #$FFD0, #$2200 )
    COP [84] ( #8F, #02 )
    COP [8A]
}

code_0AC0AE {
    COP [C5]
}

code_0AC0B0 {
    COP [80] ( #8E )
    COP [89]
    LDA $7F0010, X
    CMP #$0002
    BNE code_0AC0D5
    COP [84] ( #8E, #08 )
    COP [8A]
    COP [9E] ( @code_0ADAB5, #$000B, #$FFDA, #$2202 )
    COP [84] ( #8E, #02 )
    COP [8A]
}

code_0AC0D5 {
    COP [C5]
}

code_0AC0D7 {
    COP [80] ( #8D )
    COP [89]
    LDA $7F0010, X
    CMP #$0003
    BNE code_0AC0FC
    COP [84] ( #8D, #08 )
    COP [8A]
    COP [9E] ( @code_0ADA81, #$0006, #$FFD9, #$2202 )
    COP [84] ( #8D, #02 )
    COP [8A]
}

code_0AC0FC {
    COP [C5]
}

---------------------------------------------

sub_0ADD1E {
    COP [2E] ( #00, #D0 )
    STA $7F0010, X
    RTS 
}