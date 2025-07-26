?BANK 03

?INCLUDE 'chunk_028000'
?INCLUDE 'func_02ED02'
?INCLUDE 'system_strings'
?INCLUDE 'func_02F06A'
?INCLUDE 'chunk_008000'
?INCLUDE 'reward_table_01AADE'
?INCLUDE 'table_01ADA8'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00F3C9'
?INCLUDE 'thinker_00B520'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'entry_points_00C418'

!scene_next                     0642
!scene_current                  0644
!joypad_mask_std                065A
!camera_offset_x                06D6
!camera_offset_y                06D8
!camera_bounds_x                06DA
!camera_bounds_y                06DC
!player_x_tile                  09A6
!player_y_tile                  09A8
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4
!jewels_collected               0AB0
!inventory_slots                0AB4
!inventory_equipped_index       0AC4
!inventory_equipped_type        0AC6
!INIDISP                        2100
!APUIO1                         2141

---------------------------------------------

func_038000 {
    PHP 
    REP #$20
    LDA $scene_next
    AND #$00FF
    BNE code_038039
    LDA $player_flags
    BIT #$0200
    BNE code_038039
    JSL $@func_02A10A
    BCS code_038039
    LDA $0656
    BIT #$1000
    BNE code_038055
    LDA $player_flags
    BIT #$2800
    BNE code_038039
    LDA $0656
    BIT #$2000
    BNE code_03803B
    BIT #$4000
    BEQ code_038039
    JMP $&sub_038410
}

code_038039 {
    PLP 
    RTL 
}

code_03803B {
    LDA #$2000
    TSB $0658
    JSL $@func_028043
    JSL $@func_02ED02
    JSL $@func_0281A2
    LDA #$6000
    TSB $0658
    PLP 
    RTL 
}

code_038055 {
    LDA #$1000
    TSB $0658
    LDX #$0000
    LDA $player_flags
    BIT #$0008
    BNE code_03806D
    JSR $&sub_0380BF
    SEP #$20
    BRA code_03808B
}

code_03806D {
    COP [BD] ( @asciistring_01EAC6 )
    LDA #$8000
    TRB $09EC
    SEP #$20
    JSL $@func_028191
    JSL $@func_028043
    JSL $@func_0281A2
    LDA #$09
    STA $INIDISP
}

code_03808B {
    LDX #$0000
    PHX 

  code_03808F:
    JSL $@func_028191
    JSL $@func_028043
    JSL $@func_0281A2
    JSR $&sub_038259
    LDA $0657
    BIT #$10
    BEQ code_03808F
    PLX 
    LDA #$10
    TSB $0659
    JSL $@func_02F06A
    LDA #$0F
    STA $INIDISP
    LDA #$01
    TSB $09EC
    JSL $@func_00811E
    PLP 
    RTL 
}

---------------------------------------------

sub_0380BF {
    LDA $7F0C07
    BEQ code_0380D7
    SEP #$20
    JSL $@func_028191
    JSL $@func_028043
    JSL $@func_0281A2
    REP #$20
    BRA sub_0380BF
}

code_0380D7 {
    LDA #$&radar_icons_001C00
    STA $7F0C03
    LDA #$*radar_icons_001C00
    STA $7F0C05
    LDA #$7700
    STA $7F0C07
    LDA #$0200
    STA $7F0C09

  code_0380F3:
    LDA $7F0C07
    BEQ code_03810B
    SEP #$20
    JSL $@func_028191
    JSL $@func_028043
    JSL $@func_0281A2
    REP #$20
    BRA code_0380F3
}

code_03810B {
    JSL $@func_02F06A
    PHB 
    LDX #$&radar_layout_001E00
    LDY #$0380
    LDA #$057F
    MVN #$7F, #$^radar_layout_001E00
    PLB 
    LDA $player_x_tile
    AND #$00FC
    SEC 
    SBC #$0020
    STA $0018
    CLC 
    ADC #$0044
    STA $001A
    LDA $player_y_tile
    AND #$00FC
    SEC 
    SBC #$0020
    STA $001C
    CLC 
    ADC #$0044
    STA $001E
    JSR $&sub_03827C
    LDA $0002
    AND #$00F0
    LSR 
    LSR 
    LSR 
    LSR 
    BEQ code_03815B
    ORA #$34F0
    STA $7F07CC
}

code_03815B {
    LDA $0002
    AND #$000F
    ORA #$34F0
    STA $7F07CE
    LDA #$2EE6
    STA $7F07C8
    LDA $0018
    ASL 
    ASL 
    ASL 
    ASL 
    STA $0018
    LDA $001C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $001C
    LDA $001A
    ASL 
    ASL 
    ASL 
    ASL 
    STA $001A
    LDA $001E
    ASL 
    ASL 
    ASL 
    ASL 
    STA $001E
    JSR $&sub_03830E
    LDA $0AEE
    AND #$00F0
    LSR 
    LSR 
    LSR 
    LSR 
    BEQ code_0381AD
    ORA #$34F0
    STA $7F060C
}

code_0381AD {
    LDA $0AEE
    AND #$000F
    ORA #$34F0
    STA $7F060E
    LDA #$2AE7
    STA $7F0608
    LDA $scene_current
    JSL $@func_00B496
    BCS code_038248
    LDX $scene_current
    LDA $@reward_table_01AADE, X
    AND #$00FF
    BEQ code_038248
    LDA #$2EE1
    STA $7F0406
    LDA #$6EE1
    STA $7F040C
    LDA #$AEE1
    STA $7F04C6
    LDA #$EEE1
    STA $7F04CC
    LDA #$2EE2
    STA $7F0408
    LDA #$6EE2
    STA $7F040A
    LDA #$AEE2
    STA $7F04C8
    LDA #$EEE2
    STA $7F04CA
    LDA #$2EE3
    STA $7F0446
    LDA #$AEE3
    STA $7F0486
    LDA #$6EE3
    STA $7F044C
    LDA #$EEE3
    STA $7F048C
    LDA #$32E8
    STA $7F0448
    INC 
    STA $7F044A
    INC 
    STA $7F0488
    INC 
    STA $7F048A
    LDX #$0000
    COP [BD] ( @asciistring_01EAD1 )
}

code_038248 {
    LDA #$32E5
    STA $7F0626
    LDA #$0001
    TSB $09EC
    LDX #$0000
    RTS 
}

---------------------------------------------

sub_038259 {
    LDA $0036
    LSR 
    BCS code_038260
    RTS 
}

code_038260 {
    REP #$20
    LDA $03, S
    INC 
    CMP #$001D
    BCC code_03826D
    LDA #$0000
}

code_03826D {
    STA $03, S
    ASL 
    TAX 
    LDA $@word_0383D6, X
    STA $7F0A24
    SEP #$20
    RTS 
}

---------------------------------------------

