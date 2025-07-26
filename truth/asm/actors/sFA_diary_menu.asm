?BANK 0B

?INCLUDE 'system_strings'
?INCLUDE 'strings_0BF706'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'func_02F06A'
?INCLUDE 'chunk_028000'

!scene_next                     0642
!joypad_mask_std                065A
!joypad_mask_inv                065C
!player_actor                   09AA
!player_flags                   09AE
!M7A                            211B
!M7B                            211C
!M7C                            211D
!M7D                            211E
!M7X                            211F
!M7Y                            2120
!W34SEL                         2124
!WOBJSEL                        2125
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131
!APUIO0                         2140
!RDNMI                          4210
!JOY2L                          421A

---------------------------------------------

h_sFA_diary_menu [
  h_actor < #00, #00, #28 >   ;00
]

---------------------------------------------

e_sFA_diary_menu {
    LDA #$0000
    STA $7F0A00
    SEP #$20
    STA $_TM
    REP #$20
    LDA #$FFFF
    STA $0D92
    STA $0D96
    STA $0D98
    LDA #$4001
    TSB $09EC
    SEP #$20
    LDA #$88
    STA $W34SEL
    LDA #$22
    STA $WOBJSEL
    REP #$20
    LDA #$0000
    STA $7F0A00
    STA $0B04
    LDA #$0001
    STA $00EE
    SEP #$20
    LDA #$01
    STA $_TM
    LDA #$04
    STA $_TS
    LDA #$82
    STA $CGWSEL
    LDA #$41
    STA $CGADSUB
    REP #$20
    LDA #$0080
    STA $068A
    STA $06BE
    LDA #$0300
    STA $068E
    STA $06C2
    LDA #$3000
    TSB $joypad_mask_std
    LDA #$2800
    TSB $player_flags
    COP [BD] ( @asciistring_01EADC )
    COP [6B] ( &widestring_0BF3F4 )
    JSR $&sub_0BED64
    LDA #$0F00
    STA $joypad_mask_inv
    STZ $18
    COP [C1]
    LDA $0654
    BNE code_0BE2CA
    RTL 
}

code_0BE2CA {
    BRA code_0BE2D0
}

---------------------------------------------

func_0BE2CC {
    COP [6B] ( &widestring_0BF3F4 )
}

