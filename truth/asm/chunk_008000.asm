?BANK 00
?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'chunk_038000'
?INCLUDE 'system_strings'
?INCLUDE 'binary_01D8BE'
?INCLUDE 'func_0AA3A7'
?INCLUDE 'body_table'
?INCLUDE 'func_00F3C9'
?INCLUDE 'table_01B086'

!scene_next                     0642
!scene_current                  0644
!joypad_mask_std                065A
!joypad_mask_inv                065C
!map_bounds_x                   0692
!camera_offset_x                06D6
!camera_offset_y                06D8
!camera_bounds_x                06DA
!camera_bounds_y                06DC
!player_actor                   09AA
!player_flags                   09AE
!inventory_slots                0AB4
!inventory_equipped_index       0AC4
!BG1HOFS                        210D
!BG1VOFS                        210E
!VMAIN                          2115
!VMADDL                         2116
!APUIO0                         2140
!APUIO1                         2141
!APUIO2                         2142
!WMADDL                         2181
!WMADDH                         2183
!WRMPYA                         4202
!WRMPYB                         4203
!WRDIVL                         4204
!WRDIVB                         4206
!MDMAEN                         420B
!HDMAEN                         420C
!MEMSEL                         420D
!HVBJOY                         4212
!RDDIVL                         4214
!RDMPYL                         4216
!RDMPYH                         4217
!JOY1L                          4218
!DMAP0                          4300
!BBAD0                          4301
!A1T0L                          4302
!A1B0                           4304
!DAS0L                          4305
!DASB0                          4307

---------------------------------------------

emulation_mode_reset_008000 {
    SEI 
    CLC 
    XCE 
    JML $@emulation_mode_reset_handler_008014
}

---------------------------------------------

native_mode_cop_008007 {
    JML $@native_mode_cop_handler_00846D
}

---------------------------------------------

native_mode_nmi_00800B {
    JML $@native_mode_nmi_handler_0082F8
}

---------------------------------------------

native_mode_irq_00800F {
    JML $@native_mode_irq_handler_008013
}

---------------------------------------------

native_mode_irq_handler_008013 {
    RTI 
}

---------------------------------------------

emulation_mode_reset_handler_008014 {
    CLD 
    REP #$30
    LDA #$0000
    TCD 
    LDA #$01FF
    TCS 
    SEP #$20
    LDA #$81
    PHA 
    PLB 
    LDA #$01
    STA $MEMSEL
    JSL $@func_029F31
    JSL $@func_029E44
    JSL $@func_02908E
    JSL $@func_0281BC
    SEC 
    ROR $0654
    LDA $000100
    LDY #$0000
    CMP #$83
    BEQ code_00804C
    LDY #$0000
}

code_00804C {
    TYA 
    STA $scene_next
    JSL $@func_03D9F6
    STZ $0654
    LDA #$20
    STA $099F
    REP #$20
    LDA #$0009
    STA $09C8
    STA $09CA
    LDA #$0008
    STA $0ACA
    STA $0ACE
    LDA #$0001
    STA $0ADE
    LDA #$0000
    STA $0ADC
    LDA #$&binary_01C384
    STA $09BA
    STA $09BC
    LDA #$&binary_01C384+20
    STA $09C0
    STA $09BE
    STA $09C4
    STA $09C2
    LDA #$FFFF
    STA $0B28
    STA $0B2A
    STA $0B2C
    STA $0B2E
    STA $0B30
    STA $0B32
    SEP #$20
    LDA #$FB
    STA $scene_next
    LDA #$00
    STA $0AA2

  code_0080B5:
    JSL $@func_028043
    JSL $@func_0281A2
    JSL $@func_03D12D
    JSL $@func_03D9E8
    JSL $@func_02A5DD
    JSL $@func_038000
    JSR $&sub_0082DE
    JSL $@run_actors_03CAF5
    LDX $00D8
    LDA #$FF
    STA $7F3100, X
    STA $7F3101, X
    JSL $@func_03C5FF
    JSL $@func_03BBE4
    JSL $@code_03C25E
    JSL $@func_03BBB4
    JSL $@func_03BB85
    LDX #$0000
    JSL $@func_02AC2E
    LDX #$0002
    JSL $@func_02AC2E
    JSL $@func_03E146
    JSL $@func_03D15D
    JSL $@func_03C714
    JSL $@func_008206
    JSL $@func_03E21E
    JSL $@func_028191
    BRL code_0080B5
}

---------------------------------------------

func_00811E {
    PHB 
    PHA 
    XBA 
    PHA 
    PHX 
    PHY 
    PHD 
    REP #$20
    LDA #$0000
    TCD 
    SEP #$20
    LDA #$81
    PHA 
    PLB 
    JSL $@func_03CCFF
    LDX $00D8
    LDA #$FF
    STA $7F3100, X
    STA $7F3101, X
    JSL $@func_03C5FF
    LDX #$0000
    JSL $@func_02AC2E
    LDX #$0002
    JSL $@func_02AC2E
    JSL $@func_03E146
    JSL $@func_03D1C2
    JSL $@func_03C714
    LDA #$08
    TRB $09EC
    JSL $@func_028191
    JSL $@func_028043
    JSL $@func_0281A2
    JSL $@func_03D18D
    PLD 
    PLY 
    PLX 
    PLA 
    XBA 
    PLA 
    PLB 
    RTL 
}

---------------------------------------------

func_00817D {
    PHB 
    PHA 
    XBA 
    PHA 
    PHX 
    PHY 
    PHD 
    REP #$20
    LDA #$0000
    TCD 
    SEP #$20
    LDA #$81
    PHA 
    PLB 
    JSL $@func_03C5FF
    JSL $@func_03C714
    JSL $@func_03E146
    JSL $@func_03D1C2
    JSL $@func_008206
    JSL $@func_028191
    JSL $@func_028043
    JSL $@func_0281A2
    JSL $@func_03D18D
    PLD 
    PLY 
    PLX 
    PLA 
    XBA 
    PLA 
    PLB 
    RTL 
}

---------------------------------------------

func_0081BC {
    PHP 
    SEP #$20
    JSL $@func_0281A2
    PHB 
    LDA #$81
    PHA 
    PLB 
    JSL $@func_02803B
    JSL $@func_03D18D
    JSL $@func_03CD6E
    LDX $00D8
    LDA #$FF
    STA $7F3100, X
    STA $7F3101, X
    JSL $@func_03C5FF
    LDX #$0000
    JSL $@func_02AC2E
    LDX #$0002
    JSL $@func_02AC2E
    JSL $@func_03E146
    JSL $@func_03D1C2
    JSL $@func_03C714
    PLB 
    JSL $@func_028191
    PLP 
    RTL 
}

---------------------------------------------

func_008206 {
    LDA $09ED
    BIT #$40
    BEQ code_00820E
    RTL 
}

code_00820E {
    PHP 
    LDX #$0000
    SEP #$20
    LDA $09EC
    AND #$01
    PHA 
    LDA $09AF
    BIT #$02
    BNE code_008244
    LDA $0036
    BIT #$07
    BNE code_008244
    LDA $0B22
    BEQ code_008244
    DEC 
    STA $0B22
    LDA $0ACE
    CMP $0ACA
    BNE code_00823E
    STZ $0B22
    BRA code_008244
}