sub_03827C {
    PHX 
    STZ $0002
    LDX $0646
    LDA $@table_01ADA8, X
    SEC 
    SBC #$&table_01ADA8
    TAX 
    SEP #$20

  code_03828E:
    LDA $@table_01ADA8, X
    BMI code_03830A
    LDA $@table_01ADA8+3, X
    REP #$20
    AND #$007F
    JSL $@func_00B489
    SEP #$20
    BCS code_038304
    LDA $@table_01ADA8, X
    CMP $0018
    BMI code_0382F9
    CMP $001A
    BCS code_0382F9
    LDA $@table_01ADA8+1, X
    CMP $001C
    BMI code_0382F9
    CMP $001E
    BCS code_0382F9
    LDA $@table_01ADA8, X
    SEC 
    SBC $0018
    LSR 
    AND #$FE
    STA $0000
    STZ $0001
    LDA $@table_01ADA8+1, X
    SEC 
    SBC $001C
    REP #$20
    LSR 
    AND #$00FE
    ASL 
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $0000
    CLC 
    ADC #$0216
    PHX 
    TAX 
    LDA #$2EE6
    STA $7F0200, X
    PLX 
    SEP #$20
}

code_0382F9 {
    SED 
    LDA $0002
    CLC 
    ADC #$01
    STA $0002
    CLD 
}

code_038304 {
    INX 
    INX 
    INX 
    INX 
    BRA code_03828E
}

