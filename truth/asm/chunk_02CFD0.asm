?BANK 02
?INCLUDE 'player_character'
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'

!camera_offset_x                06D6
!camera_offset_y                06D8
!camera_bounds_x                06DA
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

func_02CFD0 {
    PHP 
    PHD 
    PHX 
    STX $000A
    LDA #$0000
    TCD 
    LDA $24
    STZ $24
    STZ $AA
    PHA 
    LDA $0010, X
    AND #$FFFB
    STA $0010, X
    LDA $20
    BEQ code_02D002
    BPL code_02CFFA
    LDA #$0040
    TSB $AA
    JSR $&sub_02DB80
    BRA code_02D002
}

code_02CFFA {
    LDA #$0040
    TSB $AA
    JSR $&func_02D6DC
}

code_02D002 {
    REP #$20
    LDX $player_actor
    LDA $22
    LSR 
    LSR 
    STA $0014, X
    LDA $26
    LSR 
    LSR 
    STA $0016, X
    STZ $20
    PLA 
    STA $24
    BEQ code_02D034
    BPL code_02D02A
    LDA $AA
    BIT #$0800
    BNE code_02D034
    JSR $&sub_02D038
    BRA code_02D034
}

code_02D02A {
    LDA $AA
    BIT #$0400
    BNE code_02D034
    JSR $&sub_02D376
}

code_02D034 {
    PLX 
    PLD 
    PLP 
    RTL 
}

---------------------------------------------

sub_02D038 {
    SEP #$20
    JSR $&sub_02E1F1
    BCC code_02D054
    CMP #$06
    BNE code_02D046
    JMP $&func_02D188
}

code_02D046 {
    CMP #$03
    BNE code_02D04D
    JMP $&func_02D0EE
}

code_02D04D {
    CMP #$0C
    BNE code_02D054
    JMP $&func_02D122
}

code_02D054 {
    JSR $&sub_02E1A9
    CMP #$09
    BNE code_02D05E
    JMP $&func_02D1F2
}

code_02D05E {
    JSR $&sub_02E263
    CMP #$0E
    BCS code_02D0AF
    CMP #$08
    BEQ code_02D0AF
    CMP #$02
    BEQ func_02D0D4
    CMP #$06
    BNE code_02D074
    JMP $&func_02D1CE
}

code_02D074 {
    JSR $&sub_02E37C
    BCS code_02D082
    CMP #$09
    BNE code_02D080
    JMP $&func_02D238
}

code_02D080 {
    BRA code_02D0A5
}

code_02D082 {
    CMP #$09
    BEQ code_02D0AF
    JSR $&sub_02E343
    STX $00
    JSR $&sub_02E2FC
    CMP #$0E
    BCS code_02D0AF
    CMP #$08
    BEQ code_02D0AF
    CMP #$02
    BEQ code_02D0AF
    CMP #$09
    BNE code_02D0A1
    JMP $&func_02D238
}

code_02D0A1 {
    CMP #$06
    BEQ code_02D0AF
}

code_02D0A5 {
    REP #$20
    LDA $26
    CLC 
    ADC $24
    STA $26
    RTS 
}

code_02D0AF {
    JSR $&sub_02E15B
    JSR $&sub_02D2BF
    BCS sub_02D0BC
    PHP 
    REP #$20
    BRA code_02D0C2
}

---------------------------------------------

sub_02D0BC {
    PHP 
    REP #$20
    STZ $player_speed_ns
}

code_02D0C2 {
    LDA $24
    CLC 
    ADC $26
    AND #$FFC0
    CLC 
    ADC #$0040
    STA $26
    STZ $24
    PLP 
    RTS 
}

---------------------------------------------

func_02D0D4 {
    JSR $&sub_02E37C
    BCS code_02D0AF
    PHY 
    LDY $player_actor
    REP #$20
    LDA #$&func_02C7B6
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    PLY 
    BRA code_02D0AF
}

---------------------------------------------

func_02D0EE {
    JSR $&sub_02E1A9
    CMP #$03
    BNE code_02D0AF
    JSR $&sub_02E389
    BCC code_02D11A
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$03
    BEQ code_02D11A
    LDA $26
    CLC 
    ADC $24
    LSR 
    LSR 
    AND #$0F
    SEC 
    SBC #$10
    EOR #$FF
    INC 
    CMP #$08
    BPL code_02D11A
    JMP $&func_02E16E
}

code_02D11A {
    LDA #$10
    TSB $09AF
    JMP $&func_02E16E
}

---------------------------------------------

func_02D122 {
    JSR $&sub_02E1A9
    CMP #$0C
    BNE code_02D0AF
    JSR $&sub_02E389
    BCC code_02D14E
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$0C
    BEQ code_02D14E
    LDA $24
    CLC 
    ADC $26
    LSR 
    LSR 
    AND #$0F
    SEC 
    SBC #$10
    EOR #$FF
    INC 
    CMP #$08
    BPL code_02D14E
    JMP $&func_02E16E
}

code_02D14E {
    LDA #$10
    TSB $09AF
    REP #$20
    LDA $09C6
    BMI code_02D15D
    STZ $09C6
}

code_02D15D {
    LDA $24
    CLC 
    ADC $09C6
    STA $09C6
    EOR #$FFFF
    INC 
    LSR 
    LSR 
    LSR 
    LSR 
    BEQ code_02D185
    STA $24
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $09C6
    STA $09C6
    LDA $24
    EOR #$FFFF
    INC 
    STA $24
}

code_02D185 {
    JMP $&func_02E16E
}

---------------------------------------------

func_02D188 {
    JSR $&sub_02E183
    CMP #$06
    BNE code_02D192
    JMP $&func_02E154
}

code_02D192 {
    JSR $&sub_02E263
    JSR $&sub_02E389
    BCC code_02D1B2
    CMP #$06
    BNE code_02D1B2

  code_02D19E:
    JSR $&sub_02E343
    STX $00
    JSR $&sub_02E2FC
    BNE rep_stz_rts_1
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    BNE rep_stz_rts_1
    BRA code_02D1C6
}

