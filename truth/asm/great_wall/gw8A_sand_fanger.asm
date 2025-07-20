?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_00F432'
?INCLUDE 'func_0AA36E'
?INCLUDE 'func_0AA43F'
?INCLUDE 'func_00DF15'
?INCLUDE 'table_0EE000'
?INCLUDE 'stats_01ABF0'
?INCLUDE 'actor_00E4DB'
?INCLUDE 'entry_points_00C418'
?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_028000'

!joypad_mask_std                065A
!camera_bounds_y                06DC
!player_x_pos                   09A2
!player_x_tile                  09A6
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btF5_neo_fanger [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_btF5_neo_fanger {
    LDA #$8019
    TSB $12
    LDA $camera_bounds_y
    CLC 
    ADC #$0020
    STA $camera_bounds_y
    LDY $player_actor
    LDA $000E, Y
    ORA #$3000
    STA $000E, Y
    COP [57] ( @code_0B8582 )
    COP [A5] ( @code_0B80F0, #00, #00, #$2000 )
    LDA $0AD4
    CMP #$0002
    BNE code_0B8037
    JMP $&code_0B81E3
}

code_0B8037 {
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
    BEQ code_0B805D
    RTL 
}

code_0B805D {
    JMP $&code_0B81E3
}

---------------------------------------------

func_0B8060 {
    COP [C1]
    LDA $player_flags
    BIT #$0020
    BNE code_0B806B
    RTL 
}

code_0B806B {
    BIT #$0200
    BEQ code_0B8073
    COP [C1]
    RTL 
}

code_0B8073 {
    COP [D3] ( #$016A, #01 )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [BF] ( &widestring_0B80B5 )
    LDA #$0003
    STA $0AAC
    LDA #$008A
    STA $0B12
    LDA #$0016
    STA $0B08
    STA $0B0A
    LDA #$002C
    STA $0B0C
    STA $0B0E
    LDA #$3300
    STA $0B10
    COP [26] ( #FD, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

widestring_0B80B5 `[DEF][TPL:0][LU1:67]defeated the [N]Sand Fanger!  [N]Look! A Mystic Statue![PAL:0][END]`

code_0B80F0 {
    COP [C1]
    LDA $0AEC
    BEQ code_0B80F8
    RTL 
}

code_0B80F8 {
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
    BEQ code_0B811E
    RTL 
}

code_0B811E {
    COP [CD] ( #$0178 )
    LDA #$0003
    STA $0648
    LDA #$0403
    STA $064A
    COP [26] ( #E0, #$02F8, #$00A0, #03, #$1800 )
    COP [E0]
}

---------------------------------------------

func_0B813A {
    LDY $player_actor
    LDA $0016, Y
    CMP #$01C7
    BCS code_0B8152
    LDA $000E, Y
    AND #$CFFF
    ORA #$2000
    STA $000E, Y
    RTL 
}

code_0B8152 {
    LDA $000E, Y
    ORA #$3000
    STA $000E, Y
    RTL 
}

---------------------------------------------

h_gw8A_sand_fanger [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_gw8A_sand_fanger {
    COP [A5] ( @func_0B813A, #00, #00, #$2000 )
    LDA #$0003
    JSL $@func_00B05E
    BCC code_0B8179
    STZ $0AEC
    STZ $0AEE
    COP [E0]
}

code_0B8179 {
    LDA #$8019
    TSB $12
    COP [A5] ( @func_0B8060, #00, #00, #$2000 )
    COP [57] ( @code_0B8582 )
    COP [0F] ( #0F, #2A )
    COP [0F] ( #10, #2A )
    COP [0F] ( #0F, #2B )
    COP [0F] ( #10, #2B )
    COP [C1]
    COP [45] ( #0D, #19, #12, #1B, &code_0B81A7 )
    RTL 
}

code_0B81A7 {
    LDY $player_actor
    LDA $000E, Y
    ORA #$3000
    STA $000E, Y
    COP [C1]
    COP [45] ( #0F, #2C, #11, #2E, &code_0B81BE )
    RTL 
}

code_0B81BE {
    COP [10] ( #0F, #2A )
    COP [10] ( #10, #2A )
    COP [10] ( #0F, #2B )
    COP [10] ( #10, #2B )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #1F )
    COP [04] ( #0F )
    COP [DA] ( #3B )
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_0B81E3 {
    COP [A1] ( @code_0B8A09, #$2000 )
    COP [9C] ( @code_0B861C, #$2200 )
    LDA #$0009

  code_0B81F4:
    PHA 
    COP [9C] ( @code_0B86EE, #$2200 )
    PLA 
    DEC 
    BPL code_0B81F4

  code_0B8200:
    COP [DA] ( #4F )
    LDA #$0080
    TRB $10
    LDA $player_x_tile
    LSR 
    LSR 
    LSR 
    BCS code_0B8226
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0B821E )
}

code_list_0B821E [
  &code_0B823C   ;00
  &code_0B823C   ;01
  &code_0B825D   ;02
  &code_0B82FC   ;03
]

code_0B8226 {
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0B8234 )
}

code_list_0B8234 [
  &code_0B825D   ;00
  &code_0B825D   ;01
  &code_0B823C   ;02
  &code_0B82FC   ;03
]

code_0B823C {
    JSR $&sub_0B8BCB
    JSR $&sub_0B8BBE
    COP [DA] ( #3B )
    LDA #$02C8
    STA $16
    COP [C8] ( &code_0B8313 )
    JSR $&sub_0B8BCB
    LDA #$0048
    STA $16
    COP [C8] ( &code_0B8348 )
    JMP $&code_0B8200
}

code_0B825D {
    LDA $player_x_pos
    CMP #$0180
    BCC code_0B82B3
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC #$0278
    STA $14
    STA $24
    JSR $&sub_0B8BBE
    LDA #$0000
    STA $7F100C, X
    COP [DA] ( #13 )

  code_0B8283:
    LDA #$02E0
    STA $16
    LDA #$0003
    STA $26
    JSR $&sub_0B8B86
    JSR $&sub_0B8B32
    COP [C8] ( &code_0B837D )
    LDA $7F0018, X
    SEC 
    SBC #$0080
    STA $14
    STA $24
    BPL code_0B82A8
    JMP $&code_0B8200
}

code_0B82A8 {
    CMP #$00E8
    BCS code_0B8283
    COP [DA] ( #31 )
    JMP $&code_0B8200
}

code_0B82B3 {
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC #$0088
    STA $14
    STA $24
    JSR $&sub_0B8BBE
    LDA #$0000
    STA $7F100C, X
    COP [DA] ( #13 )

  code_0B82D1:
    LDA #$02E0
    STA $16
    LDA #$0004
    STA $26
    JSR $&sub_0B8B86
    JSR $&sub_0B8B5C
    COP [C8] ( &func_0B8422 )
    LDA $7F0018, X
    CLC 
    ADC #$0080
    STA $14
    STA $24
    CMP #$0218
    BCC code_0B82D1
    COP [DA] ( #31 )
    JMP $&code_0B8200
}

code_0B82FC {
    LDA $0DBC
    CMP #$003C
    BCC code_0B8307
    JMP $&code_0B8200
}

code_0B8307 {
    LDA #$0005
    STA $26
    COP [C8] ( &func_0B84C7 )
    JMP $&code_0B8200
}

code_0B8313 {
    LDA #$0001
    STA $26
    JSR $&sub_0B8AE1
    COP [8D] ( #00 )
    COP [AB] ( #08 )
    COP [C1]
    JSR $&sub_0B9CE8
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $7F0010, X
    CLC 
    ADC #$0006
    AND #$00FF
    STA $7F0010, X
    LDA $16
    CMP #$0050
    BCC code_0B8344
    RTL 
}

code_0B8344 {
    STZ $2E
    COP [C5]
}

code_0B8348 {
    LDA #$0002
    STA $26
    JSR $&sub_0B8AE1
    COP [8D] ( #04 )
    COP [AB] ( #0B )
    COP [C1]
    JSR $&sub_0B9CE8
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $7F0010, X
    CLC 
    ADC #$0008
    AND #$00FF
    STA $7F0010, X
    LDA $16
    CMP #$03A0
    BCS code_0B8379
    RTL 
}

code_0B8379 {
    STZ $2E
    COP [C5]
}

code_0B837D {
    LDA $7F000A, X
    STA $28
    COP [8D] ( #FF )
    STZ $08
    STZ $2E
    STZ $2C

  code_0B838C:
    COP [C2]
    LDA $7F0018, X
    STA $14
    LDA $7F001A, X
    STA $16
    JSL $@func_00F432
    LDA $7F0010, X
    CLC 
    ADC #$0010
    AND #$00FF
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    CMP $7F0000, X
    BEQ code_0B83E1
    STA $7F0000, X
    PHX 
    TAX 
    STZ $28
    SEP #$20
    LDA #$40
    TRB $0F
    LDA $@byte_0B841A, X
    PLX 
    CLC 
    ADC $7F000A, X
    STA $28
    BPL code_0B83DA
    AND #$7F
    STA $28
    LDA #$40
    TSB $0F
    BRA code_0B83DC
}

code_0B83DA {
    STA $28
}

code_0B83DC {
    REP #$20
    COP [8D] ( #FF )
}

code_0B83E1 {
    SEP #$20
    LDA $7F0010, X
    CLC 
    ADC #$02
    STA $7F0010, X
    STA $7F0011, X
    SEC 
    SBC $7F0002, X
    BIT #$80
    BEQ code_0B8411
    LDA $7F0002, X
    CLC 
    ADC #$80
    STA $7F0002, X
    LDA $7F000E, X
    DEC 
    BMI code_0B8416
    STA $7F000E, X
}

code_0B8411 {
    REP #$20
    JMP $&code_0B838C
}

code_0B8416 {
    REP #$20
    COP [C5]
}

---------------------------------------------

byte_0B841A [
  #82   ;00
  #81   ;01
  #00   ;02
  #01   ;03
  #02   ;04
  #03   ;05
  #04   ;06
  #83   ;07
]

---------------------------------------------

func_0B8422 {
    LDA $7F000A, X
    STA $28
    COP [8D] ( #FF )
    STZ $08
    STZ $2E
    STZ $2C

  code_0B8431:
    COP [C2]
    LDA $7F0018, X
    STA $14
    LDA $7F001A, X
    STA $16
    JSL $@func_00F432
    LDA $7F0010, X
    CLC 
    ADC #$0010
    AND #$00FF
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    CMP $7F0000, X
    BEQ code_0B8486
    STA $7F0000, X
    PHX 
    TAX 
    STZ $28
    SEP #$20
    LDA #$40
    TRB $0F
    LDA $@byte_0B84BF, X
    PLX 
    CLC 
    ADC $7F000A, X
    STA $28
    BPL code_0B847F
    AND #$7F
    STA $28
    LDA #$40
    TSB $0F
    BRA code_0B8481
}

code_0B847F {
    STA $28
}

code_0B8481 {
    REP #$20
    COP [8D] ( #FF )
}

code_0B8486 {
    SEP #$20
    LDA $7F0010, X
    CLC 
    ADC #$FE
    STA $7F0010, X
    STA $7F0011, X
    CLC 
    ADC $7F0002, X
    BIT #$80
    BEQ code_0B84B6
    LDA $7F0002, X
    SEC 
    SBC #$80
    STA $7F0002, X
    LDA $7F000E, X
    DEC 
    BMI code_0B84BB
    STA $7F000E, X
}

code_0B84B6 {
    REP #$20
    JMP $&code_0B8431
}

code_0B84BB {
    REP #$20
    COP [C5]
}

---------------------------------------------

byte_0B84BF [
  #02   ;00
  #03   ;01
  #04   ;02
  #83   ;03
  #82   ;04
  #81   ;05
  #00   ;06
  #01   ;07
]

---------------------------------------------

func_0B84C7 {
    COP [23]
    SEC 
    SBC #$007F
    CLC 
    ADC $player_x_pos
    BPL code_0B84D7

  code_0B84D3:
    CLC 
    ADC #$007F
}

code_0B84D7 {
    CMP #$0030
    BCC code_0B84D3
    CMP #$02D0
    BCC code_0B84E5
    SEC 
    SBC #$007F
}

code_0B84E5 {
    STA $14
    JSR $&sub_0B8BBE
    COP [DA] ( #3B )
    LDA #$02CF
    STA $16
    COP [80] ( #0F )
    COP [89]
    PEA $&func_0B8531-1
    COP [23]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0B8508 )
}

code_list_0B8508 [
  &code_0B8518   ;00
  &code_0B851D   ;01
  &code_0B8522   ;02
  &code_0B8527   ;03
  &code_0B852C   ;04
  &code_0B8518   ;05
  &code_0B8518   ;06
  &code_0B8518   ;07
]

code_0B8518 {
    JSR $&code_0B856E
    BRA code_0B8578
}

code_0B851D {
    JSR $&code_0B856E
    BRA code_0B8546
}

code_0B8522 {
    JSR $&code_0B8578
    BRA code_0B8550
}

code_0B8527 {
    JSR $&code_0B856E
    BRA code_0B8564
}

code_0B852C {
    JSR $&code_0B8578
    BRA code_0B855A
}

---------------------------------------------

func_0B8531 {
    COP [84] ( #19, #20 )
    COP [8A]
    COP [80] ( #1A )
    COP [89]
    COP [AB] ( #13 )
    COP [DA] ( #09 )
    STZ $2E
    COP [C5]
}

code_0B8546 {
    COP [A5] ( @code_0B87E4, #00, #F8, #$0301 )
    RTS 
}

code_0B8550 {
    COP [A5] ( @code_0B87DA, #00, #F8, #$0301 )
    RTS 
}

code_0B855A {
    COP [A5] ( @code_0B8891, #00, #F8, #$0301 )
    RTS 
}

code_0B8564 {
    COP [A5] ( @code_0B8896, #00, #F8, #$0301 )
    RTS 
}

code_0B856E {
    COP [A5] ( @code_0B88CD, #00, #F8, #$0111 )
    RTS 
}

code_0B8578 {
    COP [A5] ( @code_0B88DB, #00, #F8, #$0111 )
    RTS 
}

code_0B8582 {
    LDA $player_flags
    BIT #$0200
    BEQ code_0B858D
    COP [C1]
    RTL 
}

code_0B858D {
    LDA #$0020
    TSB $player_flags
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
    LDA #$000A
    STA $0000
    LDA #$0014
    STA $0002
    LDY $06

  code_0B85AA:
    LDA $0010, Y
    BIT #$2000
    BEQ code_0B85BA
    LDA #$&loc_0B8618
    STA $0000, Y
    BRA code_0B85CD
}

code_0B85BA {
    LDA #$&loc_0B860C
    STA $0000, Y
    LDA $0002
    STA $0008, Y
    CLC 
    ADC #$0008
    STA $0002
}

code_0B85CD {
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_0B85AA
    PHX 
    LDX $0056

  code_0B85DA:
    LDA $7F002A, X
    BIT #$0080
    BEQ code_0B85FB
    LDA $0010, X
    BIT #$0040
    BNE code_0B85FB
    BIT #$2000
    BEQ code_0B85F5
    LDA #$&loc_0B8618
    BRA code_0B85F8
}

code_0B85F5 {
    LDA #$&loc_0B860C
}

code_0B85F8 {
    STA $0000, X
}

code_0B85FB {
    LDA $0006, X
    BEQ code_0B8603
    TAX 
    BRA code_0B85DA
}

code_0B8603 {
    PLX 
    COP [DA] ( #10 )
    COP [C7] ( @func_0AA43F )

  loc_0B860C:
    COP [07] ( #06 )
    COP [A5] ( @func_00DF15, #00, #10, #$0302 )

  loc_0B8618:
    COP [E0]
}

---------------------------------------------

func_0B861A {
    COP [C1]
}

code_0B861C {
    LDY $24
    LDA $0026, Y
    BNE code_0B8624
    RTL 
}

code_0B8624 {
    LDY $24
    LDA $0014, Y
    STA $14
    LDA $0026, Y
    DEC 
    STA $0000
    LDA #$0000
    STA $0026, Y
    COP [D9] ( #$0000, &code_list_0B863E )
}

code_list_0B863E [
  &code_0B8648   ;00
  &code_0B8672   ;01
  &code_0B869C   ;02
  &code_0B86C3   ;03
  &func_0B861A   ;04
]

code_0B8648 {
    COP [8D] ( #0A )
    LDA $14
    STA $7F0000, X
    STA $7F0002, X
    STA $7F000E, X

  code_0B8659:
    JSR $&sub_0B8AF6
    LDY $24
    LDA $0016, Y
    CLC 
    ADC #$00C0
    STA $16
    COP [C2]
    LDY $24
    LDA $0026, Y
    BNE code_0B8624
    BRA code_0B8659
}

code_0B8672 {
    COP [8D] ( #0E )
    LDA $14
    STA $7F0000, X
    STA $7F0002, X
    STA $7F000E, X

  code_0B8683:
    JSR $&sub_0B8B05
    LDY $24
    LDA $0016, Y
    SEC 
    SBC #$00B0
    STA $16
    COP [C2]
    LDY $24
    LDA $0026, Y
    BNE code_0B8624
    BRA code_0B8683
}

code_0B869C {
    LDA #$000A
    STA $7F000A, X
    LDY $24
    LDA $0024, Y
    STA $14
    LDA #$02E0
    STA $16
    JSR $&sub_0B8B32
    COP [C8] ( &code_0B837D )

  code_0B86B6:
    COP [C1]
    LDY $24
    LDA $0026, Y
    BEQ code_0B86C2
    JMP $&code_0B8624
}

code_0B86C2 {
    RTL 
}

code_0B86C3 {
    LDA #$000A
    STA $7F000A, X
    LDY $24
    LDA $0024, Y
    STA $14
    LDA #$02E0
    STA $16
    JSR $&sub_0B8B5C
    COP [C8] ( &func_0B8422 )
    BRA code_0B86B6
}

---------------------------------------------

func_0B86DF {
    COP [C1]
    LDY $24
    LDA $0026, Y
    CMP #$0005
    BNE code_0B86EC
    RTL 
}

code_0B86EC {
    COP [C1]
}

code_0B86EE {
    LDY $24
    LDA $0026, Y
    BNE code_0B86F6
    RTL 
}

code_0B86F6 {
    LDY $24
    LDA $0024, Y
    STA $14
    LDA $0026, Y
    DEC 
    STA $0000
    COP [D9] ( #$0000, &code_list_0B870A )
}

code_list_0B870A [
  &code_0B8714   ;00
  &code_0B8744   ;01
  &code_0B8774   ;02
  &code_0B879B   ;03
  &func_0B86DF   ;04
]

code_0B8714 {
    COP [8D] ( #05 )
    LDA $14
    STA $7F0000, X
    STA $7F0002, X
    STA $7F000E, X

  code_0B8725:
    COP [8B]
    LDA $2A
    BEQ code_0B8725
    LDA $08
    STZ $08
    INC 
    STA $26

  code_0B8732:
    JSR $&sub_0B8AF6
    COP [C2]
    LDY $24
    LDA $0026, Y
    BNE code_0B86F6
    DEC $26
    BMI code_0B8725
    BRA code_0B8732
}

code_0B8744 {
    COP [8D] ( #09 )
    LDA $14
    STA $7F0000, X
    STA $7F0002, X
    STA $7F000E, X

  code_0B8755:
    COP [8B]
    LDA $2A
    BEQ code_0B8755
    LDA $08
    STZ $08
    INC 
    STA $26

  code_0B8762:
    JSR $&sub_0B8B05
    COP [C2]
    LDY $24
    LDA $0026, Y
    BNE code_0B86F6
    DEC $26
    BMI code_0B8755
    BRA code_0B8762
}

code_0B8774 {
    LDA #$0005
    STA $7F000A, X
    LDY $24
    LDA $0024, Y
    STA $14
    LDA #$02E0
    STA $16
    JSR $&sub_0B8B32
    COP [C8] ( &code_0B837D )

  code_0B878E:
    COP [C1]
    LDY $24
    LDA $0026, Y
    BEQ code_0B879A
    JMP $&code_0B86F6
}

code_0B879A {
    RTL 
}

code_0B879B {
    LDA #$0005
    STA $7F000A, X
    LDY $24
    LDA $0024, Y
    STA $14
    LDA #$02E0
    STA $16
    JSR $&sub_0B8B5C
    COP [C8] ( &func_0B8422 )
    BRA code_0B878E
}

---------------------------------------------

func_0B87B7 {
    COP [B6] ( #30 )
    LDA #$02D0
    STA $16
    COP [80] ( #1B )
    COP [89]
    COP [CA] ( #3C )
    LDY $24
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    CMP #$02C8
    BCC code_0B87D8
    COP [CB]
}

code_0B87D8 {
    COP [E0]
}

code_0B87DA {
    LDA #$4000
    TSB $12
    COP [AA] ( #11 )
    BRA code_0B87E9
}

code_0B87E4 {
    COP [AA] ( #11 )
    COP [BB]
}

code_0B87E9 {
    LDA #$0002
    TSB $12
    COP [8D] ( #10 )
    COP [C8] ( &code_0B89D7 )
    LDA #$0101
    TRB $10
    COP [80] ( #1C )
    COP [89]
    COP [07] ( #26 )
    COP [8D] ( #1D )
    STZ $26

  code_0B8807:
    COP [AC] ( #03, #01 )

  code_0B880B:
    COP [8B]
    LDA $2A
    BEQ code_0B8807
    LDA $08
    STZ $08
    STA $24

  code_0B8817:
    LDA $14
    CMP #$02C8
    BCC code_0B8839
    LDA #$4000
    TSB $12
    LDA $26
    INC $26
    CMP #$0002
    BCS code_0B8879
    CLC 
    ADC #$001E
    STA $28
    COP [8D] ( #FF )
    COP [BA]
    BRA code_0B8859
}

code_0B8839 {
    LDA $14
    CMP #$0038
    BCS code_0B8859
    LDA #$4000
    TRB $12
    LDA $26
    INC $26
    CMP #$0002
    BCS code_0B8879
    CLC 
    ADC #$001E
    STA $28
    COP [8D] ( #FF )
    COP [BB]
}

code_0B8859 {
    LDA $16
    CMP #$02F0
    BCC code_0B8865
    LDA #$2000
    TSB $12
}

code_0B8865 {
    LDA $16
    CMP #$02B0
    BCS code_0B8871
    LDA #$2000
    TRB $12
}

code_0B8871 {
    COP [C2]
    DEC $24
    BPL code_0B8817
    BRA code_0B880B
}

code_0B8879 {
    COP [AC] ( #13, #45 )
    COP [DA] ( #0A )
    STZ $2C
    STZ $2E
    COP [80] ( #20 )
    COP [89]
    COP [84] ( #24, #04 )
    COP [8A]
    COP [E0]
}

code_0B8891 {
    LDA #$4000
    TSB $12
}

code_0B8896 {
    COP [AA] ( #13 )
    COP [8D] ( #21 )
    COP [C8] ( &code_0B89D7 )
    LDA #$0100
    TRB $10
    COP [DA] ( #13 )
    COP [84] ( #22, #06 )
    COP [8A]
    COP [07] ( #14 )
    COP [A5] ( @code_0B88C1, #00, #FD, #$0302 )
    COP [80] ( #23 )
    COP [89]
    COP [E0]
}

code_0B88C1 {
    COP [88] ( @table_0EE000 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0B88CD {
    LDA #$4000
    TSB $12
    BRA code_0B88DB
}

---------------------------------------------

func_0B88D4_noref {
    LDA #$4000
    TSB $12
    BRA code_0B88E0
}

code_0B88DB {
    COP [AA] ( #13 )
    BRA code_0B88E3
}

code_0B88E0 {
    COP [AA] ( #11 )
}

code_0B88E3 {
    COP [07] ( #13 )
    COP [8D] ( #10 )
    COP [C8] ( &code_0B89D7 )
    COP [07] ( #1D )
    LDA #$&stats_01ABF0+DC
    STA $7F0020, X
    LDA $@stats_01ABF0+DC
    AND #$00FF
    STA $7F0026, X
    COP [07] ( #28 )
    LDA #$0010
    TRB $10
    COP [80] ( #11 )
    COP [89]
    LDA #$00B0
    TSB $12

  code_0B8914:
    LDA #$2000
    TSB $10
    COP [23]
    AND #$007F
    CLC 
    ADC #$0064
    STA $08
    COP [C2]

  code_0B8926:
    COP [23]
    PHA 
    SEC 
    SBC #$007F
    CLC 
    ADC $player_x_pos
    AND #$FFF0
    CLC 
    ADC #$0008
    STA $14
    PLA 
    AND #$0070
    SEC 
    SBC #$0030
    CLC 
    ADC #$02D0
    STA $16
    COP [C2]
    COP [13] ( &code_0B8926 )
    LDA #$2000
    TRB $10
    COP [80] ( #12 )
    COP [89]
    COP [84] ( #14, #02 )
    COP [8A]
    COP [21] ( #02, &code_0B8972 )
    COP [A5] ( @code_0B8979, #00, #F0, #$0200 )
    COP [84] ( #14, #02 )
    COP [8A]
}

code_0B8972 {
    COP [80] ( #13 )
    COP [89]
    BRA code_0B8914
}

code_0B8979 {
    COP [5B] ( #$0010 )
    COP [07] ( #1E )
    LDA #$0002
    STA $7F0014, X
    COP [A2] ( @code_00E4FC, #$2000 )
    CPY #$1FC0
    BEQ code_0B89D0
    LDA $player_actor
    STA $0024, Y
    COP [8D] ( #17 )

  code_0B899C:
    COP [8B]
    LDA $2A
    BEQ code_0B899C
    LDA $08
    STZ $08
    INC 
    STA $26

  code_0B89A9:
    LDA $14
    CMP #$0030
    BCC code_0B89D2
    CMP #$02D0
    BCS code_0B89D2
    LDA $16
    CMP #$0294
    BCC code_0B89D2
    CMP #$02F8
    BCS code_0B89D2
    COP [C2]
    LDA $10
    BIT #$4000
    BNE code_0B899C
    DEC $26
    BPL code_0B89A9
    BRA code_0B899C
}

code_0B89D0 {
    COP [E0]
}

code_0B89D2 {
    COP [C7] ( @func_00C418 )
}

code_0B89D7 {
    COP [5B] ( #$0080 )
    COP [B6] ( #30 )
    COP [63] ( #02, #08, #00 )
    COP [C1]
    LDA $14
    CMP #$02D0
    BCC code_0B89F1
    LDA #$4000
    TSB $12
}

code_0B89F1 {
    LDA $14
    CMP #$0030
    BCS code_0B89FD
    LDA #$4000
    TRB $12
}

code_0B89FD {
    COP [64]
    CMP #$0000
    BMI code_0B8A05
    RTL 
}

code_0B8A05 {
    STZ $2C
    COP [C5]
}

code_0B8A09 {
    LDA #$0180
    TSB $12
    COP [A1] ( @code_0B8AD5, #$2300 )
    STY $20
    COP [C1]
    LDY $24
    LDA $0010, Y
    BIT #$0040
    BEQ code_0B8A26
    JMP $&code_0B8AC7
}

code_0B8A26 {
    LDA #$000B
    STA $0000
    LDY $06
    STY $0002
    STZ $0004
    LDA $0010, Y
    BIT #$0080
    BEQ code_0B8A3F
    INC $0004
}

code_0B8A3F {
    LDA #$02D0
    CMP $0016, Y
    BCS code_0B8A52
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    BRA code_0B8A5B
}

code_0B8A52 {
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
}

code_0B8A5B {
    CPY $0002
    BEQ code_0B8A7D
    LDA $000E, Y
    AND #$F1FF
    STA $000E, Y
    LDA $0004
    BEQ code_0B8A7D
    LDA $0036
    LSR 
    BCC code_0B8A7D
    LDA $000E, Y
    ORA #$0800
    STA $000E, Y
}

code_0B8A7D {
    DEC $0000
    BMI code_0B8A88
    LDA $0006, Y
    TAY 
    BRA code_0B8A3F
}

code_0B8A88 {
    LDA #$000B
    STA $0000
    LDY $06

  code_0B8A90:
    LDA #$02C8
    SEC 
    SBC $0016, Y
    BPL code_0B8A9D
    EOR #$FFFF
    INC 
}

code_0B8A9D {
    CMP #$000A
    BCS code_0B8ABC
    PHX 
    LDX $20
    LDA $0010, X
    AND #$DFFF
    STA $0010, X
    LDA $0014, Y
    STA $0014, X
    LDA #$02D8
    STA $0016, X
    PLX 
    RTL 
}

code_0B8ABC {
    DEC $0000
    BMI code_0B8AC9
    LDA $0006, Y
    TAY 
    BRA code_0B8A90
}

code_0B8AC7 {
    COP [C1]
}

code_0B8AC9 {
    LDY $20
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    RTL 
}

code_0B8AD5 {
    LDA #$2000
    TRB $10

  code_0B8ADA:
    COP [80] ( #16 )
    COP [89]
    BRA code_0B8ADA
}

---------------------------------------------

sub_0B8AE1 {
    LDA #$0000
    STA $7F0010, X
    LDA #$0020
    STA $7F0012, X
    LDA $14
    STA $7F100C, X
    RTS 
}

---------------------------------------------

sub_0B8AF6 {
    LDY $04
    JSR $&sub_0B8B14
    LDA $0016, Y
    CLC 
    ADC #$0010
    STA $16
    RTS 
}

---------------------------------------------

sub_0B8B05 {
    LDY $04
    JSR $&sub_0B8B14
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $16
    RTS 
}

---------------------------------------------

sub_0B8B14 {
    LDA $7F0000, X
    STA $14
    LDA $7F0002, X
    STA $7F0000, X
    LDA $7F000E, X
    STA $7F0002, X
    LDA $0014, Y
    STA $7F000E, X
    RTS 
}

---------------------------------------------

sub_0B8B32 {
    LDA #$0000
    STA $7F000E, X
    LDA $14
    SEC 
    SBC #$0050
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$4040
    STA $7F0010, X
    STA $7F0002, X
    LDA #$FFA0
    STA $7F0012, X
    RTS 
}

---------------------------------------------

sub_0B8B5C {
    LDA #$0000
    STA $7F000E, X
    LDA $14
    CLC 
    ADC #$0050
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$C0C0
    STA $7F0010, X
    STA $7F0002, X
    LDA #$FFA0
    STA $7F0012, X
    RTS 
}

---------------------------------------------

sub_0B8B86 {
    LDA $7F100C, X
    BEQ code_0B8B8D
    RTS 
}

code_0B8B8D {
    INC 
    STA $7F100C, X
    LDA #$0000
    STA $7F000A, X
    LDA #$000A
    STA $0000
    LDA #$0004
    STA $0002
    LDY $06

  code_0B8BA7:
    LDA $0002
    STA $0008, Y
    CLC 
    ADC #$0003
    STA $0002
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_0B8BA7
    RTS 
}

---------------------------------------------

sub_0B8BBE {
    COP [07] ( #27 )
    COP [A5] ( @func_0B87B7, #00, #00, #$0301 )
    RTS 
}

---------------------------------------------

sub_0B8BCB {
    LDA $player_x_pos
    CMP #$00F8
    BCS code_0B8BD8
    LDA #$0088
    BRA code_0B8BE5
}

code_0B8BD8 {
    CMP #$01F8
    BCS code_0B8BE2
    LDA #$0188
    BRA code_0B8BE5
}

code_0B8BE2 {
    LDA #$0288
}

code_0B8BE5 {
    STA $14
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $14
    STA $14
    STA $24
    RTS 
}

---------------------------------------------

sub_0B9CE8 {
    LDA $7F0010, X
    TAY 
    SEP #$20
    CLC 
    LDA $&binary_01C455, Y
    BPL code_0B9CF9
    EOR #$FF
    INC 
    SEC 
}

code_0B9CF9 {
    XBA 
    LDA $7F0012, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code_0B9D0E
    EOR #$FFFF
    INC 
}

code_0B9D0E {
    RTS 
}