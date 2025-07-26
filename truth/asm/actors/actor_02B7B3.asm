?BANK 02

?INCLUDE 'player_character'
?INCLUDE 'func_00F3C9'
?INCLUDE 'table_179000'
?INCLUDE 'chunk_008000'
?INCLUDE 'table_178000'
?INCLUDE 'actor_02BDF6'
?INCLUDE 'table_0EE000'
?INCLUDE 'table_01D9A7'
?INCLUDE 'table_01D9BF'

!scene_current                  0644
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

e_actor_02B7B3 {
    LDA $player_flags
    BIT #$0008
    BEQ code_02B7BD
    COP [E0]
}

code_02B7BD {
    LDA #$0001
    TRB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$2A00
    BEQ code_02B7CE
    RTL 
}

code_02B7CE {
    LDA $0AD4
    CMP #$0002
    BCC code_02B7D7
    RTL 
}

code_02B7D7 {
    COP [40] ( #$8001, &code_02B7DE )
    RTL 
}

code_02B7DE {
    LDA #$0001
    TSB $player_flags
    LDA #$8000
    TSB $0658
    LDA $0AD4
    BEQ code_02B7F2
    JMP $&func_02B86D
}

code_02B7F2 {
    LDA $0AA2
    BIT #$0005
    BNE code_02B7FB
    RTL 
}

code_02B7FB {
    COP [CA] ( #28 )
    COP [41] ( #$8001, &code_02B7BD )
    COP [CB]
    JSR $&sub_02B94F
    COP [A5] ( @func_02C308, #00, #00, #$2C00 )
    STY $22
    LDA #$0078
    STA $24
    COP [C1]
    JSR $&sub_02B946
    COP [41] ( #$8001, &code_02B901 )
    DEC $24
    BMI code_02B829
    RTL 
}

code_02B829 {
    LDA $0AA2
    BIT #$0004
    BNE code_02B83D
    COP [C1]
    JSR $&sub_02B946
    COP [41] ( #$8001, &code_02B855 )
    RTL 
}

code_02B83D {
    COP [C1]
    JSR $&sub_02B946
    COP [41] ( #$8001, &code_02B855 )
    JSR $&sub_02B95D
    BCC code_02B84E
    RTL 
}

code_02B84E {
    COP [40] ( #$0030, &code_02B861 )
    RTL 
}

code_02B855 {
    JSR $&sub_02B933
    LDA #$&func_02BEA0
    JSR $&sub_02B926
    JMP $&code_02B901
}

code_02B861 {
    JSR $&sub_02B933
    LDA #$&func_02C0A9
    JSR $&sub_02B926
    JMP $&code_02B901
}

---------------------------------------------

func_02B86D {
    LDA $0AA2
    BIT #$0050
    BNE code_02B876
    RTL 
}

code_02B876 {
    COP [CA] ( #28 )
    COP [41] ( #$8001, &code_02B7BD )
    COP [CB]
    JSR $&sub_02B94F
    COP [A5] ( @func_02C315, #00, #00, #$2C00 )
    STY $22
    LDA #$0064
    STA $24
    COP [C1]
    JSR $&sub_02B946
    COP [41] ( #$8001, &code_02B901 )
    COP [40] ( #$40B0, &code_02B901 )
    DEC $24
    BMI code_02B8AA
    RTL 
}

code_02B8AA {
    LDA $0AA2
    BIT #$0020
    BNE code_02B8BE
    COP [C1]
    JSR $&sub_02B946
    COP [41] ( #$8001, &code_02B8D6 )
    RTL 
}

code_02B8BE {
    COP [C1]
    JSR $&sub_02B946
    COP [41] ( #$8001, &code_02B8D6 )
    COP [40] ( #$0F00, &code_02B8D5 )
    COP [40] ( #$0030, &code_02B8E7 )
}

code_02B8D5 {
    RTL 
}

code_02B8D6 {
    LDA #$0001
    STA $00EA
    JSR $&sub_02B933
    LDA #$&func_02BB3B
    JSR $&sub_02B926
    BRA code_02B901
}

code_02B8E7 {
    LDA $player_speed_ew
    ORA $player_speed_ns
    BEQ code_02B8F0
    RTL 
}

code_02B8F0 {
    LDA #$0002
    STA $00EA
    JSR $&sub_02B933
    LDA #$&func_02B97F
    JSR $&sub_02B926
    BRA code_02B901
}

code_02B901 {
    PHX 
    PHD 
    LDA $22
    BEQ code_02B90B
    TCD 
    TAX 
    COP [A7]
}

code_02B90B {
    PLD 
    PLX 
    LDA $0AD4
    BNE code_02B91C
    COP [37] ( #0B )
    COP [39]
    COP [C4] ( @code_02B7BD )
}

code_02B91C {
    COP [37] ( #0C )
    COP [39]
    COP [C4] ( @code_02B7BD )
}

---------------------------------------------

sub_02B926 {
    LDY $player_actor
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    RTS 
}

---------------------------------------------

sub_02B933 {
    LDA $player_flags
    BIT #$3A00
    BNE code_02B943
    COP [48]
    CMP #$0004
    BCS code_02B943
    RTS 
}

code_02B943 {
    PLA 
    BRA code_02B901
}

---------------------------------------------

sub_02B946 {
    LDA $player_flags
    BIT #$2B00
    BNE code_02B943
    RTS 
}

---------------------------------------------

sub_02B94F {
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    RTS 
}

---------------------------------------------

sub_02B95D {
    LDA $player_flags
    BIT #$8000
    BEQ code_02B967

  code_02B965:
    SEC 
    RTS 
}

code_02B967 {
    LDY $player_actor
    LDA $0028, Y
    BMI code_02B965
    CMP #$0004
    BCC code_02B97D
    SEC 
    SBC #$0010
    CMP #$0004
    BCS code_02B965
}

code_02B97D {
    CLC 
    RTS 
}

---------------------------------------------

func_02B97F {
    LDA #$0200
    TSB $10
    LDA #$0800
    TSB $player_flags
    COP [A5] ( @code_02BA0C, #00, #00, #$2600 )
    CPY #$1FC0
    BNE code_02B99B
    JMP $&code_02B9FC
}

code_02B99B {
    LDA $16
    CMP #$0020
    BNE code_02B9B4
    COP [C2]
    COP [CA] ( #08 )
    LDA $7F0C07
    CMP #$4400
    BNE code_02B9C0
    COP [CB]
    BRA code_02B9C0
}

code_02B9B4 {
    COP [C1]
    LDA $7F0C07
    CMP #$4400
    BNE code_02B9C0
    RTL 
}

code_02B9C0 {
    COP [50] ( @fx_palette_198090, #00, #A9, #07 )
    COP [8E] ( #06 )
    COP [80] ( #02 )
    COP [89]
    COP [A5] ( @func_02C322, #00, #00, #$2400 )
    TYA 
    STA $7F0012, X
    COP [84] ( #03, #02 )
    COP [8A]
    LDA #$0001
    TRB $player_flags
    COP [A5] ( @code_02BA17, #00, #F0, #$2600 )
    COP [84] ( #03, #0A )
    COP [8A]
    JSR $&sub_02C21C
}

code_02B9FC {
    LDA #$0200
    TRB $10
    LDA $7F0004, X
    BEQ code_02BA09
    COP [C5]
}

code_02BA09 {
    JMP $&code_02C3C8
}

code_02BA0C {
    COP [4F] ( @misc_fx_1CC480, #$4400, #$0600 )
    COP [E0]
}

code_02BA17 {
    STZ $24
    STZ $26
    LDA #$0000
    STA $7F0012, X
    LDA $0B1E
    BEQ code_02BA39
    COP [A2] ( @func_02BAFE, #$0600 )
    INC $24
    COP [A2] ( @func_02BAFE, #$0600 )
    INC $24
}

code_02BA39 {
    COP [A2] ( @func_02BAFE, #$0600 )
    INC $24
    COP [A2] ( @func_02BAFE, #$0600 )
    LDA #$00F0
    STA $20
    COP [C1]
    LDA $player_flags
    BIT #$0001
    BNE code_02BA7D
    LDA $26
    CLC 
    ADC #$0002
    AND #$00FF
    STA $26
    STA $7F0010, X
    LDA $7F0012, X
    CMP #$0040
    BCS code_02BA75
    INC 
    STA $7F0012, X
}

code_02BA75 {
    JSR $&sub_02BABD
    DEC $20
    BMI code_02BA7D
    RTL 
}

code_02BA7D {
    LDA $24
    STA $0000
    LDY $06

  code_02BA84:
    LDA #$&func_02BB29
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_02BA84
    COP [CA] ( #1E )
    LDA $26
    CLC 
    ADC #$0002
    AND #$00FF
    STA $26
    STA $7F0010, X
    LDA $7F0012, X
    BEQ code_02BAB6
    DEC 
    STA $7F0012, X
}

code_02BAB6 {
    JSR $&sub_02BABD
    COP [CB]
    COP [E0]
}

---------------------------------------------

sub_02BABD {
    PHD 
    LDA #$0080
    STA $0002
    LDA $24
    STA $0000
    LDA $06

  code_02BACB:
    TCD 
    LDY $player_actor
    JSL $@func_00F3C9
    LDA $7F0010, X
    CLC 
    ADC $0002
    AND #$00FF
    STA $7F0010, X
    LDA $0002
    CMP #$0040
    BNE code_02BAEF
    LDA #$0080
    BRA code_02BAF2
}

code_02BAEF {
    LDA #$0040
}

code_02BAF2 {
    STA $0002
    LDA $06
    DEC $0000
    BPL code_02BACB
    PLD 
    RTS 
}

---------------------------------------------

func_02BAFE {
    LDA $scene_current
    AND #$00FF
    CMP #$00DD
    BNE code_02BB13
    LDA $0E
    AND #$CFFF
    ORA #$2000
    STA $0E
}

code_02BB13 {
    COP [88] ( @table_179000 )
    COP [80] ( #00 )
    COP [89]
    COP [80] ( #01 )
    COP [89]

  code_02BB22:
    COP [80] ( #02 )
    COP [89]
    BRA code_02BB22
}

---------------------------------------------

func_02BB29 {
    COP [80] ( #01 )
    COP [89]
    COP [80] ( #00 )
    COP [89]
    LDA #$2000
    TSB $10
    COP [C1]
    RTL 
}

---------------------------------------------

func_02BB3B {
    LDA #$2000
    TSB $player_flags
    COP [A5] ( @code_02BC02, #00, #00, #$2600 )
    CPY #$1FC0
    BNE code_02BB52
    JMP $&code_02BBFD
}

code_02BB52 {
    LDA $16
    CMP #$0020
    BNE code_02BB6B
    COP [C2]
    COP [CA] ( #08 )
    LDA $7F0C07
    CMP #$4400
    BNE code_02BB77
    COP [CB]
    BRA code_02BB77
}

code_02BB6B {
    COP [C1]
    LDA $7F0C07
    CMP #$4400
    BNE code_02BB77
    RTL 
}

code_02BB77 {
    COP [50] ( @fx_palette_198070, #00, #A0, #10 )
    COP [3B] ( #4A, @func_00B519 )
    COP [48]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_02BB93 )
}

code_list_02BB93 [
  &code_02BB9B   ;00
  &code_02BBB4   ;01
  &code_02BBCD   ;02
  &code_02BBE6   ;03
]

code_02BB9B {
    COP [A5] ( @code_02BC0D, #FE, #1A, #$2600 )
    COP [A5] ( @code_02BC2C, #FE, #1A, #$2600 )
    COP [8F] ( #36 )
    COP [89]
    BRA code_02BBFD
}

code_02BBB4 {
    COP [A5] ( @code_02BC0D, #00, #C0, #$2600 )
    COP [A5] ( @code_02BC27, #00, #C0, #$2600 )
    COP [8F] ( #37 )
    COP [89]
    BRA code_02BBFD
}

code_02BBCD {
    COP [A5] ( @code_02BC0D, #CC, #EA, #$2600 )
    COP [A5] ( @code_02BC74, #CC, #EA, #$2600 )
    COP [8F] ( #38 )
    COP [89]
    BRA code_02BBFD
}

code_02BBE6 {
    COP [A5] ( @code_02BC0D, #34, #EA, #$2600 )
    COP [A5] ( @code_02BC79, #34, #EA, #$2600 )
    COP [8F] ( #39 )
    COP [89]
}

code_02BBFD {
    COP [DA] ( #07 )
    COP [C5]
}

code_02BC02 {
    COP [4F] ( @misc_fx_1CC000, #$4400, #$0480 )
    COP [E0]
}

code_02BC0D {
    COP [88] ( @table_178000 )
    JSR $&sub_02BE72
    COP [DA] ( #07 )
    JSR $&sub_02BE89
    LDA #$2000
    TRB $10
    COP [80] ( #00 )
    COP [89]
    COP [E0]
}

code_02BC27 {
    LDA #$2000
    TSB $12
}

code_02BC2C {
    LDA #$0000
    JSR $&sub_02C365
    COP [88] ( @table_178000 )
    LDA $player_flags
    BIT #$0080
    BEQ code_02BC42
    COP [B6] ( #30 )
}

code_02BC42 {
    JSR $&sub_02BE72
    COP [DA] ( #07 )
    JSR $&sub_02BE89
    LDA #$2000
    TRB $10
    LDA $0B1C
    BEQ code_02BC5D
    COP [5B] ( #$0010 )
    COP [5A] ( &code_02BCF2 )
}

code_02BC5D {
    COP [86] ( #01, #02, #01 )
    COP [8A]
    COP [86] ( #02, #03, #03 )
    COP [8A]
    COP [8D] ( #03 )
    COP [AC] ( #00, #05 )
    BRA code_02BCCA
}

code_02BC74 {
    LDA #$4000
    TSB $12
}

code_02BC79 {
    LDA #$0000
    JSR $&sub_02C365
    COP [88] ( @table_178000 )
    LDA $player_flags
    BIT #$0080
    BEQ code_02BC8F
    COP [B6] ( #30 )
}

code_02BC8F {
    JSR $&sub_02BE72
    COP [DA] ( #07 )
    JSR $&sub_02BE89
    LDA #$2000
    TRB $10
    LDA $0B1C
    BEQ code_02BCAA
    COP [5B] ( #$0010 )
    COP [5A] ( &code_02BCF2 )
}

code_02BCAA {
    COP [85] ( #01, #02, #01 )
    COP [8A]
    COP [85] ( #02, #03, #03 )
    COP [8A]
    COP [8D] ( #03 )
    COP [AC] ( #05, #00 )
    BRA code_02BCCA
}

---------------------------------------------

func_02BCC1 {
    LDA $10
    BIT #$4000
    BNE code_02BCEC
    COP [B1]
}

code_02BCCA {
    COP [8B]
    LDA $2A
    BEQ func_02BCC1
    LDA $08
    STZ $08
    STA $26

  code_02BCD6:
    LDA $0B1C
    CMP #$0002
    BNE code_02BCE4
    COP [40] ( #$8001, &code_02BCEE )
}

code_02BCE4 {
    COP [C2]
    DEC $26
    BPL code_02BCD6
    BRA code_02BCCA
}

code_02BCEC {
    COP [E0]
}

code_02BCEE {
    COP [5A] ( #$0000 )
}

code_02BCF2 {
    COP [9C] ( @code_02BD0C, #$0600 )
    COP [9C] ( @code_02BD11, #$0600 )
    COP [9C] ( @code_02BD16, #$0600 )
    LDA #$0000
    BRA code_02BD19
}

code_02BD0C {
    LDA #$0040
    BRA code_02BD19
}

code_02BD11 {
    LDA #$0080
    BRA code_02BD19
}

code_02BD16 {
    LDA #$00C0
}

code_02BD19 {
    STA $7F0010, X
    LDA #$0000
    JSR $&sub_02C365
    LDA #$0000
    STA $7F0012, X
    LDA $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    COP [A2] ( @e_actor_02BDFB, #$0600 )
    COP [A2] ( @e_actor_02BDF6, #$0600 )
    LDA #$0001
    STA $7F100E, X
    STA $7F100C, X
    COP [8D] ( #04 )

  code_02BD52:
    COP [8B]
    LDA $2A
    BEQ code_02BD52
    LDA $08
    STZ $08
    STA $26

  code_02BD5E:
    COP [C2]
    SEP #$20
    LDA $7F0010, X
    CLC 
    ADC #$02
    STA $7F0010, X
    LDA $7F0012, X
    CLC 
    ADC #$04
    STA $7F0012, X
    BCS code_02BDA8
    REP #$20
    LDA $14
    PHA 
    LDA $16
    PHA 
    LDA $7F0018, X
    STA $14
    LDA $7F001A, X
    STA $16
    JSL $@code_00F3D3
    PLA 
    SEC 
    SBC $16
    STA $7F100E, X
    PLA 
    SEC 
    SBC $14
    STA $7F100C, X
    DEC $26
    BPL code_02BD5E
    BRA code_02BD52
}

code_02BDA8 {
    REP #$20
    LDA #$6000
    TRB $12
    LDA $7F100C, X
    EOR #$FFFF
    INC 
    STA $7F100C, X
    LDA $7F100E, X
    EOR #$FFFF
    INC 
    STA $7F100E, X
    BRA code_02BDD7
}

---------------------------------------------

func_02BDC9 {
    COP [8B]
    LDA $2A
    BEQ func_02BDC9
    LDA $08
    STZ $08
    STA $26

  code_02BDD5:
    COP [C2]
}

code_02BDD7 {
    LDA $7F100C, X
    STA $7F002C, X
    LDA $7F100E, X
    STA $7F002E, X
    LDA $10
    BIT #$4000
    BNE code_02BDF4
    DEC $26
    BPL code_02BDD5
    BRA func_02BDC9
}

code_02BDF4 {
    COP [E0]
}

---------------------------------------------

sub_02BE72 {
    LDY $24
    LDA $14
    SEC 
    SBC $0014, Y
    STA $7F100C, X
    LDA $16
    SEC 
    SBC $0016, Y
    STA $7F100E, X
    RTS 
}

---------------------------------------------

sub_02BE89 {
    LDY $24
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $16
    RTS 
}

---------------------------------------------

func_02BEA0 {
    LDA #$0000
    JSR $&sub_02C33E
    JSR $&sub_02CCA5
    COP [48]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_02BEB7 )
}

code_list_02BEB7 [
  &code_02BEBF   ;00
  &code_02BECF   ;01
  &code_02BEE2   ;02
  &code_02BEF5   ;03
]

code_02BEBF {
    COP [9B] ( @code_02BF09 )
    COP [8E] ( #04 )
    COP [82] ( #04, #36 )
    COP [89]
    BRA code_02BF03
}

code_02BECF {
    COP [9B] ( @code_02BF71 )
    COP [AE] ( #01 )
    COP [8E] ( #04 )
    COP [82] ( #05, #36 )
    COP [89]
    BRA code_02BF03
}

code_02BEE2 {
    COP [9B] ( @code_02BFD9 )
    COP [AF] ( #01 )
    COP [8E] ( #04 )
    COP [81] ( #06, #36 )
    COP [89]
    BRA code_02BF03
}

code_02BEF5 {
    COP [9B] ( @code_02C041 )
    COP [8E] ( #04 )
    COP [81] ( #07, #36 )
    COP [89]
}

code_02BF03 {
    JSR $&sub_02CCC2
    JMP $&code_02C3C8
}

code_02BF09 {
    LDA #$0006
    STA $08
    LDY $04
    LDA $0016, Y
    STA $14
    LDA #$09D0
    STA $16
    COP [C2]
    COP [CA] ( #08 )
    LDY $04
    LDA $14
    SEC 
    SBC $0016, Y
    LDY $16
    INC $16
    INC $16
    STA $0000, Y
    LDY $04
    LDA $0016, Y
    STA $14
    COP [CB]
    LDA #$0003
    STA $08
    LDY $04
    LDA #$0000
    STA $002E, Y
    COP [C2]
    DEC $16
    DEC $16
    COP [CA] ( #08 )
    LDY $16
    DEC $16
    DEC $16
    PHX 
    LDX $04
    LDA $0000, Y
    STA $7F002E, X
    PLX 
    COP [CB]
    COP [C2]
    PHX 
    LDX $04
    LDA #$0000
    STA $7F002E, X
    PLX 
    COP [E0]
}

code_02BF71 {
    LDA #$0006
    STA $08
    LDY $04
    LDA $0016, Y
    STA $14
    LDA #$09D0
    STA $16
    COP [C2]
    COP [CA] ( #08 )
    LDY $04
    LDA $0016, Y
    SEC 
    SBC $14
    LDY $16
    INC $16
    INC $16
    STA $0000, Y
    LDY $04
    LDA $0016, Y
    STA $14
    COP [CB]
    LDA #$0003
    STA $08
    LDY $04
    LDA #$0000
    STA $002E, Y
    COP [C2]
    DEC $16
    DEC $16
    COP [CA] ( #08 )
    LDY $16
    DEC $16
    DEC $16
    PHX 
    LDX $04
    LDA $0000, Y
    STA $7F002E, X
    PLX 
    COP [CB]
    COP [C2]
    PHX 
    LDX $04
    LDA #$0000
    STA $7F002E, X
    PLX 
    COP [E0]
}

code_02BFD9 {
    LDA #$0006
    STA $08
    LDY $04
    LDA $0014, Y
    STA $14
    LDA #$09D0
    STA $16
    COP [C2]
    COP [CA] ( #08 )
    LDY $04
    LDA $0014, Y
    SEC 
    SBC $14
    LDY $16
    INC $16
    INC $16
    STA $0000, Y
    LDY $04
    LDA $0014, Y
    STA $14
    COP [CB]
    LDA #$0003
    STA $08
    LDY $04
    LDA #$0000
    STA $002C, Y
    COP [C2]
    DEC $16
    DEC $16
    COP [CA] ( #08 )
    LDY $16
    DEC $16
    DEC $16
    PHX 
    LDX $04
    LDA $0000, Y
    STA $7F002C, X
    PLX 
    COP [CB]
    COP [C2]
    PHX 
    LDX $04
    LDA #$0000
    STA $7F002C, X
    PLX 
    COP [E0]
}

code_02C041 {
    LDA #$0006
    STA $08
    LDY $04
    LDA $0014, Y
    STA $14
    LDA #$09D0
    STA $16
    COP [C2]
    COP [CA] ( #08 )
    LDY $04
    LDA $14
    SEC 
    SBC $0014, Y
    LDY $16
    INC $16
    INC $16
    STA $0000, Y
    LDY $04
    LDA $0014, Y
    STA $14
    COP [CB]
    LDA #$0003
    STA $08
    LDY $04
    LDA #$0000
    STA $002C, Y
    COP [C2]
    DEC $16
    DEC $16
    COP [CA] ( #08 )
    LDY $16
    DEC $16
    DEC $16
    PHX 
    LDX $04
    LDA $0000, Y
    STA $7F002C, X
    PLX 
    COP [CB]
    COP [C2]
    PHX 
    LDX $04
    LDA #$0000
    STA $7F002C, X
    PLX 
    COP [E0]
}

---------------------------------------------

func_02C0A9 {
    LDA #$8000
    TSB $0658
    LDA #$2002
    TSB $player_flags
    LDA #$000F
    STA $26
    STA $7F0010, X
    COP [8E] ( #04 )
    COP [8D] ( #22 )
    LDA #$0000
    STA $7F102E, X

  code_02C0CB:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_02C0CB
    STZ $08
    LDA $10
    BIT #$0080
    BEQ code_02C0DF
    JMP $&code_02C1E4
}

code_02C0DF {
    LDA $26
    BMI code_02C0FB
    CMP #$000C
    BCC code_02C0FB
    LSR 
    STA $24
    COP [C1]
    COP [41] ( #$8001, &code_02C1E4 )
    JSR $&sub_02C1EB
    DEC $24
    BMI code_02C0CB
    RTL 
}

code_02C0FB {
    LDA #$0002
    JSR $&sub_02C33E
    LDA #$0100
    TRB $10
    LDA #$0200
    TSB $10
    COP [A5] ( @func_02C232, #00, #00, #$0302 )
    TYA 
    STA $7F0012, X
    COP [80] ( #1C )
    COP [89]
    COP [84] ( #1D, #04 )
    COP [8A]
    JSR $&sub_02C21C
    PEA $&func_02C17C-1
    STZ $player_speed_ew
    STZ $player_speed_ns
    LDA $0656
    BIT #$0100
    BEQ code_02C145
    LDA #$0007
    STA $player_speed_ew
    STZ $09B6
    STZ $09B8
    RTS 
}

code_02C145 {
    BIT #$0200
    BEQ code_02C157
    LDA #$FFF9
    STA $player_speed_ew
    STZ $09B6
    STZ $09B8
    RTS 
}

code_02C157 {
    BIT #$0800
    BEQ code_02C169
    LDA #$FFF9
    STA $player_speed_ns
    STZ $09B6
    STZ $09B8
    RTS 
}

code_02C169 {
    BIT #$0400
    BEQ code_02C17B
    LDA #$0007
    STA $player_speed_ns
    STZ $09B6
    STZ $09B8
    RTS 
}

code_02C17B {
    RTS 
}

---------------------------------------------

func_02C17C {
    LDA #$2800
    TRB $player_flags
    PEA $&func_02C199-1
    LDA #$&loc_02C1A3
    STA $7F001E, X
    LDA $0B1A
    BNE code_02C195
    LDA #$000C
    RTS 
}

code_02C195 {
    LDA #$0018
    RTS 
}

---------------------------------------------

func_02C199 {
    STA $7F0014, X
    LDA #$0001
    JSR $&sub_02C33E

  loc_02C1A3:
    COP [80] ( #1D )
    COP [89]
    COP [CB]
    LDA #$0002
    TRB $player_flags
    COP [40] ( #$0300, &func_02C1BE )
    COP [40] ( #$0C00, &func_02C1D0 )
    BRA code_02C1E4
}

---------------------------------------------

func_02C1BE {
    LDA $0656
    BIT #$0200
    BNE code_02C1CB
    COP [8F] ( #03 )
    BRA code_02C1E0
}

code_02C1CB {
    COP [8F] ( #02 )
    BRA code_02C1E0
}

---------------------------------------------

func_02C1D0 {
    LDA $0656
    BIT #$0800
    BNE code_02C1DD
    COP [8F] ( #00 )
    BRA code_02C1E0
}

code_02C1DD {
    COP [8F] ( #01 )
}

code_02C1E0 {
    COP [8B]
    STZ $08
}

code_02C1E4 {
    LDA #$0200
    TRB $10
    COP [C5]
}

---------------------------------------------

sub_02C1EB {
    LDA $26
    LSR 
    BCC code_02C202
    LDA $0656
    BIT #$0020
    BEQ code_02C212
    LDA $26
    SEC 
    SBC #$0001
    STA $26
    BRA code_02C212
}

code_02C202 {
    LDA $0656
    BIT #$0010
    BEQ code_02C212
    LDA $26
    SEC 
    SBC #$0001
    STA $26
}

code_02C212 {
    LDA $0656
    AND #$0030
    TSB $0658
    RTS 
}

---------------------------------------------

sub_02C21C {
    PHX 
    PHD 
    LDA $7F0012, X
    BEQ code_02C22F
    TCD 
    TAX 
    LDA #$0000
    STA $7F0012, X
    COP [A7]
}

code_02C22F {
    PLD 
    PLX 
    RTS 
}

---------------------------------------------

func_02C232 {
    COP [B6] ( #30 )
    LDA $14
    SEC 
    SBC $player_x_pos
    STA $7F100C, X
    LDA $16
    SEC 
    SBC $player_y_pos
    STA $7F100E, X
    COP [88] ( @table_0EE000 )

  code_02C24E:
    COP [40] ( #$0100, &code_02C288 )
    COP [40] ( #$0200, &code_02C2A8 )
    COP [40] ( #$0800, &code_02C2C8 )
    COP [40] ( #$0400, &code_02C2E8 )
    COP [C1]
    COP [8D] ( #39 )

  code_02C26B:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C26B
    COP [40] ( #$0F00, &code_02C24E )
    JSR $&sub_02C329
    DEC $24
    BMI code_02C26B
    RTL 
}

code_02C288 {
    COP [8D] ( #3D )

  code_02C28B:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C28B
    COP [41] ( #$0100, &code_02C24E )
    JSR $&sub_02C329
    DEC $24
    BMI code_02C28B
    RTL 
}

code_02C2A8 {
    COP [8D] ( #3C )

  code_02C2AB:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C2AB
    COP [41] ( #$0200, &code_02C24E )
    JSR $&sub_02C329
    DEC $24
    BMI code_02C2AB
    RTL 
}

code_02C2C8 {
    COP [8D] ( #3B )

  code_02C2CB:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C2CB
    COP [41] ( #$0800, &code_02C24E )
    JSR $&sub_02C329
    DEC $24
    BMI code_02C2CB
    RTL 
}

code_02C2E8 {
    COP [8D] ( #3A )

  code_02C2EB:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C2EB
    COP [41] ( #$0400, &code_02C24E )
    JSR $&sub_02C329
    DEC $24
    BMI code_02C2EB
    RTL 
}

---------------------------------------------

func_02C308 {
    COP [38] ( #2A, #02 )
    COP [3A]

  code_02C30E:
    COP [37] ( #2B )
    COP [39]
    BRA code_02C30E
}

---------------------------------------------

func_02C315 {
    COP [38] ( #4B, #02 )
    COP [3A]

  code_02C31B:
    COP [37] ( #2C )
    COP [39]
    BRA code_02C31B
}

---------------------------------------------

func_02C322 {
    COP [37] ( #5B )
    COP [39]
    BRA func_02C322
}

---------------------------------------------

sub_02C329 {
    LDA $7F100C, X
    CLC 
    ADC $player_x_pos
    STA $14
    LDA $7F100E, X
    CLC 
    ADC $player_y_pos
    STA $16
    RTS 
}

---------------------------------------------

sub_02C33E {
    PHX 
    ASL 
    TAX 
    LDA $@table_01D9A7, X
    SEC 
    SBC #$&table_01D9A7
    TAX 
    LDA $@table_01D9A7+2, X
    TAY 
    LDA $0000, Y
    PHA 
    TXA 
    CLC 
    ADC $01, S
    TAX 
    PLA 
    LDA $@table_01D9A7+4, X
    AND #$00FF
    STA $09E0
    PLX 
    RTS 
}

---------------------------------------------

sub_02C365 {
    PHX 
    ASL 
    TAX 
    LDA $@table_01D9BF, X
    SEC 
    SBC #$&table_01D9BF
    TAX 
    LDA $@table_01D9BF+2, X
    TAY 
    LDA $0000, Y
    PHA 
    TXA 
    CLC 
    ADC $01, S
    TAX 
    PLA 
    LDA $@table_01D9BF+4, X
    AND #$00FF
    STA $09E2
    PLX 
    RTS 
}