code_02D1B2 {
    JSR $&sub_02DC10
    JSR $&sub_02E263
    CMP #$06
    BEQ code_02D1C6

  code_02D1BC:
    REP #$20
    STZ $24
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02D1C6 {
    REP #$20
    JSR $&sub_02D246
    JMP $&func_02D69A
}

---------------------------------------------

func_02D1CE {
    LDA $AB
    BIT #$02
    BEQ code_02D1E0
    JSR $&sub_02E37C
    BCS code_02D1E0
    REP #$20
    STZ $24
    JMP $&func_02E16E
}

code_02D1E0 {
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    CMP #$0E
    BCS code_02D1BC
    BRA code_02D19E
}

---------------------------------------------

rep_stz_rts_1 {
    REP #$20
    STZ $player_speed_ns
    RTS 
}

---------------------------------------------

func_02D1F2 {
    JSR $&sub_02E1CD
    CMP #$09
    BNE code_02D1FC
    JMP $&func_02E154
}

code_02D1FC {
    JSR $&sub_02E20D
    JSR $&sub_02E389
    BCC code_02D21C
    CMP #$09
    BNE code_02D21C

  code_02D208:
    JSR $&sub_02E35D
    STX $00
    JSR $&sub_02E2FC
    BNE rep_stz_rts_2
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    BNE rep_stz_rts_2
    BRA code_02D230
}

code_02D21C {
    JSR $&sub_02D760
    JSR $&sub_02E20D
    CMP #$09
    BEQ code_02D230
    REP #$20
    STZ $24
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02D230 {
    REP #$20
    JSR $&sub_02D246
    JMP $&func_02D655
}

---------------------------------------------

func_02D238 {
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    BRA code_02D208
}

---------------------------------------------

rep_stz_rts_2 {
    REP #$20
    STZ $player_speed_ns
    RTS 
}

---------------------------------------------

sub_02D246 {
    REP #$20
    LDA $1E
    AND #$000F
    ORA #$FFF0
    EOR #$FFFF
    INC 
    STA $02
    RTS 
}

---------------------------------------------

sub_02D257_noref {
    REP #$20
    LDA $1A
    PHA 
    LDA $1E
    PHA 
    SEP #$20
    JSR $&sub_02E1F1
    CMP #$06
    BEQ code_02D277
    JSR $&sub_02E37C
    BCC code_02D2A3
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    CMP #$09
    BNE code_02D2A3
}

code_02D277 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
    LDA $1E
    PHA 
    LDA $24
    BEQ code_02D28D
    LSR 
    LSR 
    ORA #$C000
}

code_02D28D {
    EOR #$FFFF
    INC 
    CLC 
    ADC $01, S
    EOR $01, S
    BIT #$0010
    BEQ code_02D2A0
    LDA #$0010
    STA $02
}

code_02D2A0 {
    PLA 
    BRA code_02D2AD
}

code_02D2A3 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
}

code_02D2AD {
    LDA $1E
    AND #$000F
    ORA #$FFF0
    EOR #$FFFF
    INC 
    CLC 
    ADC $02
    STA $02
    RTS 
}

---------------------------------------------

sub_02D2BF {
    REP #$20
    LDA $AA
    BIT #$0040
    BNE code_02D339
    LDA $7FC000, X
    AND #$00FF
    BIT #$00F0
    BNE code_02D339
    LDA $22
    LSR 
    LSR 
    SEC 
    SBC #$0008
    AND #$000F
    STA $04
    BEQ code_02D339
    CMP #$0006
    BCC code_02D30D
    JSR $&sub_02E20D
    CMP #$000E
    BCS code_02D30D
    CMP #$0006
    BEQ code_02D30D
    LDX #$0022
    LDA $00, X
    SEC 
    SBC #$0020
    STA $00, X
    JSR $&sub_02D33B
    LDA $00, X
    CLC 
    ADC #$0020
    STA $00, X
    CLC 
    RTS 
}

code_02D30D {
    LDA $04
    CMP #$0009
    BCS code_02D339
    JSR $&sub_02E263
    CMP #$000E
    BCS code_02D339
    CMP #$0009
    BEQ code_02D339
    LDX #$0022
    LDA $00, X
    SEC 
    SBC #$0020
    STA $00, X
    JSR $&sub_02D354
    LDA $00, X
    CLC 
    ADC #$0020
    STA $00, X
    CLC 
    RTS 
}

code_02D339 {
    SEC 
    RTS 
}

---------------------------------------------

sub_02D33B {
    LDA $00, X
    PHA 
    CLC 
    ADC #$0008
    STA $00, X
    EOR $01, S
    BIT #$0040
    BEQ code_02D352
    LDA $00, X
    AND #$FFC0
    STA $00, X
}

code_02D352 {
    PLA 
    RTS 
}

---------------------------------------------

sub_02D354 {
    LDA $00, X
    PHA 
    SEC 
    SBC #$0008
    STA $00, X
    EOR $01, S
    BIT #$0040
    BEQ code_02D374
    LDA $00, X
    BIT #$003F
    BEQ code_02D374
    AND #$FFC0
    CLC 
    ADC #$0040
    STA $00, X
}

code_02D374 {
    PLA 
    RTS 
}

---------------------------------------------

sub_02D376 {
    SEP #$20
    JSR $&sub_02E1CD
    CMP #$09
    BNE code_02D382
    JMP $&func_02D4DA
}

code_02D382 {
    CMP #$03
    BNE code_02D389
    JMP $&func_02D44E
}

code_02D389 {
    CMP #$0C
    BNE code_02D390
    JMP $&func_02D47F
}

code_02D390 {
    JSR $&sub_02E183
    CMP #$06
    BNE code_02D39A
    JMP $&func_02D536
}

code_02D39A {
    JSR $&sub_02E285
    CMP #$0E
    BCC code_02D3A4
    JMP $&func_02D3EA
}

code_02D3A4 {
    CMP #$02
    BEQ func_02D40B
    CMP #$08
    BEQ func_02D425
    CMP #$09
    BNE code_02D3B3
    JMP $&func_02D524
}

code_02D3B3 {
    JSR $&sub_02E37C
    BCS code_02D3C1
    CMP #$06
    BNE code_02D3BF
    JMP $&func_02D57C
}

code_02D3BF {
    BRA code_02D3E0
}

code_02D3C1 {
    CMP #$06
    BEQ func_02D3EA
    JSR $&sub_02E343
    STX $00
    JSR $&sub_02E2FC
    CMP #$0E
    BCS func_02D3EA
    CMP #$02
    BEQ func_02D3EA
    CMP #$06
    BNE code_02D3DC
    JMP $&func_02D57C
}

code_02D3DC {
    CMP #$09
    BEQ func_02D3EA
}

code_02D3E0 {
    REP #$20
    LDA $26
    CLC 
    ADC $24
    STA $26
    RTS 
}

---------------------------------------------

func_02D3EA {
    JSR $&sub_02E15B
    JSR $&sub_02D584
    BCS sub_02D3F7
    PHP 
    REP #$20
    BRA code_02D3FD
}

---------------------------------------------

sub_02D3F7 {
    PHP 
    REP #$20
    STZ $player_speed_ns
}

code_02D3FD {
    LDA $24
    CLC 
    ADC $26
    AND #$FFC0
    STA $26
    STZ $24
    PLP 
    RTS 
}

---------------------------------------------

func_02D40B {
    JSR $&sub_02E37C
    BCS func_02D3EA
    PHY 
    REP #$20
    LDY $player_actor
    LDA #$&func_02C7E2
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    PLY 
    BRA func_02D3EA
}

---------------------------------------------

func_02D425 {
    JSR $&sub_02E37C
    BCC code_02D434
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    CMP #$08
    BNE func_02D3EA
}

code_02D434 {
    LDA #$08
    TSB $09AF
    PHY 
    LDY $player_actor
    REP #$20
    LDA #$&func_02C61E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    PLY 
    BRA sub_02D3F7
}

---------------------------------------------

func_02D44E {
    JSR $&sub_02E183
    CMP #$03
    BEQ code_02D458
    JMP $&func_02D3EA
}

code_02D458 {
    JSR $&sub_02E389
    BCC code_02D477
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    CMP #$03
    BEQ code_02D477
    LDA $24
    CLC 
    ADC $26
    LSR 
    LSR 
    AND #$0F
    CMP #$08
    BPL code_02D477
    JMP $&func_02E16E
}

code_02D477 {
    LDA #$10
    TSB $09AF
    JMP $&func_02E16E
}

---------------------------------------------

func_02D47F {
    JSR $&sub_02E183
    CMP #$0C
    BEQ code_02D489
    JMP $&func_02D3EA
}

