
!player_y_pos                   09A4

---------------------------------------------

h_ec0F_king_bat [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_ec0F_king_bat {
    LDA #$0010
    TSB $12
    COP [B6] ( #30 )
    COP [B7] ( #02 )
    COP [BC] ( #08, #00 )
    COP [27] ( #10 )
    COP [C1]
    JSR $&sub_0A8733
    BCC code_0A8614
    RTL 
}

code_0A8614 {
    COP [86] ( #1F, #02, #01 )
    COP [8A]
    COP [84] ( #1F, #02 )
    COP [8A]
    COP [86] ( #20, #02, #02 )
    COP [8A]
    COP [84] ( #1F, #02 )
    COP [8A]

  code_0A862E:
    COP [81] ( #21, #04 )
    COP [89]
    COP [82] ( #1F, #03 )
    COP [89]
    COP [85] ( #A1, #02, #03 )
    COP [8A]
    COP [82] ( #9F, #03 )
    COP [89]
    COP [85] ( #21, #02, #04 )
    COP [8A]
    COP [82] ( #20, #04 )
    COP [89]
    COP [85] ( #A1, #02, #03 )
    COP [8A]
    COP [82] ( #A0, #04 )
    COP [89]
    COP [81] ( #21, #04 )
    COP [89]
    BRA code_0A862E
}

---------------------------------------------

h_ec0F_sub_bat1 [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_ec0F_sub_bat1 {
    JSR $&sub_0A8743
    COP [27] ( #10 )
    COP [C1]
    JSR $&sub_0A8733
    BCC code_0A867A
    RTL 
}

code_0A867A {
    COP [81] ( #21, #02 )
    COP [89]

  code_0A8680:
    COP [82] ( #1F, #03 )
    COP [89]
    COP [81] ( #A1, #03 )
    COP [89]
    COP [82] ( #A0, #04 )
    COP [89]
    COP [81] ( #21, #04 )
    COP [89]
    BRA code_0A8680
}

---------------------------------------------

h_ec0F_sub_bat2 [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_ec0F_sub_bat2 {
    JSR $&sub_0A8743
    COP [27] ( #10 )
    COP [C1]
    JSR $&sub_0A8733
    BCC code_0A86AB
    RTL 
}

code_0A86AB {
    COP [81] ( #A1, #01 )
    COP [89]

  code_0A86B1:
    COP [82] ( #1F, #03 )
    COP [89]
    COP [81] ( #21, #04 )
    COP [89]
    COP [82] ( #20, #04 )
    COP [89]
    COP [81] ( #A1, #03 )
    COP [89]
    BRA code_0A86B1
}

---------------------------------------------

h_ec0F_sub_bat3 [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_ec0F_sub_bat3 {
    JSR $&sub_0A8743
    COP [27] ( #10 )
    COP [C1]
    JSR $&sub_0A8733
    BCC code_0A86DC
    RTL 
}

code_0A86DC {
    COP [85] ( #21, #02, #02 )
    COP [8A]

  code_0A86E3:
    COP [86] ( #1F, #02, #03 )
    COP [8A]
    COP [81] ( #A1, #03 )
    COP [89]
    COP [86] ( #20, #02, #04 )
    COP [8A]
    COP [81] ( #21, #04 )
    COP [89]
    BRA code_0A86E3
}

---------------------------------------------

h_ec0F_sub_bat4 [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_ec0F_sub_bat4 {
    JSR $&sub_0A8743
    COP [27] ( #10 )
    COP [C1]
    JSR $&sub_0A8733
    BCC code_0A8710
    RTL 
}

code_0A8710 {
    COP [85] ( #A1, #02, #01 )
    COP [8A]

  code_0A8717:
    COP [86] ( #1F, #02, #03 )
    COP [8A]
    COP [81] ( #21, #04 )
    COP [89]
    COP [86] ( #20, #02, #04 )
    COP [8A]
    COP [81] ( #A1, #03 )
    COP [89]
    BRA code_0A8717
}

---------------------------------------------

sub_0A8733 {
    LDA $16
    SEC 
    SBC $player_y_pos
    BPL code_0A873F
    EOR #$FFFF
    INC 
}

code_0A873F {
    CMP #$003C
    RTS 
}

---------------------------------------------

sub_0A8743 {
    LDA #$0010
    TSB $12
    COP [B6] ( #30 )
    COP [B7] ( #00 )
    COP [BC] ( #08, #00 )
    RTS 
}

---------------------------------------------

func_0A8753 {
    COP [E0]
}