code_0BE2D0 {
    LDA #$FFFF
    STA $0D92
    LDA #$0000
    STA $0D98

  code_0BE2DC:
    COP [BD] ( @asciistring_01EADC )
    COP [C1]
    COP [40] ( #$0800, &code_0BE2F6 )
    COP [40] ( #$0400, &code_0BE30F )
    COP [40] ( #$0080, &code_0BE32B )
    RTL 
}

code_0BE2F6 {
    COP [06] ( #10 )
    LDA $0D98
    DEC 
    BPL code_0BE302
    LDA #$0003
}

code_0BE302 {
    STA $0D98
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE30F {
    COP [06] ( #10 )
    LDA $0D98
    INC 
    CMP #$0004
    BCC code_0BE31E
    LDA #$0000
}

code_0BE31E {
    STA $0D98
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE32B {
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D98
    AND #$0003
    STA $0000
    LDA #$FFFF
    STA $0D98
    COP [D9] ( #$0000, &code_list_0BE34C )
}

code_list_0BE34C [
  &code_0BE354   ;00
  &code_0BEA55   ;01
  &func_0BE8A8   ;02
  &func_0BE6BA   ;03
]

code_0BE354 {
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF437 )
    COP [C8] ( &code_0BEB8B )
    COP [BD] ( @asciistring_01EADC )
    LDA $0D8C
    AND #$0003
    STA $0D92

  code_0BE36D:
    COP [C2]
    LDA #$000C
    STA $7F101C, X
    COP [C8] ( &code_0BE527 )
    COP [E2] ( @code_0BE36D )
    COP [40] ( #$0800, &code_0BE398 )
    COP [40] ( #$0400, &code_0BE3B1 )
    COP [40] ( #$0080, &code_0BE3DF )
    COP [40] ( #$8000, &code_0BE3CD )
    RTL 
}

code_0BE398 {
    COP [06] ( #10 )
    LDA $0D92
    DEC 
    BPL code_0BE3A4
    LDA #$0002
}

code_0BE3A4 {
    STA $0D92
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE3B1 {
    COP [06] ( #10 )
    LDA $0D92
    INC 
    CMP #$0003
    BCC code_0BE3C0
    LDA #$0000
}

code_0BE3C0 {
    STA $0D92
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE3CD {
    COP [06] ( #0D )
    LDA $0656
    ORA $0658
    STA $0658
    JSR $&sub_0BEBF9
    JMP $&func_0BE2CC
}

code_0BE3DF {
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D92
    STA $0D8C
    LDA #$FFFF
    STA $0D92
    LDA $0D8C
    STA $306000
    JSL $@func_03D954
    BCS code_0BE433
    JSR $&sub_0BE673
    LDA $0AB2
    STA $0AAC
    LDA #$00E6
    STA $scene_next
    LDA #$0078
    STA $064C
    LDA #$0090
    STA $064E
    LDA #$0003
    STA $0650
    LDA #$1100
    STA $0652
    LDA #$2800
    TRB $player_flags
    COP [E0]
}

code_0BE433 {
    LDA $0D92
    STA $0D94
    LDA #$FFFF
    STA $0D92
    LDA #$0000
    STA $0D8E
    STA $0D90
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF5AD )
    COP [6B] ( &widestring_0BF625 )
    COP [6B] ( &widestring_0BF630 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0000
    STA $0D98

  code_0BE462:
    COP [C2]
    COP [40] ( #$0380, &code_0BE498 )
    COP [40] ( #$0800, &code_0BE75B )
    COP [40] ( #$0400, &code_0BE774 )
    COP [40] ( #$8000, &code_0BE47D )
    RTL 
}

code_0BE47D {
    COP [06] ( #0D )
    LDA $0656
    ORA $0658
    STA $0658
    LDA #$FFFF
    STA $0D98
    LDA $0D94
    STA $0D92
    JMP $&code_0BE354
}

code_0BE498 {
    LDA #$0380
    TSB $0658
    LDA $0D98
    BEQ code_0BE4E7
    DEC 
    BNE code_0BE4C5
    COP [06] ( #0D )
    LDA $0D90
    INC 
    AND #$0001
    STA $0D90
    COP [6B] ( &widestring_0BF625 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0380
    TSB $0658
    JMP $&code_0BE462
}

code_0BE4C5 {
    DEC 
    BNE code_0BE4E7
    COP [06] ( #0D )
    LDA $0D8E
    INC 
    AND #$0001
    STA $0D8E
    COP [6B] ( &widestring_0BF630 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0380
    TSB $0658
    JMP $&code_0BE462
}

code_0BE4E7 {
    COP [40] ( #$0080, &code_0BE4EE )
    RTL 
}

code_0BE4EE {
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA #$FFFF
    STA $0D98
    LDA $0D90
    STA $0B24
    LDA $0D8E
    STA $0B26
    JSR $&sub_0BE673
    LDA #$0008
    STA $scene_next
    COP [26] ( #08, #$0050, #$00A0, #00, #$1200 )
    LDA #$2800
    TRB $player_flags
    COP [E0]
}

code_0BE527 {
    PHX 
    LDA $0D92
    ASL 
    TAY 
    LDA $0D74, Y
    ASL 
    TAX 
    LDA $@strings_0BF706, X
    SEC 
    SBC #$&strings_0BF706
    TAX 
    SEP #$20

  code_0BE53D:
    LDA $@strings_0BF706, X
    INX 
    CMP #$CA
    BNE code_0BE53D
    REP #$20
    LDA $@strings_0BF706, X
    TAY 
    LDA $@strings_0BF706+2, X
    PLX 
    STA $7F100E, X
    TYA 
    STA $7F100C, X
    SEC 
    SBC $06BE
    BMI code_0BE56E
    STA $7F100C, X
    LDA #$0001
    STA $7F0000, X
    BRA code_0BE57D
}

code_0BE56E {
    EOR #$FFFF
    INC 
    STA $7F100C, X
    LDA #$FFFF
    STA $7F0000, X
}

code_0BE57D {
    LDA $7F100E, X
    SEC 
    SBC $06C2
    BMI code_0BE596
    STA $7F100E, X
    BEQ code_0BE590
    LDA #$0001
}

code_0BE590 {
    STA $7F0002, X
    BRA code_0BE5A7
}

code_0BE596 {
    EOR #$FFFF
    INC 
    STA $7F100E, X
    BEQ code_0BE5A3
    LDA #$FFFF
}

code_0BE5A3 {
    STA $7F0002, X
}

code_0BE5A7 {
    LDA $7F100C, X
    CMP $7F100E, X
    BCC code_0BE612
    LDA $7F100C, X
    BEQ code_0BE610
    STA $7F1014, X
    LSR 
    STA $7F1010, X
    LDA $7F100E, X
    STA $7F1012, X
    COP [C1]
    LDA $7F101C, X
    STA $0000

  code_0BE5D1:
    LDA $7F0000, X
    CLC 
    ADC $06BE
    STA $06BE
    LDA $7F1010, X
    SEC 
    SBC $7F1012, X
    STA $7F1010, X
    BPL code_0BE5FF
    CLC 
    ADC $7F100C, X
    STA $7F1010, X
    LDA $7F0002, X
    CLC 
    ADC $06C2
    STA $06C2
}

code_0BE5FF {
    LDA $7F1014, X
    DEC 
    STA $7F1014, X
    BEQ code_0BE610
    DEC $0000
    BNE code_0BE5D1
    RTL 
}

code_0BE610 {
    COP [C5]
}

code_0BE612 {
    LDA $7F100E, X
    BEQ code_0BE671
    STA $7F1014, X
    LSR 
    STA $7F1012, X
    LDA $7F100C, X
    STA $7F1010, X
    COP [C1]
    LDA $7F101C, X
    STA $0000

  code_0BE632:
    LDA $7F0002, X
    CLC 
    ADC $06C2
    STA $06C2
    LDA $7F1012, X
    SEC 
    SBC $7F1010, X
    STA $7F1012, X
    BPL code_0BE660
    CLC 
    ADC $7F100E, X
    STA $7F1012, X
    LDA $7F0000, X
    CLC 
    ADC $06BE
    STA $06BE
}

code_0BE660 {
    LDA $7F1014, X
    DEC 
    STA $7F1014, X
    BEQ code_0BE671
    DEC $0000
    BNE code_0BE632
    RTL 
}

code_0BE671 {
    COP [C5]
}

---------------------------------------------

sub_0BE673 {
    LDA #$0000
    STA $0B04
    STZ $00EE
    LDA $0B24
    BNE code_0BE68C
    SEP #$20
    LDA #$91
    STA $APUIO0
    REP #$20
    BRA code_0BE695
}

code_0BE68C {
    SEP #$20
    LDA #$90
    STA $APUIO0
    REP #$20
}

code_0BE695 {
    LDA $0B26
    BNE code_0BE6B3
    LDA #$8000
    STA $0DAC
    LDA #$4000
    STA $0DAA
    LDA #$0000
    STA $0DB0
    LDA #$0040
    STA $0DAE
    RTS 
}

code_0BE6B3 {
    LDA #$0000
    STA $0DB0
    RTS 
}

---------------------------------------------

func_0BE6BA {
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF476 )
    COP [C8] ( &code_0BEB8B )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0000
    STA $0D92

  code_0BE6D0:
    COP [C2]
    COP [40] ( #$0800, &code_0BEA86 )
    COP [40] ( #$0400, &code_0BEA9F )
    COP [40] ( #$0080, &code_0BE6FD )
    COP [40] ( #$8000, &code_0BE6EB )
    RTL 
}

code_0BE6EB {
    COP [06] ( #0D )
    LDA $0656
    ORA $0658
    STA $0658
    JSR $&sub_0BEBF9
    JMP $&func_0BE2CC
}

code_0BE6FD {
    COP [06] ( #12 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D92
    ASL 
    TAY 
    LDA $0D74, Y
    BNE code_0BE714
    RTL 
}

code_0BE714 {
    COP [06] ( #11 )
    LDA $0D92
    STA $0D94
    JSR $&sub_0BE840
    LDA #$FFFF
    STA $0D92
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF538 )
    COP [6B] ( &widestring_0BF625 )
    COP [6B] ( &widestring_0BF630 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0000
    STA $0D98

  code_0BE740:
    COP [C2]
    COP [40] ( #$0380, &code_0BE7A5 )
    COP [40] ( #$0800, &code_0BE75B )
    COP [40] ( #$0400, &code_0BE774 )
    COP [40] ( #$8000, &code_0BE790 )
    RTL 
}

code_0BE75B {
    COP [06] ( #10 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D98
    DEC 
    BPL code_0BE770
    LDA #$0002
}

code_0BE770 {
    STA $0D98
    RTL 
}

code_0BE774 {
    COP [06] ( #10 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D98
    INC 
    CMP #$0003
    BCC code_0BE78C
    LDA #$0000
}

code_0BE78C {
    STA $0D98
    RTL 
}

code_0BE790 {
    COP [06] ( #0D )
    LDA $0656
    ORA $0658
    STA $0658
    LDA #$FFFF
    STA $0D98
    JMP $&func_0BE6BA
}

code_0BE7A5 {
    LDA $0D98
    BEQ code_0BE7EE
    DEC 
    BNE code_0BE7CC
    COP [06] ( #10 )
    LDA $0D90
    INC 
    AND #$0001
    STA $0D90
    COP [6B] ( &widestring_0BF625 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0380
    TSB $0658
    JMP $&code_0BE740
}

code_0BE7CC {
    DEC 
    BNE code_0BE7EE
    COP [06] ( #10 )
    LDA $0D8E
    INC 
    AND #$0001
    STA $0D8E
    COP [6B] ( &widestring_0BF630 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0380
    TSB $0658
    JMP $&code_0BE740
}

code_0BE7EE {
    COP [40] ( #$0080, &code_0BE7F5 )
    RTL 
}

code_0BE7F5 {
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA #$FFFF
    STA $0D98
    LDA $0D94
    JSR $&sub_0BE87C
    PHX 
    LDA $0D94
    XBA 
    ASL 
    TAX 
    JSL $@func_03D9B8
    LDA $0018
    STA $3063FC, X
    LDA $001C
    STA $3063FE, X
    PLX 
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF476 )
    COP [C8] ( &code_0BEB8B )
    COP [BD] ( @asciistring_01EADC )
    LDA $0D94
    STA $0D92
    JMP $&code_0BE6D0
}

---------------------------------------------

sub_0BE840 {
    PHX 
    XBA 
    ASL 
    TAX 
    PHX 
    LDA $01, S
    CLC 
    ADC #$0B24
    SEC 
    SBC #$0A00
    TAX 
    LDA $306200, X
    CMP #$0002
    BCC code_0BE85C
    LDA #$0000
}

code_0BE85C {
    STA $0D90
    LDA $01, S
    CLC 
    ADC #$0B26
    SEC 
    SBC #$0A00
    TAX 
    LDA $306200, X
    CMP #$0002
    BCC code_0BE876
    LDA #$0000
}

code_0BE876 {
    STA $0D8E
    PLX 
    PLX 
    RTS 
}

---------------------------------------------

sub_0BE87C {
    PHX 
    XBA 
    ASL 
    TAX 
    PHX 
    LDA $01, S
    CLC 
    ADC #$0B24
    SEC 
    SBC #$0A00
    TAX 
    LDA $0D90
    STA $306200, X
    LDA $01, S
    CLC 
    ADC #$0B26
    SEC 
    SBC #$0A00
    TAX 
    LDA $0D8E
    STA $306200, X
    PLX 
    PLX 
    RTS 
}

---------------------------------------------

func_0BE8A8 {
    LDA $0D74
    BEQ code_0BE8D4
    LDA $0D76
    BEQ code_0BE8D4
    LDA $0D78
    BEQ code_0BE8D4
    LDA #$0002
    STA $0D98
    STZ $00EE
    COP [6B] ( &widestring_0BF679 )
    LDA #$0001
    STA $00EE
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF3F4 )
    JMP $&code_0BE2DC
}

code_0BE8D4 {
    JSR $&sub_0BEBF9
    LDA #$0000
    STA $0D92

  code_0BE8DD:
    COP [6B] ( &widestring_0BF48C )
    COP [C8] ( &code_0BEB8B )
    COP [BD] ( @asciistring_01EADC )
    COP [C2]
    COP [40] ( #$0800, &code_0BE905 )
    COP [40] ( #$0400, &code_0BE91E )
    COP [40] ( #$0080, &code_0BE949 )
    COP [40] ( #$8000, &code_0BE93A )
    RTL 
}

code_0BE905 {
    COP [06] ( #10 )
    LDA $0D92
    DEC 
    BPL code_0BE911
    LDA #$0002
}

code_0BE911 {
    STA $0D92
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE91E {
    COP [06] ( #10 )
    LDA $0D92
    INC 
    CMP #$0003
    BCC code_0BE92D
    LDA #$0000
}

code_0BE92D {
    STA $0D92
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE93A {
    COP [06] ( #0D )
    LDA #$8000
    TSB $0658
    JSR $&sub_0BEBF9
    JMP $&func_0BE2CC
}

code_0BE949 {
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D92
    ASL 
    TAY 
    LDA $0D74, Y
    BNE code_0BE960
    RTL 
}

code_0BE960 {
    LDY #$0000

  code_0BE963:
    LDA $0D74, Y
    BEQ code_0BE972
    INY 
    INY 
    CPY #$0006
    BCC code_0BE963
    BNE code_0BE972
    RTL 
}

code_0BE972 {
    TYA 
    LSR 
    STA $0D96
    COP [C2]
    COP [40] ( #$0800, &code_0BE992 )
    COP [40] ( #$0400, &code_0BE9B7 )
    COP [40] ( #$0080, &code_0BE9F7 )
    COP [40] ( #$8000, &code_0BE9DF )
    RTL 
}

code_0BE992 {
    COP [06] ( #10 )
    LDA $0D96

  code_0BE998:
    DEC 
    BPL code_0BE99E
    LDA #$0002
}

code_0BE99E {
    STA $0D96
    CMP $0D92
    BEQ code_0BE998
    ASL 
    TAY 
    LDA $0D74, Y
    BNE code_0BE992
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE9B7 {
    COP [06] ( #10 )
    LDA $0D96

  code_0BE9BD:
    INC 
    CMP #$0003
    BCC code_0BE9C6
    LDA #$0000
}

code_0BE9C6 {
    STA $0D96
    CMP $0D92
    BEQ code_0BE9BD
    ASL 
    TAY 
    LDA $0D74, Y
    BNE code_0BE9B7
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BE9DF {
    COP [06] ( #0D )
    LDA $0656
    ORA $0658
    STA $0658
    JSR $&sub_0BEBF9
    LDA #$FFFF
    STA $0D96
    JMP $&code_0BE8DD
}

code_0BE9F7 {
    LDA $0D96
    ASL 
    TAY 
    LDA $0D74, Y
    BEQ code_0BEA04
    JMP $&code_0BE949
}

code_0BEA04 {
    COP [06] ( #29 )
    LDA $0656
    ORA $0658
    STA $0658
    PHX 
    LDA $0D92
    AND #$0003
    XBA 
    ASL 
    CLC 
    ADC #$6200
    TAX 
    LDA $0D96
    AND #$0003
    XBA 
    ASL 
    CLC 
    ADC #$6200
    TAY 
    SEP #$20
    LDA #$30
    STA $0405
    LDA #$30
    STA $0404
    REP #$20
    LDA #$01FF
    JSR $0402
    PLX 
    LDA $0D96
    STA $0D92
    LDA #$FFFF
    STA $0D96
    JSR $&sub_0BED64
    JSR $&sub_0BEBF9
    JMP $&code_0BE8DD
}

code_0BEA55 {
    JSR $&sub_0BEBF9

  code_0BEA58:
    COP [6B] ( &widestring_0BF4A7 )
    COP [C8] ( &code_0BEB8B )
    COP [BD] ( @asciistring_01EADC )
    LDA #$0000
    STA $0D92

  code_0BEA6B:
    COP [C2]
    COP [40] ( #$0800, &code_0BEA86 )
    COP [40] ( #$0400, &code_0BEA9F )
    COP [40] ( #$0080, &code_0BEACD )
    COP [40] ( #$8000, &code_0BEABB )
    RTL 
}

code_0BEA86 {
    COP [06] ( #10 )
    LDA $0D92
    DEC 
    BPL code_0BEA92
    LDA #$0002
}

code_0BEA92 {
    STA $0D92
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BEA9F {
    COP [06] ( #10 )
    LDA $0D92
    INC 
    CMP #$0003
    BCC code_0BEAAE
    LDA #$0000
}

code_0BEAAE {
    STA $0D92
    LDA $0656
    ORA $0658
    STA $0658
    RTL 
}

code_0BEABB {
    COP [06] ( #0D )
    LDA $0656
    ORA $0658
    STA $0658
    JSR $&sub_0BEBF9
    JMP $&func_0BE2CC
}

code_0BEACD {
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    LDA $0D92
    ASL 
    TAY 
    LDA $0D74, Y
    BNE code_0BEAF0
    COP [06] ( #12 )
    LDA $0D92
    JSL $@func_03D994
    JMP $&code_0BEA6B
}

code_0BEAF0 {
    LDA $0D92
    STA $0D94
    LDA #$FFFF
    STA $0D92
    JSR $&sub_0BEBF9
    COP [6B] ( &widestring_0BF6B3 )
    COP [BD] ( @asciistring_01EADC )
    LDA $0D94
    ASL 
    TAY 
    LDA $0D7A, Y
    PHY 
    JSR $&sub_0BF1DB
    PLY 
    STA $0D9A
    LDA $0D80, Y
    PHY 
    JSR $&sub_0BF1DB
    PLY 
    STA $0D9E
    LDA $0D86, Y
    PHY 
    JSR $&sub_0BF1DB
    PLY 
    STA $0D9C
    COP [6B] ( &widestring_0BF6A4 )
    COP [BD] ( @asciistring_01EADC )
    LDA #$4000
    STA $0DAA
    STZ $0DAE
    COP [BE] ( #02, #03, &code_list_0BEB46 )
}

code_list_0BEB46 [
  &code_0BEB4C   ;00
  &code_0BEB4C   ;01
  &code_0BEB61   ;02
]

code_0BEB4C {
    LDA #$8000
    TSB $0658
    LDA #$8000
    STA $0DAA
    LDA #$4000
    STA $0DAE
    JMP $&code_0BEA55
}

code_0BEB61 {
    LDA #$8000
    STA $0DAA
    LDA #$4000
    STA $0DAE
    COP [06] ( #13 )
    COP [C1]
    LDA $0D94
    JSL $@func_03D994
    COP [DA] ( #1D )
    LDA $1C
    STA $1A
    STZ $1C
    JSR $&sub_0BEBF9
    JSR $&sub_0BED64
    JMP $&code_0BEA58
}

code_0BEB8B {
    LDA $0D74
    BEQ code_0BEBAF
    LDA $0D7A
    JSR $&sub_0BF1DB
    STA $0D9A
    LDA $0D80
    JSR $&sub_0BF1DB
    STA $0D9E
    LDA $0D86
    JSR $&sub_0BF1DB
    STA $0D9C
    COP [6B] ( &widestring_0BF4C3 )
}

code_0BEBAF {
    LDA $0D76
    BEQ code_0BEBD3
    LDA $0D7C
    JSR $&sub_0BF1DB
    STA $0D9A
    LDA $0D82
    JSR $&sub_0BF1DB
    STA $0D9E
    LDA $0D88
    JSR $&sub_0BF1DB
    STA $0D9C
    COP [6B] ( &widestring_0BF4EA )
}

code_0BEBD3 {
    LDA $0D78
    BEQ code_0BEBF7
    LDA $0D7E
    JSR $&sub_0BF1DB
    STA $0D9A
    LDA $0D84
    JSR $&sub_0BF1DB
    STA $0D9E
    LDA $0D8A
    JSR $&sub_0BF1DB
    STA $0D9C
    COP [6B] ( &widestring_0BF511 )
}

code_0BEBF7 {
    COP [C5]
}

---------------------------------------------

sub_0BEBF9 {
    PHP 
    PHX 
    PHD 
    SEP #$20
    JSL $@func_02F076
    PLX 
    PLD 
    PLP 
    RTS 
}

---------------------------------------------

func_0BEC06_noref {
    COP [40] ( #$8000, &code_0BEC8C )
    COP [40] ( #$6040, &code_0BECA1 )
    COP [40] ( #$0800, &code_0BEC6C )
    COP [40] ( #$0400, &code_0BEC74 )
    LDA $14
    CMP #$0002
    BCS code_0BEC31
    COP [40] ( #$0200, &code_0BEC7C )
    COP [40] ( #$0100, &code_0BEC84 )
}

code_0BEC31 {
    LDA $18
    INC $18
    BIT #$000F
    BEQ code_0BEC53
    LDA $1A
    CLC 
    RTS 
}

---------------------------------------------

func_0BEC3E {
    STA $1A
    JSR $&sub_0BECFB
    STZ $18
    LDA $0656
    ORA $0658
    STA $0658
    COP [06] ( #10 )
    LDA $18
}

code_0BEC53 {
    BIT #$0010
    BNE code_0BEC5F
    JSR $&sub_0BECB1
    LDA $1A
    CLC 
    RTS 
}

code_0BEC5F {
    JSR $&sub_0BECD9
    LDA #$0001
    TSB $09EC
    LDA $1A
    CLC 
    RTS 
}

code_0BEC6C {
    LDA $1A
    SEC 
    SBC #$0001
    BRA func_0BEC3E
}

code_0BEC74 {
    LDA $1A
    CLC 
    ADC #$0001
    BRA func_0BEC3E
}

code_0BEC7C {
    LDA $1A
    SEC 
    SBC #$0002
    BRA func_0BEC3E
}

code_0BEC84 {
    LDA $1A
    CLC 
    ADC #$0002
    BRA func_0BEC3E
}

code_0BEC8C {
    JSR $&sub_0BECB1
    COP [06] ( #11 )
    LDA $0656
    ORA $0658
    STA $0658
    STZ $18
    LDA $1A
    SEC 
    RTS 
}

code_0BECA1 {
    LDA $0656
    ORA $0658
    STA $0658
    STZ $18
    LDA #$FFFF
    SEC 
    RTS 
}

---------------------------------------------

sub_0BECB1 {
    PHX 
    LDA $14
    ASL 
    TAX 
    LDA $@table_0BED3C, X
    SEC 
    SBC #$&table_0BED3C
    CLC 
    ADC $1A
    CLC 
    ADC $1A
    TAX 
    LDA $@table_0BED3C+2, X
    TAX 
    LDA #$202B
    STA $7F0200, X
    PLX 
    LDA #$0001
    TSB $09EC
    RTS 
}

---------------------------------------------

sub_0BECD9 {
    PHX 
    LDA $14
    ASL 
    TAX 
    LDA $@table_0BED3C, X
    SEC 
    SBC #$&table_0BED3C
    CLC 
    ADC $1A
    CLC 
    ADC $1A
    TAX 
    LDA $@table_0BED3C+2, X
    TAX 
    LDA #$2040
    STA $7F0200, X
    PLX 
    RTS 
}

---------------------------------------------

sub_0BECFB {
    PHX 
    LDA $14
    ASL 
    TAX 
    LDA $@table_0BED3C, X
    SEC 
    SBC #$&table_0BED3C
    TAX 
    LDA $1A
    BPL code_0BED12
    CLC 
    ADC $@table_0BED3C, X
}

code_0BED12 {
    CMP $@table_0BED3C, X
    BCC code_0BED1D
    SEC 
    SBC $@table_0BED3C, X
}

code_0BED1D {
    STA $1A
    LDA $@table_0BED3C, X
    TAY 
    DEY 
    INX 
    INX 

  code_0BED27:
    LDA $@table_0BED3C, X
    PHX 
    TAX 
    LDA #$2040
    STA $7F0200, X
    PLX 
    INX 
    INX 
    DEY 
    BPL code_0BED27
    PLX 
    RTS 
}

---------------------------------------------

table_0BED3C [
  &word_0BED44   ;00
  &word_0BED4E   ;01
  &word_0BED54   ;02
  &word_0BED5C   ;03
]

word_0BED44 [
  #$0004   ;00
  #$014A   ;01
  #$01CA   ;02
  #$0160   ;03
  #$01E0   ;04
]

word_0BED4E [
  #$0002   ;00
  #$01CE   ;01
  #$01D8   ;02
]

word_0BED54 [
  #$0003   ;00
  #$02CA   ;01
  #$044A   ;02
  #$05CA   ;03
]

word_0BED5C [
  #$0003   ;00
  #$034A   ;01
  #$03CA   ;02
  #$044A   ;03
]

---------------------------------------------

sub_0BED64 {
    PHX 
    LDA #$0000
    STA $0D74
    STA $0D76
    STA $0D78
    STA $0D7A
    STA $0D7C
    STA $0D7E
    STA $0D80
    STA $0D82
    STA $0D84
    STA $0D80
    STA $0D82
    STA $0D84
    LDA #$0002
    STA $24
    STZ $26
    LDA $306000
    CMP #$0003
    BCC code_0BEDA3
    LDA #$0000
    STA $306000
}

code_0BEDA3 {
    STA $0D8C

  code_0BEDA6:
    LDA $24
    XBA 
    ASL 
    TAX 
    JSL $@func_03D9B8
    LDA $0018
    CMP $3063FC, X
    BNE code_0BEE11
    LDA $001C
    CMP $3063FE, X
    BNE code_0BEE11
    PHX 
    LDA $24
    ASL 
    TAY 
    TXA 
    CLC 
    ADC #$0B12
    SEC 
    SBC #$0A00
    TAX 
    LDA $306200, X
    STA $0D74, Y
    LDA $01, S
    CLC 
    ADC #$0ACA
    SEC 
    SBC #$0A00
    TAX 
    LDA $306200, X
    STA $0D7A, Y
    LDA $01, S
    CLC 
    ADC #$0ADC
    SEC 
    SBC #$0A00
    TAX 
    LDA $306200, X
    STA $0D80, Y
    LDA $01, S
    CLC 
    ADC #$0ADE
    SEC 
    SBC #$0A00
    TAX 
    LDA $306200, X
    STA $0D86, Y
    PLA 
    SEC 
    BRA code_0BEE12
}

code_0BEE11 {
    CLC 
}

code_0BEE12 {
    ROL $26
    LDA $24
    DEC 
    STA $24
    BMI code_0BEE1E
    JMP $&code_0BEDA6
}

code_0BEE1E {
    PLX 
    RTS 
}

---------------------------------------------

func_0BF178_noref {
    LDA $00E0
    AND $00E2
    STA $00E2
    LDA $00E2
    TRB $00E0
    LDA $00E0
    BIT #$0040
    BEQ code_0BF1A1
    LDY $player_actor
    LDA $0010, Y
    EOR #$0008
    STA $0010, Y
    LDA #$0040
    TSB $00E2
}

code_0BF1A1 {
    RTL 
}

---------------------------------------------

func_0BF1A2_noref {
    STZ $00DE
    RTL 
}

---------------------------------------------

func_0BF1A6_noref {
    INC $00DE
    RTL 
}

---------------------------------------------

func_0BF1AA_noref {
    LDA $00E0
    BIT #$8000
    BNE code_0BF1B3
    RTL 
}

code_0BF1B3 {
    LDA $00DE
    JSR $&sub_0BF1DB
    STA $0000
    LDA $068A
    CLC 
    ADC #$0010
    STA $0018
    LDA $068E
    CLC 
    ADC #$0070
    STA $001C
    LDA #$3200
    STA $0002
    JSL $@func_03BAE1
    RTL 
}

---------------------------------------------

sub_0BF1DB {
    PHA 
    LDY $0000
    STZ $0000
    CMP #$03E8
    BCS code_0BF245
    CMP #$01F4
    BCC code_0BF1F8
    SEC 
    SBC #$01F4
    PHA 
    LDA #$0005
    STA $0000
    PLA 
}

code_0BF1F8 {
    CMP #$0064
    BCC code_0BF206
    SEC 
    SBC #$0064
    INC $0000
    BRA code_0BF1F8
}

code_0BF206 {
    PHA 
    LDA $0000
    XBA 
    AND #$FF00
    STA $0000
    PLA 
    SEP #$20
    CMP #$32
    BCC code_0BF222
    SEC 
    SBC #$32
    PHA 
    LDA #$05
    STA $0000
    PLA 
}

code_0BF222 {
    CMP #$0A
    BCC code_0BF22E
    SEC 
    SBC #$0A
    INC $0000
    BRA code_0BF222
}

code_0BF22E {
    PHA 
    LDA $0000
    ASL 
    ASL 
    ASL 
    ASL 
    ORA $01, S
    STA $01, S
    PLA 
    REP #$20
    STA $01, S
    STY $0000
    PLA 
    CLC 
    RTS 
}

code_0BF245 {
    STY $0000
    PLA 
    SEC 
    RTS 
}

---------------------------------------------

func_0BF24B_noref {
    LDA $00E1
    BIT #$F040
    ASL $A9
    TSB $22
    CMP #$8281
    RTL 
}

---------------------------------------------

func_0BF259_noref {
    LDA $JOY2L
    STA $00E0
    RTL 
}

---------------------------------------------

func_0BF260_noref {
    RTL 
}

---------------------------------------------

func_0BF261_noref {
    LDA $0660
    BIT #$0080
    BEQ code_0BF2A5

  code_0BF269:
    JSL $@func_028191
    JSL $@func_0BF2A6
    JSL $@func_0281A2
    LDA $0660
    BIT #$0080
    BNE code_0BF269

  code_0BF27D:
    JSL $@func_028191
    JSL $@func_0BF2A6
    JSL $@func_0281A2
    LDA $0660
    BIT #$0080
    BEQ code_0BF27D

  code_0BF291:
    JSL $@func_028191
    JSL $@func_0BF2A6
    JSL $@func_0281A2
    LDA $0660
    BIT #$0080
    BNE code_0BF291
}

code_0BF2A5 {
    RTL 
}

---------------------------------------------

func_0BF2A6 {
    PHP 
    REP #$20
    PHA 
    SEP #$20
    LDA $804210

  code_0BF2B0:
    LDA $804210
    BPL code_0BF2B0
    LDA $804210
    LDA $06EF
    BIT #$08
    BEQ code_0BF309
    LDA $C2
    STA $M7A
    LDA $C3
    STA $M7A
    LDA $C4
    STA $M7B
    LDA $C5
    STA $M7B
    LDA $C6
    STA $M7C
    LDA $C7
    STA $M7C
    LDA $C8
    STA $M7D
    LDA $C9
    STA $M7D
    LDA $CA
    STA $M7X
    LDA $CB
    AND #$1F
    STA $M7X
    LDA $CC
    STA $M7Y
    LDA $CD
    AND #$1F
    STA $M7Y
    LDX $BE
    STX $CE
    LDX $C0
    STX $D0
}

code_0BF309 {
    REP #$20
    LDA $09AC
    BEQ code_0BF319
    STA $0656
    STZ $09AC
    PLA 
    PLP 
    RTL 
}

code_0BF319 {
    LDA $0660
    AND #$0F00
    STA $065E
    LDA $0DB2
    BEQ code_0BF335
    LDA $0660
    BIT #$1000
    BEQ code_0BF335
    LDA $0DB2
    TSB $065E
}

code_0BF335 {
    LDA $0DB4
    BEQ code_0BF348
    LDA $0660
    BIT #$2000
    BEQ code_0BF348
    LDA $0DB4
    TSB $065E
}

code_0BF348 {
    LDA $0DAA
    BEQ code_0BF35B
    LDA $0660
    BIT #$8000
    BEQ code_0BF35B
    LDA $0DAA
    TSB $065E
}

code_0BF35B {
    LDA $0DAE
    BEQ code_0BF36E
    LDA $0660
    BIT #$4000
    BEQ code_0BF36E
    LDA $0DAE
    TSB $065E
}

code_0BF36E {
    LDA $0DAC
    BEQ code_0BF381
    LDA $0660
    BIT #$0080
    BEQ code_0BF381
    LDA $0DAC
    TSB $065E
}

code_0BF381 {
    LDA $0DB0
    BEQ code_0BF394
    LDA $0660
    BIT #$0040
    BEQ code_0BF394
    LDA $0DB0
    TSB $065E
}

code_0BF394 {
    LDA $0DA8
    BEQ code_0BF3A7
    LDA $0660
    BIT #$0020
    BEQ code_0BF3A7
    LDA $0DA8
    TSB $065E
}

code_0BF3A7 {
    LDA $0DA6
    BEQ code_0BF3BA
    LDA $0660
    BIT #$0010
    BEQ code_0BF3BA
    LDA $0DA6
    TSB $065E
}

code_0BF3BA {
    LDA $065E
    STA $0656
    STA $0660
    AND $0658
    STA $0658
    BEQ code_0BF3E2
    AND $joypad_mask_inv
    BEQ code_0BF3E2
    LDA $0662
    INC 
    STA $0662
    CMP #$000C
    BNE code_0BF3E5
    LDA $joypad_mask_inv
    TRB $0658
}

code_0BF3E2 {
    STZ $0662
}

code_0BF3E5 {
    LDA $0658
    TRB $0656
    LDA $joypad_mask_std
    TRB $0656
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

table_0BF6AD [
  &widestring_0BF4C3+M   ;00
  &widestring_0BF4EA+M   ;01
  &widestring_0BF511+M   ;02
]

---------------------------------------------

widestring_0BF3F4 `[DLG:6,A][SIZ:A,4]Start Journey[N]Erase Trip Diary[N]Copy Trip Diary[N][LU1:B]Snd/Buttons`

widestring_0BF437 `[DLG:2,8][SIZ:E,7]Which Diary?[N][::] Diary1 [ADR:&strings_0BF706,D74][N][N] Diary2 [ADR:&strings_0BF706,D76][N][N] Diary3 [ADR:&strings_0BF706,D78]`

widestring_0BF476 `[DLG:2,8][SIZ:E,7][LU1:B]Snd/Button[N][JMP:&widestring_0BF437+M]`

widestring_0BF48C `[DLG:2,8][SIZ:E,7]Move which Diary?[N][JMP:&widestring_0BF437+M]`

widestring_0BF4A7 `[DLG:2,8][SIZ:E,7]Erase which Diary?[N][JMP:&widestring_0BF437+M]`

widestring_0BF4C3 `[DLG:2,C][::][SKP:2]HP[SKP:1][BCD:2,D9A][SKP:2]STR[SKP:1][BCD:2,D9C][SKP:2]DEF[SKP:1][BCD:2,D9E]`

widestring_0BF4EA `[DLG:2,10][::][SKP:2]HP[SKP:1][BCD:2,D9A][SKP:2]STR[SKP:1][BCD:2,D9C][SKP:2]DEF[SKP:1][BCD:2,D9E]`

widestring_0BF511 `[DLG:2,14][::][SKP:2]HP[SKP:1][BCD:2,D9A][SKP:2]STR[SKP:1][BCD:2,D9C][SKP:2]DEF[SKP:1][BCD:2,D9E]`

widestring_0BF538 `[DLG:6,8][SIZ:A,8][SKP:2][LU1:B]Snd/Buttons[N]End Changes[N]Sound[N][LU2:2]Type[N][SKP:5]   :Attack/Talk[N][SKP:5]   :Item/Cancel[N][SKP:5]   :Item palette[N][SKP:5]   :Not used`

widestring_0BF5AD `[DLG:6,8][SIZ:A,8]Arrangement  OK?[N]Start Journey[N]Sound[N][LU2:2]Type[N][SKP:5]   :Attack/Talk[N][SKP:5]   :Item/Cancel[N][SKP:5]   :Item palette[N][SKP:5]   :Not used`

widestring_0BF625 `[DLG:D,C][SFX:0][ADR:&table_0BF667,D90]`

widestring_0BF630 `[DLG:11,E][SFX:0][ADR:&table_0BF63B,D8E]`

---------------------------------------------

table_0BF63B [
  &widestring_0BF63F   ;00
  &widestring_0BF653   ;01
]

widestring_0BF63F `1[DLG:8,10]A[DLG:8,12]B[DLG:8,14]SEL[DLG:8,16]Y`

widestring_0BF653 `2[DLG:8,10]B[DLG:8,12]Y[DLG:8,14]SEL[DLG:8,16]A`

---------------------------------------------

table_0BF667 [
  &widestring_0BF66B   ;00
  &widestring_0BF672   ;01
]

widestring_0BF66B `Stereo`

widestring_0BF672 `Mono  `

---------------------------------------------

widestring_0BF679 `[DLG:4,15][SIZ:C,2][DLY:FF]Diary not empty[N]Erase and select[FIN][CLD]`

---------------------------------------------

widestring_0BF6A4 `[DLG:4,A][ADR:&table_0BF6AD,D94]`

---------------------------------------------

widestring_0BF6B3 `[DLG:4,8][SIZ:D,5][ADR:&table_0BF6D9,D94][N][N]Erase diary? [N] No [N] Yes `

---------------------------------------------

table_0BF6D9 [
  &widestring_0BF6DF   ;00
  &widestring_0BF6EC   ;01
  &widestring_0BF6F9   ;02
]

widestring_0BF6DF `Diary1 [ADR:&strings_0BF706,D74]`

widestring_0BF6EC `Diary2 [ADR:&strings_0BF706,D76]`

widestring_0BF6F9 `Diary3 [ADR:&strings_0BF706,D78]`