code_02D489 {
    JSR $&sub_02E389
    BCC code_02D4A8
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    CMP #$0C
    BEQ code_02D4A8
    LDA $24
    CLC 
    ADC $26
    LSR 
    LSR 
    AND #$0F
    CMP #$08
    BPL code_02D4A8
    JMP $&func_02E16E
}

code_02D4A8 {
    LDA #$10
    TSB $09AF
    REP #$20
    LDA $09C6
    BPL code_02D4B7
    STZ $09C6
}

code_02D4B7 {
    LDA $24
    CLC 
    ADC $09C6
    STA $09C6
    LSR 
    LSR 
    LSR 
    LSR 
    BEQ code_02D4D7
    STA $24
    ASL 
    ASL 
    ASL 
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $09C6
    STA $09C6
}

code_02D4D7 {
    JMP $&func_02E16E
}

---------------------------------------------

func_02D4DA {
    JSR $&sub_02E1A9
    CMP #$09
    BNE code_02D4E4
    JMP $&func_02E154
}

code_02D4E4 {
    JSR $&sub_02E285
    JSR $&sub_02E389
    BCC code_02D504
    CMP #$09
    BNE code_02D504

  code_02D4F0:
    JSR $&sub_02E343
    STX $00
    JSR $&sub_02E2FC
    BNE rep_stz_rts_3
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    BNE rep_stz_rts_3
    BRA code_02D51C
}

code_02D504 {
    JSR $&sub_02DC10
    JSR $&sub_02E285
    BCC code_02D51C
    CMP #$01
    BEQ code_02D51C
    CMP #$09
    BEQ code_02D51C
    REP #$20

  code_02D516:
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02D51C {
    REP #$20
    JSR $&sub_02D5F9
    JMP $&func_02D69A
}

---------------------------------------------

func_02D524 {
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    CMP #$0E
    BCS code_02D516
    BRA code_02D4F0
}

---------------------------------------------

rep_stz_rts_3 {
    REP #$20
    STZ $player_speed_ns
    RTS 
}

---------------------------------------------

func_02D536 {
    JSR $&sub_02E1F1
    CMP #$06
    BNE code_02D540
    JMP $&func_02E154
}

code_02D540 {
    JSR $&sub_02E237
    JSR $&sub_02E389
    BCC code_02D560
    CMP #$06
    BNE code_02D560

  code_02D54C:
    JSR $&sub_02E35D
    STX $00
    JSR $&sub_02E2FC
    BNE rep_stz_rts_4
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    BNE rep_stz_rts_4
    BRA code_02D574
}

code_02D560 {
    JSR $&sub_02D760
    JSR $&sub_02E237
    CMP #$06
    BEQ code_02D574
    REP #$20
    STZ $24
    JSR $&sub_02D0BC
    JMP $&func_02E16E
}

code_02D574 {
    REP #$20
    JSR $&sub_02D5F9
    JMP $&func_02D655
}

---------------------------------------------

func_02D57C {
    BRA code_02D54C
}

---------------------------------------------

rep_stz_rts_4 {
    REP #$20
    STZ $player_speed_ns
    RTS 
}

---------------------------------------------

sub_02D584 {
    REP #$20
    LDA $AA
    BIT #$0040
    BNE code_02D5F7
    LDA $7FC000, X
    AND #$00FF
    BIT #$00F0
    BNE code_02D5F7
    LDA $22
    LSR 
    LSR 
    AND #$000F
    SEC 
    SBC #$0008
    AND #$000F
    STA $04
    BEQ code_02D5F7
    CMP #$0006
    BCC code_02D5D0
    JSR $&sub_02E237
    CMP #$000E
    BCS code_02D5D0
    LDX #$0022
    LDA $00, X
    SEC 
    SBC #$0020
    STA $00, X
    JSR $&sub_02D33B
    LDA $00, X
    CLC 
    ADC #$0020
    STA $00, X
    CLC 
    RTS 
}

code_02D5D0 {
    LDA $04
    CMP #$0009
    BCS code_02D5F7
    JSR $&sub_02E285
    CMP #$000E
    BCS code_02D5F7
    LDX #$0022
    LDA $00, X
    SEC 
    SBC #$0020
    STA $00, X
    JSR $&sub_02D354
    LDA $00, X
    CLC 
    ADC #$0020
    STA $00, X
    CLC 
    RTS 
}

code_02D5F7 {
    SEC 
    RTS 
}

---------------------------------------------

sub_02D5F9 {
    REP #$20
    LDA $1A
    PHA 
    LDA $1E
    PHA 
    SEP #$20
    JSR $&sub_02E1CD
    CMP #$09
    BEQ code_02D619
    JSR $&sub_02E37C
    BCC code_02D640
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    CMP #$06
    BNE code_02D640
}

code_02D619 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
    LDA $1E
    PHA 
    LDA $24
    LSR 
    LSR 
    SEC 
    SBC $01, S
    EOR #$FFFF
    INC 
    EOR $01, S
    BIT #$0010
    BEQ code_02D63D
    LDA #$0010
    STA $02
}

code_02D63D {
    PLA 
    BRA code_02D64A
}

code_02D640 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
}

code_02D64A {
    LDA $1E
    AND #$000F
    CLC 
    ADC $02
    STA $02
    RTS 
}

---------------------------------------------

func_02D655 {
    LDX $player_actor
    LDA $0014, X
    SEC 
    SBC #$0008
    AND #$000F
    BNE code_02D667
    LDA #$0010
}

code_02D667 {
    CLC 
    ADC $02
    CMP #$0011
    BCS code_02D672
    JMP $&func_02E16E
}

code_02D672 {
    LDA #$0010
    SEC 
    SBC $02
    STA $02
    LDA $0014, X
    SEC 
    SBC #$0008
    BIT #$000F
    BNE code_02D68A
    SEC 
    SBC #$0010
}

code_02D68A {
    AND #$FFF0
    ORA $02
    CLC 
    ADC #$0008
    ASL 
    ASL 
    STA $22
    JMP $&func_02E16E
}

---------------------------------------------

func_02D69A {
    LDX $player_actor
    LDA $0014, X
    SEC 
    SBC #$0008
    ORA #$FFF0
    EOR #$FFFF
    INC 
    CLC 
    ADC $02
    CMP #$0011
    BCS code_02D6B6
    JMP $&func_02E16E
}

code_02D6B6 {
    LDA #$0010
    SEC 
    SBC $02
    ORA #$FFF0
    EOR #$FFFF
    INC 
    STA $02
    LDA $0014, X
    SEC 
    SBC #$0008
    AND #$FFF0
    ORA $02
    CLC 
    ADC #$0008
    ASL 
    ASL 
    STA $22
    JMP $&func_02E16E
}

---------------------------------------------

func_02D6DC {
    SEP #$20
    JSR $&sub_02B1BB
    BNE code_02D6EB
    BCS code_02D6E8
    JMP $&func_02D843
}

code_02D6E8 {
    JMP $&func_02D986
}

code_02D6EB {
    JSR $&sub_02E1A9
    CMP #$09
    BNE code_02D6F5
    JMP $&code_02D79B
}

code_02D6F5 {
    JSR $&sub_02E183
    CMP #$06
    BNE code_02D6FF
    JMP $&code_02D7EF
}

