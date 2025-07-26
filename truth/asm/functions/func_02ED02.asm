
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'func_02F06A'
?INCLUDE 'chunk_008000'
?INCLUDE 'system_strings'

!scene_current                  0644
!joypad_mask_std                065A
!joypad_mask_inv                065C
!INIDISP                        2100
!BG1SC                          2107
!BG2SC                          2108
!BG3SC                          2109
!BG3HOFS                        2111
!BG3VOFS                        2112
!VMADDL                         2116
!W12SEL                         2123
!W34SEL                         2124
!WOBJSEL                        2125
!WH0                            2126
!WH1                            2127
!WH2                            2128
!WH3                            2129
!WBGLOG                         212A
!WOBJLOG                        212B
!HDMAEN                         420C

---------------------------------------------

func_02ED02 {
    PHP 
    SEP #$20
    JSL $@func_0281A2
    JSL $@func_0281BC
    STZ $HDMAEN
    JSR $&sub_02EF1D
    REP #$20
    LDA #$0F00
    STA $joypad_mask_inv
    LDA $06E4
    PHA 
    STZ $06E4
    LDA $09EC
    PHA 
    LDA #$4000
    STA $09EC
    LDA $0A00
    PHA 
    STZ $0A00
    LDA $scene_current
    AND #$00FF
    PHA 
    LDA #$00FF
    STA $scene_current
    ASL 
    STA $0646
    SEP #$20
    LDA $0A1F
    AND #$7F
    STA $0A1F
    STZ $W12SEL
    STZ $W34SEL
    STZ $WOBJSEL
    STZ $WBGLOG
    STZ $WOBJLOG
    STZ $WH0
    STZ $WH2
    STZ $WH3
    LDA #$FF
    STA $WH1
    LDA #$78
    STA $BG3SC
    STZ $BG3HOFS
    STZ $BG3HOFS
    STZ $BG3VOFS
    STZ $BG3VOFS
    JSL $@func_0283E7
    LDA #$0C
    STA $BG2SC
    LDA #$04
    STA $BG1SC
    STA $0AE6
    JSL $@func_03DFA0
    LDA #$1B
    STA $7F0A04
    LDA #$5B
    STA $7F0A05
    JSL $@func_029DE2
    LDX #$0000
    STX $0673
    STX $0676
    LDX #$0000
    STX $06BE
    STX $06C2
    STX $06C0
    STX $06C4
    STX $068A
    STX $068E
    STX $068C
    STX $0690
    STX $06C6
    STX $06C8
    STX $06CA
    STX $06CC
    STX $00B2
    JSL $@func_02F076
    JSL $@func_03CDDC
    JSL $@func_03CEA1
    JSL $@func_03D7E7
    JSL $@zero_bytes_03D86A
    JSL $@run_actors_03CAF5
    JSL $@run_actors_03CAF5
    JSL $@func_03C5FF
    LDA #$FF
    STA $7F3100
    STA $7F3101
    JSL $@func_03C714
    JSL $@func_00811E
    JSL $@func_028191
    JSL $@func_028043
    LDA #$0F
    STA $INIDISP
    JSL $@func_0281A2

  code_02EE17:
    JSL $@func_00811E
    LDA $0AE6
    STA $BG1SC
    COP [D0] ( #00, #00, &code_02EE17 )
    STZ $BG3VOFS
    STZ $BG3VOFS
    JSL $@func_0281A2
    JSL $@func_0281BC
    STZ $HDMAEN
    JSR $&sub_02EFB2
    LDX $06BE
    STX $068A
    LDX $06C2
    STX $068E
    LDX $06C0
    STX $068C
    LDX $06C4
    STX $0690
    REP #$20
    PLA 
    STA $scene_current
    ASL 
    STA $0646
    PLA 
    STA $0A00
    PLA 
    STA $09EC
    PLA 
    STA $06E4
    SEP #$20
    JSL $@func_0283E7
    JSL $@func_02A1E9
    JSL $@func_02A5F0
    JSR $&sub_02F035
    JSL $@func_03DFA0
    JSL $@func_03DFF8
    JSR $&sub_02EECC
    JSL $@zero_bytes_03D86A
    JSL $@func_02F076
    LDA #$41
    TSB $09EC
    JSL $@func_03DECD
    LDX #$0000
    STX $09CC
    STX $09CE
    STX $0AD0
    STX $0ACC
    STX $joypad_mask_inv
    STX $00F4
    STX $00F8
    COP [BD] ( @asciistring_01E818 )
    JSR $&sub_02EF0B
    JSL $@func_03E146
    JSL $@func_00817D
    COP [CC] ( #FF )
    JSL $@func_00817D
    LDA #$0F
    STA $INIDISP
    PLP 
    RTL 
}

---------------------------------------------

sub_02EECC {
    LDA $00EA
    BNE code_02EED2
    RTS 
}

code_02EED2 {
    DEC 
    BNE code_02EEF0
    LDX #$4400
    STX $VMADDL
    LDX #$&misc_fx_1CC000
    LDA #$^misc_fx_1CC000
    LDY #$0480
    JSL $@func_0283A2
    COP [50] ( @fx_palette_198070, #00, #A0, #10 )
    RTS 
}

code_02EEF0 {
    LDX #$4400
    STX $VMADDL
    LDX #$&misc_fx_1CC480
    LDA #$^misc_fx_1CC480
    LDY #$0600
    JSL $@func_0283A2
    COP [50] ( @fx_palette_198090, #00, #A9, #07 )
    RTS 
}

---------------------------------------------

sub_02EF0B {
    PHP 
    PHD 
    REP #$20
    LDA $5A
    BEQ code_02EF1A

  code_02EF13:
    TCD 
    STZ $08
    LDA $06
    BNE code_02EF13
}

code_02EF1A {
    PLD 
    PLP 
    RTS 
}

---------------------------------------------

sub_02EF1D {
    PHP 
    PHB 
    REP #$20
    LDA $0656
    STZ $0656
    STA $7E38AC
    LDA $0658
    STA $7E38AE
    LDA $joypad_mask_std
    STZ $joypad_mask_std
    STA $7E38B0
    LDA $0DBC
    STA $0DBE
    LDX #$0000

  code_02EF45:
    LDA $004E, X
    STA $7E389C, X
    INX 
    INX 
    CPX #$0010
    BNE code_02EF45
    LDX #$0000

  code_02EF56:
    LDA $06BE, X
    STA $7E3890, X
    INX 
    INX 
    CPX #$000C
    BNE code_02EF56
    LDX #$0E00
    LDY #$3490
    LDA #$00FF
    MVN #$7E, #$00
    LDX #$3000
    LDA #$00FF
    MVN #$7E, #$7E
    LDX #$1000
    LDY #$E000
    LDA #$0FFF
    MVN #$7F, #$00
    LDX #$1000
    LDA #$0FFF
    MVN #$7F, #$7F
    LDX #$0F00
    LDY #$3690
    LDA #$00FF
    MVN #$7E, #$00
    LDX #$0F00
    LDA #$00FF
    MVN #$7E, #$7F
    LDX #$0A00
    LDY #$38B4
    LDA #$0202
    MVN #$7E, #$7F
    PLB 
    PLP 
    RTS 
}

---------------------------------------------

sub_02EFB2 {
    PHP 
    PHB 
    REP #$20
    LDA $7E38AC
    STA $0656
    LDA $7E38AE
    STA $0658
    LDA $7E38B0
    STA $joypad_mask_std
    LDA $0DBE
    STA $0DBC
    LDX #$0000

  code_02EFD4:
    LDA $7E389C, X
    STA $004E, X
    INX 
    INX 
    CPX #$0010
    BNE code_02EFD4
    LDX #$0000

  code_02EFE5:
    LDA $7E3890, X
    STA $06BE, X
    INX 
    INX 
    CPX #$000C
    BNE code_02EFE5
    LDX #$3490
    LDY #$0E00
    LDA #$00FF
    MVN #$00, #$7E
    LDY #$3000
    LDA #$00FF
    MVN #$7E, #$7E
    LDX #$E000
    LDY #$1000
    LDA #$0FFF
    MVN #$00, #$7F
    LDY #$1000
    LDA #$0FFF
    MVN #$7F, #$7F
    LDX #$3690
    LDY #$0F00
    LDA #$00FF
    MVN #$00, #$7E
    LDY #$0F00
    LDA #$00FF
    MVN #$7F, #$7E
    PLB 
    PLP 
    RTS 
}

---------------------------------------------

sub_02F035 {
    PHP 
    PHB 
    REP #$20
    LDX #$38B4
    LDY #$0A00
    LDA #$0202
    MVN #$7F, #$7E
    PLB 
    PLP 
    RTS 
}