code_03830A {
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

sub_03830E {
    LDA $56
    BEQ code_03832E

  code_038312:
    TAX 
    LDA $7F002A, X
    BIT #$0100
    BEQ code_038321
    JSR $&sub_03832F
    BRA code_038329
}

code_038321 {
    BIT #$0200
    BEQ code_038329
    JSR $&sub_038379
}

code_038329 {
    LDA $0006, X
    BNE code_038312
}

code_03832E {
    RTS 
}

---------------------------------------------

sub_03832F {
    LDA $0014, X
    CMP $0018
    BMI code_038377
    CMP $001A
    BCS code_038377
    LDA $0016, X
    CMP $001C
    BMI code_038377
    CMP $001E
    BCS code_038377
    PHX 
    LDA $0014, X
    SEC 
    SBC $0018
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$FFFE
    STA $0000
    LDA $0016, X
    SEC 
    SBC $001C
    AND #$FFC0
    CLC 
    ADC $0000
    CLC 
    ADC #$0216
    TAX 
    LDA #$2AE7
    STA $7F0200, X
    PLX 
}

code_038377 {
    SEC 
    RTS 
}

---------------------------------------------

sub_038379 {
    LDA $0014, X
    CMP $camera_offset_x
    BCC code_0383D5
    CMP $camera_bounds_x
    BCS code_0383D5
    CMP $0018
    BMI code_0383D5
    CMP $001A
    BCS code_0383D5
    LDA $0016, X
    CMP $camera_offset_y
    BCC code_0383D5
    CMP $camera_bounds_y
    BCS code_0383D5
    CMP $001C
    BMI code_0383D5
    CMP $001E
    BCS code_0383D5
    PHX 
    LDA $0014, X
    SEC 
    SBC $0018
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$FFFE
    STA $0000
    LDA $0016, X
    SEC 
    SBC $001C
    AND #$FFC0
    CLC 
    ADC $0000
    CLC 
    ADC #$0216
    TAX 
    LDA #$280D
    STA $7F0200, X
    PLX 
}

code_0383D5 {
    RTS 
}

---------------------------------------------

word_0383D6 [
  #$5C82   ;00
  #$5CC4   ;01
  #$5906   ;02
  #$5928   ;03
  #$596A   ;04
  #$55AC   ;05
  #$55EE   ;06
  #$5610   ;07
  #$5252   ;08
  #$5294   ;09
  #$52D6   ;0A
  #$4EF8   ;0B
  #$4F3A   ;0C
  #$4F7C   ;0D
  #$4BBF   ;0E
  #$4BBF   ;0F
  #$4B9D   ;10
  #$4B5B   ;11
  #$4F19   ;12
  #$4EF7   ;13
  #$4EB5   ;14
  #$5273   ;15
  #$5231   ;16
  #$520F   ;17
  #$55CD   ;18
  #$558B   ;19
  #$5549   ;1A
  #$5927   ;1B
  #$58E5   ;1C
]

---------------------------------------------

sub_038410 {
    PEA $&sub_03842F-1
    LDY $inventory_equipped_index
    BPL code_03841B
    JMP $&func_0384BF
}

code_03841B {
    LDA $inventory_slots, Y
    AND #$00FF
    AND #$003F
    ASL 
    TAX 
    LDA #$4000
    TSB $0658
    JMP ($&table_03843F, X)
}

---------------------------------------------

sub_03842F {
    SEP #$20
    JSL $@func_00811E
    REP #$20
    LDA #$4000
    TSB $0658
    PLP 
    RTL 
}

---------------------------------------------

table_03843F [
  &func_0384BF   ;00
  &func_0384D5   ;01
  &func_0385C2   ;02
  &func_038691   ;03
  &func_0387A7   ;04
  &func_03881D   ;05
  &func_03888A   ;06
  &func_038917   ;07
  &func_03899A   ;08
  &func_038BA4   ;09
  &func_038D67   ;0A
  &func_038E15   ;0B
  &func_038E96   ;0C
  &func_038F17   ;0D
  &func_038FF3   ;0E
  &func_0390CE   ;0F
  &func_039144   ;10
  &func_03921A   ;11
  &func_039299   ;12
  &func_03932B   ;13
  &func_0393A1   ;14
  &func_039427   ;15
  &func_03950C   ;16
  &func_03966A   ;17
  &func_039691   ;18
  &func_03983D   ;19
  &func_0398B2   ;1A
  &func_03995C   ;1B
  &func_03997F   ;1C
  &func_0399CD   ;1D
  &func_039AA0   ;1E
  &func_039AA0   ;1F
  &func_039AA0   ;20
  &func_039AA0   ;21
  &func_039AA0   ;22
  &func_039AA0   ;23
  &func_039CAF   ;24
  &func_039D09   ;25
  &func_039E15   ;26
  &func_039F30   ;27
  &func_039F5D   ;28
  &func_039FB1   ;29
  &func_039FB1   ;2A
  &func_039FB1   ;2B
  &func_039FB1   ;2C
  &func_039FB1   ;2D
  &func_039FB1   ;2E
  &func_039FB1   ;2F
  &func_039FB1   ;30
  &func_039FB1   ;31
  &func_039FB1   ;32
  &func_039FB1   ;33
  &func_039FB1   ;34
  &func_039FB1   ;35
  &func_039FB1   ;36
  &func_039FB1   ;37
  &func_039FB1   ;38
  &func_039FB1   ;39
  &func_039FB1   ;3A
  &func_039FB1   ;3B
  &func_039FB1   ;3C
  &func_039FB1   ;3D
  &func_039FB1   ;3E
  &func_039FB1   ;3F
]

---------------------------------------------

func_0384BF {
    COP [BF] ( &widestring_0384C4 )
    RTS 
}

widestring_0384C4 `[DEF][LU1:69]not equipped.[END]`

---------------------------------------------

func_0384D5 {
    COP [BF] ( &widestring_038517 )
    JSR $&sub_039FB2
    SED 
    LDA $jewels_collected
    CLC 
    ADC #$0001
    STA $jewels_collected
    CLD 
    PHX 
    PHD 
    LDA $player_actor
    TCD 
    TAX 
    COP [A5] ( @code_038566, #00, #00, #$2000 )
    TYX 
    LDA #$0000
    STA $0012, X
    LDA #$3000
    STA $000E, X
    LDY $player_actor
    LDA $0014, Y
    STA $0014, X
    LDA $0016, Y
    STA $0016, X
    PLD 
    PLX 
    RTS 
}

widestring_038517 `[DEF]He [LU1:C5]the Red Jewel![FIN]Red Jewels[N]fly to Jeweler Gem's in[N]a single ray of light![END]`

code_038566 {
    COP [A2] ( @code_038576, #$1002 )
    COP [CA] ( #FF )
    DEC $16
    COP [CB]
    COP [E0]
}

code_038576 {
    COP [88] ( @table_0EE000 )
    COP [8D] ( #02 )
    LDA #$0001
    STA $7F0010, X
    STA $7F0012, X
    COP [06] ( #25 )

  code_03858C:
    COP [8B]
    LDA $2A
    BEQ code_03858C
    LDA $08
    STZ $08
    STA $26

  code_038598:
    LDY $24
    JSL $@func_00F3C9
    COP [C2]
    LDA $7F0010, X
    CLC 
    ADC #$0002
    STA $7F0010, X
    LDA $7F0012, X
    CMP #$00FF
    BEQ code_0385C0
    INC 
    STA $7F0012, X
    DEC $26
    BPL code_038598
    BRA code_03858C
}

code_0385C0 {
    COP [E0]
}

---------------------------------------------

func_0385C2 {
    LDA $scene_current
    CMP #$000B
    BNE code_03861A
    COP [45] ( #0E, #10, #10, #11, &code_0385DC )
    COP [45] ( #0A, #17, #0C, #18, &code_0385FF )
    BRA code_03861A
}

code_0385DC {
    COP [D0] ( #24, #01, &code_038615 )
    COP [BF] ( &widestring_03861F )
    COP [32] ( #06 )
    COP [33]
    COP [CD] ( #$0106 )
    COP [CC] ( #24 )
    COP [08] ( #$0E0E )
    COP [10] ( #0E, #11 )
    COP [10] ( #0F, #11 )
    RTS 
}

code_0385FF {
    COP [D0] ( #42, #01, &code_038615 )
    COP [BF] ( &widestring_03861F )
    COP [CC] ( #42 )
    COP [08] ( #$0E0E )
    COP [12] ( #09, #17 )
    RTS 
}

code_038615 {
    COP [BF] ( &widestring_038680 )
    RTS 
}

code_03861A {
    COP [BF] ( &widestring_03865D )
    RTS 
}

widestring_03861F `[DEF]As he turns the [N][LU2:91]key, the steel [N][LU2:58]opens [LU1:F0]a [N]dull sound. [END]`

widestring_03865D `[DEF]There's no keyhole for[N]the [LU2:91]key.[END]`

widestring_038680 `[DEF]The [LU2:58]is open. [END]`

---------------------------------------------

func_038691 {
    LDA $scene_current
    CMP #$001E
    BNE code_0386FA
    LDA $player_y_tile
    CMP #$0012
    BEQ code_0386A6
    CMP #$0013
    BNE code_0386EA
}

code_0386A6 {
    LDA $player_x_tile
    CMP #$0037
    BEQ code_0386B3
    CMP #$0038
    BNE code_0386EA
}

code_0386B3 {
    COP [BF] ( &widestring_0386BE )
    COP [D5] ( #03 )
    COP [CC] ( #30 )
    RTS 
}

widestring_0386BE `[DEF]He set [LU1:1E][LU1:48][N]A on the mantel. [END]`

---------------------------------------------

func_0386DD {
    LDA $player_y_tile
    CMP #$0015
    BEQ code_0386EA
    CMP #$0016
    BNE code_0386FA
}

code_0386EA {
    LDA $player_x_tile
    CMP #$0026
    BNE code_0386F5
    JMP $&code_03876D
}

code_0386F5 {
    CMP #$0027
    BNE code_0386FA
}

code_0386FA {
    COP [D0] ( #44, #00, &code_038705 )
    COP [BF] ( &widestring_03870A )
    RTS 
}

code_038705 {
    COP [BF] ( &widestring_038746 )
    RTS 
}

widestring_03870A `[DEF]He [LU1:D4]to dedicate the [N][LU1:D2][LU1:F4]the [N][LU2:4B]of the spirits [N][LU1:78]reach. [END]`

widestring_038746 `[DEF]Is the [LU1:1E]secret[N]hidden in the statue?[END]`

code_03876D {
    COP [BF] ( &widestring_038772 )
    RTS 
}

widestring_038772 `[DEF]The [LU2:A3]of the mantel [N][LU1:84]match the [N][LU2:A3]of the statue. [END]`

---------------------------------------------

func_0387A7 {
    LDA $scene_current
    CMP #$001E
    BNE code_03880D
    LDA $player_y_tile
    CMP #$0015
    BEQ code_0387BC
    CMP #$0016
    BNE code_038800
}

code_0387BC {
    LDA $player_x_tile
    CMP #$0026
    BEQ code_0387C9
    CMP #$0027
    BNE code_038800
}

code_0387C9 {
    COP [BF] ( &widestring_0387D4 )
    COP [D5] ( #04 )
    COP [CC] ( #31 )
    RTS 
}

widestring_0387D4 `[DEF]He set [LU1:1E][LU1:48][N]B on the mantel. [END]`

---------------------------------------------

func_0387F3 {
    LDA $player_y_tile
    CMP #$0012
    BEQ code_038800
    CMP #$0013
    BNE code_03880D
}

code_038800 {
    LDA $player_x_tile
    CMP #$0037
    BEQ code_038818
    CMP #$0038
    BNE code_03880D
}

code_03880D {
    COP [D0] ( #44, #00, &code_038705 )
    COP [BF] ( &widestring_03870A )
    RTS 
}

code_038818 {
    COP [BF] ( &widestring_038772 )
    RTS 
}

---------------------------------------------

func_03881D {
    COP [BF] ( &widestring_038836 )
    LDA $scene_current
    CMP #$0018
    BNE code_038831
    COP [CC] ( #2E )
    COP [BF] ( &widestring_03885A )
    RTS 
}

code_038831 {
    COP [BF] ( &widestring_03887A )
    RTS 
}

widestring_038836 `[DEF]Will [LU2:A1]played the [N]Incan melody. [FIN]`

widestring_03885A `The Mayor's expression[N]changed![END]`

widestring_03887A `But [LU1:B9]happened.[END]`

---------------------------------------------

func_03888A {
    COP [BF] ( &widestring_0388AD )
    COP [BE] ( #02, #01, &code_list_038894 )
}

code_list_038894 [
  &code_0388A8   ;00
  &code_03889A   ;01
  &code_0388A8   ;02
]

code_03889A {
    COP [BF] ( &widestring_0388E9 )
    LDA #$0008
    STA $0B22
    JSR $&sub_039FB2
    RTS 
}

code_0388A8 {
    COP [BF] ( &widestring_0388CA )
    RTS 
}

widestring_0388AD `[DEF]Take the medicine?[N] Yes[N] No`

widestring_0388CA `[CLR]He stopped eating [N]the herb. [END]`

widestring_0388E9 `[CLR]Eating the herb, he [N]regained his strength. [END]`

---------------------------------------------

func_038917 {
    LDA $scene_current
    CMP #$0025
    BNE code_038939
    LDA $player_y_tile
    CMP #$0019
    BEQ code_03892C
    CMP #$001A
    BNE code_038939
}

code_03892C {
    LDA $player_x_tile
    CMP #$000E
    BEQ func_038971
    CMP #$000F
    BNE code_038939
}

code_038939 {
    COP [BF] ( &widestring_03893E )
    RTS 
}

widestring_03893E `[DEF]I [LU1:78][LU1:90]a space [N][LU1:D7]the diamond-shaped [N]block fits. [END]`

---------------------------------------------

func_038971 {
    COP [BF] ( &widestring_03897C )
    COP [D5] ( #07 )
    COP [CC] ( #2F )
    RTS 
}

widestring_03897C `[DEF]He fit the block[N][LU1:A1]the tile![END]`

---------------------------------------------

func_03899A {
    LDA $0AD4
    BNE code_0389F5
    JSL $@func_02A10A
    BCC code_0389A6
    RTS 
}

code_0389A6 {
    LDA $scene_current
    CMP #$0024
    BNE code_0389F0
    COP [D0] ( #01, #01, &code_0389F0 )
    LDA #$0080
    TSB $09EC
    COP [BF] ( &widestring_038A2B )
    PHX 
    LDX #$0000
    COP [A5] ( @func_039FCA, #00, #00, #$2000 )
    CPY #$1FC0
    BNE code_0389D3
    JMP $&code_0389D9
}

code_0389D3 {
    LDA #$CFF0
    TSB $joypad_mask_std
}

code_0389D9 {
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$0019
    STA $0026, Y
    LDA #$0000
    STA $0020, Y
    PLX 
    RTS 
}

code_0389F0 {
    COP [BF] ( &widestring_038A8A )
    RTS 
}

code_0389F5 {
    COP [BF] ( &widestring_038B76 )
    RTS 
    COP [BF] ( &widestring_038B8F )
    RTS 
}

---------------------------------------------

widestring_0389FF `[DEF][LU2:27]the Flute?[N] Yes[N] No`

---------------------------------------------

func_038A16 {
    COP [CC] ( #01 )
    COP [BF] ( &widestring_038A46 )
    COP [3B] ( #2F, @e_thinker_00B520 )
    COP [C5]
    COP [BF] ( &widestring_038AB5 )
    COP [C5]
}

widestring_038A2B `[DEF]He [LU2:A1]played[N]the [LU2:3D]Melody.[END]`

widestring_038A46 `[DEF][CLR][LU1:61]touched by the echo[N]of the Flute, the Gold[N]Block began to glow![END]`

widestring_038A8A `[DEF]He [LU2:A1]played[N]the [LU2:3D]Melody.[FIN]But [LU1:B9]happened.[END]`

widestring_038AB5 `[DEF][CLR][LU1:61]the [LU1:B4]flowed[N][LU1:6D]his body, strange[N]words filled his head.[FIN]Chant in the room paved[N][LU1:F0]gold, and meditate[N]a [LU2:BF]in the place[N][LU1:D7]shines brightly.[FIN]For [LU1:D7]person the road[N]to the [LU2:8A]of[N]freedom [LU1:EF]open...[END]`

widestring_038B76 `[DEF][CLR]He [LU1:84]have[N]the Flute...[END]`

widestring_038B8F `[CLR]He stopped playing.[END]`

---------------------------------------------

func_038BA4 {
    LDA $0AD4
    BEQ code_038BAC
    JMP $&code_038C30
}

code_038BAC {
    JSL $@func_02A10A
    BCC code_038BB3
    RTS 
}

code_038BB3 {
    LDA $scene_current
    CMP #$0015
    BEQ code_038BD6
    CMP #$0011
    BEQ code_038BC7
    CMP #$00CD
    BEQ code_038BDE
    BRA code_038C2B
}

code_038BC7 {
    COP [D1] ( #$0113, #01, &code_038C2B )
    COP [D0] ( #02, #01, &code_038C2B )
    BRA code_038BEF
}

code_038BD6 {
    COP [D0] ( #40, #01, &code_038C2B )
    BRA code_038BEF
}

code_038BDE {
    COP [D0] ( #BB, #01, &code_038C2B )
    COP [D0] ( #0E, #00, &code_038C2B )
    COP [CC] ( #0D )
    BRA code_038BEF
}

code_038BEF {
    LDA #$0080
    TSB $09EC
    COP [BF] ( &widestring_038C76 )
    PHX 
    LDX #$0000
    COP [A5] ( @func_039FCA, #00, #00, #$2000 )
    CPY #$1FC0
    BNE code_038C0E
    JMP $&code_038C14
}

code_038C0E {
    LDA #$CFF0
    TSB $joypad_mask_std
}

code_038C14 {
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$0018
    STA $0026, Y
    LDA #$0001
    STA $0020, Y
    PLX 
    RTS 
}

code_038C2B {
    COP [BF] ( &widestring_038CDB )
    RTS 
}

code_038C30 {
    COP [BF] ( &widestring_038F82 )
    RTS 
}

---------------------------------------------

func_038C35 {
    LDA $scene_current
    CMP #$0015
    BEQ code_038C49
    CMP #$0011
    BEQ code_038C58
    CMP #$00CD
    BEQ code_038C68
    BRA code_038C70
}

code_038C49 {
    COP [D0] ( #40, #01, &code_038C68 )
    COP [CC] ( #40 )
    COP [BF] ( &widestring_038CA0 )
    COP [C5]
}

code_038C58 {
    COP [D1] ( #$0113, #01, &code_038C70 )
    COP [CC] ( #02 )
    COP [BF] ( &widestring_038D17 )
    COP [C5]
}

code_038C68 {
    COP [CC] ( #01 )
    COP [CE] ( #0E )
    COP [C5]
}

code_038C70 {
    COP [BF] ( &widestring_038CDB+M )
    COP [C5]
}

widestring_038C76 `[DEF]He [LU2:A1]played the[N][LU1:B4]he had learned[N][LU1:8E]Lola.[END]`

widestring_038CA0 `[DEF][CLR]The melody, carried on [N]the wind, spread [N][LU1:BE]the meadow. [END]`

widestring_038CDB `[DEF]He [LU2:A1]played the[N][LU1:B4]he had learned[N][LU1:8E]Lola.[FIN][::][DEF][CLR]But [LU1:B9]happened.[END]`

widestring_038D17 `[DEF][CLR]He [LU1:99]a soft voice[N][LU1:8E]somewhere...[FIN][TPL:2][LU1:46]Voice:[N]Go to the switch on[N]the [LU1:C6]wall.[PAL:0][END]`

---------------------------------------------

func_038D67 {
    LDA $scene_current
    CMP #$002F
    BNE code_038D80
    COP [D0] ( #02, #00, &code_038D80 )
    COP [D5] ( #0A )
    COP [BF] ( &widestring_038DDA )
    COP [CC] ( #03 )
    RTS 
}

code_038D80 {
    COP [BF] ( &widestring_038D85 )
    RTS 
}

widestring_038D85 `[DEF]He bit off [LU1:D0][N]of the smoked meat. [FIN]It had a flavor he'd[N][LU1:BB]tasted before.[N][LU1:62][LU1:7A]it be?[END]`

widestring_038DDA `[DEF]We bit off[N][LU1:D0]of the meat.[FIN]It was [LU2:50][LU2:B5]any[N]food we'd [LU2:5D]had.[END]`

---------------------------------------------

func_038E15 {
    COP [BF] ( &widestring_038E39 )
    LDA $scene_current
    CMP #$0044
    BNE code_038E29
    COP [45] ( #0F, #16, #11, #19, &code_038E2E )
}

code_038E29 {
    COP [BF] ( &widestring_038E61 )
    RTS 
}

code_038E2E {
    COP [BF] ( &widestring_038E73 )
    COP [D5] ( #0B )
    COP [CC] ( #5B )
    RTS 
}

widestring_038E39 `[DEF]He tries using the key [N]to the mine. [FIN]`

widestring_038E61 `But [LU1:DB]no keyhole![END]`

widestring_038E73 `The key turns, making a [N][LU1:C7]sound. [END]`

---------------------------------------------

func_038E96 {
    COP [BF] ( &widestring_038EBA )
    LDA $scene_current
    CMP #$0044
    BNE code_038EAA
    COP [45] ( #0F, #16, #11, #19, &code_038EAF )
}

code_038EAA {
    COP [BF] ( &widestring_038EE2 )
    RTS 
}

code_038EAF {
    COP [BF] ( &widestring_038EF4 )
    COP [D5] ( #0C )
    COP [CC] ( #5C )
    RTS 
}

widestring_038EBA `[DEF]He tries using the key [N]to the mine. [FIN]`

widestring_038EE2 `But [LU1:DB]no keyhole![END]`

widestring_038EF4 `The key turns, making a [N][LU1:C7]sound. [END]`

---------------------------------------------

func_038F17 {
    LDA $0AD4
    BEQ code_038F21
    COP [BF] ( &widestring_038F82 )
    RTS 
}

code_038F21 {
    LDA $scene_current
    CMP #$0039
    BEQ code_038F2B
    BRA code_038F7D
}

code_038F2B {
    COP [D0] ( #68, #01, &code_038F7D )
    COP [45] ( #13, #18, #1A, #1D, &code_038F3B )
    BRA code_038F7D
}

code_038F3B {
    LDA #$0080
    TSB $09EC
    COP [BF] ( &widestring_038FCD )
    PHX 
    LDX #$0000
    COP [A5] ( @func_039FCA, #00, #00, #$2000 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$001D
    STA $0026, Y
    LDA #$0002
    STA $0020, Y
    PLX 
    LDA #$000E
    STA $06F2
    RTS 
}

---------------------------------------------

func_038F6F {
    COP [D5] ( #0D )
    COP [3B] ( #1B, @func_00B519 )
    COP [CC] ( #0F )
    COP [C5]
}

code_038F7D {
    COP [BF] ( &widestring_038F98 )
    RTS 
}

widestring_038F82 `[DEF]He [LU1:84]have[N]the Flute.[END]`

widestring_038F98 `[DEF]Will began [LU1:C4]the [N][LU1:B4]he remembered. [FIN]But [LU1:B9]happened.[END]`

widestring_038FCD `[DEF][CLR]Will began [LU1:C4]the [N][LU1:B4]he remembered. [END]`

---------------------------------------------

func_038FF3 {
    LDA $scene_current
    CMP #$004C
    BNE code_03901B
    COP [45] ( #16, #0C, #18, #0F, &code_039020 )
    COP [45] ( #16, #10, #18, #13, &code_03902B )
    COP [45] ( #08, #0A, #0B, #0D, &code_039036 )
    COP [45] ( #08, #0E, #0B, #11, &code_039041 )
}

code_03901B {
    COP [BF] ( &widestring_039057 )
    RTS 
}

code_039020 {
    COP [D0] ( #60, #01, &code_039052 )
    COP [CC] ( #60 )
    BRA code_03904A
}

code_03902B {
    COP [D0] ( #61, #01, &code_039052 )
    COP [CC] ( #61 )
    BRA code_03904A
}

code_039036 {
    COP [D0] ( #62, #01, &code_039052 )
    COP [CC] ( #62 )
    BRA code_03904A
}

code_039041 {
    COP [D0] ( #63, #01, &code_039052 )
    COP [CC] ( #63 )
}

code_03904A {
    COP [BF] ( &widestring_039083 )
    JSR $&sub_039FB2
    RTS 
}

code_039052 {
    COP [BF] ( &widestring_0390A5 )
    RTS 
}

widestring_039057 `[DEF]He raises the [N][LU1:7]Ball, but [N][LU1:B9]happened... [END]`

widestring_039083 `[DEF]The [LU1:7]Ball is [N]set in the hole! [END]`

widestring_0390A5 `[DEF]The [LU1:7]Ball is [N]already set in the hole![END]`

---------------------------------------------

func_0390CE {
    COP [BF] ( &widestring_0390F2 )
    LDA $scene_current
    CMP #$003F
    BNE code_0390E2
    COP [45] ( #18, #34, #1A, #37, &code_0390E7 )
}

code_0390E2 {
    COP [BF] ( &widestring_039110 )
    RTS 
}

code_0390E7 {
    COP [BF] ( &widestring_039122 )
    COP [D5] ( #0F )
    COP [CC] ( #69 )
    RTS 
}

widestring_0390F2 `[DEF]He tries using [N]the [LU2:5E]key. [FIN]`

widestring_039110 `But [LU1:DB]no keyhole![END]`

widestring_039122 `The key turns, making a[N][LU1:C7]sound. [END]`

---------------------------------------------

func_039144 {
    COP [BF] ( &widestring_039179 )
    LDA $scene_current
    CMP #$005A
    BNE code_039158
    COP [45] ( #08, #07, #0A, #08, &code_03915D )
}

code_039158 {
    COP [BF] ( &widestring_0391A4 )
    RTS 
}

code_03915D {
    COP [D1] ( #$0138, #01, &code_039158 )
    COP [BF] ( &widestring_0391B6 )
    COP [D5] ( #10 )
    COP [32] ( #38 )
    COP [33]
    COP [CD] ( #$0138 )
    COP [BF] ( &widestring_0391D9 )
    RTS 
}

widestring_039179 `[DEF]He tries using the key [N]to the [LU2:32]Palace.[FIN]`

widestring_0391A4 `But [LU1:DB]no keyhole![END]`

widestring_0391B6 `The key turns, making a[N][LU1:C7]sound. [FIN]`

widestring_0391D9 `[CLR][TPL:2][LU1:2C]spoke from[N]his pocket.[FIN]The phantom land of[N]Mu lies ahead.[PAL:0][END]`

---------------------------------------------

func_03921A {
    COP [BF] ( &widestring_039244 )
    LDA $scene_current
    CMP #$005D
    BNE code_03923F
    COP [45] ( #0A, #11, #17, #1A, &code_039230 )
    BRA code_03923F
}

code_039230 {
    COP [0F] ( #0D, #0F )
    COP [D5] ( #11 )
    COP [BF] ( &widestring_03926F )
    COP [CC] ( #0E )
    RTS 
}

code_03923F {
    COP [BF] ( &widestring_03925F )
    RTS 
}

widestring_039244 `[DEF]He raises the [N][LU1:40]Stone. [FIN]`

widestring_03925F `But [LU1:B9]happened![END]`

widestring_03926F `The [LU2:9D]began to glow, [N][LU2:B6][LU2:5A][LU1:A1][N]the spring. [END]`

---------------------------------------------

func_039299 {
    COP [BF] ( &widestring_0392DE )
    LDA $scene_current
    CMP #$0063
    BNE code_0392D9
    COP [45] ( #06, #06, #0A, #08, &code_0392C8 )
    COP [45] ( #16, #06, #1A, #08, &code_0392B7 )
    BRA code_0392D9
}

code_0392B7 {
    COP [D0] ( #7E, #01, &code_0392D9 )
    JSR $&sub_039FB2
    COP [BF] ( &widestring_03930B )
    COP [CC] ( #7E )
    RTS 
}

code_0392C8 {
    COP [D0] ( #7B, #01, &code_0392D9 )
    JSR $&sub_039FB2
    COP [BF] ( &widestring_03930B )
    COP [CC] ( #7B )
    RTS 
}

code_0392D9 {
    COP [BF] ( &widestring_0392FB )
    RTS 
}

widestring_0392DE `[DEF]He raises the [N][LU1:48]of Hope. [FIN]`

widestring_0392FB `But [LU1:B9]happened![END]`

widestring_03930B `A [LU1:C7]whisper is[N][LU1:99][LU1:8E]somewhere...[END]`

---------------------------------------------

func_03932B {
    COP [BF] ( &widestring_039370 )
    LDA $scene_current
    CMP #$0066
    BNE code_03936B
    COP [45] ( #23, #08, #26, #0A, &code_039349 )
    COP [45] ( #2A, #08, #2D, #0A, &code_03935A )
    BRA code_03936B
}

code_039349 {
    COP [D0] ( #80, #01, &code_03936B )
    JSR $&sub_039FB2
    COP [BF] ( &widestring_03939F )
    COP [CC] ( #80 )
    RTS 
}

code_03935A {
    COP [D0] ( #81, #01, &code_03936B )
    JSR $&sub_039FB2
    COP [BF] ( &widestring_03939F )
    COP [CC] ( #81 )
    RTS 
}

code_03936B {
    COP [BF] ( &widestring_03938F )
    RTS 
}

widestring_039370 `[DEF]He raises the [N]Rama Statue. [FIN]`

widestring_03938F `But [LU1:B9]happened![END]`

widestring_03939F `[CLD]`

---------------------------------------------

func_0393A1 {
    COP [BF] ( &widestring_0393C5 )
    LDA $scene_current
    CMP #$0074
    BNE code_0393B5
    COP [45] ( #07, #08, #09, #0A, &code_0393BA )
}

code_0393B5 {
    COP [BF] ( &widestring_0393EA )
    RTS 
}

code_0393BA {
    COP [BF] ( &widestring_0393FA )
    COP [D5] ( #14 )
    COP [CC] ( #01 )
    RTS 
}

widestring_0393C5 `[DEF]He tries using the [N]Magic Powder. [FIN]`

widestring_0393EA `But [LU1:B9]happened![END]`

widestring_0393FA `He spreads Magic Powder [N]on Kara's picture! [END]`

---------------------------------------------

func_039427 {
    COP [BF] ( &widestring_03944D )
    COP [BE] ( #03, #01, &code_list_039431 )
}

code_list_039431 [
  &code_039439   ;00
  &code_03943E   ;01
  &code_039443   ;02
  &code_039448   ;03
]

code_039439 {
    COP [BF] ( &widestring_0394B5 )
    RTS 
}

code_03943E {
    COP [BF] ( &widestring_0394CE )
    RTS 
}

code_039443 {
    COP [BF] ( &widestring_0394E5 )
    RTS 
}

code_039448 {
    COP [BF] ( &widestring_0394FD )
    RTS 
}

widestring_03944D `[DEF]He [LU2:8B]Lance's father's[N]journal. [FIN]Read which entry? [N] Tower of Babel [N] Mystic Statues [N] [LU1:16]Wall of China `

widestring_0394B5 `[DEF]He closes the journal. [END]`

widestring_0394CE `[DEF]The Tower of Babel...[END]`

widestring_0394E5 `[DEF]The Mystic Statues... [END]`

widestring_0394FD `[DEF]The [LU1:16]Wall...[END]`

---------------------------------------------

func_03950C {
    COP [CC] ( #8E )
    COP [BF] ( &widestring_039514 )
    RTS 
}

widestring_039514 `[DEF]He [LU2:8B]Lance's letter. [FIN][TPL:4]Lance: [N]I'm [LU1:93]to the [N][LU1:16]Wall of China. [FIN]I intended to keep it [N]secret, but I told Will [N][LU1:A3]in case... [FIN]I'm putting [LU1:D6]letter[N]in his luggage, but he[N][LU2:8F][LU1:FA]notice.[FIN]The [LU2:AE]say[N][LU1:DB][LU1:D0]kind of[N]cure for my father[N]at the [LU1:16]Wall.[FIN][LU1:1D]a [LU1:A6]journey, but[N]I'd go anywhere if[N]it [LU1:F3]help him.[N][LU1:D]worry [LU1:6B]me...[FIN]P.S.: [N]By the way, [LU1:2C][N]has [LU1:AE]me.[PAL:0][END]`

---------------------------------------------

func_03966A {
    COP [BF] ( &widestring_03966F )
    RTS 
}

widestring_03966F `[DEF]Lance [LU1:B3][LU1:D6]necklace [N]for Lilly...[END]`

---------------------------------------------

func_039691 {
    COP [BF] ( &widestring_039696 )
    RTS 
}

widestring_039696 `[DEF]He [LU2:8B]the will.[FIN][N]    To the Opponent[FIN][LU1:12]if I perish, don't[N]mourn for me.[FIN][LU1:12]if [LU2:2D]Glass[N][LU1:84]cost me[N]my life, [LU1:9F]my fate[N]to pass away soon.[FIN]Six months ago, [LU1:F6]I[N][LU1:8F]out I was dying,[N]I decided to amass as[N]much money as possible.[FIN]I [LU1:FC]to [LU1:AC]it to [N]my wife, and the child [N][LU1:1F][LU1:BB]see. [FIN]I [LU1:B3]my fortune [N]in spite of the  [N]unhappiness I [LU1:98][N]caused others. [FIN]If I lose, I [LU1:F1]to[N][LU1:AC]part of my[N]estate to you.[FIN][LU1:3B][LU1:E7][LU2:57]of my [N]four favorite [N]Kruk horses. [END]`

---------------------------------------------

func_03983D {
    COP [BF] ( &widestring_039861 )
    LDA $scene_current
    CMP #$0095
    BNE code_039851
    COP [45] ( #28, #09, #2D, #0D, &code_039856 )
}

code_039851 {
    COP [BF] ( &widestring_039880 )
    RTS 
}

code_039856 {
    COP [BF] ( &widestring_039890 )
    COP [D5] ( #19 )
    COP [CC] ( #A8 )
    RTS 
}

widestring_039861 `[DEF]He tries using [N]the Teapot. [FIN]`

widestring_039880 `But [LU1:B9]happened![END]`

widestring_039890 `The spirits' tears [N]rained down. [END]`

---------------------------------------------

func_0398B2 {
    COP [BF] ( &widestring_0398FC )
    LDA $scene_current
    CMP #$00A2
    BEQ code_0398C8
    CMP #$00A5
    BEQ func_0398DA

  code_0398C3:
    COP [BF] ( &widestring_039925 )
    RTS 
}

code_0398C8 {
    COP [45] ( #14, #08, #16, #09, &code_0398D2 )
    BRA code_0398C3
}

code_0398D2 {
    COP [BF] ( &widestring_039935 )
    COP [CC] ( #01 )
    RTS 
}

---------------------------------------------

func_0398DA {
    COP [45] ( #2E, #12, #30, #13, &code_0398EC )
    COP [45] ( #28, #24, #2A, #25, &code_0398F4 )
    BRA code_0398C3
}

code_0398EC {
    COP [BF] ( &widestring_039935 )
    COP [CC] ( #01 )
    RTS 
}

code_0398F4 {
    COP [BF] ( &widestring_039935 )
    COP [CC] ( #02 )
    RTS 
}

widestring_0398FC `[DEF]He tries using the [LU2:C0][N][LU1:8E]the mushroom. [FIN]`

widestring_039925 `But [LU1:B9]happened![END]`

widestring_039935 `He pours the mushroom[N][LU2:C0]on the stems! [END]`

---------------------------------------------

func_03995C {
    COP [BF] ( &widestring_039961 )
    RTS 
}

widestring_039961 `[DEF][LU1:1D]the prize money[N][LU1:8E][LU2:2D]Glass.[END]`

---------------------------------------------

func_03997F {
    COP [BF] ( &widestring_039984 )
    RTS 
}

widestring_039984 `[DEF][LU1:5E]are glasses made[N]of black crystal. They[N]can cut out a lot[N]of light...[END]`

---------------------------------------------

func_0399CD {
    LDA $scene_current
    CMP #$00AE
    BNE code_0399ED
    COP [45] ( #06, #06, #07, #08, &code_0399F2 )
    COP [45] ( #08, #06, #09, #08, &code_039A01 )
    COP [45] ( #0A, #06, #0B, #08, &code_039A10 )
}

code_0399ED {
    COP [BF] ( &widestring_039A35 )
    RTS 
}

code_0399F2 {
    COP [D0] ( #BF, #01, &code_0399ED )
    COP [CC] ( #BF )
    COP [BF] ( &widestring_039A63 )
    BRA code_039A1F
}

code_039A01 {
    COP [D0] ( #C0, #01, &code_0399ED )
    COP [CC] ( #C0 )
    COP [BF] ( &widestring_039A63 )
    BRA code_039A1F
}

code_039A10 {
    COP [D0] ( #C1, #01, &code_0399ED )
    COP [CC] ( #C1 )
    COP [BF] ( &widestring_039A63 )
    BRA code_039A1F
}

code_039A1F {
    COP [D0] ( #BF, #00, &code_039A34 )
    COP [D0] ( #C0, #00, &code_039A34 )
    COP [D0] ( #C1, #00, &code_039A34 )
    COP [D5] ( #1D )
}

code_039A34 {
    RTS 
}

widestring_039A35 `[DEF]He stares at the [LU2:13][N]Flower, but [N][LU1:B9]happens! [END]`

widestring_039A63 `[DEF]He puts one petal of[N]the [LU2:13]Flower into[N]the statue's mouth. [END]`

---------------------------------------------

func_039AA0 {
    LDA $scene_current
    CMP #$00CD
    BEQ code_039AB2

  code_039AA8:
    COP [BF] ( &widestring_039C8B )
    RTS 
}

---------------------------------------------

func_039AAD {
    COP [BF] ( &widestring_039C60 )
    RTS 
}

code_039AB2 {
    COP [D0] ( #0F, #01, &func_039AAD )
    COP [45] ( #04, #09, #0C, #0B, &code_039AC2 )
    BRA code_039AA8
}

code_039AC2 {
    COP [BF] ( &widestring_039BA5 )
    COP [BE] ( #63, #01, &code_list_039ACC )
}

code_list_039ACC [
  &code_039ADA   ;00
  &code_039ADF   ;01
  &code_039AE7   ;02
  &code_039AEF   ;03
  &code_039AF7   ;04
  &code_039AFF   ;05
  &code_039B07   ;06
]

code_039ADA {
    COP [BF] ( &widestring_039C89 )
    RTS 
}

code_039ADF {
    LDA #$0000
    STA $0AAC
    BRA code_039B0F
}

code_039AE7 {
    LDA #$0001
    STA $0AAC
    BRA code_039B0F
}

code_039AEF {
    LDA #$0002
    STA $0AAC
    BRA code_039B0F
}

code_039AF7 {
    LDA #$0003
    STA $0AAC
    BRA code_039B0F
}

code_039AFF {
    LDA #$0004
    STA $0AAC
    BRA code_039B0F
}

code_039B07 {
    LDA #$0005
    STA $0AAC
    BRA code_039B0F
}

code_039B0F {
    LDY $inventory_equipped_index
    LDA $inventory_slots, Y
    AND #$00FF
    SEC 
    SBC #$001E
    STA $0AA6
    JSR $&sub_039FB2
    PHX 
    LDX #$0000
    COP [A5] ( @code_039B70, #00, #00, #$2000 )
    LDA $0AA6
    STA $0024, Y
    LDA $0AAC
    CLC 
    ADC #$0005
    STA $0014, Y
    LDA #$0006
    STA $0016, Y
    PLX 
    LDA $0AAC
    ASL 
    TAY 
    LDA $0B28, Y
    BMI code_039B65
    CLC 
    ADC #$001E
    PHY 
    JSL $@func_03EF97
    PLY 
    LDA $0AA6
    STA $0B28, Y
    COP [BF] ( &widestring_039C19 )
    RTS 
}

code_039B65 {
    LDA $0AA6
    STA $0B28, Y
    COP [BF] ( &widestring_039C39 )
    RTS 
}

code_039B70 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_039B7B )
}

code_list_039B7B [
  &code_039B87   ;00
  &code_039B8C   ;01
  &code_039B91   ;02
  &code_039B96   ;03
  &code_039B9B   ;04
  &code_039BA0   ;05
]

code_039B87 {
    COP [4C] ( #84 )
    COP [E0]
}

code_039B8C {
    COP [4C] ( #85 )
    COP [E0]
}

code_039B91 {
    COP [4C] ( #86 )
    COP [E0]
}

code_039B96 {
    COP [4C] ( #8C )
    COP [E0]
}

code_039B9B {
    COP [4C] ( #8D )
    COP [E0]
}

code_039BA0 {
    COP [4C] ( #8E )
    COP [E0]
}

widestring_039BA5 `[DEF][TPL:0]There are six hollows [N][LU1:F4]a tile can fit. [FIN]Put it where?[N] 1st [LU1:8E]L. 4th [LU1:8E]L.[N] 2nd [LU1:8E]L. 5th [LU1:8E]L.[N] 3rd [LU1:8E]L. 6th [LU1:8E]L.`

widestring_039C19 `[CLR][TPL:0]He exchanges the [N][LU1:9E]plate![PAL:0][END]`

widestring_039C39 `[CLR][TPL:0]He puts the [LU1:9E][N]plate in the hole![PAL:0][END]`

widestring_039C60 `[DEF][TPL:0]Now is not the [LU1:DF]to[N]fit the tile...[PAL:0][END]`

widestring_039C89 `[CLD]`

widestring_039C8B `[DEF]There's no [LU2:90]to put[N]the [LU1:9E]plate.[PAL:0][END]`

---------------------------------------------

func_039CAF {
    LDA $player_flags
    BIT #$1000
    BNE code_039CE0
    BIT #$0100
    BNE code_039CE0
    LDA $player_speed_ew
    ORA $player_speed_ns
    BNE code_039CE0
    LDA $0AD4
    CMP #$0002
    BNE code_039CDC
    LDY $player_actor
    LDA #$*func_00C557
    STA $0002, Y
    LDA #$&func_00C557
    JSR $&sub_03A0A0
    RTS 
}

code_039CDC {
    COP [BF] ( &widestring_039CE1 )
}

code_039CE0 {
    RTS 
}

widestring_039CE1 `[DEF]He holds up the Aura,[N]but [LU1:B9]happens...[END]`

---------------------------------------------

func_039D09 {
    COP [BF] ( &widestring_039D0E )
    RTS 
}

widestring_039D0E `[DEF][TPL:3][LU2:14]you [LU1:70]OK? [N][LU2:23]told us [LU1:D7]he was [N]in Dao, so I'm sending [N][LU1:D6]letter. [FIN]I [LU1:99]the reason why.[N][LU1:1A]and I are[N][LU1:AB]forward to[N]seeing you.[FIN][LU1:61]we [LU2:80]in [LU1:FE][N][LU1:92]luggage, we [N][LU1:8F]a journal [LU2:C3][N][LU1:6B]the Pyramid. [FIN]I [LU1:D8]it [LU1:F3]help[N]you, so I sent it along.[N]Take care.[N]            Bill / Lola[PAL:0][END]`

---------------------------------------------

func_039E15 {
    COP [BF] ( &widestring_039E1A )
    RTS 
}

widestring_039E1A `[DEF][LU1:20]deciphered the[N]hieroglyphs. No one[N]has [LU2:5D]done[N]it before.[FIN]It says [LU1:DB]a key to[N]solving the riddle of[N][LU1:9A]history in[N]the Pyramid.[FIN][ESC:C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB][N]The [LU2:61]part says, [N]"The Sun Spirit rises [N][LU1:8E]the horizon.ˮ [FIN]I [LU2:C1]to the Pyramid,[N]and [LU1:8F]the same[N]inscription. So...[FIN]Here a page is missing.[END]`

---------------------------------------------

func_039F30 {
    COP [BF] ( &widestring_039F35 )
    RTS 
}

widestring_039F35 `[DEF]This is the [LU1:7]Ring [N][LU1:D7][LU1:27][LU1:11] [N]is [LU1:AB]for. [END]`

---------------------------------------------

func_039F5D {
    COP [BF] ( &widestring_039F6B )
    COP [D5] ( #28 )
    LDA #$0001
    STA $0B22
    RTS 
}

widestring_039F6B `[DEF][LU1:61]I bite a bright red [N]apple, I [LU1:91]better. The [N]apple was delicious. [END]`

---------------------------------------------

func_039FB1 {
    RTS 
}

---------------------------------------------

sub_039FB2 {
    LDA $inventory_equipped_index
    TAY 
    SEP #$20
    LDA #$00
    STA $inventory_slots, Y
    REP #$20
    LDA #$0000
    STA $inventory_equipped_type
    DEC 
    STA $inventory_equipped_index
    RTS 
}

---------------------------------------------

func_039FCA {
    LDA #$0080
    TSB $09EC
    LDA $06F2
    STA $24
    COP [9C] ( @func_03E1D6, #$2000 )
    CPY #$1FC0
    BNE code_039FE4
    JMP $&code_03A098
}

code_039FE4 {
    TXA 
    TYX 
    TAY 
    LDA $26
    INC 
    STA $7F000A, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    TXA 
    TYX 
    TAY 
    LDY $player_actor
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$*func_00C446
    STA $0002, Y
    LDA #$&func_00C446
    JSR $&sub_03A0A0
    LDA #$0800
    TSB $player_flags
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [C1]
    LDA $06FA
    CMP #$FFFF
    BEQ code_03A029
    RTL 
}

code_03A029 {
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_03A03B
    RTL 
}

code_03A03B {
    LDY $player_actor
    LDA $0012, Y
    AND #$EFFF
    STA $0012, Y
    LDA #$*func_00C455
    STA $0002, Y
    LDA #$&func_00C455
    JSR $&sub_03A0A0
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C6] ( &code_03A06E )
    LDA $20
    STA $0000
    COP [D9] ( #$0000, &code_list_03A068 )
}

code_list_03A068 [
  &func_038A16   ;00
  &func_038C35   ;01
  &func_038F6F   ;02
]

code_03A06E {
    COP [9C] ( @func_03E1D6, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA $24
    STA $7F000A, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    TXA 
    TYX 
    TAY 
    COP [C1]
    LDA $06FA
    CMP #$FFFF
    BEQ code_03A095
    RTL 
}

code_03A095 {
    COP [DA] ( #01 )
}

code_03A098 {
    LDA #$0080
    TRB $09EC
    COP [E0]
}

---------------------------------------------

sub_03A0A0 {
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    RTS 
}