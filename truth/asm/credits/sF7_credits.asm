?BANK 09
?INCLUDE 'misc_actors_09E64B'
?INCLUDE 'func_09E8E4'

!joypad_mask_std                065A
!BG3SC                          2109
!W12SEL                         2123
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131
!COLDATA                        2132

---------------------------------------------

h_sF7_credits [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_sF7_credits {
    LDA #$0080
    STA $00F6
    LDA #$007F
    STA $00FA
    STZ $00FE
    DEC $00FE
    STZ $09F6
    LDA #$FFFF
    STA $00E4
    LDA #$4001
    TSB $09EC
    SEP #$20
    LDA #$33
    STA $W12SEL
    LDA #$02
    STA $CGWSEL
    LDA #$00
    STA $_TM
    STA $_TS
    REP #$20
    LDA #$0000
    STA $7F0A00
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [51] ( @gfx_sc02_main_characters, $7EE000 )
    LDY #$4000
    JSR $&sub_09DB4B
    COP [51] ( @gfx_credits_actors1, $7EE000 )
    LDY #$6000
    JSR $&sub_09DB4B
    COP [51] ( @gfx_credits_actors2, $7EE000 )
    LDY #$8000
    JSR $&sub_09DB4B
    COP [51] ( @gfx_credits_actors3, $7EA000 )
    LDY #$C000
    JSR $&sub_09DB59
    COP [51] ( @gfx_credits_scenery, $7EA000 )
    COP [51] ( @file_002380, $7EE000 )
    STZ $0084
    STZ $0086
    STZ $0088
    STZ $008A
    STZ $0094
    COP [51] ( @spm_credits, $7E6000 )
    COP [4F] ( $7F0200, #$7C00, #$0800 )
    COP [37] ( #0B )
    COP [39]
    COP [04] ( #14 )
    STZ $06BE
    STZ $06C2
    COP [A5] ( @code_09E9D2, #00, #00, #$2000 )
    COP [A5] ( @func_09E919, #00, #00, #$2000 )
    STZ $00E4
    COP [C8] ( &code_09E934 )
    COP [69] ( #$00C8 )
    SEP #$20
    LDA #$10
    STA $_TM
    REP #$20
    COP [4F] ( $7FC000, #$2000, #$0800 )
    COP [4F] ( $7FC800, #$2400, #$0800 )
    COP [4F] ( $7FD000, #$2800, #$0800 )
    COP [4F] ( $7FD800, #$2C00, #$0800 )
    COP [4F] ( $7FE000, #$3000, #$0800 )
    COP [4F] ( $7FE800, #$3400, #$0800 )
    COP [4F] ( $7FF000, #$3800, #$0800 )
    COP [4F] ( $7FF800, #$3C00, #$0800 )
    COP [4F] ( $7EE000, #$1180, #$0200 )
    COP [4F] ( $7EE200, #$1980, #$0200 )
    COP [50] ( @palette_1E094C, #00, #00, #80 )
    COP [69] ( #$0CA8 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$11BC )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$1FF4 )
    COP [4F] ( $7EE400, #$1180, #$0200 )
    COP [4F] ( $7EE600, #$1980, #$0200 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$251C )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$2710 )
    COP [4F] ( $7EE800, #$1180, #$0200 )
    COP [4F] ( $7EEA00, #$1980, #$0200 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$2CEC )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$2FA8 )
    COP [4F] ( $7EEC00, #$1180, #$0200 )
    COP [4F] ( $7EEE00, #$1980, #$0200 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [DA] ( #3F )
    SEP #$20
    LDA #$41
    STA $CGADSUB
    LDA #$02
    STA $_TS
    REP #$20
    COP [69] ( #$3200 )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    SEP #$20
    LDA #$83
    STA $CGADSUB
    LDA #$00
    STA $_TS
    REP #$20
    COP [69] ( #$3264 )
    COP [A5] ( @code_09E62F, #00, #00, #$0500 )
    COP [69] ( #$32E4 )
    COP [A5] ( @code_09E637, #00, #00, #$0500 )
    COP [69] ( #$32FC )
    COP [A5] ( @code_09E62F, #00, #00, #$0500 )
    COP [69] ( #$3396 )
    COP [A5] ( @code_09E62F, #00, #00, #$0500 )
    COP [69] ( #$344A )
    COP [A5] ( @code_09E637, #00, #00, #$0500 )
    COP [69] ( #$37B4 )
    COP [A5] ( @code_09E65D, #00, #00, #$0500 )
    COP [69] ( #$39FC )
    COP [A5] ( @code_09E67C, #00, #00, #$2500 )
    COP [69] ( #$3C8C )
    COP [C8] ( &code_09E9A4 )
    COP [4F] ( $7EA000, #$2000, #$0800 )
    COP [4F] ( $7EA800, #$2400, #$0800 )
    COP [4F] ( $7EB000, #$2800, #$0800 )
    COP [4F] ( $7EB800, #$2C00, #$0800 )
    COP [4F] ( $7EC000, #$3000, #$0800 )
    COP [4F] ( $7EC800, #$3400, #$0800 )
    COP [4F] ( $7ED000, #$3800, #$0800 )
    COP [4F] ( $7ED800, #$3C00, #$0800 )
    COP [4F] ( $7EF000, #$1180, #$0200 )
    COP [4F] ( $7EF200, #$1980, #$0200 )
    COP [50] ( @palette_1E0A6C, #00, #00, #80 )
    COP [69] ( #$3CF0 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$3D46 )
    COP [A5] ( @func_09F69F, #00, #00, #$2000 )
    COP [C2]
    SEP #$20
    LDA #$01
    STA $CGADSUB
    LDA #$02
    STA $_TS
    REP #$20
    COP [69] ( #$3F48 )
    SEP #$20
    LDA #$83
    STA $CGADSUB
    LDA #$00
    STA $_TS
    REP #$20
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$4920 )
    COP [C8] ( &code_09E962 )
    COP [4F] ( $7EF400, #$1180, #$0200 )
    COP [4F] ( $7EF600, #$1980, #$0200 )
    COP [69] ( #$4AA1 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$4CF9 )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$500C )
    COP [A5] ( @code_09E68D, #00, #00, #$0500 )
    COP [69] ( #$5208 )
    COP [A5] ( @code_09E6A5, #00, #00, #$0500 )
    COP [69] ( #$526C )
    COP [4F] ( $7EF800, #$1180, #$0200 )
    COP [4F] ( $7EFA00, #$1980, #$0200 )
    COP [69] ( #$52D0 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$5366 )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$5398 )
    COP [A5] ( @code_09E6C0, #00, #00, #$0500 )
    COP [69] ( #$53A8 )
    COP [A5] ( @code_09E6DB, #00, #00, #$0500 )
    COP [69] ( #$5528 )
    COP [A5] ( @code_09E6F6, #00, #00, #$0500 )
    COP [69] ( #$5538 )
    COP [A5] ( @code_09E711, #00, #00, #$0500 )
    COP [69] ( #$56B8 )
    COP [A5] ( @code_09E72C, #00, #00, #$0500 )
    COP [69] ( #$5848 )
    COP [A5] ( @code_09E747, #00, #00, #$0500 )
    COP [69] ( #$5860 )
    COP [A5] ( @code_09E762, #00, #00, #$0500 )
    COP [69] ( #$59CE )
    COP [C8] ( &code_09E990 )
    COP [69] ( #$59D8 )
    COP [A5] ( @code_09E77D, #00, #00, #$0500 )
    COP [69] ( #$59F0 )
    COP [A5] ( @code_09E798, #00, #00, #$0500 )
    COP [69] ( #$5B68 )
    COP [A5] ( @code_09E7B3, #00, #00, #$0500 )
    COP [69] ( #$5CF8 )
    COP [A5] ( @code_09E7CE, #00, #00, #$0500 )
    COP [69] ( #$5D10 )
    COP [A5] ( @code_09E7E9, #00, #00, #$0500 )
    COP [69] ( #$5E88 )
    COP [A5] ( @code_09E804, #00, #00, #$0500 )
    COP [69] ( #$5EA0 )
    COP [A5] ( @code_09E81F, #00, #00, #$0500 )
    COP [69] ( #$600E )
    COP [C8] ( &code_09E99A )
    COP [69] ( #$6018 )
    COP [A5] ( @code_09E83A, #00, #00, #$0500 )
    COP [69] ( #$6038 )
    COP [A5] ( @code_09E855, #00, #00, #$0500 )
    COP [69] ( #$6198 )
    COP [A5] ( @code_09E870, #00, #00, #$0500 )
    COP [69] ( #$61C8 )
    COP [A5] ( @code_09E88B, #00, #00, #$0500 )
    COP [69] ( #$6338 )
    COP [A5] ( @code_09E8A6, #00, #00, #$0500 )
    COP [69] ( #$6400 )
    COP [50] ( @palette_1E0B8C, #00, #00, #80 )
    COP [4F] ( $7EFC00, #$1180, #$0200 )
    COP [4F] ( $7EFE00, #$1980, #$0200 )
    COP [A5] ( @code_09F4AA, #00, #00, #$2000 )
    COP [69] ( #$64C8 )
    COP [A5] ( @code_09E8C1, #00, #00, #$0500 )
    COP [69] ( #$652C )
    COP [A5] ( @code_09F4ED, #00, #00, #$2000 )
    COP [69] ( #$7068 )
    STZ $066D
    STZ $0670
    STZ $0673
    STZ $0676
    STZ $0679
    STZ $067C
    STZ $067F
    STZ $0682
    STZ $0685
    COP [26] ( #F0, #$0090, #$0178, #06, #$1201 )
    COP [C1]
    RTL 
}

---------------------------------------------

sub_09DB4B {
    PHX 
    PHB 
    LDX #$E000
    LDA #$1FFF
    MVN #$7F, #$7E
    PLB 
    PLX 
    RTS 
}

---------------------------------------------

sub_09DB59 {
    PHX 
    PHB 
    LDX #$A000
    LDA #$3FFF
    MVN #$7F, #$7E
    PLB 
    PLX 
    RTS 
}

---------------------------------------------

code_09E62F {
    LDA #$0012
    JSL $@func_09E8E4
    BRA code_09E63D
}

code_09E637 {
    LDA #$0022
    JSL $@func_09E8E4
}

code_09E63D {
    COP [88] ( $7E6000 )
    COP [85] ( #10, #07, #02 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

func_09E919 {
    COP [C1]
    INC $00E4
    SED 
    LDA $00E6
    CLC 
    ADC #$0001
    STA $00E6
    LDA $00E8
    ADC #$0000
    STA $00E8
    CLD 
    RTL 
}

code_09E934 {
    COP [4F] ( $7F6000, #$5000, #$0800 )
    COP [4F] ( $7F6800, #$5400, #$0800 )
    COP [4F] ( $7F7000, #$5800, #$0800 )
    COP [4F] ( $7F7800, #$5C00, #$0800 )
    COP [50] ( @palette_1F3333, #00, #90, #40 )
    COP [C5]
}

code_09E962 {
    COP [4F] ( $7F8000, #$5000, #$0800 )
    COP [4F] ( $7F8800, #$5400, #$0800 )
    COP [4F] ( $7F9000, #$5800, #$0800 )
    COP [4F] ( $7F9800, #$5C00, #$0800 )
    COP [50] ( @palette_1E65F3, #00, #90, #70 )
    COP [C5]
}

code_09E990 {
    COP [50] ( @palette_1E66D3, #00, #90, #70 )
    COP [C5]
}

code_09E99A {
    COP [50] ( @palette_1E67B3, #00, #90, #70 )
    COP [C5]
}

code_09E9A4 {
    COP [4F] ( $7F4000, #$5000, #$0800 )
    COP [4F] ( $7F4800, #$5400, #$0800 )
    COP [4F] ( $7F5000, #$5800, #$0800 )
    COP [4F] ( $7F5800, #$5C00, #$0800 )
    COP [50] ( @pal_sc02_main_characters, #00, #A0, #60 )
    COP [C5]
}

code_09E9D2 {
    LDA $00E4
    BPL code_09E9D8
    RTL 
}

code_09E9D8 {
    COP [69] ( #$01F4 )
    LDA #$&credits_09ECBF
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ECE7
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED10
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED3C
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED68
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED96
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EDC3
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EDF1
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EE2D
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EE7D
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EEAA
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EEF7
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EF22
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EF75
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EFB1
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EFFB
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F038
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F073
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F0B2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F0F2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F12C
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F18A
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F1C8
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F1F2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F220
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F248
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F273
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F2A9
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F2FA
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    SEP #$20
    LDA #$79
    STA $BG3SC
    REP #$20
    LDY #$&credits_09F315
    JSR $&sub_09EC23
    COP [4F] ( $7F0200, #$7800, #$0800 )
    SEP #$20
    LDA #$14
    ORA $09F6
    STA $_TM
    LDA #$00
    STA $_TS
    REP #$20
    COP [C1]
    RTL 
}

code_09EB64 {
    SEP #$20
    LDA #$79
    STA $BG3SC
    REP #$20
    LDA #$0000
    STA $0720
    LDA #$0100
    LDY #$0024

  code_09EB79:
    STA $0726, Y
    DEY 
    DEY 
    BPL code_09EB79
    LDA $0724
    LDA $0748
    STZ $074A
    LDY $26
    JSR $&sub_09EC23
    COP [4F] ( $7F0200, #$7800, #$0800 )
    SEP #$20
    LDA #$14
    ORA $09F6
    STA $_TM
    LDA $09F7
    STA $_TS
    REP #$20
    COP [CA] ( #80 )
    LDA $0726
    SEC 
    SEC 
    SBC #$0002
    STA $0726
    LDA $0728
    CLC 
    ADC #$0002
    STA $0728
    LDA $0036
    LSR 
    BCC code_09EBDB
    LDY $074A
    CPY #$0022
    BEQ code_09EBDB
    INC $074A
    INC $074A
    LDA #$0000
    STA $072A, Y
}

code_09EBDB {
    COP [CB]
    COP [DB] ( #$0257 )
    SEP #$20
    LDA #$7A
    STA $BG3SC
    REP #$20
    COP [CA] ( #80 )
    LDA $0720
    CLC 
    ADC #$0001
    STA $0720
    COP [CB]
    SEP #$20
    LDA #$10
    ORA $09F6
    STA $_TM
    REP #$20
    LDA #$0000
    STA $0720
    PHX 
    LDX #$0400

  code_09EC0F:
    STA $7F0200, X
    DEX 
    DEX 
    BPL code_09EC0F
    PLX 
    COP [4F] ( $7F0200, #$7800, #$0800 )
    COP [C5]
}

---------------------------------------------

sub_09EC23 {
    PHX 
    PHB 
    SEP #$20
    LDA #$^credits_09ECBF
    PHA 
    PLB 
    REP #$20
    STZ $0000
    LDA #$2100
    STA $099E

  code_09EC36:
    SEP #$20
    LDA $0000, Y
    INY 
    CMP #$C0
    BCS code_09EC5E
    LDX $0000
    REP #$20
    AND #$00FF
    ORA $099E
    STA $7F0200, X
    CLC 
    ADC #$0010
    STA $7F0240, X
    INX 
    INX 
    STX $0000
    BRA code_09EC36
}

code_09EC5E {
    STX $0000
    REP #$20
    AND #$001F
    ASL 
    TAX 
    JSR ($&table_09EC74, X)
    LDX $0000
    BRA code_09EC36
}

---------------------------------------------

func_09EC70 {
    PLA 
    PLB 
    PLX 
}

---------------------------------------------

code_09EC73 {
    RTS 
}

---------------------------------------------

table_09EC74 [
  &func_09EC70   ;00
  &code_09EC94   ;01
  &code_09EC73   ;02
  &code_09ECA0   ;03
  &code_09EC73   ;04
  &code_09EC73   ;05
  &code_09EC73   ;06
  &code_09EC73   ;07
  &code_09EC73   ;08
  &code_09EC73   ;09
  &code_09EC73   ;0A
  &code_09ECB1   ;0B
  &code_09EC73   ;0C
  &code_09EC73   ;0D
  &code_09EC73   ;0E
  &code_09EC73   ;0F
]

code_09EC94 {
    LDA $0000, Y
    INY 
    INY 
    STA $0000
    STA $09A0
    RTS 
}

code_09ECA0 {
    SEP #$20
    LDA $099F
    AND #$E3
    ORA $0000, Y
    INY 
    STA $099F
    REP #$20
    RTS 
}

code_09ECB1 {
    LDA $09A0
    CLC 
    ADC #$0080
    STA $09A0
    STA $0000
    RTS 
}

---------------------------------------------

credits_09ECBF `[PAL:0][DLG:4C,1]The Illusion of GAIA[N][N]       STAFF[END]`

---------------------------------------------

credits_09ECE7 `[PAL:0][DLG:4C,1]  Original Story[N][N][PAL:C]   MARIKO OHARA[END]`

---------------------------------------------

credits_09ED10 `[PAL:0][DLG:4C,1] Character Designer[N][N][PAL:C]     MOTO HAGIO[END]`

---------------------------------------------

credits_09ED3C `[PAL:0][DLG:4C,1]   Game Designer[N][N][PAL:8]TOMOYOSHI MIYAZAKI[END]`

---------------------------------------------

credits_09ED68 `[PAL:0][DLG:4C,1]  Program Director[N][N][PAL:8]  MASAYA HASHIMOTO[END]`

---------------------------------------------

credits_09ED96 `[PAL:0][DLG:4C,1]  Main Programmer[N][N][PAL:8]  AKIRA KITANOHARA[END]`

---------------------------------------------

credits_09EDC3 `[PAL:0][DLG:4C,1]Background Designer[N][N][PAL:8]   HISASHI YOKOTA[END]`

---------------------------------------------

credits_09EDF1 `[PAL:0][DLG:4C,1]  Object Designer[N][PAL:8]   JUNICHI ISHIDA[N]   HITOSHI ARIGA[END]`

---------------------------------------------

credits_09EE2D `[PAL:0][DLG:4C,1]  Graphic Designer[N][PAL:C]    NAOKO SUZUKI[N][PAL:8]   TAKAHIRO OHURA[N]    KOUJI YOKOTA[END]`

---------------------------------------------

credits_09EE7D `[PAL:0][DLG:4A,1]   Sound Composer[N][N][PAL:8] YASUHIRO KAWASAKI[END]`

---------------------------------------------

credits_09EEAA `[PAL:0][DLG:4C,1]  English Text by[N][PAL:8]   Scott Pelland[N]     Tim Rooney[N]  Robert L.Jerauld[END]`

---------------------------------------------

credits_09EEF7 `[PAL:0][DLG:4C,1] Title Coordinator[N][N][PAL:C]    Mary Cocoma[END]`

---------------------------------------------

credits_09EF22 `[PAL:0][DLG:4C,1]   Quintet Staff[N][PAL:8]T.HASHIMOTO  S.KITA[N]K.SUGAYA     T.TURU[N][PAL:C]   R.TAKEBAYASHI[END]`

---------------------------------------------

credits_09EF75 `[PAL:0][DLG:4C,1]   Quintet Staff[N][PAL:C]M.TSURUNO Y.SASHIDA[N]    M.KOBAYASHI[END]`

---------------------------------------------

credits_09EFB1 `[PAL:0][DLG:4C,1]     ENIX Staff[N][PAL:8]   YUKINOBU CHIDA[N]    KEIJI HONDA[N]   YASUYUKI SONE[END]`

---------------------------------------------

credits_09EFFB `[PAL:0][DLG:4C,1]   Art Direction[N][N][PAL:8]  HIDEKI YAMAMOTO[N]  TAKASHI OOTSUKA[END]`

---------------------------------------------

credits_09F038 `[PAL:0][DLG:4C,1] Technical Support[N][N][PAL:8]   SADAO YAHAGI[N]   KENJIRO KANO[END]`

---------------------------------------------

credits_09F073 `[PAL:0][DLG:4C,1] Enix America Staff[N][N][PAL:8]    TSUNEO MORITA[N]     Paul Bowler[END]`

---------------------------------------------

credits_09F0B2 `[PAL:0][DLG:4C,1] Enix America Staff[N][N][PAL:8]    Paul Handelman[N]     Jake Kazdal[END]`

---------------------------------------------

credits_09F0F2 `[PAL:0][DLG:4C,1] Special Thanks to[N][N][PAL:8]     Dan Owsen[N]    Hiro Yamada[END]`

---------------------------------------------

credits_09F12C `[PAL:0][DLG:4A,1]  Special Thanks to[N][PAL:8]H.KURODA   A.SHIGENO[N]K.KUWABARA [PAL:C]M.SUMITA[N][PAL:8]Y.SASAKI   N.SUGINAKA[END]`

---------------------------------------------

credits_09F18A `[PAL:0][DLG:4C,1] Special Thanks to[N][PAL:8]M.KAKIZAWA   A.ARAI[N][PAL:C]K.WAKABAYASHI[END]`

---------------------------------------------

credits_09F1C8 `[PAL:0][DLG:4C,1]      Director[N][N][PAL:8]  MASAYA HASHIMOTO[END]`

---------------------------------------------

credits_09F1F2 `[PAL:0][DLG:4C,1] Assistant Producer[N][N][PAL:8]  KAZUNORI TAKADO[END]`

---------------------------------------------

credits_09F220 `[PAL:0][DLG:4C,1]      Producer[N][N][PAL:8]   SHINJI FUTAMI[END]`

---------------------------------------------

credits_09F248 `[PAL:0][DLG:4C,1]     Publisher[N][N][PAL:8] YASUHIRO FUKUSHIMA[END]`

---------------------------------------------

credits_09F273 `[PAL:0][DLG:4C,1]     Copyright[N][N][PAL:8]    1994 ENIX[N]    1994 QUINTET[END]`

---------------------------------------------

credits_09F2A9 `[PAL:0][DLG:4A,1]     Copyright[N][PAL:C]1994 MARIKO OHARA[N]1994 MOTO HAGIO[N][PAL:8]1994 YASUHIRO KAWASAKI[END]`

---------------------------------------------

credits_09F2FA `[PAL:0][DLG:4A,2] Licensed to NINTENDO[END]`

---------------------------------------------

credits_09F315 `[PAL:0][DLG:4C,3]Thank you for playing[END]`

---------------------------------------------

code_09F4AA {
    LDA #$0003
    TSB $09F6
    SEP #$20
    LDA #$17
    STA $_TM
    LDA #$FF
    STA $COLDATA
    REP #$20
    AND #$00FF
    STA $24
    STZ $00FE
    COP [C1]
    LDA $00FE
    CMP #$003F
    BCS code_09F4EB
    INC 
    STA $00FE
    LSR 
    BCC code_09F4D8
    RTL 
}

code_09F4D8 {
    LDA $24
    CMP #$00E0
    BNE code_09F4E0
    RTL 
}

code_09F4E0 {
    DEC 
    STA $24
    SEP #$20
    STA $COLDATA
    REP #$20
    RTL 
}

code_09F4EB {
    COP [E0]
}

code_09F4ED {
    LDA #$00E0
    STA $24
    COP [C1]
    LDA $24
    CMP #$00FF
    BEQ code_09F508
    INC 
    STA $24
    SEP #$20
    STA $COLDATA
    REP #$20
    INC $08
    RTL 
}

code_09F508 {
    STZ $00FE
    DEC $00FE
    COP [E0]
}

---------------------------------------------

func_09F69F {
    COP [37] ( #65 )
    COP [39]
    COP [E0]
}