code_00823E {
    INC $0ACE
    COP [06] ( #0D )
}

code_008244 {
    LDA $0ACE
    CMP $0AD0
    BNE code_00825C
    LDA $0ACA
    CMP $0ACC
    BNE code_00825C
    LDA $0AD6
    CMP $0ADA
    BEQ code_008279
}

code_00825C {
    LDA #$10
    TSB $09EC
    REP #$20
    STZ $0AD8
    LDA $0AD6

  code_008269:
    SEC 
    SBC #$0064
    BMI code_008274
    INC $0AD8
    BRA code_008269
}

code_008274 {
    COP [BD] ( @asciistring_01E7F6 )
}

code_008279 {
    REP #$20
    LDA $09EA
    BEQ code_008299
    LDA #$0019
    STA $0AE4
    COP [BD] ( @asciistring_01E818 )
    LDA #$0010
    TSB $09EC
    LDA #$003C
    STA $0AE4
    BRA code_0082BD
}

code_008299 {
    LDA $0AE4
    BEQ code_0082BD
    DEC $0AE4
    BNE code_0082BD
    LDA #$001E
    STA $0AE4
    STZ $09E6
    STZ $09E4
    COP [BD] ( @asciistring_01E818 )
    LDA #$0010
    TSB $09EC
    STZ $0AE4
}

code_0082BD {
    LDA $0ACE
    STA $0AD0
    LDA $0ACA
    STA $0ACC
    LDA $0AD6
    STA $0ADA
    SEP #$20
    LDA $09EC
    AND #$FE
    ORA $01, S
    STA $09EC
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

sub_0082DE {
    PHP 
    REP #$20
    LDA $040C
    BMI code_0082EA
    DEC 
    STA $040C
}

code_0082EA {
    LDA $040E
    CMP #$0100
    BCS code_0082F3
    INC 
}

code_0082F3 {
    STA $040E
    PLP 
    RTS 
}

---------------------------------------------

native_mode_nmi_handler_0082F8 {
    PHP 
    PHB 
    REP #$20
    PHA 
    PHX 
    PHY 
    CLD 
    SEP #$20
    LDA #$81
    PHA 
    PLB 
    STZ $HDMAEN
    JSR $&sub_008387
    JSL $@func_02AF5F
    JSL $@func_029DE2
    JSL $@func_029E1D
    JSL $@func_02B038
    LDA #$80
    STA $VMAIN
    LDA #$18
    STA $BBAD0
    LDA #$01
    STA $DMAP0
    LDA $09EC
    BIT #$08
    BNE code_00834A
    LDA $0800
    BNE code_008344
    JSL $@func_03F1D0
    JSL $@func_02A310
    JSR $&sub_008411
    BRA code_00834E
}

code_008344 {
    JSL $@func_02A310
    BRA code_00834E
}

code_00834A {
    JSL $@func_03D881
}

code_00834E {
    LDA $66
    STA $HDMAEN
    REP #$20

  code_008355:
    LDA $HVBJOY
    ROR 
    BCS code_008355
    LDA $JOY1L
    STA $0660
    LDA $06FA
    BEQ code_00836E
    BMI code_00837F
    JSL $@func_0081BC
    BRA code_00837F
}

code_00836E {
    LDA $36
    LSR 
    LDA #$0000
    BCS code_00837C
    LDA $06F8
    STZ $06F8
}

code_00837C {
    STA $APUIO2
}

code_00837F {
    INC $36
    PLY 
    PLX 
    PLA 
    PLB 
    PLP 
    RTI 
}

---------------------------------------------

sub_008387 {
    LDA $06EF
    BIT #$08
    BNE code_0083B7
    LDA $06EE
    BMI code_0083A4
    LDX #$0000
    LDY #$0000
    JSR $&sub_0083D4
    LDX #$0002
    LDY #$0002
    BRA code_0083B3
}

code_0083A4 {
    LDX #$0002
    LDY #$0000
    JSR $&sub_0083D4
    LDX #$0000
    LDY #$0002
}

code_0083B3 {
    JSR $&sub_0083D4
    RTS 
}

code_0083B7 {
    LDA $068A
    STA $BG1HOFS
    LDA $068B
    AND #$7F
    STA $BG1HOFS
    LDA $068E
    STA $BG1VOFS
    LDA $068F
    AND #$7F
    STA $BG1VOFS
    RTS 
}

---------------------------------------------

sub_0083D4 {
    LDA $06C7, X
    BPL code_0083E4
    LDA $06C6, X
    STA $BG1HOFS, Y
    LDA $06C7, X
    BRA code_0083ED
}

code_0083E4 {
    LDA $068A, X
    STA $BG1HOFS, Y
    LDA $068B, X
}

code_0083ED {
    AND #$03
    STA $BG1HOFS, Y
    LDA $06CB, X
    BPL code_008402
    LDA $06CA, X
    STA $BG1VOFS, Y
    LDA $06CB, X
    BRA code_00840B
}

code_008402 {
    LDA $068E, X
    STA $BG1VOFS, Y
    LDA $068F, X
}

code_00840B {
    AND #$03
    STA $BG1VOFS, Y
    RTS 
}

---------------------------------------------

sub_008411 {
    LDX $00B2
    BNE code_008417
    RTS 
}

code_008417 {
    STX $DAS0L
    LDX $00B0
    STX $VMADDL
    LDX $00AC
    STX $A1T0L
    LDA $00AE
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    LDX #$0000
    STX $00B2
    RTS 
}

---------------------------------------------

sub_008438_noref {
    PHP 
    SEP #$20
    LDA #$00
    STA $WMADDH
    REP #$20
    LDA #$0422
    STA $WMADDL
    LDY #$0200
    STY $DAS0L
    SEP #$20
    LDA #$08
    STA $DMAP0
    LDA #$80
    STA $BBAD0
    LDA #$80
    STA $A1B0
    LDX #$846C
    STX $A1T0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

byte_00846C #E0

---------------------------------------------

native_mode_cop_handler_00846D {
    REP #$20
    TXY 
    LDA $04, S
    STA $0C
    LDA $02, S
    DEC 
    STA $0A
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    TAX 
    JMP ($&cop_table_008485, X)
}

---------------------------------------------

cop_table_008485 [
  &cop_handler_00_00864E   ;00
  &cop_handler_01_008689   ;01
  &cop_handler_02_0086A0   ;02
  &cop_handler_03_0086B7   ;03
  &cop_handler_04_008714   ;04
  &cop_handler_05_008749   ;05
  &cop_handler_06_00877E   ;06
  &cop_handler_07_008792   ;07
  &cop_handler_08_0087A6   ;08
  &cop_handler_09_0087B5   ;09
  &cop_handler_0A_0087C9   ;0A
  &cop_handler_0B_008876   ;0B
  &cop_handler_0C_00888C   ;0C
  &cop_handler_0D_0088A2   ;0D
  &cop_handler_0E_0088C8   ;0E
  &cop_handler_0F_0088EE   ;0F
  &cop_handler_10_008925   ;10
  &cop_handler_11_00895C   ;11
  &cop_handler_12_008975   ;12
  &cop_handler_13_0089AC   ;13
  &cop_handler_14_0089D3   ;14
  &cop_handler_15_008A22   ;15
  &cop_handler_16_008A4D   ;16
  &cop_handler_17_008A78   ;17
  &cop_handler_18_008AA3   ;18
  &cop_handler_19_0087DD   ;19
  &cop_handler_1A_008ACE   ;1A
  &cop_handler_1B_008B01   ;1B
  &cop_handler_1C_008B38   ;1C
  &cop_handler_1D_008B6F   ;1D
  &cop_handler_1E_008BA6   ;1E
  &cop_handler_1F_008BDD   ;1F
  &cop_handler_20_008C19   ;20
  &cop_handler_21_008C26   ;21
  &cop_handler_22_008C6F   ;22
  &cop_handler_23_008FFC   ;23
  &cop_handler_24_00902B   ;24
  &cop_handler_25_00904E   ;25
  &cop_handler_26_009072   ;26
  &cop_handler_27_0090CE   ;27
  &cop_handler_28_0090F4   ;28
  &cop_handler_29_0090FA   ;29
  &cop_handler_2A_009135   ;2A
  &cop_handler_2B_00915F   ;2B
  &cop_handler_2C_009189   ;2C
  &cop_handler_2D_0091B8   ;2D
  &cop_handler_2E_009236   ;2E
  &cop_handler_2F_00926A   ;2F
  &cop_handler_30_009299   ;30
  &cop_handler_31_0092E8   ;31
  &cop_handler_32_009317   ;32
  &cop_handler_33_009328   ;33
  &cop_handler_34_009352   ;34
  &cop_handler_35_0091CC   ;35
  &cop_handler_36_009361   ;36
  &cop_handler_37_009364   ;37
  &cop_handler_38_009381   ;38
  &cop_handler_39_0093AA   ;39
  &cop_handler_3A_0093CE   ;3A
  &cop_handler_3B_009400   ;3B
  &cop_handler_3C_00943C   ;3C
  &cop_handler_3D_009443   ;3D
  &cop_handler_3E_009485   ;3E
  &cop_handler_3F_0094AD   ;3F
  &cop_handler_40_0094D5   ;40
  &cop_handler_41_009501   ;41
  &cop_handler_42_00952F   ;42
  &cop_handler_43_008DE6   ;43
  &cop_handler_44_00956B   ;44
  &cop_handler_45_0095EA   ;45
  &cop_handler_46_009647   ;46
  &cop_handler_47_00964C   ;47
  &cop_handler_48_00965E   ;48
  &cop_handler_49_009668   ;49
  &cop_handler_4A_008E19   ;4A
  &cop_handler_4B_009685   ;4B
  &cop_handler_4C_0096CA   ;4C
  &cop_handler_4D_009703   ;4D
  &cop_handler_4E_009774   ;4E
  &cop_handler_4F_0098B8   ;4F
  &cop_handler_50_009930   ;50
  &cop_handler_51_00997B   ;51
  &cop_handler_52_008E36   ;52
  &cop_handler_53_008F0D   ;53
  &cop_handler_54_0099BF   ;54
  &cop_handler_55_0099DA   ;55
  &cop_handler_56_0099F5   ;56
  &cop_handler_57_009A67   ;57
  &cop_handler_58_009A82   ;58
  &cop_handler_59_009A92   ;59
  &cop_handler_5A_009AA2   ;5A
  &cop_handler_5B_009AC2   ;5B
  &cop_handler_5C_009AD6   ;5C
  &cop_handler_5D_009AEA   ;5D
  &cop_handler_5E_009AB2   ;5E
  &cop_handler_5F_009B89   ;5F
  &cop_handler_60_009C3A   ;60
  &cop_handler_61_009C91   ;61
  &cop_handler_62_009B41   ;62
  &cop_handler_63_009CB4   ;63
  &cop_handler_64_009CFA   ;64
  &cop_handler_65_009D52   ;65
  &cop_handler_66_009D81   ;66
  &cop_handler_67_009DA3   ;67
  &cop_handler_68_009DBD   ;68
  &cop_handler_69_009DEA   ;69
  &cop_handler_6A_009E06   ;6A
  &cop_handler_6B_00A958   ;6B
  &cop_handler_6C_00A992   ;6C
  &cop_handler_6D_00A9AE   ;6D
]

---------------------------------------------

cop_junk_008561 [
  #$C200   ;00
  #$A720   ;01
  #$E62A   ;02
  #$292A   ;03
  #$00FF   ;04
  #$1E9F   ;05
  #$7F00   ;06
  #$06BD   ;07
  #$0900   ;08
  #$0400   ;09
  #$069D   ;0A
  #$FA00   ;0B
  #$2AA5   ;0C
  #$0283   ;0D
  #$BB40   ;0E
  #$2AA7   ;0F
  #$2AE6   ;10
  #$FF29   ;11
]

---------------------------------------------

cop_table2_008585 [
  &cop_handler_80_009E23   ;00
  &cop_handler_81_009E35   ;01
  &cop_handler_82_009E57   ;02
  &cop_handler_83_009E79   ;03
  &cop_handler_84_009EAB   ;04
  &cop_handler_85_009EC8   ;05
  &cop_handler_86_009EF5   ;06
  &cop_handler_87_009F22   ;07
  &cop_handler_88_009F8F   ;08
  &cop_handler_89_009FAA   ;09
  &cop_handler_8A_009FC0   ;0A
  &cop_handler_8B_009FDE   ;0B
  &cop_handler_8C_009FF1   ;0C
  &cop_handler_8D_00A01E   ;0D
  &cop_handler_8E_00A036   ;0E
  &cop_handler_8F_00A06B   ;0F
  &cop_handler_90_00A081   ;10
  &cop_handler_91_00A0A7   ;11
  &cop_handler_92_00A0CD   ;12
  &cop_handler_93_00A103   ;13
  &cop_handler_94_00A119   ;14
  &cop_handler_95_00A159   ;15
  &cop_handler_96_00A16E   ;16
  &cop_handler_97_00A1B5   ;17
  &cop_handler_98_00A200   ;18
  &cop_handler_99_00A24B   ;19
  &cop_handler_9A_00A267   ;1A
  &cop_handler_9B_00A28C   ;1B
  &cop_handler_9C_00A2A8   ;1C
  &cop_handler_9D_00A2CD   ;1D
  &cop_handler_9E_00A303   ;1E
  &cop_handler_9F_00A342   ;1F
  &cop_handler_A0_00A370   ;20
  &cop_handler_A1_00A3A7   ;21
  &cop_handler_A2_00A3D4   ;22
  &cop_handler_A3_00A401   ;23
  &cop_handler_A4_00A440   ;24
  &cop_handler_A5_00A499   ;25
  &cop_handler_A6_00A533   ;26
  &cop_handler_A7_00A5DE   ;27
  &cop_handler_A8_00A6A1   ;28
  &cop_handler_A9_00A6B1   ;29
  &cop_handler_AA_00A6C1   ;2A
  &cop_handler_AB_00A6D7   ;2B
  &cop_handler_AC_00A6ED   ;2C
  &cop_handler_AD_00A713   ;2D
  &cop_handler_AE_00A731   ;2E
  &cop_handler_AF_00A74F   ;2F
  &cop_handler_B0_00A76D   ;30
  &cop_handler_B1_00A799   ;31
  &cop_handler_B2_00A7B3   ;32
  &cop_handler_B3_00A7BE   ;33
  &cop_handler_B4_00A7C9   ;34
  &cop_handler_B5_00A7D4   ;35
  &cop_handler_B6_00A7DF   ;36
  &cop_handler_B7_00A7F4   ;37
  &cop_handler_B8_00A809   ;38
  &cop_handler_B9_00A816   ;39
  &cop_handler_BA_00A823   ;3A
  &cop_handler_BB_00A82E   ;3B
  &cop_handler_BC_00A839   ;3C
  &cop_handler_BD_00A867   ;3D
  &cop_handler_BE_00A894   ;3E
  &cop_handler_BF_00A8FB   ;3F
  &cop_handler_C0_00A9EB   ;40
  &cop_handler_C1_00A9FB   ;41
  &cop_handler_C2_00AA07   ;42
  &cop_handler_C3_00AA13   ;43
  &cop_handler_C4_00AA30   ;44
  &cop_handler_C5_00AA60   ;45
  &cop_handler_C6_00AA8B   ;46
  &cop_handler_C7_00AA9B   ;47
  &cop_handler_C8_00AAB6   ;48
  &cop_handler_C9_00AAC6   ;49
  &cop_handler_CA_00AAD8   ;4A
  &cop_handler_CB_00AB0E   ;4B
  &cop_handler_CC_00AB41   ;4C
  &cop_handler_CD_00AB51   ;4D
  &cop_handler_CE_00AB60   ;4E
  &cop_handler_CF_00AB70   ;4F
  &cop_handler_D0_00AB7F_fall   ;50
  &cop_handler_D1_00AB8E   ;51
  &cop_handler_D2_00ABC2_fall   ;52
  &cop_handler_D3_00ABD7   ;53
  &cop_handler_D4_00AC05   ;54
  &cop_handler_D5_00AC27   ;55
  &cop_handler_D6_00AC38   ;56
  &cop_handler_D7_00AC5A   ;57
  &cop_handler_D8_00AC82   ;58
  &cop_handler_D9_00AC94   ;59
  &cop_handler_DA_00ACC1   ;5A
  &cop_handler_DB_00ACD6   ;5B
  &cop_handler_DC_00ACDF   ;5C
  &cop_handler_DD_00AD17   ;5D
  &cop_handler_DE_00AD57   ;5E
  &cop_handler_DF_00AD8F   ;5F
  &cop_handler_E0_00A5F7   ;60
  &cop_handler_E1_00AA74   ;61
  &cop_handler_E2_00AA47   ;62
]

---------------------------------------------

cop_footer_00864B #EA80FD

---------------------------------------------

cop_handler_00_00864E {
    TYX 
    PHP 
    JSR $&sub_00AEB8
    LDA $7F0006, X
    INC 
    STA $7F0006, X
    AND #$01FE
    CLC 
    ADC #$8900
    STA $7E8801
    CLC 
    ADC #$00FE
    STA $7E8804
    SEP #$20
    LDA #$FF
    STA $7E8800
    LDA #$E0
    STA $7E8803
    LDA #$00
    STA $7E8806
    PLP 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_01_008689 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    LDA [$0A]
    INC $0A
    INC $0A
    JSL $@func_03E157
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_02_0086A0 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    LDA [$0A]
    INC $0A
    INC $0A
    JSL $@func_03E173
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_03_0086B7 {
    PHY 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002
    ASL 
    ASL 
    ASL 
    ASL 
    STA $0000
    LDX $0002
    SEP #$20
    LDA $@bitmasks_00B11D, X
    TSB $0066
    REP #$20
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    LDA [$0A]
    INC $0A
    INC $0A
    PHP 
    SEP #$20
    PHA 
    LDA #$00
    XBA 
    PHA 
    TAX 
    LDA $&binary_01D8BE, X
    LDX $0000
    ORA #$40
    STA $DMAP0, X
    LDA $02, S
    STA $DASB0, X
    PLA 
    STA $BBAD0, X
    REP #$20
    TYA 
    STA $A1T0L, X
    SEP #$20
    PLA 
    STA $A1B0, X
    PLP 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_04_008714 {
    TYX 
    PHX 
    JSR $&sub_00B189
    TYX 
    LDA #$&func_03E1D6
    STA $0000, X
    LDA #$*func_03E1D6
    STA $0002, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    LDA $0010, X
    AND #$EFFF
    STA $0010, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F000A, X
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_05_008749 {
    TYX 
    PHX 
    JSR $&sub_00B189
    TYX 
    LDA #$&func_03E1AA
    STA $0000, X
    LDA #$*func_03E1AA
    STA $0002, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    LDA $0010, X
    AND #$EFFF
    STA $0010, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F000A, X
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_06_00877E {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $06F9
    REP #$20
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_07_008792 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $06F8
    REP #$20
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_08_0087A6 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $06F8
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_09_0087B5 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $APUIO1
    REP #$20
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_0A_0087C9 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $APUIO0
    REP #$20
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_19_0087DD {
    TYX 
    PHD 
    LDA #$0000
    TCD 
    JSL $@func_00B501
    BCS code_008836
    TYX 
    LDY $0058
    TXA 
    STA $0006, Y
    STA $0058
    TYA 
    STA $0004, X
    STZ $0006, X
    TXY 
    PLA 
    TCD 
    TAX 
    JSR $&sub_00B1DA
    LDA #$&func_02A040
    STA $0000, Y
    LDA #$*func_02A040
    STA $0002, Y
    LDA #$1000
    STA $0012, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0026, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0020, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0022, Y
    LDA $0A
    STA $02, S
    RTI 
}

code_008836 {
    PLA 
    TCD 
    TAX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    PHP 
    PHB 
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    LDA $joypad_mask_std
    STZ $joypad_mask_std
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    PHA 
    PLB 
    JSL $@func_00817D
    REP #$20
    JSL $@sub_03E255
    PLA 
    STA $joypad_mask_std
    PLB 
    PLP 
    LDA #$0080
    TRB $09EC
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_0B_008876 {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    STZ $0000
    JSR $&sub_00B29F
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_0C_00888C {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    STZ $0000
    JSR $&sub_00B345
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_0D_0088A2 {
    TYX 
    JSR $&sub_00AF8F
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDX #$0000
    JSL $@func_02B0A3
    SEP #$20
    LDA $7FC000, X
    ORA #$F0
    STA $7FC000, X
    REP #$20
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_0E_0088C8 {
    TYX 
    JSR $&sub_00AF8F
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDX #$0000
    JSL $@func_02B0A3
    SEP #$20
    LDA $7FC000, X
    AND #$0F
    STA $7FC000, X
    REP #$20
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_0F_0088EE {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $001C
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDX #$0000
    JSL $@func_02B0A3
    SEP #$20
    LDA $7FC000, X
    ORA #$F0
    STA $7FC000, X
    REP #$20
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_10_008925 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $001C
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDX #$0000
    JSL $@func_02B0A3
    SEP #$20
    LDA $7FC000, X
    AND #$0F
    STA $7FC000, X
    REP #$20
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_11_00895C {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    LDA #$0001
    STA $0000
    JSR $&sub_00B345
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_12_008975 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $001C
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDX #$0000
    JSL $@func_02B0A3
    SEP #$20
    LDA $7FC000, X
    AND #$F0
    STA $7FC000, X
    REP #$20
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_13_0089AC {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00B43B
    BIT #$000F
    BNE code_0089CA
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_0089CA {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_14_0089D3 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_0089E3
    ORA #$FF00
}

code_0089E3 {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $14
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_0089FC
    ORA #$FF00
}

code_0089FC {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $16
    STA $001C
    JSR $&sub_00B43B
    BIT #$000F
    BNE code_008A19
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_008A19 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_15_008A22 {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    SEC 
    SBC #$0010
    STA $001C
    JSR $&sub_00B43B
    BIT #$000F
    BNE code_008A44
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_008A44 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_16_008A4D {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    CLC 
    ADC #$0010
    STA $001C
    JSR $&sub_00B43B
    BIT #$000F
    BNE code_008A6F
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_008A6F {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_17_008A78 {
    TYX 
    LDA $14
    SEC 
    SBC #$0010
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00B43B
    BIT #$000F
    BNE code_008A9A
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_008A9A {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_18_008AA3 {
    TYX 
    LDA $14
    CLC 
    ADC #$0010
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00B43B
    BIT #$000F
    BNE code_008AC5
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_008AC5 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_1A_008ACE {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00B43B
    AND #$00FF
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $01, S
    BEQ code_008AF7
    LDA [$0A]
    INC $0A
    INC $0A
    PLY 
    LDA $0A
    STA $02, S
    RTI 
}

code_008AF7 {
    PLA 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_1B_008B01 {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    SEC 
    SBC #$0010
    STA $001C
    JSR $&sub_00B43B
    AND #$00FF
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $01, S
    BEQ code_008B2E
    LDA [$0A]
    INC $0A
    INC $0A
    PLY 
    LDA $0A
    STA $02, S
    RTI 
}

code_008B2E {
    PLA 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_1C_008B38 {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    CLC 
    ADC #$0010
    STA $001C
    JSR $&sub_00B43B
    AND #$00FF
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $01, S
    BEQ code_008B65
    LDA [$0A]
    INC $0A
    INC $0A
    PLY 
    LDA $0A
    STA $02, S
    RTI 
}

code_008B65 {
    PLA 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_1D_008B6F {
    TYX 
    LDA $14
    SEC 
    SBC #$0010
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00B43B
    AND #$00FF
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $01, S
    BEQ code_008B9C
    LDA [$0A]
    INC $0A
    INC $0A
    PLY 
    LDA $0A
    STA $02, S
    RTI 
}

code_008B9C {
    PLA 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_1E_008BA6 {
    TYX 
    LDA $14
    CLC 
    ADC #$0010
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00B43B
    AND #$00FF
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $01, S
    BEQ code_008BD3
    LDA [$0A]
    INC $0A
    INC $0A
    PLY 
    LDA $0A
    STA $02, S
    RTI 
}

code_008BD3 {
    PLA 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_1F_008BDD {
    TYX 
    PHB 
    LDA $16
    BIT #$000F
    BEQ code_008BF0

  code_008BE6:
    PLB 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

code_008BF0 {
    LDA $7F000C, X
    TAY 
    SEP #$20
    LDA $7F0008, X
    PHA 
    PLB 
    REP #$20
    LDA $0000, Y
    ORA #$FF00
    CLC 
    ADC $14
    BIT #$000F
    BNE code_008BE6
    PLB 
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_20_008C19 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_00B125
    BRA code_008C2A
}

---------------------------------------------

cop_handler_21_008C26 {
    TYX 
    LDY $player_actor
}

code_008C2A {
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    INC 
    STA $0000
    LDA $14
    SEC 
    SBC $0014, Y
    BPL code_008C45
    EOR #$FFFF
    INC 
}

code_008C45 {
    CMP $0000
    BCS code_008C64
    LDA $16
    SEC 
    SBC $0016, Y
    BPL code_008C56
    EOR #$FFFF
    INC 
}

code_008C56 {
    CMP $0000
    BCS code_008C64
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

code_008C64 {
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_22_008C6F {
    TYX 
    LDA $7F002A, X
    BIT #$0002
    BNE code_008C7C
    JSR $&sub_008D4D
}

code_008C7C {
    LDA $7F000E, X
    AND #$00FF
    CMP $24
    BNE code_008C8A
    JMP $&code_008D11
}

code_008C8A {
    SEP #$20
    LDA $24
    STA $WRMPYA
    LDA $7F0018, X
    AND #$FF
    JSR $&sub_008D33
    SEC 
    SBC $7F0000, X
    BEQ code_008CC3
    REP #$20
    AND #$00FF
    PHA 
    LDA $7F000E, X
    ASL 
    BMI code_008CB1
    PLA 
    BRA code_008CB6
}

code_008CB1 {
    PLA 
    EOR #$FFFF
    INC 
}

code_008CB6 {
    STA $7F002C, X
    SEP #$20
    LDA $0000
    STA $7F0000, X
}

code_008CC3 {
    LDA $7F001A, X
    AND #$FF
    JSR $&sub_008D33
    SEC 
    SBC $7F0001, X
    REP #$20
    BEQ code_008CF7
    AND #$00FF
    PHA 
    LDA $7F000E, X
    ASL 
    BCS code_008CE3
    PLA 
    BRA code_008CE8
}

code_008CE3 {
    PLA 
    EOR #$FFFF
    INC 
}

code_008CE8 {
    STA $7F002E, X
    SEP #$20
    LDA $0000
    STA $7F0001, X
    REP #$20
}

code_008CF7 {
    INC $24
    LDA $7F0002, X
    DEC 
    BPL code_008D08

  code_008D00:
    JSL $@func_03CA55
    BCS code_008D00
    LDA $08
}

code_008D08 {
    STZ $08
    STA $7F0002, X
    PLA 
    PLA 
    RTL 
}

code_008D11 {
    LDA $7F002A, X
    AND #$FFFD
    STA $7F002A, X
    LDA $0A
    INC 
    INC 
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

sub_008D25 {
    NOP 
    LDY $RDMPYL
    RTS 
}

---------------------------------------------

sub_008D2A {
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $RDDIVL
    RTS 
}

---------------------------------------------

sub_008D33 {
    STA $WRMPYB
    JSR $&sub_008D25
    STY $WRDIVL
    LDA $7F000E, X
    DEC 
    STA $WRDIVB
    BEQ code_008D49
    JSR $&sub_008D2A
}

code_008D49 {
    STA $0000
    RTS 
}

---------------------------------------------

sub_008D4D {
    STZ $0004
    LDA $0A
    DEC 
    DEC 
    STA $00
    LDY #$0001
    LDA [$0A]
    AND #$00FF
    CMP #$00FF
    BNE code_008D65
    LDA $28
}

code_008D65 {
    JSR $&sub_009F5F
    LDA $7F0018, X
    SEC 
    SBC $14
    CLC 
    BPL code_008D77
    EOR #$FFFF
    INC 
    SEC 
}

code_008D77 {
    ROR $0004
    BIT #$FF00
    BEQ code_008D82
    LDA #$00FE
}

code_008D82 {
    STA $7F0018, X
    LDA $7F001A, X
    SEC 
    SBC $16
    CLC 
    BPL code_008D95
    EOR #$FFFF
    INC 
    SEC 
}

code_008D95 {
    ROR $0004
    BIT #$FF00
    BEQ code_008DA0
    LDA #$00FE
}

code_008DA0 {
    STA $7F001A, X
    CMP $7F0018, X
    BCS code_008DAE
    LDA $7F0018, X
}

code_008DAE {
    PHA 
    LDA [$0A], Y
    AND #$00FF
    PLY 
    SEP #$20
    JSL $@func_0281E8
    INC 
    STA $7F000E, X
    LDA $0005
    STA $7F000F, X
    REP #$20
    LDA #$0000
    STA $7F0000, X
    STA $7F0002, X
    STA $24
    STZ $2C
    STZ $2E
    LDA $7F002A, X
    ORA #$0002
    STA $7F002A, X
    RTS 
}

---------------------------------------------

cop_handler_43_008DE6 {
    TYX 
    STZ $2C
    STZ $2E
    LDA $14
    SEC 
    SBC #$0008
    ORA $16
    AND #$000F
    BEQ code_008E14
    LDA $0A
    STA $7F1018, X
    LDA $02
    STA $7F101A, X
    LDA #$&func_0AA3A7
    STA $02, S
    SEP #$20
    LDA #$^func_0AA3A7
    STA $02
    STA $04, S
    REP #$20
    RTI 
}

code_008E14 {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_4A_008E19 {
    TYX 
    LDA $7F1018, X
    STA $02, S
    SEP #$20
    LDA $7F101A, X
    STA $04, S
    REP #$20
    LDA #$0000
    STA $7F1018, X
    STA $7F101A, X
    RTI 
}

---------------------------------------------

cop_handler_52_008E36 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP #$00FF
    BNE code_008E45
    LDA $28
}

code_008E45 {
    JSR $&sub_009F5F
    LDY #$0000
    LDA $7F0018, X
    SEC 
    SBC $14
    BPL code_008E5B
    LDY #$4000
    EOR #$FFFF
    INC 
}

code_008E5B {
    STA $7F0018, X
    TYA 
    STA $7F000E, X
    LDY #$0000
    LDA $7F001A, X
    SEC 
    SBC $16
    BPL code_008E77
    LDY #$8000
    EOR #$FFFF
    INC 
}

code_008E77 {
    STA $7F001A, X
    CMP $7F0018, X
    BCS code_008E85
    LDA $7F0018, X
}

code_008E85 {
    PHA 
    TYA 
    ORA $7F000E, X
    STA $7F000E, X
    LDA #$0000
    STA $7F000A, X
    PLA 

  code_008E97:
    BIT #$FF00
    BEQ code_008EA4
    LSR 
    PHA 
    JSR $&sub_008EF1
    PLA 
    BRA code_008E97
}

code_008EA4 {
    STA $WRDIVL
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    CMP #$80
    BCC code_008EB7
    EOR #$FF
    INC 
}

code_008EB7 {
    STA $WRDIVB
    REP #$20
    LDA [$0A]
    INC $0A
    AND #$00FF
    XBA 
    STA $7F0002, X
    LDA $RDDIVL
    INC 
    ORA $7F000E, X
    STA $7F000E, X
    BCC code_008ED9
    JSR $&sub_008EF1
}

code_008ED9 {
    LDA #$0000
    STA $7F0000, X
    STA $24
    STA $00002C, X
    STA $00002E, X
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

sub_008EF1 {
    LDA $7F0018, X
    LSR 
    STA $7F0018, X
    LDA $7F001A, X
    LSR 
    STA $7F001A, X
    LDA $7F000A, X
    INC 
    STA $7F000A, X
    RTS 
}

---------------------------------------------

cop_handler_53_008F0D {
    TYX 

  code_008F0E:
    LDA $7F000E, X
    AND #$3FFF
    CMP $24
    BNE code_008F1C
    JMP $&code_008FBC
}

code_008F1C {
    SEP #$20
    LDA $24
    STA $WRMPYA
    LDA $7F001A, X
    JSR $&sub_008FDC
    SBC $7F0001, X
    BEQ code_008F55
    PHA 
    LDA $7F000E, X
    ASL 
    PLA 
    BCC code_008F3D
    EOR #$FFFF
    INC 
}

code_008F3D {
    AND #$00FF
    BIT #$0080
    BEQ code_008F48
    ORA #$FF00
}

code_008F48 {
    STA $7F002E, X
    SEP #$20
    LDA $0000
    STA $7F0001, X
}

code_008F55 {
    SEP #$20
    LDA $7F0018, X
    JSR $&sub_008FDC
    SBC $7F0000, X
    BEQ code_008F8A
    PHA 
    LDA $7F000E, X
    ASL 
    ASL 
    PLA 
    BCC code_008F72
    EOR #$FFFF
    INC 
}

code_008F72 {
    AND #$00FF
    BIT #$0080
    BEQ code_008F7D
    ORA #$FF00
}

code_008F7D {
    STA $7F002C, X
    SEP #$20
    LDA $0000
    STA $7F0000, X
}

code_008F8A {
    SEP #$20
    LDA $7F0003, X
    BMI code_008F9C
    DEC 
    BNE code_008F98
    JMP $&code_008FBC
}

code_008F98 {
    STA $7F0003, X
}

code_008F9C {
    LDA $7F0002, X
    DEC 
    BPL code_008FAF
    REP #$20

  code_008FA5:
    JSL $@func_03CA55
    BCS code_008FA5
    SEP #$20
    LDA $08
}

code_008FAF {
    STA $7F0002, X
    REP #$20
    STZ $08
    INC $24
    PLA 
    PLA 
    RTL 
}

code_008FBC {
    REP #$20
    LDA $7F000A, X
    BEQ code_008FD5
    DEC 
    STA $7F000A, X
    LDA #$0000
    STA $7F0000, X
    STA $24
    JMP $&code_008F0E
}

code_008FD5 {
    LDA $0A
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

sub_008FDC {
    STA $WRMPYB
    LDA $7F000E, X
    DEC 
    LDY $RDMPYL
    STY $WRDIVL
    STA $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20
    SEC 
    LDA $RDDIVL
    STA $0000
    RTS 
}

---------------------------------------------

cop_handler_23_008FFC {
    PHY 
    SEP #$20
    LDX #$000F
    LDA #$00
    XBA 
    CLC 

  code_009006:
    LDA $0410, X
    ADC $040F, X
    STA $040F, X
    DEX 
    BNE code_009006
    LDX #$0010

  code_009015:
    INC $040F, X
    BNE code_00901D
    DEX 
    BNE code_009015
}

code_00901D {
    REP #$20
    PLX 
    LDA $0A
    STA $02, S
    LDA $0410
    AND #$00FF
    RTI 
}

---------------------------------------------

cop_handler_24_00902B {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0000
    LDA $0410
    AND #$00FF

  code_00903C:
    SEC 
    SBC $0000
    BPL code_00903C
    CLC 
    ADC $0000
    STA $0420
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_25_00904E {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC #$0008
    STA $14
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    STA $16
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_26_009072 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $scene_next
    LDA [$0A]
    INC $0A
    INC $0A
    STA $064C
    LDA [$0A]
    INC $0A
    INC $0A
    STA $064E
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0650
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0652
    LDA $0650
    BIT #$0080
    BNE code_0090AF
    LDA $0A
    STA $02, S
    RTI 
}

code_0090AF {
    AND #$FF7F
    STA $0650
    LDA $0A
    SEC 
    SBC #$0008
    STA $0AF0
    STA $0AF4
    LDA $0C
    STA $0AF2
    STA $0AF6
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_27_0090CE {
    TYX 
    LDA $10
    BIT #$4000
    BEQ code_0090E8
    LDA $0A
    DEC 
    DEC 
    STA $00
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $08
    PLA 
    PLA 
    RTL 
}

code_0090E8 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_28_0090F4 {
    TYX 
    LDY $player_actor
    BRA code_009105
}

---------------------------------------------

cop_handler_29_0090FA {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_00B125
}

code_009105 {
    LDA [$0A]
    INC $0A
    INC $0A
    CMP $0014, Y
    BNE code_009124
    LDA [$0A]
    INC $0A
    INC $0A
    CMP $0016, Y
    BNE code_00912A
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

code_009124 {
    LDA [$0A]
    INC $0A
    INC $0A
}

code_00912A {
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_2A_009135 {
    TYX 
    LDY $player_actor
    LDA $0014, Y
    LDY #$0004
    SEC 
    SBC $14
    BEQ code_00915A
    BPL code_009153
    EOR #$FFFF
    INC 
    CMP [$0A]
    BCC code_00915A
    LDY #$0002
    BRA code_00915A
}

code_009153 {
    CMP [$0A]
    BCC code_00915A
    LDY #$0006
}

code_00915A {
    LDA [$0A], Y
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_2B_00915F {
    TYX 
    LDY $player_actor
    LDA $0016, Y
    LDY #$0004
    SEC 
    SBC $16
    BEQ code_009184
    BPL code_00917D
    EOR #$FFFF
    INC 
    CMP [$0A]
    BCC code_009184
    LDY #$0002
    BRA code_009184
}

code_00917D {
    CMP [$0A]
    BCC code_009184
    LDY #$0006
}

code_009184 {
    LDA [$0A], Y
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_2C_009189 {
    TYX 
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_009199
    EOR #$FFFF
    INC 
}

code_009199 {
    PHA 
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_0091A6
    EOR #$FFFF
    INC 
}

code_0091A6 {
    CMP $01, S
    BCC code_0091AF
    LDY #$0002
    BRA code_0091B2
}

code_0091AF {
    LDY #$0000
}

code_0091B2 {
    PLA 
    LDA [$0A], Y
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_2D_0091B8 {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00AFCE
    LDA $0A
    STA $02, S
    TYA 
    RTI 
}

---------------------------------------------

cop_handler_35_0091CC {
    TYX 
    LDY #$&code_009230-1
    PHY 
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BMI code_009203
    STA $0018
    LDA $0016, Y
    SEC 
    SBC $16
    BMI code_0091F0
    CMP $0018
    BCC code_0091FB
    LDY #$0002
    RTS 
}

code_0091F0 {
    BPL code_0091F6
    EOR #$FFFF
    INC 
}

code_0091F6 {
    CMP $0018
    BCS code_0091FF
}

code_0091FB {
    LDY #$0001
    RTS 
}

code_0091FF {
    LDY #$0000
    RTS 
}

code_009203 {
    BPL code_009209
    EOR #$FFFF
    INC 
}

code_009209 {
    STA $0018
    LDA $0016, Y
    SEC 
    SBC $16
    BMI code_00921D
    CMP $0018
    BCC code_009228
    LDY #$0002
    RTS 
}

code_00921D {
    BPL code_009223
    EOR #$FFFF
    INC 
}

code_009223 {
    CMP $0018
    BCS code_00922C
}

code_009228 {
    LDY #$0003
    RTS 
}

code_00922C {
    LDY #$0000
    RTS 
}

---------------------------------------------

code_009230 {
    LDA $0A
    STA $02, S
    TYA 
    RTI 
}

---------------------------------------------

cop_handler_2E_009236 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_009246
    ORA #$FF00
}

code_009246 {
    CLC 
    ADC $14
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00925B
    ORA #$FF00
}

code_00925B {
    CLC 
    ADC $16
    STA $001C
    JSR $&sub_00AFCE
    LDA $0A
    STA $02, S
    TYA 
    RTI 
}

---------------------------------------------

cop_handler_2F_00926A {
    TYX 
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    JSR $&sub_00AFCE
    SEP #$20
    CMP [$0A]
    REP #$20
    BEQ code_009289
    LDA $0A
    CLC 
    ADC #$0003
    STA $02, S
    RTI 
}

code_009289 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_30_009299 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_0092A9
    ORA #$FF00
}

code_0092A9 {
    CLC 
    ADC $14
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_0092BE
    ORA #$FF00
}

code_0092BE {
    CLC 
    ADC $16
    STA $001C
    JSR $&sub_00AFCE
    SEP #$20
    CMP [$0A]
    REP #$20
    BEQ code_0092D8
    LDA $0A
    CLC 
    ADC #$0003
    STA $02, S
    RTI 
}

code_0092D8 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_31_0092E8 {
    TYX 
    JSL $@func_03F0CA
    BEQ code_009300
    DEC 
    BEQ code_009305
    DEC 
    BEQ code_00930A
    DEC 
    BEQ code_00930F
    LDA #$0008
    CLC 
    ADC $0A
    BRA code_009314
}

code_009300 {
    LDY #$0000
    BRA code_009312
}

code_009305 {
    LDY #$0002
    BRA code_009312
}

code_00930A {
    LDY #$0004
    BRA code_009312
}

code_00930F {
    LDY #$0006
}

code_009312 {
    LDA [$0A], Y
}

code_009314 {
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_32_009317 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF

  code_00931F:
    JSL $@func_02A363
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_33_009328 {
    TYX 
    SEP #$20
    JSL $@func_00817D
    JSL $@func_00811E
    REP #$20

  code_009335:
    JSL $@func_02A3A8
    BCS code_009345
    SEP #$20
    JSL $@func_00811E
    REP #$20
    BRA code_009335
}

code_009345 {
    SEP #$20
    JSL $@func_00811E
    REP #$20
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_34_009352 {
    TYX 
    LDA $7F0024, X
    PHA 
    LDA #$0F0F
    STA $06F8
    PLA 
    BRA code_00931F
}

---------------------------------------------

cop_handler_36_009361 {
    TYX 
    BRA code_009370
}

---------------------------------------------

cop_handler_37_009364 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0002, X
}

code_009370 {
    STZ $0E
    JSL $@func_03E0B0
    JSL $@func_03E125
    LDA $0A
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_38_009381 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0002, X
    STZ $000E, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0004, X
    JSL $@func_03E0B0
    JSL $@func_03E125
    LDA $0A
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_39_0093AA {
    TYX 
    LDA $7F0006, X
    DEC 
    BNE code_0093BD
    JSL $@func_03E0B0
    BCC code_0093C7
    LDA $0A
    STA $02, S
    RTI 
}

code_0093BD {
    STA $7F0006, X
    LDA $7F0000, X
    STA $08
}

code_0093C7 {
    JSL $@func_03E125
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_3A_0093CE {
    TYX 
    LDA $7F0006, X
    DEC 
    BNE code_0093EE

  code_0093D6:
    JSL $@func_03E0B0
    BCC code_0093F9
    LDA $7F0004, X
    DEC 
    BEQ code_0093E9
    STA $7F0004, X
    BRA code_0093D6
}

code_0093E9 {
    LDA $0A
    STA $02, S
    RTI 
}

code_0093EE {
    STA $7F0006, X
    LDA $7F0000, X
    STA $0008, X
}

code_0093F9 {
    JSL $@func_03E125
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_3B_009400 {
    PHY 
    JSR $&sub_00B27B
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0002, X

  code_009410:
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, X
    TXY 
    LDA $01, S
    TAX 
    LDA $7F000E, X
    TYX 
    STA $7F000E, X
    LDA #$0000
    STA $000E, X
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_3C_00943C {
    PHY 
    JSR $&sub_00B27B
    TYX 
    BRA code_009410
}

---------------------------------------------

cop_handler_3D_009443 {
    TYX 
    LDY $0004, X
    BNE code_009459
    LDY $0006, X
    STY $005A
    BEQ code_00946D
    LDA #$0000
    STA $0004, Y
    BRA code_00946D
}

code_009459 {
    LDA $0006, X
    STA $0006, Y
    BNE code_009466
    STY $005C
    BRA code_00946D
}

code_009466 {
    TAY 
    LDA $0004, X
    STA $0004, Y
}

code_00946D {
    PHD 
    LDA #$0000
    TCD 
    SEP #$20
    DEC $0052
    DEC $0052
    REP #$20
    TXA 
    STA [$52]
    PLD 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_3E_009485 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    BIT #$0001
    BNE code_009498
    BIT $0656
    BNE code_00949D
    BRA code_0094A2
}

code_009498 {
    BIT $0660
    BEQ code_0094A2
}

code_00949D {
    LDA $0A
    STA $02, S
    RTI 
}

code_0094A2 {
    LDA $0A
    SEC 
    SBC #$0004
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_3F_0094AD {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    BIT #$0001
    BNE code_0094C0
    BIT $0656
    BEQ code_0094C5
    BRA code_0094CA
}

code_0094C0 {
    BIT $0660
    BNE code_0094CA
}

code_0094C5 {
    LDA $0A
    STA $02, S
    RTI 
}

code_0094CA {
    LDA $0A
    SEC 
    SBC #$0004
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_40_0094D5 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    BIT #$0001
    BNE code_0094E8
    BIT $0656
    BNE code_0094F8
    BRA code_0094ED
}

code_0094E8 {
    BIT $0660
    BNE code_0094F8
}

code_0094ED {
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_0094F8 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_41_009501 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    BIT #$0001
    BNE code_009514
    BIT $0656
    BEQ code_00951B
    BRA code_009524
}

code_009514 {
    BIT $0660
    BEQ code_00951B
    BRA code_009524
}

code_00951B {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

code_009524 {
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_42_00952F {
    PHY 
    PHD 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $001C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0000
    LDA #$0000
    TCD 
    LDX #$0000
    JSL $@func_02B0A3
    SEP #$20
    LDA $00
    STA $7FC000, X
    REP #$20
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_44_00956B {
    PHY 
    LDX $player_actor
    LDY #$0000
    LDA [$0A]
    INY 
    AND #$00FF
    BIT #$0080
    BEQ code_009580
    ORA #$FF00
}

code_009580 {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $14
    CMP $0014, X
    BCS code_0095E0
    LDA [$0A], Y
    INY 
    AND #$00FF
    BIT #$0080
    BEQ code_00959A
    ORA #$FF00
}

code_00959A {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $16
    CMP $0016, X
    BCS code_0095E0
    LDA [$0A], Y
    INY 
    AND #$00FF
    BIT #$0080
    BEQ code_0095B4
    ORA #$FF00
}

code_0095B4 {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $14
    CMP $0014, X
    BCC code_0095E0
    LDA [$0A], Y
    INY 
    AND #$00FF
    BIT #$0080
    BEQ code_0095CE
    ORA #$FF00
}

code_0095CE {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $16
    CMP $0016, X
    BCC code_0095E0
    PLX 
    LDA [$0A], Y
    STA $02, S
    RTI 
}

code_0095E0 {
    PLX 
    LDA $0A
    CLC 
    ADC #$0006
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_45_0095EA {
    PHY 
    LDX $player_actor
    LDY #$0000
    LDA $0016, X
    SEC 
    SBC #$0008
    STA $0000
    LDA [$0A]
    INY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0014, X
    BCS code_00963D
    LDA [$0A], Y
    INY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0000
    BCS code_00963D
    LDA [$0A], Y
    INY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0014, X
    BCC code_00963D
    LDA [$0A], Y
    INY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    CMP $0000
    BCC code_00963D
    PLX 
    LDA [$0A], Y
    STA $02, S
    RTI 
}

code_00963D {
    PLX 
    LDA $0A
    CLC 
    ADC #$0006
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_46_009647 {
    TYX 
    LDY $04
    BRA code_00964F
}

---------------------------------------------

cop_handler_47_00964C {
    TYX 
    LDY $06
}

code_00964F {
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_48_00965E {
    TYX 
    LDA $0A
    STA $02, S
    JSL $@func_03F0CA
    RTI 
}

---------------------------------------------

cop_handler_49_009668 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $0AD4
    BNE code_00967C
    LDA $0A
    INC 
    INC 
    STA $02, S
    RTI 
}

code_00967C {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_4B_009685 {
    TYX 
    JSR $&sub_0098A9
    BCC code_00968E
    PLA 
    PLA 
    RTL 
}

code_00968E {
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0018
    ASL 
    ASL 
    ASL 
    ASL 
    STA $001A
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $001C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $001E
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0000
    PHY 
    PHD 
    LDA #$0000
    TCD 
    JSR $&sub_009829
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_4C_0096CA {
    TYX 
    JSR $&sub_0098A9
    BCC code_0096D3
    PLA 
    PLA 
    RTL 
}

code_0096D3 {
    PHY 
    PHD 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0000
    LDA #$0000
    TCD 
    LDA $0014, X
    STA $18
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1A
    LDA $0016, X
    STA $1C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1E
    JSR $&sub_009829
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_4D_009703 {
    TYX 
    JSR $&sub_0098A9
    BCC code_00970C
    PLA 
    PLA 
    RTL 
}

code_00970C {
    LDA $7F002A, X
    BIT #$0002
    BNE code_009720
    ORA #$0002
    STA $7F002A, X
    LDA [$0A]
    STA $24
}

code_009720 {
    PHX 
    PHD 
    PHB 
    SEP #$20
    LDA $02
    PHA 
    PLB 
    REP #$20
    LDA $24
    TAX 
    INC 
    INC 
    INC 
    STA $24
    JSR $&sub_0097EF
    BCS code_00975B
    PLB 
    JSR $&sub_009829
    PLD 
    PLX 
    LDA $7F002A, X
    BIT #$0004
    BEQ code_009752
    SEP #$20
    LDA $7F0010, X
    STA $06F9
    REP #$20
}

code_009752 {
    LDA $0A
    DEC 
    DEC 
    STA $00
    PLA 
    PLA 
    RTL 
}

code_00975B {
    REP #$20
    PLB 
    PLD 
    PLX 
    LDA $7F002A, X
    AND #$FFFD
    STA $7F002A, X
    LDA $0A
    CLC 
    ADC #$0002
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_4E_009774 {
    TYX 
    JSR $&sub_0098A9
    BCC code_00977D
    PLA 
    PLA 
    RTL 
}

code_00977D {
    LDA $7F002A, X
    BIT #$0002
    BNE code_009791
    ORA #$0002
    STA $7F002A, X
    LDA [$0A]
    STA $24
}

code_009791 {
    PHX 
    PHD 
    PHB 
    SEP #$20
    LDA $02
    PHA 
    PLB 
    REP #$20
    LDA $24
    TAX 
    CLC 
    ADC #$0004
    STA $24
    JSR $&sub_0097EF
    BCS code_0097D6
    LDA $0003, X
    AND #$00FF
    STA $0008, Y
    PLB 
    JSR $&sub_009829
    PLD 
    PLX 
    LDA $7F002A, X
    BIT #$0004
    BEQ code_0097CD
    SEP #$20
    LDA $7F0010, X
    STA $06F9
    REP #$20
}

code_0097CD {
    LDA $0A
    DEC 
    DEC 
    STA $00
    PLA 
    PLA 
    RTL 
}

code_0097D6 {
    REP #$20
    PLB 
    PLD 
    PLX 
    LDA $7F002A, X
    AND #$FFFD
    STA $7F002A, X
    LDA $0A
    CLC 
    ADC #$0002
    STA $02, S
    RTI 
}

---------------------------------------------

sub_0097EF {
    LDA #$0000
    TCD 
    SEP #$20
    LDA $0000, X
    BMI code_009827
    STA $18
    LDA $0001, X
    STA $1C
    LDA $0002, X
    REP #$20
    AND #$00FF
    STA $00
    LDA $18
    AND #$00FF
    STA $18
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1A
    LDA $1C
    AND #$00FF
    STA $1C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1E
    CLC 
    RTS 
}

code_009827 {
    SEC 
    RTS 
}

---------------------------------------------

sub_009829 {
    LDX #$0000
    JSL $@func_02B0A3
    LDA $00
    PHX 
    TAX 
    SEP #$20
    LDA $7F0000, X
    STA $02
    TXA 
    PLX 
    STA $7EA000, X
    LDA $02
    STA $7FC000, X
    REP #$20
    LDA $1A
    CLC 
    ADC #$0010
    SEC 
    SBC $068A
    CMP #$0111
    BCS code_0098A8
    LDA $068E
    SEC 
    SBC #$0010
    AND #$FFF0
    PHA 
    LDA $1E
    SEC 
    SBC $01, S
    BMI code_0098A7
    CMP #$00F1
    BCS code_0098A7
    PLA 
    LDA $7EA000, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    TAX 
    LDA $7E2000, X
    STA $0904
    LDA $7E2002, X
    STA $0906
    LDA $7E2004, X
    STA $090A
    LDA $7E2006, X
    STA $090C
    JSL $@func_02B0CF
    STA $0902
    CLC 
    ADC #$0020
    STA $0908
    RTS 
}

code_0098A7 {
    PLA 
}

code_0098A8 {
    RTS 
}

---------------------------------------------

sub_0098A9 {
    CLC 
    LDA $0902
    BNE code_0098B0
    RTS 
}

code_0098B0 {
    LDA $0A
    DEC 
    DEC 
    STA $00
    SEC 
    RTS 
}

---------------------------------------------

cop_handler_4F_0098B8 {
    TYX 
    LDA $7F002A, X
    BIT #$0001
    BNE code_00990E
    LDA $7F0C07
    BEQ code_0098D1
    LDA $0A
    DEC 
    DEC 
    STA $00
    PLA 
    PLA 
    RTL 
}

code_0098D1 {
    LDA $0A
    DEC 
    DEC 
    STA $00
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F0C03
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0C05
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F0C07
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F0C09
    LDA $7F002A, X
    ORA #$0001
    STA $7F002A, X
    PLA 
    PLA 
    RTL 
}

code_00990E {
    LDY #$0003
    LDA [$0A], Y
    CMP $7F0C07
    BNE code_00991C
    PLA 
    PLA 
    RTL 
}

code_00991C {
    LDA $7F002A, X
    AND #$FFFE
    STA $7F002A, X
    LDA $0A
    CLC 
    ADC #$0007
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_50_009930 {
    PHY 
    LDA [$0A]
    INC $0A
    INC $0A
    PHA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $0405
    REP #$20
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    CLC 
    ADC $01, S
    TAX 
    PLA 
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    CLC 
    ADC #$0A00
    TAY 
    SEP #$20
    LDA #$7F
    STA $0404
    REP #$20
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    DEC 
    JSR $0402
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_51_00997B {
    PHY 
    PHD 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $003E
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $0040
    REP #$20
    LDA [$0A]
    INC $0A
    INC $0A
    STA $007A
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA #$0000
    TCD 
    LDA [$3E]
    STA $78
    INC $3E
    INC $3E
    JSL $@func_028270
    JSL $@zero_bytes_03D86A
    PLD 
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_54_0099BF {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F0000, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0002, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_55_0099DA {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $28
    STZ $2A
    LDA [$0A]
    INC $0A
    INC $0A
    STA $24
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_56_0099F5 {
    TYX 
    LDA $00B2
    BEQ code_0099FE
    PLA 
    PLA 
    RTL 
}

code_0099FE {
    PHB 
    LDA $24
    STA $00B0
    SEP #$20
    LDA $7F0008, X
    PHA 
    PLB 
    REP #$20
    LDA $28
    ASL 
    CLC 
    ADC $7F0006, X
    TAY 
    LDA $2A
    INC $2A
    ASL 
    ASL 
    CLC 
    ADC $0000, Y
    TAY 
    LDA $0000, Y
    BMI code_009A5F
    STA $08
    LDA $0002, Y
    TAY 
    LDA $0012, Y
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $7F0000, X
    STA $00AC
    LDA $7F0002, X
    STA $00AE
    LDA #$0020
    STA $00B2
    LDA $000D, Y
    AND #$00FF
    BEQ code_009A5B
    LDA #$0080
    STA $00B2
}

code_009A5B {
    PLB 
    PLA 
    PLA 
    RTL 
}

code_009A5F {
    STZ $2A
    PLB 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_57_009A67 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F1004, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F1006, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_58_009A82 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F1000, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_59_009A92 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F1002, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_5A_009AA2 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F1008, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_5E_009AB2 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F1016, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_5B_009AC2 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    ORA $7F002A, X
    STA $7F002A, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_5C_009AD6 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    AND $7F002A, X
    STA $7F002A, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_5D_009AEA {
    TYX 
    LDA $14
    LSR 
    LSR 
    LSR 
    LSR 
    STA $0018
    LDA $16
    LSR 
    LSR 
    LSR 
    LSR 
    STA $001C
    PHD 
    LDA #$0000
    TCD 
    JSL $@func_03D78A
    CPY #$4000
    BCS code_009B37
    LDA $000F, X
    AND #$0010
    BEQ code_009B1C
    LDA [$80], Y
    AND #$000F
    BEQ code_009B2D
    BRA code_009B2D
}

code_009B1C {
    LDA [$80], Y
    BIT #$00F0
    BNE code_009B37
    AND #$000F
    BEQ code_009B2D
    CMP #$000E
    BNE code_009B37
}

code_009B2D {
    PLD 
    LDA $0A
    CLC 
    ADC #$0002
    STA $02, S
    RTI 
}

code_009B37 {
    PLD 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_62_009B41 {
    TYX 
    LDA $14
    LSR 
    LSR 
    LSR 
    LSR 
    STA $0018
    LDA $16
    LSR 
    LSR 
    LSR 
    LSR 
    STA $001C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0000
    PHD 
    LDA #$0000
    TCD 
    JSL $@func_03D78A
    CPY #$4000
    BCS code_009B7F
    LDA [$80], Y
    AND #$000F
    CMP $00
    BEQ code_009B7F
    PLD 
    LDA $0A
    CLC 
    ADC #$0002
    STA $02, S
    RTI 
}

code_009B7F {
    PLD 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_5F_009B89 {
    PHY 
    PHB 
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0062
    STA $7F0006, X
    CLC 
    ADC #$0200
    STA $005E
    CLC 
    ADC #$0200
    STA $0006
    CLC 
    ADC #$0200
    STA $0008
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0E
    ORA #$0080
    STA $0004
    LDA $0E
    ASL 
    STA $0E
    LSR 
    DEC 
    STA $7F0000, X
    LDA $0E
    LSR 
    LDY #$0100
    JSL $@func_0281E8
    AND #$00FF
    STA $000E
    ASL 
    CLC 
    ADC $000E
    STA $000E
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    LDA #$0000
    TCD 
    LDA $62
    CLC 
    ADC #$0100
    STA $00
    CLC 
    ADC #$0200
    STA $02
    LDY #$0000

  code_009BFD:
    LDA $04
    STA ($62), Y
    STA ($5E), Y
    STA ($06), Y
    STA ($08), Y
    INY 
    LDA $00
    STA ($62), Y
    LDA $02
    STA ($5E), Y
    CLC 
    ADC #$0200
    STA ($06), Y
    CLC 
    ADC #$0200
    STA ($08), Y
    INY 
    INY 
    CPY $0E
    BNE code_009BFD
    LDA #$0000
    STA $5E
    STA $7F0002, X
    STA $7F0004, X
    PLB 
    PLA 
    TAX 
    TCD 
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_60_009C3A {
    TYX 
    LDA $7F0002, X
    DEC 
    BPL code_009C58
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0002, X
    LDA $7F0004, X
    INC 
    STA $7F0004, X
    BRA code_009C5E
}

code_009C58 {
    STA $7F0002, X
    INC $0A
}

code_009C5E {
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_009C7C
    AND #$000F
    TAY 
    LDA $06BE, Y
    STA $0018
    LDA $06C2, Y
    STA $001C
    BRA code_009C89
}

code_009C7C {
    TAY 
    LDA $06BE, Y
    STA $0018
    LDA $06C2, Y
    STA $001C
}

code_009C89 {
    JSR $&sub_00ADCF
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_61_009C91 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    LDA $0036
    LSR 
    BCC code_009CA5
    TYA 
    CLC 
    ADC #$0200
    TAY 
}

code_009CA5 {
    LDA [$0A]
    INC $0A
    INC $0A
    JSL $@func_03E157
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_63_009CB4 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_009CC4
    ORA #$FF00
}

code_009CC4 {
    STA $7F1012, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F1010, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    BIT #$0800
    BEQ code_009CE7
    EOR #$FFFF
    INC 
}

code_009CE7 {
    CLC 
    ADC $16
    STA $7F001A, X
    LDA #$0000
    STA $7F1014, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_64_009CFA {
    TYX 
    LDA $7F1010, X
    TAY 
    LDA $7F1014, X
    INC 
    STA $7F1014, X
    SEP #$20
    STA $WRMPYA
    LSR 
    STA $WRMPYB
    LDA #$00
    XBA 
    REP #$20
    LDA $RDMPYL

  code_009D1A:
    DEY 
    BMI code_009D20
    LSR 
    BRA code_009D1A
}

code_009D20 {
    PHA 
    LDA $7F1012, X
    SEC 
    SBC $01, S
    STA $01, S
    PLA 
    EOR #$FFFF
    INC 
    STA $7F002E, X
    BMI code_009D4A
    LDA $16
    BMI code_009D4A
    LDA $7F001A, X
    SEC 
    SBC $16
    BCS code_009D4A
    LDA $0A
    STA $02, S
    LDA #$FFFF
    RTI 
}

code_009D4A {
    LDA $0A
    STA $02, S
    LDA #$0000
    RTI 
}

---------------------------------------------

cop_handler_65_009D52 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0D52
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0D56
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0D5E
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0D5A
    STZ $0D58
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_66_009D81 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0D52
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0D56
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0D58
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_67_009DA3 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0D5E
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0D5A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_68_009DBD {
    TYX 
    LDA $14
    BMI code_009DE1
    CMP $camera_offset_x
    BCC code_009DE1
    CMP $camera_bounds_x
    BCS code_009DE1
    LDA $16
    BMI code_009DE1
    CMP $camera_offset_y
    BCC code_009DE1
    CMP $camera_bounds_y
    BCS code_009DE1
    LDA $0A
    INC 
    INC 
    STA $02, S
    RTI 
}

code_009DE1 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_69_009DEA {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    CMP $00E4
    BCC code_009E01
    LDA $0A
    SEC 
    SBC #$0004
    STA $00
    PLA 
    PLA 
    RTL 
}

code_009E01 {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_6A_009E06 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    LDY $06
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002C, Y
    STA $002E, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_80_009E23 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_81_009E35 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_82_009E57 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_83_009E79 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_84_009EAB {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0016, X
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_85_009EC8 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0016, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_86_009EF5 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0016, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_87_009F22 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0016, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

sub_009F5F {
    STZ $2A
    CMP #$00FF
    BNE code_009F67
    RTS 
}

code_009F67 {
    BIT #$0080
    BEQ code_009F7F
    AND #$FF7F
    STA $28
    LDA $12
    BIT #$0002
    BEQ code_009F79
    RTS 
}

code_009F79 {
    LDA #$4000
    TSB $0E
    RTS 
}

code_009F7F {
    STA $28
    LDA $12
    BIT #$0002
    BEQ code_009F89
    RTS 
}

code_009F89 {
    LDA #$4000
    TRB $0E
    RTS 
}

---------------------------------------------

cop_handler_88_009F8F {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F0006, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0008, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_89_009FAA {
    TYX 
    JSL $@func_03CA55
    BCC code_009FBD
    LDA #$0000
    STA $2C
    STA $2E
    LDA $0A
    STA $02, S
    RTI 
}

code_009FBD {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_8A_009FC0 {
    TYX 

  code_009FC1:
    JSL $@func_03CA55
    BCC code_009FDB
    LDA $7F0016, X
    DEC 
    STA $7F0016, X
    BNE code_009FC1
    STZ $2C
    STZ $2E
    LDA $0A
    STA $02, S
    RTI 
}

code_009FDB {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_8B_009FDE {
    TYX 
    JSL $@func_03CA55
    BCC code_009FEC
    LDA #$0000
    STA $2C
    STA $2E
}

code_009FEC {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_8C_009FF1 {
    TYX 
    JSL $@func_03CA55
    BCC code_00A00B
    LDA #$0000
    STA $2C
    STA $2E
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA $0A
    STA $02, S
    RTI 
}

code_00A00B {
    LDA [$0A]
    INC $0A
    AND #$00FF
    CMP $2A
    BEQ code_00A019
    PLA 
    PLA 
    RTL 
}

code_00A019 {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_8D_00A01E {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_009F5F
    JSL $@func_03CA55
    STZ $2A
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_8E_00A036 {
    TYX 
    SEP #$20
    LDA [$0A]
    STA $0AC8
    ASL 
    CLC 
    ADC [$0A]
    ASL 
    REP #$20
    AND #$00FF
    STA $7F000E, X
    TAY 
    LDA $&body_table, Y
    STA $7F0006, X
    LDA $&body_table+2, Y
    AND #$00FF
    STA $7F0008, X
    LDA #$8000
    TSB $player_flags
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_8F_00A06B {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $28
    STZ $2A
    JSR $&sub_00AF6D
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_90_00A081 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $28
    STZ $2A
    JSR $&sub_00AF6D
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_91_00A0A7 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $28
    STZ $2A
    JSR $&sub_00AF6D
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_92_00A0CD {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $28
    STZ $2A
    JSR $&sub_00AF6D
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_93_00A103 {
    TYX 
    JSL $@func_03CA55
    BCC code_00A116
    LDA #$0000
    STA $2C
    STA $2E
    LDA $0A
    STA $02, S
    RTI 
}

code_00A116 {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_94_00A119 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $28
    STZ $2A
    JSR $&sub_00AF6D
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $09B0
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_95_00A159 {
    TYX 
    LDA $0000
    AND #$00FF
    STA $28
    STZ $2A
    JSR $&sub_00AF6D
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_96_00A16E {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    CMP $0656
    BNE code_00A1A4
    LDA $16
    BIT #$000F
    BNE code_00A19E
    STA $001C
    LDA $14
    STA $0018
    JSR $&sub_00B43B
    AND #$00FF
    BIT #$00F0
    BNE code_00A1A9
    CMP #$000F
    BEQ code_00A1A9
    CMP $09B0
    BNE code_00A1A4
}

code_00A19E {
    JSL $@func_03CA55
    BCC code_00A1B2
}

code_00A1A4 {
    LDA $0A
    STA $02, S
    RTI 
}

code_00A1A9 {
    LDA $10
    ORA #$0004
    STA $10
    BRA code_00A1A4
}

code_00A1B2 {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_97_00A1B5 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    CMP $0656
    BNE code_00A1EF
    LDA $16
    BIT #$000F
    BNE code_00A1E9
    SEC 
    SBC #$0010
    STA $001C
    LDA $14
    STA $0018
    JSR $&sub_00B43B
    AND #$00FF
    BIT #$00F0
    BNE code_00A1F4
    CMP #$000F
    BEQ code_00A1F4
    CMP $09B0
    BNE code_00A1EF
}

code_00A1E9 {
    JSL $@func_03CA55
    BCC code_00A1FD
}

code_00A1EF {
    LDA $0A
    STA $02, S
    RTI 
}

code_00A1F4 {
    LDA $10
    ORA #$0004
    STA $10
    BRA code_00A1EF
}

code_00A1FD {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_98_00A200 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    CMP $0656
    BNE code_00A23A
    LDA $16
    BIT #$000F
    BNE code_00A234
    CLC 
    ADC #$0010
    STA $001C
    LDA $14
    STA $0018
    JSR $&sub_00B43B
    AND #$00FF
    BIT #$00F0
    BNE code_00A23F
    CMP #$000F
    BEQ code_00A23F
    CMP $09B0
    BNE code_00A23A
}

code_00A234 {
    JSL $@func_03CA55
    BCC code_00A248
}

code_00A23A {
    LDA $0A
    STA $02, S
    RTI 
}

code_00A23F {
    LDA $10
    ORA #$0004
    STA $10
    BRA code_00A23A
}

code_00A248 {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_99_00A24B {
    TYX 
    JSR $&sub_00B15D
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_9A_00A267 {
    TYX 
    JSR $&sub_00B15D
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_9B_00A28C {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_9C_00A2A8 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_9D_00A2CD {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    CLC 
    ADC $0014, Y
    STA $0014, Y
    LDA [$0A]
    INC $0A
    INC $0A
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_9E_00A303 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    CLC 
    ADC $0014, Y
    STA $0014, Y
    LDA [$0A]
    INC $0A
    INC $0A
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_9F_00A342 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0014, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0016, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A0_00A370 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0014, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0016, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A1_00A3A7 {
    TYX 
    JSR $&sub_00B15D
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA #$0040
    TSB $12
    JSR $&sub_00B1CB
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A2_00A3D4 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA #$0040
    TSB $12
    JSR $&sub_00B1CB
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A3_00A401 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0014, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0016, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA #$0040
    TSB $12
    JSR $&sub_00B1CB
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A4_00A440 {
    TYX 
    JSR $&sub_00B189
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A466
    ORA #$FF00
}

code_00A466 {
    CLC 
    ADC $0014, Y
    STA $0014, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A47C
    ORA #$FF00
}

code_00A47C {
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA #$0040
    TSB $12
    JSR $&sub_00B1CB
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A5_00A499 {
    PHY 
    LDA #$0000
    TCD 
    JSL $@func_00B501
    BCS code_00A50A
    TYX 
    LDY $0058
    TXA 
    STA $0006, Y
    STA $0058
    TYA 
    STA $0004, X
    STZ $0006, X
    TXY 
    PLA 
    TCD 
    TAX 
    JSR $&sub_00B1DA
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A4DF
    ORA #$FF00
}

code_00A4DF {
    CLC 
    ADC $0014, Y
    STA $0014, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A4F5
    ORA #$FF00
}

code_00A4F5 {
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA $0A
    STA $02, S
    RTI 
}

code_00A50A {
    PLA 
    TCD 
    TAX 
    LDA [$0A]
    INC $0A
    INC $0A
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A6_00A533 {
    PHY 
    LDA #$0000
    TCD 
    JSL $@func_00B501
    BCS code_00A5AE
    TYX 
    LDY $0058
    TXA 
    STA $0006, Y
    STA $0058
    TYA 
    STA $0004, X
    STZ $0006, X
    TXY 
    PLA 
    TCD 
    TAX 
    JSR $&sub_00B1DA
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0000, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0002, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $0028, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A583
    ORA #$FF00
}

code_00A583 {
    CLC 
    ADC $0014, Y
    STA $0014, Y
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A599
    ORA #$FF00
}

code_00A599 {
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA [$0A]
    INC $0A
    INC $0A
    STA $0010, Y
    LDA $0A
    STA $02, S
    RTI 
}

code_00A5AE {
    PLA 
    TCD 
    TAX 
    LDA [$0A]
    INC $0A
    INC $0A
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    AND #$00FF
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A7_00A5DE {
    TYX 
    PHD 
    LDA $12
    BIT #$0040
    BEQ code_00A5EC
    PEA $&code_00A5EF-1
    BRA code_00A60E
}

code_00A5EC {
    JSR $&sub_00AF40
}

code_00A5EF {
    PLA 
    TAX 
    TCD 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_E0_00A5F7 {
    TYX 
    PHD 
    LDA $12
    BIT #$0040
    BEQ code_00A605
    PEA $&code_00A608-1
    BRA code_00A60E
}

code_00A605 {
    JSR $&sub_00AF40
}

code_00A608 {
    PLA 
    TAX 
    TCD 
    PLA 
    PLA 
    RTL 
}

code_00A60E {
    STX $0000
    LDA $0004, X
    TAX 
    BEQ code_00A626

  code_00A617:
    LDA $7F001C, X
    CMP $0000
    BNE code_00A626
    LDA $0004, X
    TAX 
    BNE code_00A617
}

code_00A626 {
    STX $0002
    LDX $0000
    LDA $0006, X
    TAX 
    BEQ code_00A641

  code_00A632:
    LDA $7F001C, X
    CMP $0000
    BNE code_00A641
    LDA $0006, X
    TAX 
    BNE code_00A632
}

code_00A641 {
    STX $0004
    LDX $0002
    BNE code_00A64F
    LDX $0056
    JSR $&sub_00B1B5
}

code_00A64F {
    LDA $0006, X
    CMP $0004
    BEQ code_00A65D
    TAX 
    JSR $&sub_00B1B5
    BRA code_00A64F
}

code_00A65D {
    LDA $0002
    BNE code_00A675
    LDX $0004
    STX $0056
    STZ $0004, X
    LDA $03, S
    TAX 
    TCD 
    LDA $0004
    STA $06
    RTS 
}

code_00A675 {
    LDA $0004
    BNE code_00A68A
    LDX $0002
    STX $0058
    STZ $0006, X
    LDA $03, S
    TAX 
    TCD 
    STZ $06
    RTS 
}

code_00A68A {
    LDY $0004
    LDA $0002
    STA $0004, Y
    TAX 
    TYA 
    STA $0006, X
    TAY 
    LDA $03, S
    TAX 
    TCD 
    TYA 
    STA $06
    RTS 
}

---------------------------------------------

cop_handler_A8_00A6A1 {
    PHY 
    LDA $04
    TCD 
    TAX 
    JSR $&sub_00AF40
    PLA 
    TCD 
    TAX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_A9_00A6B1 {
    PHY 
    LDA $06
    TCD 
    TAX 
    JSR $&sub_00AF40
    PLA 
    TCD 
    TAX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_AA_00A6C1 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_AB_00A6D7 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_AC_00A6ED {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $2C
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $2E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_AD_00A713 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BEQ code_00A727
    LDA #$4000
    TSB $12
    LDA $0A
    STA $02, S
    RTI 
}

code_00A727 {
    LDA #$4000
    TRB $12
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_AE_00A731 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BEQ code_00A745
    LDA #$2000
    TSB $12
    LDA $0A
    STA $02, S
    RTI 
}

code_00A745 {
    LDA #$2000
    TRB $12
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_AF_00A74F {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BEQ code_00A763
    LDA #$6000
    TSB $12
    LDA $0A
    STA $02, S
    RTI 
}

code_00A763 {
    LDA #$6000
    TRB $12
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B0_00A76D {
    PHY 
    LDX $0058
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0018, X
    JSR $&sub_00B157
    STA $002C, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F001A, X
    JSR $&sub_00B157
    STA $002E, X
    PLX 
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B1_00A799 {
    TYX 
    LDA $7F0018, X
    JSR $&sub_00B157
    STA $002C, X
    LDA $7F001A, X
    JSR $&sub_00B157
    STA $002E, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B2_00A7B3 {
    TYX 
    LDA #$0002
    TSB $10
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B3_00A7BE {
    TYX 
    LDA #$0001
    TSB $10
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B4_00A7C9 {
    TYX 
    LDA #$0002
    TRB $10
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B5_00A7D4 {
    TYX 
    LDA #$0001
    TRB $10
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B6_00A7DF {
    TYX 
    LDA #$3000
    TRB $0E
    LDA [$0A]
    INC $0A
    AND #$00FF
    XBA 
    TSB $0E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B7_00A7F4 {
    TYX 
    LDA #$0E00
    TRB $0E
    LDA [$0A]
    INC $0A
    AND #$00FF
    XBA 
    TSB $0E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B8_00A809 {
    TYX 
    LDA $0E
    EOR #$4000
    STA $0E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_B9_00A816 {
    TYX 
    LDA $0E
    EOR #$8000
    STA $0E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_BA_00A823 {
    TYX 
    LDA #$4000
    TRB $0E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_BB_00A82E {
    TYX 
    LDA #$4000
    TSB $0E
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_BC_00A839 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A849
    ORA #$FF00
}

code_00A849 {
    CLC 
    ADC $14
    STA $14
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A85D
    ORA #$FF00
}

code_00A85D {
    CLC 
    ADC $16
    STA $16
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_BD_00A867 {
    PHY 
    PHB 
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    PHA 
    PLB 
    REP #$20
    LDA #$0000
    TCD 
    JSL $@func_03EA62
    PLB 
    PLA 
    TAX 
    TCD 
    LDA #$0001
    TSB $09EC
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_BE_00A894 {
    TYX 
    LDA $0654
    CMP #$000F
    BEQ code_00A8A6
    LDA $0A
    DEC 
    DEC 
    STA $00
    PLA 
    PLA 
    RTL 
}

code_00A8A6 {
    LDA #$2000
    TSB $09EC
    LDA #$0F00
    STA $joypad_mask_inv
    PHB 
    SEP #$20
    LDA $0C
    PHA 
    PLB 
    REP #$20
    LDA $joypad_mask_std
    STZ $joypad_mask_std
    PHA 
    LDA $10
    AND #$0800
    PHA 
    LDA #$0800
    TRB $10
    LDA [$0A]
    INC $0A
    INC $0A
    JSL $@func_03E849
    ASL 
    PHA 
    LDA [$0A]
    INC $0A
    INC $0A
    CLC 
    ADC $01, S
    TAY 
    PLA 
    PLA 
    TSB $10
    PLA 
    STA $joypad_mask_std
    STZ $joypad_mask_inv
    LDA #$2000
    TRB $09EC
    LDA $0000, Y
    PLB 
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_BF_00A8FB {
    TYX 
    LDA #$2000
    TSB $09EC
    LDA $0A
    PHA 
    SEP #$20
    LDA $0C
    PHA 
    JSL $@func_00817D
    PLA 
    STA $0C
    REP #$20
    PLA 
    STA $0A
    LDA $10
    AND #$0800
    PHA 
    LDA #$0800
    TRB $10
    LDA $joypad_mask_std
    STZ $joypad_mask_std
    PHA 
    PHB 
    SEP #$20
    LDA $0C
    PHA 
    PLB 
    REP #$20
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    JSL $@sub_03E255
    PLB 
    PLA 
    STA $joypad_mask_std
    TRB $0656
    LDA #$0F00
    TRB $0658
    LDA #$2000
    TRB $09EC
    PLA 
    TSB $10
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_6B_00A958 {
    TYX 
    LDA $10
    AND #$0800
    PHA 
    LDA #$0800
    TRB $10
    LDA $joypad_mask_std
    STZ $joypad_mask_std
    PHA 
    PHB 
    SEP #$20
    LDA $0C
    PHA 
    PLB 
    REP #$20
    LDA [$0A]
    INC $0A
    INC $0A
    TAY 
    JSL $@sub_03E255
    PLB 
    PLA 
    STA $joypad_mask_std
    LDA #$0F00
    TRB $0658
    PLA 
    TSB $10
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_6C_00A992 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0012, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0010, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_6D_00A9AE {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A9BE
    ORA #$FF00
}

code_00A9BE {
    CLC 
    ADC $7F0012, X
    STA $7F0012, X
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00A9D6
    ORA #$FF00
}

code_00A9D6 {
    CLC 
    ADC $7F0010, X
    STA $7F0010, X
    LDY $0000
    JSL $@func_00F3C9
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_C0_00A9EB {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F000A, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_C1_00A9FB {
    TYX 
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_C2_00AA07 {
    TYX 
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_C3_00AA13 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $00
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $02
    LDA [$0A]
    INC $0A
    INC $0A
    STA $08
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_C4_00AA30 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $00
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $02
    STZ $08
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_E2_00AA47 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $00
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $02
    STZ $08
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_C5_00AA60 {
    TYX 
    LDA $7F0004, X
    BEQ code_00AA71
    STA $02, S
    LDA #$0000
    STA $7F0004, X
    RTI 
}

code_00AA71 {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_E1_00AA74 {
    TYX 
    LDA $7F0004, X
    BEQ code_00AA88
    STA $02, S
    LDA #$0000
    STA $7F0004, X
    LDA #$FFFF
    RTI 
}

code_00AA88 {
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_C6_00AA8B {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $7F0004, X
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_C7_00AA9B {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $00
    STA $02, S
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    STA $02
    STA $04, S
    REP #$20
    RTI 
}

---------------------------------------------

cop_handler_C8_00AAB6 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    LDA $0A
    STA $7F0004, X
    RTI 
}

---------------------------------------------

cop_handler_C9_00AAC6 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    STA $00
    LDA $0A
    STA $7F0004, X
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_CA_00AAD8 {
    TYX 
    CPX #$1000
    BCC code_00AAF6
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F0014, X
    LDA $0A
    STA $7F001E, X
    STA $00
    LDA $0A
    STA $02, S
    RTI 
}

code_00AAF6 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    STA $7F2102, X
    LDA $0A
    STA $7F2100, X
    STA $00
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_CB_00AB0E {
    TYX 
    CPX #$1000
    BCC code_00AB2D
    LDA $7F0014, X
    DEC 
    BEQ code_00AB28
    STA $7F0014, X
    LDA $7F001E, X
    STA $00
    PLA 
    PLA 
    RTL 
}

code_00AB28 {
    LDA $0A
    STA $02, S
    RTI 
}

code_00AB2D {
    LDA $7F2102, X
    DEC 
    BEQ code_00AB28
    STA $7F2102, X
    LDA $7F2100, X
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_CC_00AB41 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_00B0B7
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_CD_00AB51 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    JSR $&sub_00B0B7
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_CE_00AB60 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_00B0D8
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_CF_00AB70 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    JSR $&sub_00B0D8
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D0_00AB7F_fall {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_00B0FB
    BCS code_00ABA5
    BCC code_00AB9A
}

---------------------------------------------

cop_handler_D1_00AB8E {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    JSR $&sub_00B0FB
    BCS code_00ABA5
}

code_00AB9A {
    LDA [$0A]
    INC $0A
    AND #$00FF
    BNE code_00ABB7
    BRA code_00ABAE
}

code_00ABA5 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    BEQ code_00ABB7
}

code_00ABAE {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

code_00ABB7 {
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D2_00ABC2_fall {
    TYX 
    LDA $0A
    DEC 
    DEC 
    STA $00
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSR $&sub_00B0FB
    BCS code_00ABF4
    BCC code_00ABE9
}

---------------------------------------------

cop_handler_D3_00ABD7 {
    TYX 
    LDA $0A
    DEC 
    DEC 
    STA $00
    LDA [$0A]
    INC $0A
    INC $0A
    JSR $&sub_00B0FB
    BCS code_00ABF4
}

code_00ABE9 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    BEQ code_00AC00
    BRA code_00ABFD
}

code_00ABF4 {
    LDA [$0A]
    INC $0A
    AND #$00FF
    BNE code_00AC00
}

code_00ABFD {
    PLA 
    PLA 
    RTL 
}

code_00AC00 {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D4_00AC05 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSL $@func_03EF97
    BCS code_00AC1E
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_00AC1E {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D5_00AC27 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSL $@func_03F08D
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D6_00AC38 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    JSL $@func_03F0B3
    BCC code_00AC51
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_00AC51 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D7_00AC5A {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF
    SEP #$20
    LDY $inventory_equipped_index
    CMP $inventory_slots, Y
    REP #$20
    BEQ code_00AC79
    LDA [$0A]
    INC $0A
    INC $0A
    LDA $0A
    STA $02, S
    RTI 
}

code_00AC79 {
    LDA [$0A]
    INC $0A
    INC $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D8_00AC82 {
    TYX 
    LDA $7F0022, X
    AND #$00FF
    BEQ code_00AC8F
    JSR $&sub_00B074
}

code_00AC8F {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_D9_00AC94 {
    LDA [$0A]
    INC $0A
    INC $0A
    TAX 
    LDA $0000, X
    AND #$00FF
    ASL 
    STA $0000
    PHB 
    SEP #$20
    LDA $0C
    PHA 
    PLB 
    REP #$20
    LDA [$0A]
    INC $0A
    INC $0A
    CLC 
    ADC $0000
    TAX 
    LDA $0000, X
    PLB 
    TYX 
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_DA_00ACC1 {
    TYX 
    LDA [$0A]
    INC $0A
    AND #$00FF

  code_00ACC9:
    STA $08
    LDA $0C
    STA $02
    LDA $0A
    STA $00
    PLA 
    PLA 
    RTL 
}

---------------------------------------------

cop_handler_DB_00ACD6 {
    TYX 
    LDA [$0A]
    INC $0A
    INC $0A
    BRA code_00ACC9
}

---------------------------------------------

cop_handler_DC_00ACDF {
    TYX 
    LDA $2A
    AND #$00FF
    DEC 
    BMI code_00ACF0
    SEP #$20
    STA $2A
    REP #$20
    BRA code_00ACFE
}

code_00ACF0 {
    REP #$20
    JSR $&sub_00B136
    BCC code_00ACFC
    LDA $0A
    STA $02, S
    RTI 
}

code_00ACFC {
    STA $2A
}

code_00ACFE {
    LDA $2B
    AND #$000F
    CLC 
    ADC $06C2
    STA $06C2
    CMP $camera_bounds_y
    BPL code_00AD12
    PLA 
    PLA 
    RTL 
}

code_00AD12 {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_DD_00AD17 {
    TYX 
    LDA $2A
    AND #$00FF
    DEC 
    BMI code_00AD28
    SEP #$20
    STA $2A
    REP #$20
    BRA code_00AD36
}

code_00AD28 {
    REP #$20
    JSR $&sub_00B136
    BCC code_00AD34
    LDA $0A
    STA $02, S
    RTI 
}

code_00AD34 {
    STA $2A
}

code_00AD36 {
    LDA $2B
    AND #$000F
    SEC 
    SBC $06C2
    BEQ code_00AD47
    BPL code_00AD52
    EOR #$FFFF
    INC 
}

code_00AD47 {
    STA $06C2
    CMP $camera_offset_y
    BMI code_00AD52
    PLA 
    PLA 
    RTL 
}

code_00AD52 {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_DE_00AD57 {
    TYX 
    LDA $2A
    AND #$00FF
    DEC 
    BMI code_00AD68
    SEP #$20
    STA $2A
    REP #$20
    BRA code_00AD76
}

code_00AD68 {
    REP #$20
    JSR $&sub_00B136
    BCC code_00AD74
    LDA $0A
    STA $02, S
    RTI 
}

code_00AD74 {
    STA $2A
}

code_00AD76 {
    LDA $2B
    AND #$000F
    CLC 
    ADC $06BE
    STA $06BE
    CMP $camera_bounds_x
    BPL code_00AD8A
    PLA 
    PLA 
    RTL 
}

code_00AD8A {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

cop_handler_DF_00AD8F {
    TYX 
    LDA $2A
    AND #$00FF
    DEC 
    BMI code_00ADA0
    SEP #$20
    STA $2A
    REP #$20
    BRA code_00ADAE
}

code_00ADA0 {
    REP #$20
    JSR $&sub_00B136
    BCC code_00ADAC
    LDA $0A
    STA $02, S
    RTI 
}

code_00ADAC {
    STA $2A
}

code_00ADAE {
    LDA $2B
    AND #$000F
    SEC 
    SBC $06BE
    BEQ code_00ADBF
    BPL code_00ADCA
    EOR #$FFFF
    INC 
}

code_00ADBF {
    STA $06BE
    CMP $camera_offset_x
    BMI code_00ADCA
    PLA 
    PLA 
    RTL 
}

code_00ADCA {
    LDA $0A
    STA $02, S
    RTI 
}

---------------------------------------------

sub_00ADCF {
    PHX 
    PHB 
    LDA $7F0006, X
    CLC 
    ADC #$0100
    STA $0062
    CLC 
    ADC #$0400
    STA $005E
    LDA $0036
    LSR 
    BCC code_00ADFA
    LDA $0062
    CLC 
    ADC #$0200
    STA $0062
    CLC 
    ADC #$0400
    STA $005E
}

code_00ADFA {
    SEP #$20
    LDA $7F0008, X
    STA $WRMPYA
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    LDA #$0000
    TCD 
    LDA $000E, X
    STA $0E
    LSR 
    PHA 
    LDA #$0100
    STA $804204
    PLA 
    SEP #$20
    STA $804206
    LDA #$00
    XBA 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $804214
    REP #$20
    STA $00
    LDY #$0000

  code_00AE36:
    INY 
    LSR 
    BCC code_00AE36
    DEY 
    LDA $7F0004, X
    CLC 
    ADC $1C

  code_00AE42:
    ASL 
    DEY 
    BNE code_00AE42
    AND #$00FF
    TAX 
    LDY #$0000

  code_00AE4D:
    SEP #$20
    LDA $@binary_01C455, X
    STA $804203
    BPL code_00AE8F
    NOP 
    NOP 
    NOP 
    LDA $804217
    PHA 
    LDA #$FF
    STA $804203
    XBA 
    PLA 
    CLC 
    ADC $804216
    REP #$20
    PHA 
    CLC 
    ADC $18
    STA ($62), Y
    PLA 
    CLC 
    ADC $1C
    STA ($5E), Y
    TXA 
    CLC 
    ADC $00
    AND #$00FF
    TAX 
    INY 
    INY 
    CPY $0E
    BNE code_00AE4D
    PLB 
    PLA 
    TAX 
    TCD 
    RTS 
}

code_00AE8F {
    REP #$20
    NOP 
    LDA $804217
    AND #$00FF
    PHA 
    CLC 
    ADC $18
    STA ($62), Y
    PLA 
    CLC 
    ADC $1C
    STA ($5E), Y
    TXA 
    CLC 
    ADC $00
    AND #$00FF
    TAX 
    INY 
    INY 
    CPY $0E
    BNE code_00AE4D
    PLB 
    PLA 
    TCD 
    TAX 
    RTS 
}

---------------------------------------------

sub_00AEB8 {
    PHP 
    PHX 
    LDA $09EC
    BIT #$0040
    BNE code_00AED4
    LDA $7F000E, X
    BIT #$0001
    BEQ code_00AF19
    AND #$FFFE
    STA $7F000E, X
    BRA code_00AEDA
}

code_00AED4 {
    AND #$FFBF
    STA $09EC
}

code_00AEDA {
    SEP #$20
    LDA $7F0008, X
    STA $WRMPYA
    LDX #$0000
    TXY 

  code_00AEE7:
    LDA $&binary_01C455, Y
    STA $WRMPYB
    BPL code_00AF1C
    NOP 
    NOP 
    NOP 
    LDA $RDMPYH
    PHA 
    LDA #$FF
    STA $WRMPYB
    XBA 
    PLA 
    CLC 
    ADC $RDMPYL
    REP #$20
    STA $7E8900, X
    STA $7E8B00, X
    TYA 
    SEP #$20
    CLC 
    ADC $0E
    TAY 
    INX 
    INX 
    CPX #$0200
    BNE code_00AEE7
}

code_00AF19 {
    PLX 
    PLP 
    RTS 
}

code_00AF1C {
    REP #$20
    NOP 
    LDA $RDMPYH
    REP #$20
    AND #$00FF
    STA $7E8900, X
    STA $7E8B00, X
    TYA 
    SEP #$20
    CLC 
    ADC $0E
    TAY 
    INX 
    INX 
    CPX #$0200
    BNE code_00AEE7
    PLX 
    PLP 
    RTS 
}

---------------------------------------------

sub_00AF40 {
    LDY $0004, X
    BNE code_00AF55
    LDY $0006, X
    STY $0056
    BEQ code_00AF69
    LDA #$0000
    STA $0004, Y
    BRA code_00AF69
}

code_00AF55 {
    LDA $0006, X
    STA $0006, Y
    BNE code_00AF62
    STY $0058
    BRA code_00AF69
}

code_00AF62 {
    TAY 
    LDA $0004, X
    STA $0004, Y
}

code_00AF69 {
    JSR $&sub_00B1B5
    RTS 
}

---------------------------------------------

sub_00AF6D {
    LDA $0AD4
    ASL 
    CLC 
    ADC $0AD4
    ASL 
    TAY 
    LDA $&body_table, Y
    STA $7F0006, X
    LDA $&body_table+2, Y
    AND #$00FF
    STA $7F0008, X
    LDA #$8000
    TRB $player_flags
    RTS 
}

---------------------------------------------

sub_00AF8F {
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00AF9E
    ORA #$FF00
}

code_00AF9E {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $14
    LSR 
    LSR 
    LSR 
    LSR 
    STA $0018
    LDA [$0A]
    INC $0A
    AND #$00FF
    BIT #$0080
    BEQ code_00AFBB
    ORA #$FF00
}

code_00AFBB {
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $16
    SEC 
    SBC #$0010
    LSR 
    LSR 
    LSR 
    LSR 
    STA $001C
    RTS 
}

---------------------------------------------

sub_00AFCE {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $0018
    BMI code_00B01A
    STA $0000
    LDA $0016, Y
    SEC 
    SBC $001C
    BMI code_00AFFE
    LDY #$0002
    CMP #$0010
    BCC code_00B05C
    LDY #$0004
    LDA $0000
    CMP #$0010
    BCC code_00B05C
    LDY #$0003
    BRA code_00B05C
}

code_00AFFE {
    EOR #$FFFF
    INC 
    LDY #$0002
    CMP #$0010
    BCC code_00B05C
    LDY #$0000
    LDA $0000
    CMP #$0010
    BCC code_00B05C
    LDY #$0001
    BRA code_00B05C
}

code_00B01A {
    EOR #$FFFF
    INC 
    STA $0000
    LDA $0016, Y
    SEC 
    SBC $001C
    BMI code_00B042
    LDY #$0006
    CMP #$0010
    BCC code_00B05C
    LDY #$0004
    LDA $0000
    CMP #$0010
    BCC code_00B05C
    LDY #$0005
    BRA code_00B05C
}

code_00B042 {
    EOR #$FFFF
    INC 
    LDY #$0006
    CMP #$0010
    BCC code_00B05C
    LDY #$0000
    LDA $0000
    CMP #$0010
    BCC code_00B05C
    LDY #$0007
}

code_00B05C {
    TYA 
    RTS 
}

---------------------------------------------

func_00B05E {
    AND #$0007
    CLC 
    ADC #$0100
    JSR $&sub_00B095
    RTL 
}

---------------------------------------------

func_00B069 {
    AND #$0007
    CLC 
    ADC #$0100
    JSR $&sub_00B074
    RTL 
}

---------------------------------------------

sub_00B074 {
    PHX 
    STA $0000
    LSR 
    LSR 
    LSR 
    TAY 
    LDA #$0000
    SEP #$20
    LDA $0000
    AND #$07
    TAX 
    LDA $0A80, Y
    ORA $@bitmasks_00B11D, X
    STA $0A80, Y
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

sub_00B095 {
    PHX 
    STA $0000
    LSR 
    LSR 
    LSR 
    TAY 
    LDA #$0000
    SEP #$20
    LDA $0000
    AND #$07
    TAX 
    LDA $@bitmasks_00B11D, X
    AND $0A80, Y
    SEC 
    BNE code_00B0B3
    CLC 
}

code_00B0B3 {
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

sub_00B0B7 {
    PHX 
    STA $0000
    LSR 
    LSR 
    LSR 
    TAY 
    LDA #$0000
    SEP #$20
    LDA $0000
    AND #$07
    TAX 
    LDA $0A00, Y
    ORA $@bitmasks_00B11D, X
    STA $0A00, Y
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

sub_00B0D8 {
    PHX 
    STA $0000
    LSR 
    LSR 
    LSR 
    TAY 
    LDA #$0000
    SEP #$20
    LDA $0000
    AND #$07
    TAX 
    LDA $@bitmasks_00B11D, X
    EOR #$FF
    AND $0A00, Y
    STA $0A00, Y
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

sub_00B0FB {
    PHX 
    STA $0000
    LSR 
    LSR 
    LSR 
    TAY 
    LDA #$0000
    SEP #$20
    LDA $0000
    AND #$07
    TAX 
    LDA $@bitmasks_00B11D, X
    AND $0A00, Y
    SEC 
    BNE code_00B119
    CLC 
}

code_00B119 {
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

bitmasks_00B11D [
  #01   ;00
  #02   ;01
  #04   ;02
  #08   ;03
  #10   ;04
  #20   ;05
  #40   ;06
  #80   ;07
]

---------------------------------------------

sub_00B125 {
    SEP #$20
    XBA 
    LDA #$30
    JSL $@func_0281D1
    REP #$20
    CLC 
    ADC #$1000
    TAY 
    RTS 
}

---------------------------------------------

sub_00B136 {
    PHP 
    PHX 
    LDA $06E2
    INC $06E2
    ASL 
    CLC 
    ADC $06E0
    TAX 
    LDA $0000, X
    BIT #$FF00
    BEQ code_00B150
    PLX 
    PLP 
    CLC 
    RTS 
}

code_00B150 {
    STZ $06E2
    PLX 
    PLP 
    SEC 
    RTS 
}

---------------------------------------------

sub_00B157 {
    ASL 
    TAY 
    LDA $&table_01B086, Y
    RTS 
}

---------------------------------------------

sub_00B15D {
    PHD 
    LDA #$0000
    TCD 
    JSL $@func_00B501
    PLD 
    BCS code_00B188
    TXA 
    STA $0006, Y
    LDA $04
    STA $0004, Y
    TYA 
    STA $04
    PHX 
    LDX $0004, Y
    BNE code_00B180
    STY $0056
    BRA code_00B184
}

code_00B180 {
    TYA 
    STA $0006, X
}

code_00B184 {
    PLX 
    JSR $&sub_00B1DA
}

code_00B188 {
    RTS 
}

---------------------------------------------

sub_00B189 {
    PHD 
    LDA #$0000
    TCD 
    JSL $@func_00B501
    PLD 
    BCS code_00B1B4
    TXA 
    STA $0004, Y
    LDA $06
    STA $0006, Y
    TYA 
    STA $06
    PHX 
    LDX $0006, Y
    BEQ code_00B1AD
    TYA 
    STA $0004, X
    BRA code_00B1B0
}

code_00B1AD {
    STY $0058
}

code_00B1B0 {
    PLX 
    JSR $&sub_00B1DA
}

code_00B1B4 {
    RTS 
}

---------------------------------------------

sub_00B1B5 {
    LDA #$0000
    TCD 
    SEP #$20
    DEC $004E
    DEC $004E
    DEC $0DBC
    REP #$20
    TXA 
    STA [$4E]
    TCD 
    RTS 
}

---------------------------------------------

sub_00B1CB {
    LDA $7F001C, X
    BNE code_00B1D2
    TDC 
}

code_00B1D2 {
    TYX 
    STA $7F001C, X
    TDC 
    TAX 
    RTS 
}

---------------------------------------------

sub_00B1DA {
    PHX 
    LDA $0E
    STA $000E, Y
    LDA $10
    ORA #$2000
    AND #$F7FC
    STA $0010, Y
    LDA $12
    AND #$EFFF
    STA $0012, Y
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    LDA $28
    STA $0028, Y
    LDA $2A
    STA $002A, Y
    TXA 
    STA $0024, Y
    LDA $7F0020, X
    PHA 
    LDA $7F000C, X
    PHA 
    LDA $7F0006, X
    PHA 
    LDA $7F0008, X
    TYX 
    STA $7F0008, X
    PLA 
    STA $7F0006, X
    PLA 
    STA $7F000C, X
    PLA 
    STA $7F0020, X
    LDA #$0000
    STA $7F001C, X
    STA $002C, X
    STA $002E, X
    STA $7F002C, X
    STA $7F002E, X
    STA $0008, X
    STA $7F000A, X
    LDA $scene_current
    CMP #$00FF
    BEQ code_00B279
    LDA #$0000
    STA $7F002A, X
    STA $7F1000, X
    STA $7F1002, X
    STA $7F1004, X
    STA $7F1008, X
    STA $7F1016, X
    STA $7F101C, X
    STA $7F101E, X
}

code_00B279 {
    PLX 
    RTS 
}

---------------------------------------------

sub_00B27B {
    PHD 
    LDA #$0000
    TCD 
    JSL $@func_03CE8F
    BCS code_00B29D
    LDX $005C
    TXA 
    STA $0004, Y
    LDA #$0000
    STA $0008, Y
    STA $0006, Y
    TYA 
    STA $0006, X
    STY $005C
}

code_00B29D {
    PLD 
    RTS 
}

---------------------------------------------

sub_00B29F {
    PHB 
    PHD 
    PHX 
    LDA #$0000
    TCD 
    LDA $7F000C, X
    TAY 
    SEP #$20
    LDA $7F0008, X
    PHA 
    PLB 
    REP #$20
    LDA $0000, Y
    ORA #$FF00
    CLC 
    ADC $18
    LSR 
    LSR 
    LSR 
    LSR 
    STA $18
    LDA $0002, Y
    AND #$00FF
    STA $1A
    LDA $0001, Y
    ORA #$FF00
    CLC 
    ADC $1C
    LSR 
    LSR 
    LSR 
    LSR 
    STA $1C
    LDA $0003, Y
    AND #$00FF
    STA $1E
    LDX #$0000
    JSL $@func_02B0A3
    CPX #$4000
    BCS code_00B325
    LDA $1A
    STA $18
    TXA 
    STA $1C

  code_00B2F6:
    SEP #$20
    TAX 
    LDA $7FC000, X
    ORA #$F0
    STA $7FC000, X
    DEC $18
    BEQ code_00B316
    REP #$20
    TXA 
    INC 
    BIT #$000F
    BNE code_00B2F6
    CLC 
    ADC #$00F0
    BRA code_00B2F6
}

code_00B316 {
    DEC $1E
    BEQ code_00B325
    LDA $1A
    STA $18
    JSR $&sub_00B32B
    LDA $1C
    BRA code_00B2F6
}

code_00B325 {
    REP #$20
    PLX 
    PLD 
    PLB 
    RTS 
}

---------------------------------------------

sub_00B32B {
    PHP 
    SEP #$20
    LDA $1C
    CLC 
    ADC #$10
    BCS code_00B339
    STA $1C
    PLP 
    RTS 
}

code_00B339 {
    XBA 
    CLC 
    ADC $0693
    XBA 
    REP #$20
    STA $1C
    PLP 
    RTS 
}

---------------------------------------------

sub_00B345 {
    PHB 
    PHD 
    PHX 
    LDA #$0000
    TCD 
    LDA $7F000C, X
    TAY 
    SEP #$20
    LDA $7F0008, X
    PHA 
    PLB 
    REP #$20
    LDA $0000, Y
    ORA #$FF00
    CLC 
    ADC $18
    LSR 
    LSR 
    LSR 
    LSR 
    STA $18
    LDA $0002, Y
    AND #$00FF
    STA $1A
    LDA $0001, Y
    ORA #$FF00
    CLC 
    ADC $1C
    LSR 
    LSR 
    LSR 
    LSR 
    STA $1C
    LDA $0003, Y
    AND #$00FF
    STA $1E
    LDX #$0000
    JSL $@func_02B0A3
    CPX #$4000
    BCS code_00B3E9
    LDA $1A
    STA $18
    TXA 
    STA $1C
    LDA $00
    BEQ code_00B3A3
    JMP $&code_00B3EF
}

code_00B3A3 {
    TXA 

  code_00B3A4:
    SEP #$20
    TAX 
    LDA $7FC000, X
    AND #$0F
    STA $7FC000, X
    DEC $18
    BEQ code_00B3C4
    REP #$20
    TXA 
    INC 
    BIT #$000F
    BNE code_00B3A4
    CLC 
    ADC #$00F0
    BRA code_00B3A4
}

code_00B3C4 {
    DEC $1E
    BEQ code_00B3E9
    LDA $1A
    STA $18
    LDA $1C
    CLC 
    ADC #$10
    BCS code_00B3DB
    STA $1C
    REP #$20
    LDA $1C
    BRA code_00B3A4
}

code_00B3DB {
    STA $1C
    REP #$20
    LDA $1C
    CLC 
    ADC $map_bounds_x
    STA $1C
    BRA code_00B3A4
}

code_00B3E9 {
    REP #$20
    PLX 
    PLD 
    PLB 
    RTS 
}

code_00B3EF {
    TXA 

  code_00B3F0:
    SEP #$20
    TAX 
    LDA $7FC000, X
    AND #$00
    STA $7FC000, X
    DEC $18
    BEQ code_00B410
    REP #$20
    TXA 
    INC 
    BIT #$000F
    BNE code_00B3F0
    CLC 
    ADC #$00F0
    BRA code_00B3F0
}

code_00B410 {
    DEC $1E
    BEQ code_00B435
    LDA $1A
    STA $18
    LDA $1C
    CLC 
    ADC #$10
    BCS code_00B427
    STA $1C
    REP #$20
    LDA $1C
    BRA code_00B3F0
}

code_00B427 {
    STA $1C
    REP #$20
    LDA $1C
    CLC 
    ADC $map_bounds_x
    STA $1C
    BRA code_00B3F0
}

code_00B435 {
    REP #$20
    PLX 
    PLD 
    PLB 
    RTS 
}

---------------------------------------------

sub_00B43B {
    PHD 
    LDA #$0000
    TCD 
    LDA $18
    AND #$FFF0
    BMI code_00B47C
    CMP $camera_offset_x
    BCC code_00B47C
    CMP $camera_bounds_x
    BCS code_00B47C
    LSR 
    LSR 
    LSR 
    LSR 
    STA $18
    LDA $1C
    BMI code_00B47C
    CMP $camera_offset_y
    BCC code_00B47C
    CMP $06DE
    BCS code_00B47C
    LSR 
    LSR 
    LSR 
    LSR 
    DEC 
    STA $1C
    JSL $@func_03D78A
    CPY #$4000
    BCS code_00B47C
    LDA [$80], Y
    BIT #$00F0
    BEQ code_00B47F
}

code_00B47C {
    LDA #$000F
}

code_00B47F {
    PLD 
    RTS 
}

---------------------------------------------

func_00B481 {
    CLC 
    ADC #$0200
    JSR $&sub_00B0B7
    RTL 
}

---------------------------------------------

func_00B489 {
    REP #$20
    AND #$00FF
    CLC 
    ADC #$0200
    JSR $&sub_00B0FB
    RTL 
}

---------------------------------------------

func_00B496 {
    AND #$00FF
    CLC 
    ADC #$0300
    JSR $&sub_00B0FB
    RTL 
}

---------------------------------------------

func_00B4A1 {
    AND #$00FF
    CLC 
    ADC #$0300
    JSR $&sub_00B0B7
    RTL 
}

---------------------------------------------

func_00B4AC {
    AND #$00FF
    CLC 
    ADC #$0510
    JSR $&sub_00B0FB
    RTL 
}

---------------------------------------------

func_00B4B7 {
    AND #$00FF
    JSR $&sub_00B0FB
    RTL 
}

---------------------------------------------

func_00B4BE {
    AND #$00FF
    JSR $&sub_00B0B7
    RTL 
}

---------------------------------------------

func_00B4C5 {
    AND #$00FF
    JSR $&sub_00B0D8
    RTL 
}

---------------------------------------------

func_00B4CC {
    PHX 
    LDX #$0000
    LDA #$0000

  code_00B4D3:
    STA $000A80, X
    INX 
    INX 
    CPX #$0020
    BNE code_00B4D3
    PLX 
    RTL 
}

---------------------------------------------

func_00B4E0 {
    AND #$00FF
    CLC 
    ADC #$0100
    JSR $&sub_00B0B7
    RTL 
}

---------------------------------------------

func_00B4EB_noref {
    AND #$00FF
    CLC 
    ADC #$0100
    JSR $&sub_00B0D8
    RTL 
}

---------------------------------------------

func_00B4F6 {
    AND #$00FF
    CLC 
    ADC #$0100
    JSR $&sub_00B0FB
    RTL 
}

---------------------------------------------

func_00B501 {
    LDA ($4E)
    BMI code_00B514
    TAY 
    LDA #$0000
    STA ($4E)
    INC $4E
    INC $4E
    INC $0DBC
    CLC 
    RTL 
}

code_00B514 {
    LDY #$1FC0
    SEC 
    RTL 
}

---------------------------------------------

func_00B519 {
    COP [36]
    COP [39]
    COP [3D]
    RTL 
}