code_02D6FF {
    JSR $&sub_02E20D
    CMP #$0E
    BCS code_02D753
    CMP #$09
    BNE code_02D70D
    JMP $&func_02D7E1
}

code_02D70D {
    JSR $&sub_02E389
    BCS code_02D71B
    CMP #$06
    BNE code_02D719
    JMP $&code_02D81B
}

code_02D719 {
    BRA code_02D734
}

code_02D71B {
    CMP #$06
    BEQ code_02D753
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$0E
    BCS code_02D753
    CMP #$06
    BNE code_02D730
    JMP $&code_02D81B
}

code_02D730 {
    CMP #$09
    BEQ code_02D753
}

code_02D734 {
    CMP #$07
    BEQ func_02D77C
    JSR $&sub_02E1CD
    CMP #$05
    BNE code_02D742
    JMP $&func_02DA8A
}

code_02D742 {
    CMP #$0A
    BNE code_02D749
    JMP $&func_02D93F
}

code_02D749 {
    REP #$20
    LDA $22
    CLC 
    ADC $20
    STA $22
    RTS 
}

code_02D753 {
    JSR $&sub_02E15B
    JSR $&sub_02DACD
    BCS sub_02D760
    PHP 
    REP #$20
    BRA code_02D766
}

---------------------------------------------

sub_02D760 {
    PHP 
    REP #$20
    STZ $player_speed_ew
}

code_02D766 {
    LDA $20
    CLC 
    ADC $22
    SEC 
    SBC #$0020
    AND #$FFC0
    CLC 
    ADC #$0020
    STA $22
    STZ $20
    PLP 
    RTS 
}

---------------------------------------------

func_02D77C {
    JSR $&sub_02E389
    BCS code_02D753
    JSR $&sub_02E0FA
    PHY 
    REP #$20
    LDY $player_actor
    LDA #$&func_02C8BD
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    PLY 
    BRA code_02D753
}

---------------------------------------------

func_02D799 {
    SEP #$20
}

code_02D79B {
    LDA #$80
    TSB $AB
    JSR $&sub_02E20D
    JSR $&sub_02E37C
    BCC code_02D7C7
    CMP #$09
    BNE code_02D7C7

  code_02D7AB:
    JSR $&sub_02E313
    STX $00
    JSR $&sub_02E2FC
    BEQ code_02D7B9
    CMP #$0A
    BNE rep_stz_rts_5
}

code_02D7B9 {
    JSR $&sub_02E35D
    JSR $&sub_02E2FC
    BEQ code_02D7D9
    CMP #$09
    BNE rep_stz_rts_5
    BRA code_02D7D9
}

code_02D7C7 {
    JSR $&sub_02D0BC
    JSR $&sub_02E20D
    BCC code_02D7D9
    CMP #$09
    BEQ code_02D7D9
    JSR $&sub_02D760
    JMP $&func_02E16E
}

code_02D7D9 {
    REP #$20
    JSR $&sub_02DB22
    JMP $&func_02E0AB
}

---------------------------------------------

func_02D7E1 {
    LDA #$04
    TSB $AB
    BRA code_02D7AB
}

---------------------------------------------

rep_stz_rts_5 {
    REP #$20
    STZ $player_speed_ew
    RTS 
}

---------------------------------------------

func_02D7ED {
    SEP #$20
}

code_02D7EF {
    LDA #$80
    TSB $AB
    JSR $&sub_02E237
    JSR $&sub_02E37C
    BCC code_02D823
    CMP #$06
    BNE code_02D823

  code_02D7FF:
    JSR $&sub_02E32B
    STX $00
    JSR $&sub_02E2FC
    BEQ code_02D80D
    CMP #$05
    BNE rep_stz_rts_6
}

code_02D80D {
    JSR $&sub_02E35D
    JSR $&sub_02E2FC
    BEQ code_02D835
    CMP #$06
    BNE rep_stz_rts_6
    BRA code_02D835
}

code_02D81B {
    STX $00
    LDA #$08
    TSB $AB
    BRA code_02D7FF
}

code_02D823 {
    JSR $&sub_02D3F7
    JSR $&sub_02E237
    BCC code_02D835
    CMP #$06
    BEQ code_02D835
    JSR $&sub_02D760
    JMP $&func_02E16E
}

code_02D835 {
    REP #$20
    JSR $&sub_02DB22
    JMP $&func_02E060
}

---------------------------------------------

rep_stz_rts_6 {
    REP #$20
    STZ $player_speed_ew
    RTS 
}

---------------------------------------------

func_02D843 {
    JSR $&sub_02E0FA
    JSR $&sub_02E1A9
    LDA $1A
    SEC 
    SBC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000A
    BEQ code_02D8C7
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$000A
    BEQ code_02D8C7
    JSR $&sub_02E20D
    LDA $1A
    SEC 
    SBC #$0009
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000A
    BEQ code_02D899
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$000A
    BEQ code_02D899
    JMP $&func_02D978
}

code_02D899 {
    JSR $&sub_02E13F
    BNE code_02D8A1
    JMP $&func_02E16E
}

code_02D8A1 {
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    AND #$000F
    ASL 
    ASL 
    CLC 
    ADC $26
    STA $26
    CLC 
    ADC $20
    CLC 
    ADC $22
    LSR 
    LSR 
    LSR 
    BCC code_02D8CE
    LDA $26
    CLC 
    ADC #$0004
    STA $26
    BRA code_02D8CE
}

code_02D8C7 {
    LDA $20
    CLC 
    ADC $26
    STA $26
}

code_02D8CE {
    LDA #$1000
    TSB $player_flags
    SEP #$20
    JSR $&sub_02E20D
    CMP #$0E
    BCS code_02D8EA
    JSR $&sub_02E237
    CMP #$0E
    BCS code_02D8E7
    JMP $&func_02E16E
}

code_02D8E7 {
    JMP $&code_02D92F
}

code_02D8EA {
    JSR $&sub_02E237
    CMP #$0E
    BCS code_02D8F4
    JMP $&code_02D937
}

code_02D8F4 {
    REP #$20
    LDA $22
    PHA 
    CLC 
    ADC $20
    LSR 
    LSR 
    SEC 
    SBC #$0008
    BIT #$000F
    BEQ code_02D90A
    AND #$FFF0
}

code_02D90A {
    CLC 
    ADC #$0008
    ASL 
    ASL 
    STA $22
    SEC 
    SBC $01, S
    SEC 
    SBC $20
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
    PLA 
    STZ $20
    STZ $24
    STZ $player_speed_ew
    JSR $&sub_02E15B
    JMP $&func_02E16E
}

