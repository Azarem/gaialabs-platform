?BANK 02
?INCLUDE 'death_message'
?INCLUDE 'actor_02B7B3'
?INCLUDE 'actor_02B29E'
?INCLUDE 'actor_02B42B'
?INCLUDE 'actor_02B20E'
?INCLUDE 'chunk_028000'
?INCLUDE 'table_17D000'

!scene_current                  0644
!joypad_mask_std                065A
!player_x_pos                   09A2
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

h_player_character [
  h_actor < #00, #08, #85 >   ;00
]

---------------------------------------------

e_player_character {
    LDA #$0100
    TSB $10
    LDA #$0001
    TSB $12
    TXA 
    STA $player_actor
    LDA #$0001
    STA $7F101C, X
    LDA $0AF8
    BEQ code_02C3B0
    COP [9C] ( @e_death_message, #$2000 )
}

code_02C3B0 {
    COP [99] ( @e_actor_02B7B3 )
    COP [9B] ( @e_actor_02B29E )
    COP [9B] ( @e_actor_02B42B )
    COP [A5] ( @e_actor_02B20E, #00, #00, #$2800 )
}

code_02C3C8 {
    COP [C1]
    LDA $0658
    AND #$F0FF
    STA $0658
    LDA #$2800
    TRB $player_flags
    LDA #$0100
    TSB $10
    LDA #$0020
    TRB $10
    STZ $09E0
    LDA $10
    BIT #$2000
    BEQ code_02C3EE
    RTL 
}

code_02C3EE {
    COP [C6] ( &code_02C3C8 )
    COP [AF] ( #00 )
    LDA $player_speed_ew
    BEQ code_02C3FD
    JMP $&func_02CA84
}

code_02C3FD {
    LDA $player_speed_ns
    BEQ code_02C405
    JMP $&func_02CB0C
}

code_02C405 {
    PHX 
    COP [48]
    AND #$0003
    STA $24
    SEP #$20
    XBA 
    LDA #$0E
    JSL $@func_0281D1
    REP #$20
    TAX 
    LDA $0656
    BIT #$8000
    BNE code_02C43F
    INX 
    INX 
    XBA 
    LSR 
    BCS code_02C43F
    INX 
    INX 
    LSR 
    BCS code_02C43F
    INX 
    INX 
    LSR 
    BCS code_02C43F
    INX 
    INX 
    LSR 
    BCS code_02C43F
    INX 
    INX 
    BIT #$0300
    BNE code_02C43F
    INX 
    INX 
}

code_02C43F {
    LDA $@table_02C447, X
    PLX 
    DEC 
    PHA 
    RTS 
}

---------------------------------------------

table_02C447 [
  &func_02CCDA   ;00
  &func_02C5B5   ;01
  &func_02C56C   ;02
  &func_02C4DD   ;03
  &func_02C524   ;04
  &code_02CA28   ;05
  &func_02C47F   ;06
  &func_02CD5B   ;07
  &func_02C5B5   ;08
  &func_02C56C   ;09
  &func_02C4DD   ;0A
  &func_02C524   ;0B
  &code_02CA36   ;0C
  &func_02C48F   ;0D
  &func_02CDDC   ;0E
  &func_02C5B5   ;0F
  &func_02C56C   ;10
  &func_02C4DD   ;11
  &func_02C524   ;12
  &code_02CA44   ;13
  &func_02C49F   ;14
  &func_02CE5A   ;15
  &func_02C5B5   ;16
  &func_02C56C   ;17
  &func_02C4DD   ;18
  &func_02C524   ;19
  &code_02CA52   ;1A
  &func_02C4AF   ;1B
]

---------------------------------------------

func_02C47F {
    COP [D0] ( #00, #01, &func_02C48A )
    COP [8F] ( #00 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C48A {
    COP [8F] ( #10 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C48F {
    COP [D0] ( #00, #01, &func_02C49A )
    COP [8F] ( #01 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C49A {
    COP [8F] ( #11 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C49F {
    COP [D0] ( #00, #01, &func_02C4AA )
    COP [8F] ( #02 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C4AA {
    COP [8F] ( #12 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C4AF {
    COP [D0] ( #00, #01, &func_02C4BA )
    COP [8F] ( #03 )
    BRA code_02C4BD
}

---------------------------------------------

func_02C4BA {
    COP [8F] ( #13 )
}

code_02C4BD {
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $player_speed_ew
    ORA $player_speed_ns
    BNE code_02C4DB
    COP [40] ( #$8F30, &code_02C4DB )
    DEC $24
    BMI code_02C4BD
    RTL 
}

code_02C4DB {
    COP [C5]
}

---------------------------------------------

func_02C4DD {
    LDA $24
    BNE code_02C4F9
    LDA $040C
    BMI code_02C4F9
    STZ $040C
    LDA #$0003
    STA $player_speed_ns
    STZ $09B6
    STZ $09B8
    COP [C2]
    COP [C5]
}

code_02C4F9 {
    COP [8F] ( #08 )
    JSR $&sub_02C617

  code_02C4FF:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C4FF
    COP [41] ( #$0400, &code_02C615 )
    JSR $&sub_02C5FF
    BNE code_02C51F
    COP [40] ( #$0030, &code_02CA28 )
}

code_02C51F {
    DEC $24
    BMI code_02C4FF
    RTL 
}

---------------------------------------------

func_02C524 {
    LDA $24
    DEC 
    BNE code_02C541
    LDA $040C
    BMI code_02C541
    STZ $040C
    LDA #$FFFD
    STA $player_speed_ns
    STZ $09B6
    STZ $09B8
    COP [C2]
    COP [C5]
}

code_02C541 {
    COP [8F] ( #09 )
    JSR $&sub_02C617

  code_02C547:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C547
    COP [41] ( #$0800, &code_02C615 )
    JSR $&sub_02C5FF
    BNE code_02C567
    COP [40] ( #$0030, &code_02CA36 )
}

code_02C567 {
    DEC $24
    BMI code_02C547
    RTL 
}

---------------------------------------------

func_02C56C {
    LDA $24
    DEC 
    DEC 
    BNE code_02C58A
    LDA $040C
    BMI code_02C58A
    STZ $040C
    LDA #$FFFD
    STA $player_speed_ew
    STZ $09B6
    STZ $09B8
    COP [C2]
    COP [C5]
}

code_02C58A {
    COP [8F] ( #0A )
    JSR $&sub_02C617

  code_02C590:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C590
    COP [41] ( #$0200, &code_02C615 )
    JSR $&sub_02C5FF
    BNE code_02C5B0
    COP [40] ( #$0030, &code_02CA44 )
}

code_02C5B0 {
    DEC $24
    BMI code_02C590
    RTL 
}

---------------------------------------------

func_02C5B5 {
    LDA $24
    DEC 
    DEC 
    DEC 
    BNE code_02C5D4
    LDA $040C
    BMI code_02C5D4
    STZ $040C
    LDA #$0003
    STA $player_speed_ew
    STZ $09B6
    STZ $09B8
    COP [C2]
    COP [C5]
}

code_02C5D4 {
    COP [8F] ( #0B )
    JSR $&sub_02C617

  code_02C5DA:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02C5DA
    COP [41] ( #$0100, &code_02C615 )
    JSR $&sub_02C5FF
    BNE code_02C5FA
    COP [40] ( #$0030, &code_02CA52 )
}

code_02C5FA {
    DEC $24
    BMI code_02C5DA
    RTL 
}

---------------------------------------------

sub_02C5FF {
    COP [40] ( #$8000, &code_02C614 )
    LDA $player_speed_ew
    ORA $player_speed_ns
    BNE code_02C614
    LDA $player_flags
    BIT #$1000
    RTS 
}

code_02C614 {
    PLA 
}

code_02C615 {
    COP [C5]
}

---------------------------------------------

sub_02C617 {
    LDA #$000D
    STA $040C
    RTS 
}

---------------------------------------------

func_02C61E {
    LDA #$0008
    TRB $10
    LDA #$0200
    TSB $10
    LDA #$4000
    TSB $joypad_mask_std
    COP [92] ( #18, #00, #18 )
    COP [89]
    COP [91] ( #19, #07 )
    COP [89]

  code_02C63B:
    COP [1A] ( #00, &func_02C692 )
    COP [8F] ( #1A )
    COP [AB] ( #07 )

  code_02C646:
    COP [8B]
    JSR $&sub_02C6AE
    BCS code_02C658

  code_02C64D:
    JSR $&sub_02C6BC
    COP [C2]
    DEC $24
    BPL code_02C64D
    BRA code_02C646
}

code_02C658 {
    COP [1A] ( #00, &func_02C692 )
    COP [8F] ( #1B )
    COP [AB] ( #07 )

  code_02C663:
    COP [8B]
    JSR $&sub_02C6AE
    BCS code_02C675

  code_02C66A:
    JSR $&sub_02C6BC
    COP [C2]
    DEC $24
    BPL code_02C66A
    BRA code_02C663
}

code_02C675 {
    COP [1A] ( #00, &func_02C692 )
    COP [8F] ( #19 )
    COP [AB] ( #07 )

  code_02C680:
    COP [8B]
    JSR $&sub_02C6AE
    BCS code_02C63B

  code_02C687:
    JSR $&sub_02C6BC
    COP [C2]
    DEC $24
    BPL code_02C687
    BRA code_02C680
}

---------------------------------------------

func_02C692 {
    COP [06] ( #2C )
    COP [91] ( #1C, #00 )
    COP [89]
    LDA #$0200
    TRB $10
    LDA #$0008
    TSB $10
    LDA #$4000
    TRB $joypad_mask_std
    JMP $&code_02C3C8
}

---------------------------------------------

sub_02C6AE {
    LDA $2A
    BEQ code_02C6BA
    LDA $08
    STZ $08
    STA $24
    CLC 
    RTS 
}

code_02C6BA {
    SEC 
    RTS 
}

---------------------------------------------

sub_02C6BC {
    LDA $0AD4
    CMP #$0001
    BEQ code_02C6C5
    RTS 
}

code_02C6C5 {
    LDA $0AA2
    BIT #$0040
    BNE code_02C6CE
    RTS 
}

code_02C6CE {
    COP [40] ( #$8000, &func_02C6D5 )
    RTS 
}

---------------------------------------------

func_02C6D5 {
    PLA 
    COP [8E] ( #06 )
    COP [8D] ( #00 )

  code_02C6DC:
    COP [AB] ( #07 )

  code_02C6DF:
    COP [8B]
    JSR $&sub_02C6AE
    BCS code_02C6DC

  code_02C6E6:
    LDA $16
    BIT #$000F
    BNE code_02C6F2
    COP [1A] ( #00, &func_02C6FA )
}

code_02C6F2 {
    COP [C2]
    DEC $24
    BPL code_02C6E6
    BRA code_02C6DF
}

---------------------------------------------

func_02C6FA {
    LDA #$0002
    JSR $&sub_02C365
    LDA $scene_current
    AND #$00FF
    CMP #$00DD
    BEQ code_02C714
    COP [A5] ( @func_02C73F, #00, #00, #$2400 )
}

code_02C714 {
    COP [A5] ( @func_02C751, #00, #00, #$2400 )
    LDA #$003C
    STA $0026, Y
    COP [82] ( #01, #00 )
    COP [89]
    COP [DA] ( #27 )
    LDA #$0200
    TRB $10
    LDA #$0008
    TSB $10
    LDA #$4000
    TRB $joypad_mask_std
    JMP $&code_02C3C8
}

---------------------------------------------

func_02C73F {
    LDA #$0010
    TSB $player_flags
    COP [DB] ( #$01DF )
    LDA #$0010
    TRB $player_flags
    COP [E0]
}

---------------------------------------------

func_02C751 {
    COP [06] ( #15 )
    JSR $&sub_02C75E
    DEC $26
    BMI code_02C75C
    RTL 
}

code_02C75C {
    COP [E0]
}

---------------------------------------------

sub_02C75E {
    LDA $06EE
    BIT #$0200
    BNE code_02C794
    LDA #$0000
    STA $7F100C, X
    STA $7F100E, X

  code_02C771:
    COP [23]
    PHA 
    AND #$0003
    SEC 
    SBC #$0001
    CLC 
    ADC $06BE
    STA $06BE
    PLA 
    LSR 
    LSR 
    AND #$0003
    SEC 
    SBC #$0001
    CLC 
    ADC $06C2
    STA $06C2
    RTS 
}

code_02C794 {
    LDA $7F100C, X
    BNE code_02C7AA
    LDA $06BE
    STA $7F100C, X
    LDA $06C2
    STA $7F100E, X
    BRA code_02C771
}

code_02C7AA {
    STA $06BE
    LDA $7F100E, X
    STA $06C2
    BRA code_02C771
}

---------------------------------------------

func_02C7B6 {
    LDA #$0028
    TRB $10
    LDA #$0100
    TSB $10
    LDA #$0800
    TSB $player_flags
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [92] ( #26, #00, #1B )
    COP [89]
    COP [40] ( #$0801, &func_02C831 )
    COP [40] ( #$0401, &func_02C80D )
    JMP $&func_02C865
}

---------------------------------------------

func_02C7E2 {
    LDA #$0028
    TRB $10
    LDA #$0100
    TSB $10
    LDA #$0800
    TSB $player_flags
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [92] ( #28, #00, #19 )
    COP [89]
    COP [40] ( #$0401, &func_02C80D )
    COP [40] ( #$0801, &func_02C831 )
    BRA func_02C855
}

---------------------------------------------

func_02C80D {
    COP [8F] ( #2D )

  code_02C810:
    COP [AB] ( #1D )

  code_02C813:
    LDA $16
    AND #$000F
    BNE code_02C81F
    COP [1C] ( #00, &func_02C897 )
}

code_02C81F {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_02C810
    COP [41] ( #$0401, &func_02C855 )
    COP [C2]
    BRA code_02C813
}

---------------------------------------------

func_02C831 {
    COP [8F] ( #2C )

  code_02C834:
    COP [AB] ( #1E )

  code_02C837:
    LDA $16
    AND #$000F
    BNE code_02C843
    COP [1B] ( #00, &func_02C8AA )
}

code_02C843 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_02C834
    COP [41] ( #$0801, &func_02C865 )
    COP [C2]
    BRA code_02C837
}

---------------------------------------------

func_02C855 {
    COP [D0] ( #00, #01, &func_02C860 )
    COP [8F] ( #2B )
    BRA code_02C873
}

---------------------------------------------

func_02C860 {
    COP [8F] ( #2F )
    BRA code_02C873
}

---------------------------------------------

func_02C865 {
    COP [D0] ( #00, #01, &func_02C870 )
    COP [8F] ( #2A )
    BRA code_02C873
}

---------------------------------------------

func_02C870 {
    COP [8F] ( #2E )
}

code_02C873 {
    STZ $2E
    STZ $08

  code_02C877:
    COP [8B]
    LDA $2A
    BEQ code_02C877
    LDA $08
    STZ $08
    STA $24

  code_02C883:
    COP [C2]
    COP [40] ( #$0401, &func_02C80D )
    COP [40] ( #$0801, &func_02C831 )
    DEC $24
    BPL code_02C883
    BRA code_02C877
}

---------------------------------------------

func_02C897 {
    COP [91] ( #29, #1A )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$0008
    TSB $10
    COP [C5]
}

---------------------------------------------

func_02C8AA {
    COP [91] ( #27, #1C )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$0008
    TSB $10
    COP [C5]
}

---------------------------------------------

func_02C8BD {
    LDA #$0028
    TRB $10
    LDA #$0100
    TSB $10
    LDA #$0800
    TSB $player_flags
    COP [92] ( #33, #51, #00 )
    COP [89]

  code_02C8D4:
    LDA $14
    CLC 
    ADC #$0008
    AND #$000F
    BNE code_02C8EC
    COP [1E] ( #07, &code_02C8EC )
    COP [1E] ( #00, &code_02C8EC )
    JMP $&func_02C9B7
}

code_02C8EC {
    COP [8F] ( #33 )

  code_02C8EF:
    COP [AA] ( #51 )

  code_02C8F2:
    LDA $14
    SEC 
    SBC #$0008
    AND #$000F
    BNE code_02C91B
    COP [1A] ( #00, &func_02CA19 )
    COP [40] ( #$0801, &code_02C92D )
    COP [40] ( #$0401, &code_02C934 )

  code_02C90E:
    COP [1E] ( #07, &code_02C91B )
    COP [1E] ( #00, &code_02C91B )
    JMP $&func_02C9B7
}

code_02C91B {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_02C8EF
}

---------------------------------------------

sub_02C922 {
    CPY $4102
    ORA ($01, X)
    LDA [$C9], Y
    COP [C2]
    BRA code_02C8F2
}

code_02C92D {
    COP [1B] ( #00, &func_02CA19 )
    BRA code_02C90E
}

code_02C934 {
    COP [1C] ( #00, &func_02CA19 )
    BRA code_02C90E
}

---------------------------------------------

func_02C93B {
    LDA #$0028
    TRB $10
    LDA #$0100
    TSB $10
    LDA #$0800
    TSB $player_flags
    COP [92] ( #32, #52, #00 )
    COP [89]

  code_02C952:
    LDA $14
    CLC 
    ADC #$0008
    AND #$000F
    BNE code_02C969
    COP [1D] ( #07, &code_02C969 )
    COP [1D] ( #00, &code_02C969 )
    BRA func_02C9CA
}

code_02C969 {
    COP [8F] ( #32 )

  code_02C96C:
    COP [AA] ( #52 )

  code_02C96F:
    LDA $14
    SEC 
    SBC #$0008
    AND #$000F
    BNE code_02C997
    COP [1A] ( #00, &func_02CA19 )
    COP [40] ( #$0801, &code_02C9A9 )
    COP [40] ( #$0401, &code_02C9B0 )

  code_02C98B:
    COP [1D] ( #07, &code_02C997 )
    COP [1D] ( #00, &code_02C997 )
    BRA func_02C9CA
}

code_02C997 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_02C96C
    COP [41] ( #$0201, &func_02C9CA )
    COP [C2]
    BRA code_02C96F
}

code_02C9A9 {
    COP [1B] ( #00, &func_02CA19 )
    BRA code_02C98B
}

code_02C9B0 {
    COP [1C] ( #00, &func_02CA19 )
    BRA code_02C98B
}

---------------------------------------------

func_02C9B7 {
    COP [AA] ( #00 )
    COP [D0] ( #00, #01, &func_02C9C5 )
    COP [8F] ( #31 )
    BRA code_02C9DB
}

---------------------------------------------

func_02C9C5 {
    COP [8F] ( #35 )
    BRA code_02C9DB
}

---------------------------------------------

func_02C9CA {
    COP [AA] ( #00 )
    COP [D0] ( #00, #01, &func_02C9D8 )
    COP [8F] ( #30 )
    BRA code_02C9DB
}

---------------------------------------------

func_02C9D8 {
    COP [8F] ( #34 )
}

code_02C9DB {
    STZ $2C
    STZ $08

  code_02C9DF:
    COP [8B]
    LDA $2A
    BEQ code_02C9DF
    LDA $08
    STZ $08
    STA $24

  code_02C9EB:
    COP [C2]
    COP [40] ( #$0801, &code_02CA0B )
    COP [40] ( #$0401, &code_02CA12 )
    COP [40] ( #$0201, &code_02C952 )
    COP [40] ( #$0101, &code_02C8D4 )

  code_02CA05:
    DEC $24
    BPL code_02C9EB
    BRA code_02C9DF
}

code_02CA0B {
    COP [1B] ( #00, &func_02CA19 )
    BRA code_02CA05
}

code_02CA12 {
    COP [1C] ( #00, &func_02CA19 )
    BRA code_02CA05
}

---------------------------------------------

func_02CA19 {
    STZ $2C
    LDA #$0008
    TSB $10
    COP [C5]
}

---------------------------------------------

func_02CA22 {
    LDA #$0400
    TSB $0658
}

code_02CA28 {
    STZ $040C
    COP [8F] ( #3A )
    BRA code_02CA58
}

---------------------------------------------

func_02CA30 {
    LDA #$0800
    TSB $0658
}

code_02CA36 {
    STZ $040C
    COP [8F] ( #3B )
    BRA code_02CA58
}

---------------------------------------------

func_02CA3E {
    LDA #$0200
    TSB $0658
}

code_02CA44 {
    STZ $040C
    COP [8F] ( #3C )
    BRA code_02CA58
}

---------------------------------------------

func_02CA4C {
    LDA #$0100
    TSB $0658
}

code_02CA52 {
    STZ $040C
    COP [8F] ( #3D )
}

code_02CA58 {
    LDA #$2000
    TSB $player_flags
    LDA #$0020
    TSB $10
    LDA #$0100
    TRB $10

  code_02CA68:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CA68
    COP [41] ( #$0030, &func_02CA82 )
    DEC $24
    BMI code_02CA68
    RTL 
}

---------------------------------------------

func_02CA82 {
    COP [C5]
}

---------------------------------------------

func_02CA84 {
    LDA $0656
    BIT #$0300
    BEQ code_02CA93
    BIT #$0200
    BNE code_02CAD4
    BRA code_02CA9C
}

code_02CA93 {
    LDA $player_speed_ew
    BMI code_02CAD4
    BRA code_02CA9C
}

---------------------------------------------

func_02CA9A {
    COP [C2]
}

code_02CA9C {
    COP [8F] ( #0F )

  code_02CA9F:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CA9F
    LDA $player_speed_ew
    BEQ func_02CB0A
    COP [40] ( #$0200, &func_02CAD2 )
    JSR $&sub_02CB92
    JSR $&sub_02CBD9
    BCS code_02CACD
    COP [40] ( #$8000, &func_02CE5A )
    COP [40] ( #$0030, &func_02CA4C )
}

code_02CACD {
    DEC $24
    BMI code_02CA9F
    RTL 
}

---------------------------------------------

func_02CAD2 {
    COP [C2]
}

code_02CAD4 {
    COP [8F] ( #0E )

  code_02CAD7:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CAD7
    LDA $player_speed_ew
    BEQ func_02CB0A
    COP [40] ( #$0100, &func_02CA9A )
    JSR $&sub_02CB92
    JSR $&sub_02CBD9
    BCS code_02CB05
    COP [40] ( #$8000, &func_02CDDC )
    COP [40] ( #$0030, &func_02CA3E )
}

code_02CB05 {
    DEC $24
    BMI code_02CAD7
    RTL 
}

---------------------------------------------

func_02CB0A {
    COP [C5]
}

---------------------------------------------

func_02CB0C {
    LDA $0656
    BIT #$0C00
    BEQ code_02CB1B
    BIT #$0800
    BNE code_02CB24
    BRA code_02CB5C
}

code_02CB1B {
    LDA $player_speed_ns
    BMI code_02CB24
    BRA code_02CB5C
}

---------------------------------------------

func_02CB22 {
    COP [C2]
}

code_02CB24 {
    COP [8F] ( #0D )

  code_02CB27:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CB27
    LDA $player_speed_ns
    BEQ func_02CB0A
    COP [40] ( #$0400, &func_02CB5A )
    JSR $&sub_02CB92
    JSR $&code_02CBE4
    BCS code_02CB55
    COP [40] ( #$8000, &func_02CD5B )
    COP [40] ( #$0030, &func_02CA30 )
}

code_02CB55 {
    DEC $24
    BMI code_02CB27
    RTL 
}

---------------------------------------------

func_02CB5A {
    COP [C2]
}

code_02CB5C {
    COP [8F] ( #0C )

  code_02CB5F:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CB5F
    LDA $player_speed_ns
    BEQ func_02CB0A
    COP [40] ( #$0800, &func_02CB22 )
    JSR $&sub_02CB92
    JSR $&code_02CBE4
    BCS code_02CB8D
    COP [40] ( #$8000, &func_02CCDA )
    COP [40] ( #$0030, &func_02CA22 )
}

code_02CB8D {
    DEC $24
    BMI code_02CB5F
    RTL 
}

---------------------------------------------

sub_02CB92 {
    LDA $10
    BIT #$0080
    BNE code_02CBB4
    LDA $0AD4
    BNE code_02CBB4
    LDA $0AA2
    BIT #$0002
    BEQ code_02CBB4
    LDA $player_flags
    BIT #$1000
    BNE code_02CBB4
    COP [40] ( #$8000, &func_02CBB5 )
}

code_02CBB4 {
    RTS 
}

---------------------------------------------

func_02CBB5 {
    LDA $player_speed_ew
    BPL code_02CBBE
    EOR #$FFFF
    INC 
}

code_02CBBE {
    CMP #$0003
    BCC code_02CBC7
    PLA 
    JMP $&func_02CC52
}

code_02CBC7 {
    LDA $player_speed_ns
    BPL code_02CBD0
    EOR #$FFFF
    INC 
}

code_02CBD0 {
    CMP #$0003
    BCC code_02CBB4
    PLA 
    JMP $&func_02CBFF
}

---------------------------------------------

sub_02CBD9 {
    LDA $player_speed_ew
    BPL code_02CBE2
    EOR #$FFFF
    INC 
}

code_02CBE2 {
    BRA code_02CBED
}

code_02CBE4 {
    LDA $player_speed_ns
    BPL code_02CBED
    EOR #$FFFF
    INC 
}

code_02CBED {
    CMP #$0004
    BCC code_02CBF3
    RTS 
}

code_02CBF3 {
    LDA $player_flags
    BIT #$1000
    BNE code_02CBFD
    CLC 
    RTS 
}

code_02CBFD {
    SEC 
    RTS 
}

---------------------------------------------

func_02CBFF {
    LDA #$0001
    JSR $&sub_02C33E
    COP [8E] ( #04 )
    LDA $player_speed_ns
    BMI code_02CC2E
    JSR $&code_02CCB0
    LDA #$0100
    TRB $10
    COP [80] ( #0C )
    COP [89]
    STZ $player_speed_ns
    COP [86] ( #0D, #02, #44 )
    COP [8A]
    COP [80] ( #0E )
    COP [89]
    JSR $&code_02CCC8
    COP [C5]
}

code_02CC2E {
    JSR $&code_02CCB0
    COP [AE] ( #01 )
    COP [80] ( #0F )
    COP [89]
    STZ $player_speed_ns
    LDA #$0100
    TRB $10
    COP [86] ( #10, #02, #44 )
    COP [8A]
    COP [80] ( #11 )
    COP [89]
    JSR $&code_02CCC8
    COP [C5]
}

---------------------------------------------

func_02CC52 {
    LDA #$0001
    JSR $&sub_02C33E
    COP [8E] ( #04 )
    LDA $player_speed_ew
    BPL code_02CC84
    JSR $&code_02CCB0
    COP [AD] ( #01 )
    COP [80] ( #12 )
    COP [89]
    STZ $player_speed_ew
    LDA #$0100
    TRB $10
    COP [85] ( #13, #02, #44 )
    COP [8A]
    COP [80] ( #14 )
    COP [89]
    JSR $&code_02CCC8
    COP [C5]
}

code_02CC84 {
    JSR $&code_02CCB0
    COP [80] ( #15 )
    COP [89]
    STZ $player_speed_ew
    LDA #$0100
    TRB $10
    COP [85] ( #16, #02, #44 )
    COP [8A]
    COP [80] ( #17 )
    COP [89]
    JSR $&code_02CCC8
    COP [C5]
}

---------------------------------------------

sub_02CCA5 {
    LDA #$0100
    TRB $10
    LDA #$0200
    TSB $06EE
}

code_02CCB0 {
    LDA #$0200
    TSB $10
    LDA #$8000
    TSB $0658
    LDA #$0802
    TSB $player_flags
    RTS 
}

---------------------------------------------

sub_02CCC2 {
    LDA #$0200
    TRB $06EE
}

code_02CCC8 {
    LDA #$0200
    TRB $10
    LDA #$8000
    TSB $0658
    LDA #$0002
    TRB $player_flags
    RTS 
}

---------------------------------------------

func_02CCDA {
    JSR $&sub_02CEEE
    LDA #$0400
    TSB $0658
    LDA $0AD4
    CMP #$0001
    BNE code_02CD04
    COP [16] ( &code_02CCFF )
    LDA $player_x_pos
    AND #$000F
    BEQ code_02CD04
    COP [14] ( #01, #01, &code_02CCFF )
    BRA code_02CD04
}

code_02CCFF {
    COP [8F] ( #48 )
    BRA code_02CD07
}

code_02CD04 {
    COP [8F] ( #36 )
}

code_02CD07 {
    LDA $scene_current
    CMP #$00E8
    BNE code_02CD18
    COP [A5] ( @func_02CF68, #00, #00, #$0602 )
}

code_02CD18 {
    COP [C1]
    COP [8B]
    COP [C2]

  code_02CD1E:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CD52
    LDA $0AD4
    BNE code_02CD45
    COP [C1]
    COP [40] ( #$0B00, &func_02CED8 )
    COP [40] ( #$0400, &func_02CF0F )
    DEC $24
    BMI code_02CD1E
    RTL 
}

code_02CD45 {
    COP [C1]
    COP [40] ( #$0B00, &func_02CED8 )
    DEC $24
    BMI code_02CD1E
    RTL 
}

code_02CD52 {
    COP [40] ( #$8000, &func_02CCDA )
    JMP $&code_02CEE6
}

---------------------------------------------

func_02CD5B {
    JSR $&sub_02CEEE
    LDA #$0800
    TSB $0658
    LDA $0AD4
    CMP #$0001
    BNE code_02CD85
    COP [16] ( &code_02CD80 )
    LDA $player_x_pos
    AND #$000F
    BEQ code_02CD85
    COP [14] ( #01, #FF, &code_02CD80 )
    BRA code_02CD85
}

code_02CD80 {
    COP [8F] ( #49 )
    BRA code_02CD88
}

code_02CD85 {
    COP [8F] ( #37 )
}

code_02CD88 {
    LDA $scene_current
    CMP #$00E8
    BNE code_02CD99
    COP [A5] ( @func_02CF82, #00, #D0, #$0602 )
}

code_02CD99 {
    COP [C1]
    COP [8B]
    COP [C2]

  code_02CD9F:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CDD3
    LDA $0AD4
    BNE code_02CDC6
    COP [C1]
    COP [40] ( #$0700, &func_02CED8 )
    COP [40] ( #$0800, &code_02CF19 )
    DEC $24
    BMI code_02CD9F
    RTL 
}

code_02CDC6 {
    COP [C1]
    COP [40] ( #$0700, &func_02CED8 )
    DEC $24
    BMI code_02CD9F
    RTL 
}

code_02CDD3 {
    COP [40] ( #$8000, &func_02CD5B )
    JMP $&code_02CEE6
}

---------------------------------------------

func_02CDDC {
    JSR $&sub_02CEEE
    LDA #$0200
    TSB $0658
    LDA $0AD4
    CMP #$0002
    BEQ code_02CDFE
    COP [17] ( &code_02CE03 )
    LDA $16
    AND #$000F
    BEQ code_02CDFE
    COP [14] ( #FF, #01, &code_02CE03 )
}

code_02CDFE {
    COP [8F] ( #38 )
    BRA code_02CE06
}

code_02CE03 {
    COP [8F] ( #42 )
}

code_02CE06 {
    LDA $scene_current
    CMP #$00E8
    BNE code_02CE17
    COP [A5] ( @func_02CF9C, #00, #00, #$0602 )
}

code_02CE17 {
    COP [C1]
    COP [8B]
    COP [C2]

  code_02CE1D:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CE51
    LDA $0AD4
    BNE code_02CE44
    COP [C1]
    COP [40] ( #$0D00, &func_02CED8 )
    COP [40] ( #$0200, &code_02CF28 )
    DEC $24
    BMI code_02CE1D
    RTL 
}

code_02CE44 {
    COP [C1]
    COP [40] ( #$0D00, &func_02CED8 )
    DEC $24
    BMI code_02CE1D
    RTL 
}

code_02CE51 {
    COP [40] ( #$8000, &func_02CDDC )
    JMP $&code_02CEE6
}

---------------------------------------------

func_02CE5A {
    JSR $&sub_02CEEE
    LDA #$0100
    TSB $0658
    LDA $0AD4
    CMP #$0002
    BEQ code_02CE7C
    COP [18] ( &code_02CE81 )
    LDA $16
    AND #$000F
    BEQ code_02CE7C
    COP [14] ( #01, #01, &code_02CE81 )
}

code_02CE7C {
    COP [8F] ( #39 )
    BRA code_02CE84
}

code_02CE81 {
    COP [8F] ( #43 )
}

code_02CE84 {
    LDA $scene_current
    CMP #$00E8
    BNE code_02CE95
    COP [A5] ( @func_02CFB6, #00, #00, #$0602 )
}

code_02CE95 {
    COP [C1]
    COP [8B]
    COP [C2]

  code_02CE9B:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_02CECF
    LDA $0AD4
    BNE code_02CEC2
    COP [C1]
    COP [40] ( #$0E00, &func_02CED8 )
    COP [40] ( #$0100, &code_02CF37 )
    DEC $24
    BMI code_02CE9B
    RTL 
}

code_02CEC2 {
    COP [C1]
    COP [40] ( #$0E00, &func_02CED8 )
    DEC $24
    BMI code_02CE9B
    RTL 
}

code_02CECF {
    COP [40] ( #$8000, &func_02CE5A )
    JMP $&code_02CEE6
}

---------------------------------------------

func_02CED8 {
    LDA $0656
    BIT #$0F00
    BEQ code_02CEE6
    LDA #$8000
    TRB $0658
}

code_02CEE6 {
    LDA #$0F00
    TRB $0658
    COP [C5]
}

---------------------------------------------

sub_02CEEE {
    LDA $0656
    AND #$0F00
    STA $0656
    ORA #$8000
    STA $0658
    LDA #$0100
    TRB $10
    LDA $0AD4
    BEQ code_02CF0B
    COP [06] ( #02 )
    RTS 
}

code_02CF0B {
    COP [06] ( #01 )
    RTS 
}

---------------------------------------------

func_02CF0F {
    JSR $&code_02CF4F
    COP [8F] ( #44 )
    COP [89]
    BRA code_02CF3F
}

code_02CF19 {
    JSR $&code_02CF4F
    LDA #$2000
    TSB $12
    COP [8F] ( #45 )
    COP [89]
    BRA code_02CF3F
}

code_02CF28 {
    JSR $&sub_02CF4A
    LDA #$4000
    TSB $12
    COP [8F] ( #46 )
    COP [89]
    BRA code_02CF3F
}

code_02CF37 {
    JSR $&sub_02CF4A
    COP [8F] ( #47 )
    COP [89]
}

code_02CF3F {
    LDA #$0200
    TRB $10
    COP [5C] ( #$FFBF )
    COP [C5]
}

---------------------------------------------

sub_02CF4A {
    COP [AA] ( #46 )
    BRA code_02CF52
}

code_02CF4F {
    COP [AB] ( #46 )
}

code_02CF52 {
    LDA #$0800
    TSB $player_flags
    LDA #$0001
    STA $09E0
    LDA #$0200
    TSB $10
    COP [5B] ( #$0040 )
    RTS 
}

---------------------------------------------

func_02CF68 {
    COP [88] ( @table_17D000 )
    COP [82] ( #00, #09 )
    COP [89]

  code_02CF73:
    COP [82] ( #04, #0F )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_02CF73
    COP [E0]
}

---------------------------------------------

func_02CF82 {
    COP [88] ( @table_17D000 )
    COP [82] ( #01, #0A )
    COP [89]

  code_02CF8D:
    COP [82] ( #05, #10 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_02CF8D
    COP [E0]
}

---------------------------------------------

func_02CF9C {
    COP [88] ( @table_17D000 )
    COP [81] ( #02, #0A )
    COP [89]

  code_02CFA7:
    COP [81] ( #06, #10 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_02CFA7
    COP [E0]
}

---------------------------------------------

func_02CFB6 {
    COP [88] ( @table_17D000 )
    COP [81] ( #03, #09 )
    COP [89]

  code_02CFC1:
    COP [81] ( #07, #0F )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_02CFC1
    COP [E0]
}