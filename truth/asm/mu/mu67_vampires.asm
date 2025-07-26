
?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_008000'
?INCLUDE 'stats_01ABF0'
?INCLUDE 'func_0AA36E'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00DB8A'

!scene_current                  0644
!joypad_mask_std                065A
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE
!WOBJSEL                        2125
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_btF4_neo_male_vampire [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_h_btF4_neo_male_vampire {
    LDA #$8011
    TSB $12
    COP [A5] ( @code_0AF1AD, #00, #00, #$2000 )
    COP [9C] ( @func_0AF6E6, #$2000 )
    LDA $0AD4
    CMP #$0002
    BNE code_0AF173
    JMP $&code_0AF23E
}

code_0AF173 {
    LDY $player_actor
    LDA #$*func_08F5F9
    STA $0002, Y
    LDA #$&func_08F5F9
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0AF199
    RTL 
}

code_0AF199 {
    JMP $&code_0AF23E
}

---------------------------------------------

h_btF4_neo_female_vampire [
  h_actor < #16, #00, #00 >   ;00
]

---------------------------------------------

e_h_btF4_neo_female_vampire {
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0AF1AA
    RTL 
}

code_0AF1AA {
    JMP $&code_0AF3E6
}

code_0AF1AD {
    COP [C1]
    LDA $0AEC
    BEQ code_0AF1B5
    RTL 
}

code_0AF1B5 {
    LDY $player_actor
    LDA #$*func_08F3B1
    STA $0002, Y
    LDA #$&func_08F3B1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0AF1DB
    RTL 
}

code_0AF1DB {
    COP [CD] ( #$0177 )
    LDA #$0003
    STA $0648
    LDA #$0403
    STA $064A
    COP [26] ( #E0, #$02F8, #$01A0, #03, #$2810 )
    COP [E0]
}

---------------------------------------------

h_mu67_male_vampire [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_mu67_male_vampire {
    COP [9C] ( @code_0AF53D, #$2800 )
    COP [9C] ( @func_0AF6E6, #$2000 )
    LDA #$FFFF
    STA $00FE
    COP [28] ( #$0180, #$0060, &func_0AFA48 )
    COP [28] ( #$0180, #$01E0, &func_0AFA48 )
    LDA #$0002
    JSL $@func_00B05E
    BCC code_0AF22F
    STZ $0AEC
    STZ $0AEE
    COP [E0]
}

code_0AF22F {
    LDA #$*binary_0AFA51
    AND #$00FF
    STA $0AF6
    LDA #$&binary_0AFA51
    STA $0AF4
}

code_0AF23E {
    COP [57] ( @func_0AFA59 )
    LDA #$8011
    TSB $12
    COP [D0] ( #87, #01, &code_0AF27E )
    COP [C1]
    COP [45] ( #01, #13, #0F, #15, &code_0AF259 )
    RTL 
}

code_0AF259 {
    COP [D2] ( #86, #01 )
    LDA $14
    STA $7F0018, X
    LDA #$0100
    STA $7F001A, X
    COP [52] ( #01, #02, #FF )
    COP [53]
    COP [D0] ( #87, #01, &code_0AF27E )
    COP [CC] ( #87 )
    COP [BF] ( &widestring_0AFB45 )
}

code_0AF27E {
    LDA $scene_current
    CMP #$0067
    BNE code_0AF2A2
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [07] ( #0E )
    COP [DA] ( #0E )
    COP [32] ( #92 )
    COP [33]
    COP [32] ( #91 )
    COP [33]
    COP [04] ( #0F )
    COP [DA] ( #27 )
}

code_0AF2A2 {
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [DA] ( #77 )
    COP [CC] ( #02 )
    COP [A2] ( @code_0AF876, #$2200 )
    STZ $09F0
    STZ $09F2
    BRA code_0AF2CA
}

---------------------------------------------

func_0AF2BD {
    JSR $&sub_0AFA17
    COP [52] ( #01, #02, #FF )
    COP [53]
    COP [DA] ( #1D )
}

code_0AF2CA {
    LDA $00F2
    BEQ code_0AF313

  code_0AF2CF:
    JSR $&sub_0AF961
    COP [58] ( &code_0AF39D )
    COP [52] ( #01, #02, #FF )
    COP [53]
    COP [DA] ( #13 )
    COP [80] ( #02 )
    COP [89]
    COP [07] ( #06 )
    COP [A5] ( @code_0AF8AC, #00, #00, #$2200 )
    COP [A5] ( @code_0AF8C7, #00, #00, #$2200 )
    COP [A5] ( @code_0AF8E2, #00, #00, #$2200 )
    COP [A5] ( @code_0AF8FD, #00, #00, #$2200 )
    COP [80] ( #0D )
    COP [89]
    BRA code_0AF2CA
}

code_0AF313 {
    LDA $09F2
    BEQ code_0AF31B
    JMP $&code_0AF394
}

code_0AF31B {
    COP [58] ( #$0000 )
    LDA #$0001
    STA $09F0
    COP [C2]
    LDA $09F2
    BEQ code_0AF32F
    JMP $&code_0AF394
}

code_0AF32F {
    LDA $09F0
    BEQ code_0AF341
    COP [C1]
    LDA $09F2
    BNE code_0AF394
    LDA $09F0
    BEQ code_0AF341
    RTL 
}

code_0AF341 {
    LDA $player_y_pos
    STA $7F001A, X
    LDA #$00B8
    STA $7F0018, X
    COP [52] ( #01, #04, #FF )
    COP [53]
    LDA $09F2
    BNE code_0AF394
    LDA #$0001
    STA $09F0
    COP [C2]
    LDA $09F2
    BNE code_0AF394
    LDA $09F0
    BEQ code_0AF36E
    RTL 
}

code_0AF36E {
    LDA #$0200
    TSB $10
    COP [80] ( #04 )
    COP [89]
    COP [3B] ( #43, @func_00B519 )
    COP [DA] ( #17 )
    COP [A5] ( @code_0AF619, #00, #00, #$0202 )
    COP [80] ( #11 )
    COP [89]
    LDA #$0200
    TRB $10
}

code_0AF394 {
    LDA #$0001
    STA $00F2
    JMP $&code_0AF2CF
}

code_0AF39D {
    COP [84] ( #01, #02 )
    COP [8A]
    COP [A2] ( @code_0AF712, #$0200 )
    COP [A2] ( @code_0AF718, #$0200 )
    COP [A2] ( @code_0AF71E, #$0200 )
    COP [A2] ( @code_0AF724, #$0200 )
    COP [84] ( #01, #02 )
    COP [8A]
    JMP $&func_0AF2BD
}

---------------------------------------------

h_mu67_female_vampire [
  h_actor < #17, #00, #01 >   ;00
]

---------------------------------------------

e_mu67_female_vampire {
    COP [28] ( #$0180, #$0060, &func_0AFA48 )
    COP [28] ( #$0180, #$01E0, &func_0AFA48 )
    LDA #$0002
    JSL $@func_00B05E
    BCC code_0AF3E6
    COP [E0]
}

code_0AF3E6 {
    COP [57] ( @code_0AFAA0 )
    LDA #$8011
    TSB $12
    COP [D0] ( #87, #01, &code_0AF41D )
    COP [C1]
    COP [45] ( #01, #13, #0F, #15, &code_0AF401 )
    RTL 
}

code_0AF401 {
    COP [D2] ( #86, #01 )
    LDA $14
    STA $7F0018, X
    LDA #$0100
    STA $7F001A, X
    COP [52] ( #17, #02, #FF )
    COP [53]
    COP [D2] ( #02, #01 )
}

code_0AF41D {
    COP [A2] ( @code_0AF7B6, #$2200 )
    BRA code_0AF433
}

---------------------------------------------

func_0AF426 {
    JSR $&sub_0AFA17
    COP [52] ( #17, #02, #FF )
    COP [53]
    COP [DA] ( #3B )
}

code_0AF433 {
    LDA $00F2
    BEQ code_0AF455
    COP [58] ( &func_0AF50F )
    STZ $00F0
    JSR $&sub_0AF9A8
    COP [52] ( #17, #02, #FF )
    COP [53]
    COP [58] ( #$0000 )
    INC $00F0
    COP [DA] ( #07 )
    BRA code_0AF433
}

code_0AF455 {
    LDA $09F2
    BNE code_0AF4BE
    COP [58] ( #$0000 )
    INC $00F0
    COP [C1]
    LDA $09F2
    BNE code_0AF4BE
    LDA $09F0
    BNE code_0AF46E
    RTL 
}

code_0AF46E {
    STZ $09F0
    COP [C2]
    LDA $player_y_pos
    STA $7F001A, X
    LDA #$0048
    STA $7F0018, X
    COP [52] ( #17, #04, #FF )
    COP [53]
    COP [C1]
    LDA $09F2
    BNE code_0AF4BE
    LDA $09F0
    BNE code_0AF495
    RTL 
}

code_0AF495 {
    STZ $09F0
    LDA #$0200
    TSB $10
    COP [80] ( #1A )
    COP [89]
    COP [DA] ( #17 )
    COP [A5] ( @code_0AF551, #00, #00, #$0202 )
    COP [DA] ( #1F )
    COP [80] ( #2A )
    COP [89]
    LDA #$0200
    TRB $10
    JMP $&func_0AF426
}

code_0AF4BE {
    LDA #$0001
    STA $00F2
    JMP $&func_0AF426
}

---------------------------------------------

func_0AF4C7 {
    COP [84] ( #18, #02 )
    COP [8A]
    COP [A5] ( @code_0AF8A5, #00, #00, #$2200 )
    JMP $&func_0AF426
}

---------------------------------------------

func_0AF4D9 {
    COP [84] ( #18, #02 )
    COP [8A]
    COP [A5] ( @code_0AF8C0, #00, #00, #$2200 )
    JMP $&func_0AF426
}

---------------------------------------------

func_0AF4EB {
    COP [84] ( #18, #02 )
    COP [8A]
    COP [A5] ( @code_0AF8DB, #00, #00, #$2200 )
    JMP $&func_0AF426
}

---------------------------------------------

func_0AF4FD {
    COP [84] ( #18, #02 )
    COP [8A]
    COP [A5] ( @code_0AF8F6, #00, #00, #$2200 )
    JMP $&func_0AF426
}

---------------------------------------------

func_0AF50F {
    INC $00F0
    COP [84] ( #17, #02 )
    COP [8A]
    COP [A2] ( @code_0AF72D, #$0200 )
    COP [A2] ( @code_0AF733, #$0200 )
    COP [A2] ( @code_0AF739, #$0200 )
    COP [A2] ( @code_0AF73F, #$0200 )
    COP [84] ( #17, #02 )
    COP [8A]
    JMP $&func_0AF426
}

code_0AF53D {
    SEP #$20
    LDA #$30
    STA $WOBJSEL
    LDA #$22
    STA $CGWSEL
    LDA #$03
    STA $CGADSUB
    REP #$20
    RTL 
}

code_0AF551 {
    LDA $scene_current
    CMP #$0067
    BNE code_0AF562
    LDA #$&stats_01ABF0+C4
    STA $7F0020, X
    BRA code_0AF569
}

code_0AF562 {
    LDA #$&stats_01ABF0+1A4
    STA $7F0020, X
}

code_0AF569 {
    COP [07] ( #1E )
    LDA #$0080
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0020
    STA $7F001A, X
    COP [52] ( #0A, #04, #FF )
    COP [53]
    COP [08] ( #$2323 )
    COP [9C] ( @code_0AF633, #$2000 )
    COP [3B] ( #67, @func_00B519 )
    COP [84] ( #0B, #04 )
    COP [8A]
    JSR $&sub_0AF6D7
    COP [07] ( #20 )
    COP [8D] ( #2E )
    LDA #$0000
    STA $7F100C, X
    COP [2B] ( #$0000, &code_0AF5B5, &code_0AF5B5, &code_0AF5BA )
}

code_0AF5B5 {
    LDA #$FFFD
    BRA code_0AF5BD
}

code_0AF5BA {
    LDA #$0003
}

code_0AF5BD {
    STA $7F100E, X
    COP [2A] ( #$0028, &code_0AF5CB, &code_0AF5D7, &code_0AF5D0 )
}

code_0AF5CB {
    LDA #$FFFE
    BRA code_0AF5D3
}

code_0AF5D0 {
    LDA #$0002
}

code_0AF5D3 {
    STA $7F100C, X
}

code_0AF5D7 {
    JSR $&sub_0AF6D7
    COP [A2] ( @code_0AF640, #$0300 )
    JSR $&sub_0AF6AA
    LDA $10
    BIT #$4000
    BNE code_0AF5F0
    COP [C4] ( @code_0AF5D7 )
}

code_0AF5F0 {
    LDA $16
    BMI code_0AF5FE
    CMP #$0240
    BCS code_0AF608
    COP [C4] ( @code_0AF5D7 )
}

code_0AF5FE {
    CMP #$FFC0
    BCC code_0AF608
    COP [C4] ( @code_0AF5D7 )
}

code_0AF608 {
    LDA #$FFFF
    STA $00FE
    STA $00F6
    STA $00FA
    COP [DA] ( #01 )
    COP [E0]
}

code_0AF619 {
    LDA #$0080
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0020
    STA $7F001A, X
    COP [52] ( #0A, #04, #FF )
    COP [53]
    COP [E0]
}

code_0AF633 {
    COP [CA] ( #20 )
    INC $00FE
    JSR $&sub_0AF6D7
    COP [CB]
    COP [E0]
}

code_0AF640 {
    LDY $24
    LDA $0026, Y
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0AF651 )
}

code_list_0AF651 [
  &code_0AF661   ;00
  &code_0AF666   ;01
  &code_0AF66B   ;02
  &code_0AF670   ;03
  &code_0AF675   ;04
  &code_0AF67A   ;05
  &code_0AF67F   ;06
  &code_0AF684   ;07
]

code_0AF661 {
    COP [8D] ( #11 )
    BRA code_0AF687
}

code_0AF666 {
    COP [8D] ( #95 )
    BRA code_0AF687
}

code_0AF66B {
    COP [8D] ( #12 )
    BRA code_0AF687
}

code_0AF670 {
    COP [8D] ( #13 )
    BRA code_0AF687
}

code_0AF675 {
    COP [8D] ( #94 )
    BRA code_0AF687
}

code_0AF67A {
    COP [8D] ( #93 )
    BRA code_0AF687
}

code_0AF67F {
    COP [8D] ( #15 )
    BRA code_0AF687
}

code_0AF684 {
    COP [8D] ( #14 )
}

code_0AF687 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0AF6A8
    LDA $08
    STZ $08
    STA $26
    COP [C2]
    LDY $24
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    DEC $26
    BMI code_0AF687
    RTL 
}

code_0AF6A8 {
    COP [E0]
}

---------------------------------------------

sub_0AF6AA {
    INC $26
    LDA $16
    CLC 
    ADC $7F100E, X
    STA $16
    LDA $14
    CLC 
    ADC $7F100C, X
    STA $14
    BIT #$FF00
    BEQ code_0AF6D6
    SEC 
    SBC $7F100C, X
    STA $14
    LDA $7F100C, X
    EOR #$FFFF
    INC 
    STA $7F100C, X
}

code_0AF6D6 {
    RTS 
}

---------------------------------------------

sub_0AF6D7 {
    LDA $14
    STA $00F6
    LDA $16
    SEC 
    SBC $068E
    STA $00FA
    RTS 
}

---------------------------------------------

func_0AF6E6 {
    COP [23]
    AND #$00FF
    CLC 
    ADC #$02D0
    STA $00F2
    COP [C2]
    DEC $00F2
    BEQ code_0AF6FA
    RTL 
}

code_0AF6FA {
    COP [C1]
    LDA $00F2
    BNE code_0AF702
    RTL 
}

code_0AF702 {
    LDA $09F2
    BNE code_0AF709
    BRA func_0AF6E6
}

code_0AF709 {
    COP [C1]
    LDA #$0001
    STA $00F2
    RTL 
}

code_0AF712 {
    COP [6C] ( #00, #00 )
    BRA code_0AF728
}

code_0AF718 {
    COP [6C] ( #00, #40 )
    BRA code_0AF728
}

code_0AF71E {
    COP [6C] ( #00, #80 )
    BRA code_0AF728
}

code_0AF724 {
    COP [6C] ( #00, #C0 )
}

code_0AF728 {
    COP [8D] ( #2B )
    BRA code_0AF746
}

code_0AF72D {
    COP [6C] ( #00, #00 )
    BRA code_0AF743
}

code_0AF733 {
    COP [6C] ( #00, #40 )
    BRA code_0AF743
}

code_0AF739 {
    COP [6C] ( #00, #80 )
    BRA code_0AF743
}

code_0AF73F {
    COP [6C] ( #00, #C0 )
}

code_0AF743 {
    COP [8D] ( #2C )
}

code_0AF746 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0AF746
    LDA $08
    STZ $08
    STA $26
    COP [C2]
    LDA $24
    STA $0000
    COP [6D] ( #03, #02 )
    LDA $7F0012, X
    CMP #$0080
    BCS code_0AF76D
    DEC $26
    BMI code_0AF746
    RTL 
}

code_0AF76D {
    COP [CA] ( #1E )

  code_0AF770:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0AF770
    LDA $08
    STZ $08
    STA $26
    COP [C2]
    LDA $24
    STA $0000
    COP [6D] ( #00, #04 )
    DEC $26
    BMI code_0AF78E
    RTL 
}

code_0AF78E {
    COP [CB]

  code_0AF790:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0AF790
    LDA $08
    STZ $08
    STA $26
    COP [C2]
    LDA $24
    STA $0000
    COP [6D] ( #FC, #04 )
    LDA $7F0012, X
    BMI code_0AF7B4
    DEC $26
    BMI code_0AF790
    RTL 
}

code_0AF7B4 {
    COP [E0]
}

code_0AF7B6 {
    LDA $00F0
    BEQ code_0AF7BC
    RTL 
}

code_0AF7BC {
    LDA $10
    BIT #$00C0
    BEQ code_0AF7C4
    RTL 
}

code_0AF7C4 {
    LDY $24
    SEP #$20
    LDA $02
    CMP $0002, Y
    BEQ code_0AF7D2
    JMP $&code_0AF873
}

code_0AF7D2 {
    REP #$20
    LDY $24
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [2C] ( &code_0AF7E6, &code_0AF81D )
}

code_0AF7E6 {
    LDA $16
    CMP $@word_0AFA40
    BEQ code_0AF801
    CMP $@word_0AFA40+2
    BEQ code_0AF801
    CMP $@word_0AFA40+4
    BEQ code_0AF801
    CMP $@word_0AFA40+6
    BEQ code_0AF801
    RTL 
}

code_0AF801 {
    COP [2A] ( #$000F, &code_0AF80B, &code_0AF875, &code_0AF814 )
}

code_0AF80B {
    COP [44] ( #FB, #FF, #FF, #01, &code_0AF854 )
    RTL 
}

code_0AF814 {
    COP [44] ( #01, #FF, #05, #01, &code_0AF859 )
    RTL 
}

code_0AF81D {
    LDA $14
    CMP $@word_0AFA38
    BEQ code_0AF838
    CMP $@word_0AFA38+2
    BEQ code_0AF838
    CMP $@word_0AFA38+4
    BEQ code_0AF838
    CMP $@word_0AFA38+6
    BEQ code_0AF838
    RTL 
}

code_0AF838 {
    COP [2B] ( #$000F, &code_0AF842, &code_0AF875, &code_0AF84B )
}

code_0AF842 {
    COP [44] ( #FF, #FA, #01, #FF, &code_0AF85E )
    RTL 
}

code_0AF84B {
    COP [44] ( #FF, #01, #01, #06, &code_0AF863 )
    RTL 
}

code_0AF854 {
    LDA #$&func_0AF4C7
    BRA code_0AF866
}

code_0AF859 {
    LDA #$&func_0AF4D9
    BRA code_0AF866
}

code_0AF85E {
    LDA #$&func_0AF4EB
    BRA code_0AF866
}

code_0AF863 {
    LDA #$&func_0AF4FD
}

code_0AF866 {
    LDY $24
    STA $0000, Y
    COP [07] ( #06 )
    INC $00F0
    RTL 
}

---------------------------------------------

func_0AF872_noref {
    PLX 
}

code_0AF873 {
    REP #$20
}

code_0AF875 {
    RTL 
}

code_0AF876 {
    COP [DA] ( #04 )
    LDY $24
    LDA $0014, Y
    CMP $14
    BNE code_0AF889
    LDA $0016, Y
    CMP $16
    BEQ code_0AF876
}

code_0AF889 {
    COP [9C] ( @code_0AF89E, #$0300 )
    LDY $24
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    BRA code_0AF876
}

code_0AF89E {
    COP [80] ( #0E )
    COP [89]
    COP [E0]
}

code_0AF8A5 {
    LDA #$0001
    STA $26
    BRA code_0AF8B6
}

code_0AF8AC {
    STZ $26
    COP [BC] ( #F0, #00 )
    COP [C8] ( &code_0AF937 )
}

code_0AF8B6 {
    COP [BC] ( #F0, #00 )
    COP [C8] ( &code_0AF911 )
    BRA code_0AF8B6
}

code_0AF8C0 {
    LDA #$0001
    STA $26
    BRA code_0AF8D1
}

code_0AF8C7 {
    STZ $26
    COP [BC] ( #10, #00 )
    COP [C8] ( &code_0AF937 )
}

code_0AF8D1 {
    COP [BC] ( #10, #00 )
    COP [C8] ( &code_0AF911 )
    BRA code_0AF8D1
}

code_0AF8DB {
    LDA #$0001
    STA $26
    BRA code_0AF8EC
}

code_0AF8E2 {
    STZ $26
    COP [BC] ( #00, #F0 )
    COP [C8] ( &code_0AF937 )
}

code_0AF8EC {
    COP [BC] ( #00, #F0 )
    COP [C8] ( &code_0AF911 )
    BRA code_0AF8EC
}

code_0AF8F6 {
    LDA #$0001
    STA $26
    BRA code_0AF907
}

code_0AF8FD {
    STZ $26
    COP [BC] ( #00, #10 )
    COP [C8] ( &code_0AF937 )
}

code_0AF907 {
    COP [BC] ( #00, #10 )
    COP [C8] ( &code_0AF911 )
    BRA code_0AF907
}

code_0AF911 {
    COP [13] ( &code_0AF95F )
    LDA $26
    BEQ code_0AF928
    COP [9C] ( @code_0AF95A, #$0200 )
    COP [07] ( #14 )
    COP [DA] ( #03 )
    COP [C5]
}

code_0AF928 {
    COP [9C] ( @code_0AF94F, #$0200 )
    COP [07] ( #14 )
    COP [DA] ( #01 )
    COP [C5]
}

code_0AF937 {
    COP [13] ( &code_0AF95F )
    COP [9C] ( @code_0AF947, #$0200 )
    COP [DA] ( #1D )
    COP [C5]
}

code_0AF947 {
    COP [84] ( #07, #06 )
    COP [8A]
    COP [E0]
}

code_0AF94F {
    COP [5B] ( #$0010 )
    COP [80] ( #23 )
    COP [89]
    COP [E0]
}

code_0AF95A {
    COP [80] ( #06 )
    COP [89]
}

code_0AF95F {
    COP [E0]
}

---------------------------------------------

sub_0AF961 {
    LDA $7F0018, X
    STA $0018
    LDA $7F001A, X
    STA $001C
    COP [23]
    AND #$0003
    STA $7F100C, X
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA38, X
    PLX 
    STA $7F0018, X
    COP [23]
    AND #$0003
    STA $7F100E, X
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA40, X
    PLX 
    STA $7F001A, X
    CMP $001C
    BNE code_0AF9A7
    LDA $0018
    CMP $7F0018, X
    BEQ sub_0AF961
}

code_0AF9A7 {
    RTS 
}

---------------------------------------------

sub_0AF9A8 {
    COP [23]
    LSR 
    BCC code_0AF9E8
    COP [23]
    LSR 
    LDA $7F100C, X
    AND #$0003
    BCC code_0AF9C1
    CMP #$0003
    BEQ code_0AF9C4
    INC 
    BRA code_0AF9C4
}

code_0AF9C1 {
    BEQ code_0AF9E8
    DEC 
}

code_0AF9C4 {
    STA $7F100C, X
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA38, X
    PLX 
    STA $7F0018, X

  code_0AF9D4:
    LDA $7F100E, X
    AND #$0003
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA40, X
    PLX 
    STA $7F001A, X
    RTS 
}

code_0AF9E8 {
    LDA $0410
    LSR 
    LSR 
    LDA $7F100E, X
    AND #$0003
    BCC code_0AF9FE
    CMP #$0003
    BEQ code_0AFA01
    INC 
    BRA code_0AFA01
}

code_0AF9FE {
    BEQ code_0AFA01
    DEC 
}

code_0AFA01 {
    STA $7F100E, X
    LDA $7F100C, X
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA38, X
    PLX 
    STA $7F0018, X
    BRA code_0AF9D4
}

---------------------------------------------

sub_0AFA17 {
    LDA $7F100C, X
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA38, X
    PLX 
    STA $7F0018, X
    LDA $7F100E, X
    ASL 
    PHX 
    TAX 
    LDA $@word_0AFA40, X
    PLX 
    STA $7F001A, X
    RTS 
}

---------------------------------------------

word_0AFA38 [
  #$0018   ;00
  #$0058   ;01
  #$00A8   ;02
  #$00E8   ;03
]

---------------------------------------------

word_0AFA40 [
  #$0058   ;00
  #$00D8   ;01
  #$0158   ;02
  #$01D8   ;03
]

---------------------------------------------

func_0AFA48 {
    LDA #$0008
    TSB $player_flags
    COP [C1]
    RTL 
}

---------------------------------------------

binary_0AFA51 #66F8003000000022

---------------------------------------------

func_0AFA59 {
    COP [C1]
    LDA $09F2
    BNE code_0AFA72
    INC 
    STA $09F2
    LDA $scene_current
    CMP #$0067
    BNE code_0AFA81
    COP [BF] ( &widestring_0AFCA0 )
    BRA code_0AFA81
}

code_0AFA72 {
    LDA #$0020
    TSB $player_flags
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
}

code_0AFA81 {
    LDA $player_flags
    BIT #$0200
    BNE code_0AFA97
    COP [A5] ( @code_0AFAE7, #00, #F0, #$2300 )
    COP [DA] ( #1D )
    COP [E0]
}

code_0AFA97 {
    LDA #$0020
    TRB $player_flags
    COP [C1]
    RTL 
}

code_0AFAA0 {
    COP [C1]
    LDA $09F2
    BNE code_0AFAB9
    INC 
    STA $09F2
    LDA $scene_current
    CMP #$0067
    BNE code_0AFAC8
    COP [BF] ( &widestring_0AFCE4 )
    BRA code_0AFAC8
}

code_0AFAB9 {
    LDA #$0020
    TSB $player_flags
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
}

code_0AFAC8 {
    LDA $player_flags
    BIT #$0200
    BNE code_0AFADE
    COP [A5] ( @code_0AFAE7, #00, #F0, #$2300 )
    COP [DA] ( #1D )
    COP [E0]
}

code_0AFADE {
    LDA #$0020
    TRB $player_flags
    COP [C1]
    RTL 
}

code_0AFAE7 {
    COP [88] ( @table_0EE000 )
    COP [CA] ( #03 )
    COP [A5] ( @code_0AFB0E, #00, #00, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_0AFB1B, #00, #00, #$0302 )
    COP [DA] ( #05 )
    COP [CB]
    COP [C7] ( @func_00DB8A )
}

code_0AFB0E {
    JSR $&sub_0AFB28
    COP [07] ( #06 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0AFB1B {
    JSR $&sub_0AFB28
    COP [07] ( #06 )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_0AFB28 {
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $16
    STA $16
    COP [23]
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $14
    STA $14
    RTS 
}

---------------------------------------------

widestring_0AFB45 `[DEF][TPL:2]Vampire: [N][LU1:67][LU1:8F]the  [N]Mystic Statue! [FIN]I [LU1:D8][LU1:D7]guy who [N][LU1:80]to the [LU2:93]was [N]strange....We [LU1:F2][N][LU2:94]to let him go. [FIN][TPL:1]Vampiress: [N][LU1:62]are you saying? [N]You [LU1:F2]drooling [N][LU1:F6]he was here! [FIN][LU1:69][LU2:44][LU1:A5][LU1:D7][N][LU1:F6]young ones come! [N]All you [LU2:5D][LU1:DA][LU1:6B][N]is food! [FIN][TPL:2]Vampire: [N]So do you!! [FIN]Wait. This is not the[N][LU1:DF]or [LU2:90]for[N]an argument.[FIN]First, let's get [LU1:D7][N]Mystic Statue!  [N]Get ready!!![PAL:0][END]`

widestring_0AFCA0 `[DLG:3,11][SIZ:D,4][TPL:1]Vampiress: [N]I'm glad he's gone. [N][LU1:1D][LU1:FE][LU2:B9]next!! [N]Get ready![PAL:0][END]`

widestring_0AFCE4 `[DLG:3,11][SIZ:D,4][TPL:2]Vampire: You! [N]You did [LU1:D7]to my wife! [N][LU1:1F][LU1:BB]forgive you!![PAL:0][END]`