code_02D92F {
    REP #$20
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02D937 {
    REP #$20
    JSR $&sub_02D0BC
    JMP $&func_02E16E
}

---------------------------------------------

func_02D93F {
    JSR $&sub_02E0FA
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000A
    BEQ code_02D958
    JMP $&func_02E16E
}

code_02D958 {
    JSR $&sub_02E13F
    BNE code_02D960
    JMP $&code_02D8C7
}

code_02D960 {
    LDA $20
    LSR 
    LSR 
    CLC 
    ADC $1A
    AND #$000F
    ASL 
    ASL 
    SEC 
    SBC $20
    EOR #$FFFF
    INC 
    STA $24
    JMP $&code_02D8CE
}

---------------------------------------------

func_02D978 {
    JSR $&sub_02E20D
    CMP #$0009
    BNE code_02D983
    JMP $&func_02D799
}

code_02D983 {
    JMP $&func_02E16E
}

---------------------------------------------

func_02D986 {
    JSR $&sub_02E0FA
    JSR $&sub_02E183
    LDA $1A
    SEC 
    SBC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$0005
    BEQ code_02DA0E
    JSR $&sub_02E32B
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$0005
    BEQ code_02DA0E
    JSR $&sub_02E20D
    LDA $1A
    SEC 
    SBC #$0009
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$0005
    BEQ code_02D9DC
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$0005
    BEQ code_02D9DC
    JMP $&func_02DABF
}

code_02D9DC {
    JSR $&sub_02E13F
    BNE code_02D9E4
    JMP $&func_02E16E
}

code_02D9E4 {
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    AND #$000F
    ASL 
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
    CLC 
    ADC $20
    CLC 
    ADC $22
    LSR 
    LSR 
    LSR 
    BCC code_02DA19
    LDA $26
    SEC 
    SBC #$0004
    STA $26
    BRA code_02DA19
}

code_02DA0E {
    LDA $20
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
}

code_02DA19 {
    LDA #$1000
    TSB $player_flags
    SEP #$20
    JSR $&sub_02E20D
    CMP #$0E
    BCS code_02DA35
    JSR $&sub_02E237
    CMP #$0E
    BCS code_02DA32
    JMP $&func_02E16E
}

code_02DA32 {
    JMP $&code_02DA7A
}

code_02DA35 {
    JSR $&sub_02E237
    CMP #$0E
    BCS code_02DA3F
    JMP $&code_02DA82
}

code_02DA3F {
    REP #$20
    LDA $22
    PHA 
    CLC 
    ADC $20
    LSR 
    LSR 
    SEC 
    SBC #$0008
    BIT #$000F
    BEQ code_02DA55
    AND #$FFF0
}

code_02DA55 {
    CLC 
    ADC #$0008
    ASL 
    ASL 
    STA $22
    SEC 
    SBC $01, S
    SEC 
    SBC $20
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
    PLA 
    STZ $20
    STZ $24
    STZ $player_speed_ew
    JSR $&sub_02E15B
    JMP $&func_02E16E
}

code_02DA7A {
    REP #$20
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02DA82 {
    REP #$20
    JSR $&sub_02D0BC
    JMP $&func_02E16E
}

---------------------------------------------

func_02DA8A {
    JSR $&sub_02E0FA
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$0005
    BEQ code_02DAA3
    JMP $&func_02E16E
}

code_02DAA3 {
    JSR $&sub_02E13F
    BNE code_02DAAB
    JMP $&code_02DA0E
}

code_02DAAB {
    LDA $20
    LSR 
    LSR 
    CLC 
    ADC $1A
    AND #$000F
    ASL 
    ASL 
    SEC 
    SBC $20
    STA $24
    JMP $&code_02DA19
}

---------------------------------------------

func_02DABF {
    JSR $&sub_02E237
    CMP #$0006
    BNE code_02DACA
    JMP $&func_02D7ED
}

code_02DACA {
    JMP $&func_02E16E
}

---------------------------------------------

sub_02DACD {
    PHP 
    REP #$20
    LDA $06, S
    BNE code_02DB1F
    LDA $7FC000, X
    AND #$00FF
    BIT #$00F0
    BNE code_02DB1F
    LDA $26
    LSR 
    LSR 
    AND #$000F
    BEQ code_02DB1F
    STA $04
    CMP #$0004
    BCC code_02DB04
    JSR $&sub_02E237
    AND #$00FF
    CMP #$000E
    BCS code_02DB04
    LDX #$0026
    JSR $&sub_02D33B
    PLP 
    CLC 
    RTS 
}

code_02DB04 {
    LDA $04
    CMP #$000B
    BCS code_02DB1F
    JSR $&sub_02E20D
    AND #$00FF
    CMP #$000E
    BCS code_02DB1F
    LDX #$0026
    JSR $&sub_02D354
    PLP 
    CLC 
    RTS 
}

code_02DB1F {
    PLP 
    SEC 
    RTS 
}

---------------------------------------------

sub_02DB22 {
    REP #$20
    STZ $02
    LDA $1A
    PHA 
    LDA $1E
    PHA 
    SEP #$20
    JSR $&sub_02E1A9
    CMP #$09
    BEQ code_02DB44
    JSR $&sub_02E389
    BCC code_02DB6B
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$06
    BNE code_02DB6B
}

code_02DB44 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
    LDA $1A
    PHA 
    LDA $20
    LSR 
    LSR 
    SEC 
    SBC $01, S
    EOR #$FFFF
    INC 
    EOR $01, S
    BIT #$0010
    BEQ code_02DB68
    LDA #$0010
    STA $02
}

code_02DB68 {
    PLA 
    BRA code_02DB75
}

code_02DB6B {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
}

code_02DB75 {
    LDA $1A
    AND #$000F
    CLC 
    ADC $02
    STA $02
    RTS 
}

---------------------------------------------

sub_02DB80 {
    SEP #$20
    LDA #$02
    TSB $AB
    JSR $&sub_02B168
    BNE code_02DB93
    BCS code_02DB90
    JMP $&func_02DE51
}

code_02DB90 {
    JMP $&func_02DCF3
}

code_02DB93 {
    JSR $&sub_02E1F1
    BCC code_02DB9F
    CMP #$06
    BNE code_02DB9F
    JMP $&code_02DC4B
}

code_02DB9F {
    JSR $&sub_02E1CD
    BCC code_02DBAB
    CMP #$09
    BNE code_02DBAB
    JMP $&code_02DC9F
}

code_02DBAB {
    JSR $&sub_02E263
    BCC code_02DBBB
    CMP #$0E
    BCS code_02DC03
    CMP #$06
    BNE code_02DBBB
    JMP $&code_02DC77
}

code_02DBBB {
    JSR $&sub_02E389
    BCS code_02DBC9
    CMP #$09
    BNE code_02DBC7
    JMP $&code_02DCCB
}

code_02DBC7 {
    BRA code_02DBE2
}

code_02DBC9 {
    CMP #$09
    BEQ code_02DC03
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$0E
    BCS code_02DC03
    CMP #$09
    BNE code_02DBDE
    JMP $&code_02DCCB
}

code_02DBDE {
    CMP #$06
    BEQ code_02DC03
}

code_02DBE2 {
    CMP #$07
    BEQ func_02DC2C
    JSR $&sub_02E1A9
    BCC code_02DBF9
    CMP #$05
    BNE code_02DBF2
    JMP $&func_02DE02
}

code_02DBF2 {
    CMP #$0A
    BNE code_02DBF9
    JMP $&func_02DF5C
}

code_02DBF9 {
    REP #$20
    LDA $22
    CLC 
    ADC $20
    STA $22
    RTS 
}

code_02DC03 {
    JSR $&sub_02E15B
    JSR $&sub_02DFA7
    BCS sub_02DC10
    PHP 
    REP #$20
    BRA code_02DC16
}

---------------------------------------------

sub_02DC10 {
    PHP 
    REP #$20
    STZ $player_speed_ew
}

code_02DC16 {
    LDA $20
    CLC 
    ADC $22
    SEC 
    SBC #$0020
    AND #$FFC0
    CLC 
    ADC #$0060
    STA $22
    STZ $20
    PLP 
    RTS 
}

---------------------------------------------

func_02DC2C {
    JSR $&sub_02E389
    BCS code_02DC03
    JSR $&sub_02E0FA
    PHY 
    REP #$20
    LDY $player_actor
    LDA #$&func_02C93B
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    PLY 
    BRA code_02DC03
}

---------------------------------------------

func_02DC49 {
    SEP #$20
}

code_02DC4B {
    LDA #$80
    TSB $AB
    JSR $&sub_02E263
    JSR $&sub_02E37C
    BCC code_02DC7D
    CMP #$06
    BNE code_02DC7D

  code_02DC5B:
    JSR $&sub_02E313
    STX $00
    JSR $&sub_02E2FC
    BEQ code_02DC69
    CMP #$05
    BNE code_02DC97
}

code_02DC69 {
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    BEQ code_02DC8F
    CMP #$06
    BNE code_02DC97
    BRA code_02DC8F
}

code_02DC77 {
    LDA #$04
    TSB $AB
    BRA code_02DC5B
}

code_02DC7D {
    JSR $&sub_02D0BC
    JSR $&sub_02E263
    BCC code_02DC8F
    CMP #$06
    BEQ code_02DC8F
    JSR $&sub_02DC10
    JMP $&func_02E16E
}

code_02DC8F {
    REP #$20
    JSR $&sub_02DFF6
    JMP $&func_02E0AB
}

code_02DC97 {
    REP #$20
    STZ $player_speed_ew
    RTS 
}

---------------------------------------------

func_02DC9D {
    SEP #$20
}

code_02DC9F {
    LDA #$80
    TSB $AB
    JSR $&sub_02E285
    JSR $&sub_02E37C
    BCC code_02DCD3
    CMP #$09
    BNE code_02DCD3

  code_02DCAF:
    JSR $&sub_02E32B
    STX $00
    JSR $&sub_02E2FC
    BEQ code_02DCBD
    CMP #$0A
    BNE code_02DCED
}

code_02DCBD {
    JSR $&sub_02E343
    JSR $&sub_02E2FC
    BEQ code_02DCE5
    CMP #$09
    BNE code_02DCED
    BRA code_02DCE5
}

code_02DCCB {
    STX $00
    LDA #$08
    TSB $AB
    BRA code_02DCAF
}

code_02DCD3 {
    JSR $&sub_02D3F7
    JSR $&sub_02E285
    BCC code_02DCE5
    CMP #$09
    BEQ code_02DCE5
    JSR $&sub_02DC10
    JMP $&func_02E16E
}

code_02DCE5 {
    REP #$20
    JSR $&sub_02DFF6
    JMP $&func_02E060
}

code_02DCED {
    REP #$20
    STZ $player_speed_ew
    RTS 
}

---------------------------------------------

func_02DCF3 {
    JSR $&sub_02E0FA
    JSR $&sub_02E1F1
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$0005
    BNE code_02DD0F
    JMP $&code_02DD82
}

code_02DD0F {
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$0005
    BEQ code_02DD82
    JSR $&sub_02E263
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$0005
    BEQ code_02DD4C
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$0005
    BEQ code_02DD4C
    JMP $&func_02DE43
}

code_02DD4C {
    JSR $&sub_02E13F
    BNE code_02DD54
    JMP $&func_02E16E
}

code_02DD54 {
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    AND #$000F
    EOR #$FFFF
    INC 
    CLC 
    ADC #$0010
    ASL 
    ASL 
    CLC 
    ADC $26
    STA $26
    CLC 
    ADC $20
    CLC 
    ADC $22
    LSR 
    LSR 
    LSR 
    BCC code_02DD8D
    LDA $26
    CLC 
    ADC #$0004
    STA $26
    BRA code_02DD8D
}

code_02DD82 {
    LDA $20
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
}

code_02DD8D {
    LDA #$1000
    TSB $player_flags
    SEP #$20
    JSR $&sub_02E263
    CMP #$0E
    BCS code_02DDA9
    JSR $&sub_02E285
    CMP #$0E
    BCS code_02DDA6
    JMP $&func_02E16E
}

code_02DDA6 {
    JMP $&code_02DDF2
}

code_02DDA9 {
    JSR $&sub_02E285
    CMP #$0E
    BCS code_02DDB3
    JMP $&code_02DDFA
}

code_02DDB3 {
    REP #$20
    LDA $22
    PHA 
    CLC 
    ADC $20
    LSR 
    LSR 
    SEC 
    SBC #$0008
    BIT #$000F
    BEQ code_02DDCD
    AND #$FFF0
    CLC 
    ADC #$0010
}

code_02DDCD {
    CLC 
    ADC #$0008
    ASL 
    ASL 
    STA $22
    SEC 
    SBC $01, S
    SEC 
    SBC $20
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
    PLA 
    STZ $20
    STZ $24
    STZ $player_speed_ew
    JSR $&sub_02E15B
    JMP $&func_02E16E
}

code_02DDF2 {
    REP #$20
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02DDFA {
    REP #$20
    JSR $&sub_02D0BC
    JMP $&func_02E16E
}

---------------------------------------------

func_02DE02 {
    JSR $&sub_02E0FA
    LDA $1A
    SEC 
    SBC #$0009
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$0005
    BEQ code_02DE1B
    JMP $&func_02E16E
}

code_02DE1B {
    JSR $&sub_02E13F
    BNE code_02DE23
    JMP $&code_02DD82
}

code_02DE23 {
    LDA $20
    LSR 
    LSR 
    ORA #$F000
    CLC 
    ADC $1A
    INC 
    ORA #$FFF0
    ASL 
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $20
    EOR #$FFFF
    INC 
    STA $24
    JMP $&code_02DD8D
}

---------------------------------------------

func_02DE43 {
    JSR $&sub_02E263
    CMP #$0006
    BNE code_02DE4E
    JMP $&func_02DC49
}

code_02DE4E {
    JMP $&func_02E16E
}

---------------------------------------------

func_02DE51 {
    JSR $&sub_02E0FA
    JSR $&sub_02E1CD
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000A
    BNE code_02DE6D
    JMP $&code_02DEE4
}

code_02DE6D {
    JSR $&sub_02E32B
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$000A
    BEQ code_02DEE4
    JSR $&sub_02E263
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000A
    BEQ code_02DEAA
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$000A
    BEQ code_02DEAA
    JMP $&func_02DF99
}

code_02DEAA {
    JSR $&sub_02E13F
    BNE code_02DEB2
    JMP $&func_02E16E
}

code_02DEB2 {
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    AND #$000F
    EOR #$FFFF
    INC 
    CLC 
    ADC #$0010
    ASL 
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $26
    STA $26
    CLC 
    ADC $20
    CLC 
    ADC $22
    LSR 
    LSR 
    LSR 
    BCC code_02DEEB
    LDA $26
    SEC 
    SBC #$0004
    STA $26
    BRA code_02DEEB
}

code_02DEE4 {
    LDA $20
    CLC 
    ADC $26
    STA $26
}

code_02DEEB {
    LDA #$1000
    TSB $player_flags
    SEP #$20
    JSR $&sub_02E263
    CMP #$0E
    BCS code_02DF07
    JSR $&sub_02E285
    CMP #$0E
    BCS code_02DF04
    JMP $&func_02E16E
}

code_02DF04 {
    JMP $&code_02DF4C
}

code_02DF07 {
    JSR $&sub_02E285
    CMP #$0E
    BCS code_02DF11
    JMP $&code_02DF54
}

code_02DF11 {
    REP #$20
    LDA $22
    PHA 
    CLC 
    ADC $20
    LSR 
    LSR 
    SEC 
    SBC #$0008
    BIT #$000F
    BEQ code_02DF2B
    AND #$FFF0
    CLC 
    ADC #$0010
}

code_02DF2B {
    CLC 
    ADC #$0008
    ASL 
    ASL 
    STA $22
    SEC 
    SBC $01, S
    SEC 
    SBC $20
    CLC 
    ADC $26
    STA $26
    PLA 
    STZ $20
    STZ $24
    STZ $player_speed_ew
    JSR $&sub_02E15B
    JMP $&func_02E16E
}

code_02DF4C {
    REP #$20
    JSR $&sub_02D3F7
    JMP $&func_02E16E
}

code_02DF54 {
    REP #$20
    JSR $&sub_02D0BC
    JMP $&func_02E16E
}

---------------------------------------------

func_02DF5C {
    JSR $&sub_02E0FA
    LDA $1A
    SEC 
    SBC #$0009
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000A
    BEQ code_02DF75
    JMP $&func_02E16E
}

code_02DF75 {
    JSR $&sub_02E13F
    BNE code_02DF7D
    JMP $&code_02DEE4
}

code_02DF7D {
    LDA $20
    LSR 
    LSR 
    ORA #$F000
    CLC 
    ADC $1A
    INC 
    ORA #$FFF0
    ASL 
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $20
    STA $24
    JMP $&code_02DEEB
}

---------------------------------------------

func_02DF99 {
    JSR $&sub_02E285
    CMP #$0009
    BNE code_02DFA4
    JMP $&func_02DC9D
}

code_02DFA4 {
    JMP $&func_02E16E
}

---------------------------------------------

sub_02DFA7 {
    PHP 
    REP #$20
    LDA $06, S
    BNE code_02DFF3
    LDA $7FC000, X
    AND #$00FF
    BIT #$00F0
    BNE code_02DFF3
    LDA $26
    LSR 
    LSR 
    AND #$000F
    BEQ code_02DFF3
    STA $04
    CMP #$0004
    BCC code_02DFDB
    JSR $&sub_02E285
    CMP #$000E
    BCS code_02DFDB
    LDX #$0026
    JSR $&sub_02D33B
    PLP 
    CLC 
    RTS 
}

code_02DFDB {
    LDA $04
    CMP #$000B
    BCS code_02DFF3
    JSR $&sub_02E263
    CMP #$000E
    BCS code_02DFF3
    LDX #$0026
    JSR $&sub_02D354
    PLP 
    CLC 
    RTS 
}

code_02DFF3 {
    PLP 
    SEC 
    RTS 
}

---------------------------------------------

sub_02DFF6 {
    REP #$20
    STZ $02
    LDA $1A
    PHA 
    LDA $1E
    PHA 
    SEP #$20
    JSR $&sub_02E1F1
    CMP #$09
    BEQ code_02E018
    JSR $&sub_02E389
    BCC code_02E044
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$06
    BNE code_02E044
}

code_02E018 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
    LDA $1A
    PHA 
    LDA $20
    BEQ code_02E02E
    LSR 
    LSR 
    ORA #$0C00
}

code_02E02E {
    SEC 
    SBC $01, S
    EOR #$FFFF
    INC 
    EOR $01, S
    BIT #$0010
    BEQ code_02E041
    LDA #$0010
    STA $02
}

code_02E041 {
    PLA 
    BRA code_02E04E
}

code_02E044 {
    REP #$20
    PLA 
    STA $1E
    PLA 
    STA $1A
    STZ $02
}

code_02E04E {
    LDA $1A
    AND #$000F
    ORA #$FFF0
    EOR #$FFFF
    INC 
    CLC 
    ADC $02
    STA $02
    RTS 
}

---------------------------------------------

func_02E060 {
    LDA $26
    LSR 
    LSR 
    AND #$000F
    BNE code_02E06C
    LDA #$0010
}

code_02E06C {
    CLC 
    ADC $02
    CMP #$0011
    BCS code_02E077
    JMP $&func_02E16E
}

code_02E077 {
    AND #$000F
    STA $02
    LDA $03, S
    BEQ code_02E096
    LDA $20
    BPL code_02E088
    EOR #$FFFF
    INC 
}

code_02E088 {
    CMP $03, S
    BEQ code_02E0A3
    BPL code_02E096
    STZ $20
    LDA #$0840
    TRB $AA
    RTS 
}

code_02E096 {
    LDA $02
    ASL 
    ASL 
    EOR #$FFFF
    INC 
    STA $24
    JMP $&func_02E16E
}

code_02E0A3 {
    LDA #$0000
    STA $03, S
    STA $20
    RTS 
}

---------------------------------------------

func_02E0AB {
    LDA $26
    LSR 
    LSR 
    ORA #$FFF0
    EOR #$FFFF
    INC 
    BNE code_02E0BB
    LDA #$0010
}

code_02E0BB {
    CLC 
    ADC $02
    CMP #$0011
    BCS code_02E0C6
    JMP $&func_02E16E
}

code_02E0C6 {
    AND #$000F
    STA $02
    LDA $03, S
    BEQ code_02E0E9
    LDA $20
    BPL code_02E0D7
    EOR #$FFFF
    INC 
}

code_02E0D7 {
    EOR #$FFFF
    INC 
    CMP $03, S
    BEQ code_02E0F2
    BMI code_02E0E9
    STZ $20
    LDA #$0440
    TRB $AA
    RTS 
}

code_02E0E9 {
    LDA $02
    ASL 
    ASL 
    STA $24
    JMP $&func_02E16E
}

code_02E0F2 {
    LDA #$0000
    STA $03, S
    STA $20
    RTS 
}

---------------------------------------------

sub_02E0FA {
    REP #$20
    LDA #$0000
    STA $05, S
    RTS 
}

---------------------------------------------

sub_02E102_noref {
    CLC 
    ADC $26
    LSR 
    LSR 
    DEC 
    STA $1E
    AND #$000F
    PHP 
    LDA $22
    CLC 
    ADC $20
    LSR 
    LSR 
    CLC 
    ADC $1A
    STA $1A
    JSR $&sub_02E2AF
    AND #$00FF
    CMP #$000E
    BCC code_02E128
    PLP 

  code_02E126:
    SEC 
    RTS 
}

code_02E128 {
    PLP 
    BEQ code_02E13D
    SEP #$20
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$000E
    BCS code_02E126
}

code_02E13D {
    CLC 
    RTS 
}

---------------------------------------------

sub_02E13F {
    LDA $22
    LSR 
    LSR 
    PHA 
    LDA $20
    LSR 
    LSR 
    CLC 
    ADC $01, S
    EOR $01, S
    STA $01, S
    PLA 
    BIT #$0010
    RTS 
}

---------------------------------------------

func_02E154 {
    REP #$20
    STZ $24
    STZ $20
    RTS 
}

---------------------------------------------

sub_02E15B {
    PHP 
    REP #$20
    PHY 
    LDY $000A
    LDA $0010, Y
    ORA #$0004
    STA $0010, Y
    PLY 
    PLP 
    RTS 
}

---------------------------------------------

func_02E16E {
    REP #$20
    LDA $22
    CLC 
    ADC $20
    STA $22
    LDA $26
    CLC 
    ADC $24
    STA $26
    STZ $20
    STZ $24
    RTS 
}

---------------------------------------------

sub_02E183 {
    PHP 
    REP #$20
    LDA $22
    LSR 
    LSR 
    CLC 
    ADC #$0007
    STA $1A
    LDA $26
    LSR 
    LSR 
    CLC 
    ADC #$FFFF
    STA $1E
    JSR $&sub_02E2AF
    INC $1A
    INC $1E
    BCC code_02E1A6
    PLP 
    SEC 
    RTS 
}

code_02E1A6 {
    PLP 
    CLC 
    RTS 
}

---------------------------------------------

sub_02E1A9 {
    PHP 
    REP #$20
    LDA $22
    LSR 
    LSR 
    CLC 
    ADC #$0007
    STA $1A
    LDA $26
    LSR 
    LSR 
    CLC 
    ADC #$FFF0
    STA $1E
    JSR $&sub_02E2AF
    INC $1A
    BCC code_02E1CA
    PLP 
    SEC 
    RTS 
}

code_02E1CA {
    PLP 
    CLC 
    RTS 
}

---------------------------------------------

sub_02E1CD {
    PHP 
    REP #$20
    LDA $22
    LSR 
    LSR 
    CLC 
    ADC #$FFF8
    STA $1A
    LDA $26
    LSR 
    LSR 
    CLC 
    ADC #$FFFF
    STA $1E
    JSR $&sub_02E2AF
    INC $1E
    BCC code_02E1EE
    PLP 
    SEC 
    RTS 
}

code_02E1EE {
    PLP 
    CLC 
    RTS 
}

---------------------------------------------

sub_02E1F1 {
    PHP 
    REP #$20
    LDA $22
    LSR 
    LSR 
    CLC 
    ADC #$FFF8
    STA $1A
    LDA $26
    LSR 
    LSR 
    CLC 
    ADC #$FFF0
    STA $1E
    PLP 
    JSR $&sub_02E2AF
    RTS 
}

---------------------------------------------

sub_02E20D {
    PHP 
    REP #$20
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    CLC 
    ADC #$0007
    STA $1A
    LDA $26
    CLC 
    ADC $24
    LSR 
    LSR 
    CLC 
    ADC #$FFF0
    STA $1E
    JSR $&sub_02E2AF
    INC $1A
    BCC code_02E234
    PLP 
    SEC 
    RTS 
}

code_02E234 {
    PLP 
    CLC 
    RTS 
}

---------------------------------------------

sub_02E237 {
    PHP 
    REP #$20
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    CLC 
    ADC #$0007
    STA $1A
    LDA $26
    CLC 
    ADC $24
    LSR 
    LSR 
    CLC 
    ADC #$FFFF
    STA $1E
    JSR $&sub_02E2AF
    INC $1A
    INC $1E
    BCC code_02E260
    PLP 
    SEC 
    RTS 
}

code_02E260 {
    PLP 
    CLC 
    RTS 
}

---------------------------------------------

sub_02E263 {
    PHP 
    REP #$20
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    CLC 
    ADC #$FFF8
    STA $1A
    LDA $26
    CLC 
    ADC $24
    LSR 
    LSR 
    CLC 
    ADC #$FFF0
    STA $1E
    PLP 
    JSR $&sub_02E2AF
    RTS 
}

---------------------------------------------

sub_02E285 {
    PHP 
    REP #$20
    LDA $20
    CLC 
    ADC $22
    LSR 
    LSR 
    CLC 
    ADC #$FFF8
    STA $1A
    LDA $26
    CLC 
    ADC $24
    LSR 
    LSR 
    CLC 
    ADC #$FFFF
    STA $1E
    JSR $&sub_02E2AF
    INC $1E
    BCC code_02E2AC
    PLP 
    SEC 
    RTS 
}

code_02E2AC {
    PLP 
    CLC 
    RTS 
}

---------------------------------------------

sub_02E2AF {
    PHP 
    REP #$20
    LDA $1A
    BMI code_02E2F0
    CMP $camera_offset_x
    BCC code_02E2F0
    CMP $camera_bounds_x
    BCS code_02E2F0
    LSR 
    LSR 
    LSR 
    LSR 
    STA $18
    LDA $1E
    BMI code_02E2F0
    CMP $camera_offset_y
    BCC code_02E2F0
    CMP $06DE
    BCS code_02E2F0
    LSR 
    LSR 
    LSR 
    LSR 
    STA $1C
    PHY 
    JSL $@func_03D78A
    STY $00
    TYX 
    PLY 
    SEP #$20
    JSR $&sub_02E2FC
    BNE code_02E2ED
    PLP 
    CLC 
    RTS 
}

code_02E2ED {
    PLP 
    SEC 
    RTS 
}

code_02E2F0 {
    SEP #$20
    LDX #$4001
    STX $00
    LDA #$0F
    PLP 
    SEC 
    RTS 
}

---------------------------------------------

sub_02E2FC {
    CPX #$4000
    BCS code_02E310
    LDA $7FC000, X
    BIT #$F0
    BEQ code_02E30D
    LSR 
    LSR 
    LSR 
    LSR 
}

code_02E30D {
    BIT #$FF
    RTS 
}

code_02E310 {
    LDA #$0F
    RTS 
}

---------------------------------------------

sub_02E313 {
    PHP 
    REP #$20
    LDA $00
    SEP #$20
    CLC 
    ADC #$10
    BCS code_02E322
    TAX 
    PLP 
    RTS 
}

code_02E322 {
    XBA 
    CLC 
    ADC $0693
    XBA 
    TAX 
    PLP 
    RTS 
}

---------------------------------------------

sub_02E32B {
    PHP 
    REP #$20
    LDA $00
    SEP #$20
    SEC 
    SBC #$10
    BCC code_02E33A
    TAX 
    PLP 
    RTS 
}

code_02E33A {
    XBA 
    SEC 
    SBC $0693
    XBA 
    TAX 
    PLP 
    RTS 
}

---------------------------------------------

sub_02E343 {
    PHP 
    REP #$20
    LDA $00
    SEP #$20
    INC 
    BIT #$0F
    BEQ code_02E352
    TAX 
    PLP 
    RTS 
}

code_02E352 {
    XBA 
    LDA $01
    INC 
    XBA 
    CLC 
    ADC #$F0
    TAX 
    PLP 
    RTS 
}

---------------------------------------------

sub_02E35D {
    PHP 
    REP #$20
    LDA $00
    SEP #$20
    DEC 
    PHA 
    AND #$0F
    CMP #$0F
    BEQ code_02E370
    PLA 
    TAX 
    PLP 
    RTS 
}

code_02E370 {
    PLA 
    XBA 
    LDA $01
    DEC 
    XBA 
    SEC 
    SBC #$F0
    TAX 
    PLP 
    RTS 
}

---------------------------------------------

sub_02E37C {
    PHA 
    LDA $1A
    BIT #$0F
    BNE code_02E386
    PLA 
    CLC 
    RTS 
}

code_02E386 {
    PLA 
    SEC 
    RTS 
}

---------------------------------------------

sub_02E389 {
    PHA 
    LDA $1E
    BIT #$0F
    BNE code_02E393
    PLA 
    CLC 
    RTS 
}

code_02E393 {
    PLA 
    SEC 
    RTS 
}