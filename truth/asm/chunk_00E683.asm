?BANK 00
?INCLUDE 'chunk_028000'
?INCLUDE 'table_01A95E'
?INCLUDE 'dir_sprite_01ABDE'
?INCLUDE 'table_01B086'
?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

func_00E683 {
    TXY 
    LDX $0004, Y
    LDA $7F0014, X
    STA $0000
    LDA $7F000A, X
    STA $0002
    TYX 
    LDA $0000
    STA $7F0014, X
    LDA $0002
    STA $7F000A, X
    BRA code_00E6CE
}

---------------------------------------------

func_00E6A6 {
    TXY 
    LDX $0004, Y
    LDA $7F0014, X
    STA $0000
    LDA $7F000A, X
    STA $0002
    TYX 
    LDA $0000
    STA $7F0014, X
    LDA $0002
    STA $7F000A, X
    LDA #$FFFF
    STA $7F000E, X
}

code_00E6CE {
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $14
    BMI code_00E703
    STA $0018
    LDA $0016, Y
    SEC 
    SBC #$0008
    SEC 
    SBC $16
    BMI code_00E6F5
    STA $001C
    CMP $0018
    BCC code_00E6F2
    JMP $&code_00E7A5
}

code_00E6F2 {
    JMP $&code_00E789
}

code_00E6F5 {
    EOR #$FFFF
    INC 
    STA $001C
    CMP $0018
    BCS code_00E736
    BRA code_00E763
}

code_00E703 {
    EOR #$FFFF
    INC 
    STA $0018
    LDA $0016, Y
    SEC 
    SBC #$0008
    SEC 
    SBC $16
    BMI code_00E724
    STA $001C
    CMP $0018
    BCC code_00E721
    JMP $&code_00E7CE
}

code_00E721 {
    JMP $&code_00E7FB
}

code_00E724 {
    EOR #$FFFF
    INC 
    STA $001C
    CMP $0018
    BCC code_00E733
    JMP $&code_00E850
}

code_00E733 {
    JMP $&code_00E821
}

code_00E736 {
    JSR $&sub_00EDA8
    LDA #$0000
    STA $0000
    JSR $&sub_00EE7C
    LDA $0000
    BMI code_00E74A
    JMP $&code_00E8BA
}

code_00E74A {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0000
    EOR #$FFFF
    INC 
    TAY 
    LDA $0002
    STA $0000
    STY $0002
    JMP $&code_00E87E
}

code_00E763 {
    JSR $&code_00EDC3
    LDA #$0002
    STA $0000
    JSR $&code_00EE8C
    LDA $0000
    BMI code_00E777
    JMP $&code_00E8BA
}

code_00E777 {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0002
    EOR #$FFFF
    INC 
    STA $0002
    JMP $&code_00E87E
}

code_00E789 {
    JSR $&code_00EDC3
    LDA #$0004
    STA $0000
    JSR $&sub_00EE7C
    LDA $0000
    BMI code_00E79D
    JMP $&code_00E8BA
}

code_00E79D {
    COP [C1]
    JSR $&sub_00EE1C
    JMP $&code_00E87E
}

code_00E7A5 {
    JSR $&sub_00EDA8
    LDA #$0006
    STA $0000
    JSR $&code_00EE8C
    LDA $0000
    BMI code_00E7B9
    JMP $&code_00E8BA
}

code_00E7B9 {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0000
    TAY 
    LDA $0002
    STA $0000
    STY $0002
    JMP $&code_00E87E
}

code_00E7CE {
    JSR $&sub_00EDA8
    LDA #$0008
    STA $0000
    JSR $&sub_00EE7C
    LDA $0000
    BMI code_00E7E2
    JMP $&code_00E8BA
}

code_00E7E2 {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0002
    EOR #$FFFF
    INC 
    TAY 
    LDA $0000
    STA $0002
    STY $0000
    JMP $&code_00E87E
}

code_00E7FB {
    JSR $&code_00EDC3
    LDA #$000A
    STA $0000
    JSR $&code_00EE8C
    LDA $0000
    BMI code_00E80F
    JMP $&code_00E8BA
}

code_00E80F {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0000
    EOR #$FFFF
    INC 
    STA $0000
    JMP $&code_00E87E
}

code_00E821 {
    JSR $&code_00EDC3
    LDA #$000C
    STA $0000
    JSR $&sub_00EE7C
    LDA $0000
    BMI code_00E835
    JMP $&code_00E8BA
}

code_00E835 {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0000
    EOR #$FFFF
    INC 
    STA $0000
    LDA $0002
    EOR #$FFFF
    INC 
    STA $0002
    BRA code_00E87E
}

code_00E850 {
    JSR $&sub_00EDA8
    LDA #$000E
    STA $0000
    JSR $&code_00EE8C
    LDA $0000
    BMI code_00E864
    JMP $&code_00E8BA
}

code_00E864 {
    COP [C1]
    JSR $&sub_00EE1C
    LDA $0000
    EOR #$FFFF
    INC 
    TAY 
    LDA $0002
    EOR #$FFFF
    INC 
    STA $0000
    STY $0002
}

code_00E87E {
    LDY $04
    LDA $14
    CLC 
    ADC $0000
    STA $14
    STA $0014, Y
    LDA $0000
    STA $7F002C, X
    LDA $16
    CLC 
    ADC $0002
    STA $16
    STA $0016, Y
    LDA $0002
    STA $7F002E, X
    LDA $7F0012, X
    CMP #$0008
    BPL code_00E8AE
    RTL 
}

code_00E8AE {
    LDA #$0000
    STA $7F0012, X
    COP [C4] ( @code_00E6CE )
}

code_00E8BA {
    DEC 
    AND #$0007
    STA $0004
    COP [D9] ( #$0004, &code_list_00E8C7 )
}

code_list_00E8C7 [
  &code_00E74A   ;00
  &code_00E777   ;01
  &code_00E79D   ;02
  &code_00E7B9   ;03
  &code_00E7E2   ;04
  &code_00E80F   ;05
  &code_00E835   ;06
  &code_00E864   ;07
]

---------------------------------------------

head_00E94D [
  h_actor < #00, #00, #2C >   ;00
]

---------------------------------------------

func_00E950 {
    LDA #$1000
    TSB $12
    LDA $14
    SEC 
    SBC #$0008
    JSR $&sub_00ECEB
    STA $14
    LDA $16
    SEC 
    SBC #$0010
    JSR $&sub_00ECEB
    STA $16
    COP [CA] ( #03 )
    JSR $&sub_00ED0B
    LDA $06C4
    STA $0690
    COP [CB]
    COP [C1]
    JSR $&sub_00ED0B
    LDA $06C0
    ORA #$8000
    STA $06C8
    STZ $06C0
    RTL 
}

---------------------------------------------

head_00EA96 [
  h_actor < #00, #00, #2C >   ;00
]

---------------------------------------------

func_00EA99 {
    LDA #$1000
    TSB $12
    JSR $&sub_00ECF8
    COP [C1]
    JSR $&sub_00ED0B
    RTL 
}

---------------------------------------------

head_00EAA7 [
  h_actor < #00, #00, #2C >   ;00
]

---------------------------------------------

func_00EAAA {
    LDA #$1000
    TSB $12
    JSR $&sub_00ECF8
    COP [C1]
    LDA $16
    BEQ code_00EAC2
    LDY $06C2
    JSL $@func_028000
    STA $06C4
}

code_00EAC2 {
    RTL 
}

---------------------------------------------

head_00EAC3 [
  h_actor < #00, #00, #24 >   ;00
]

---------------------------------------------

func_00EAC6 {
    LDA #$1000
    TSB $12
    LDA #$0000
    STA $24
    STA $26
    JSR $&sub_00ECF8
    COP [C1]
    JSR $&sub_00ED0B
    LDA $06C0
    CLC 
    ADC $24
    STA $06C0
    LDA $06C4
    CLC 
    ADC $26
    STA $06C4
    RTL 
}

---------------------------------------------

func_00EB9B {
    LDA #$6000
    TRB $12
    COP [C1]
    LDA #$FFFF
    TSB $joypad_mask_std
    STZ $0656
    JSR $&sub_00ED28
    LDA #$2008
    TRB $10
    COP [95]
    COP [93]
    LDA #$2000
    TSB $10
    STZ $06E2
    LDA $06E0
    AND #$00FF
    ASL 
    TAX 
    LDA $&table_01A95E, X
    STA $06E0
    STZ $2A
    TDC 
    TAX 
    COP [C1]
    COP [DC]
    JSR $&sub_00ED68
    LDA #$2008
    TRB $10
    JSR $&sub_00ED28
    COP [95]
    COP [93]
    JSR $&sub_00ED84
    LDA #$FFFF
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

func_00EBEF {
    LDA #$6000
    TRB $12
    COP [C1]
    LDA #$FFFF
    TSB $joypad_mask_std
    STZ $0656
    JSR $&sub_00ED28
    LDA #$2008
    TRB $10
    COP [95]
    COP [93]
    LDA #$2000
    TSB $10
    STZ $06E2
    LDA $06E0
    AND #$00FF
    ASL 
    TAX 
    LDA $&table_01A95E, X
    STA $06E0
    STZ $2A
    TDC 
    TAX 
    COP [C1]
    COP [DD]
    JSR $&sub_00ED68
    LDA #$2008
    TRB $10
    JSR $&sub_00ED28
    COP [95]
    COP [93]
    JSR $&sub_00ED84
    LDA #$FFFF
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

func_00EC43 {
    LDA #$6000
    TRB $12
    COP [C1]
    LDA #$FFFF
    TSB $joypad_mask_std
    STZ $0656
    JSR $&sub_00ED48
    LDA #$2008
    TRB $10
    COP [95]
    COP [93]
    LDA #$2000
    TSB $10
    STZ $06E2
    LDA $06E0
    AND #$00FF
    ASL 
    TAX 
    LDA $&table_01A95E, X
    STA $06E0
    STZ $2A
    TDC 
    TAX 
    COP [C1]
    COP [DF]
    JSR $&sub_00ED68
    LDA #$2008
    TRB $10
    JSR $&sub_00ED48
    COP [95]
    COP [93]
    JSR $&sub_00ED84
    LDA #$FFFF
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

func_00EC97 {
    LDA #$6000
    TRB $12
    COP [C1]
    LDA #$FFFF
    TSB $joypad_mask_std
    STZ $0656
    JSR $&sub_00ED48
    LDA #$2008
    TRB $10
    COP [95]
    COP [93]
    LDA #$2000
    TSB $10
    STZ $06E2
    LDA $06E0
    AND #$00FF
    ASL 
    TAX 
    LDA $&table_01A95E, X
    STA $06E0
    STZ $2A
    TDC 
    TAX 
    COP [C1]
    COP [DE]
    JSR $&sub_00ED68
    LDA #$2008
    TRB $10
    JSR $&sub_00ED48
    COP [95]
    COP [93]
    JSR $&sub_00ED84
    LDA #$FFFF
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

sub_00ECEB {
    SEP #$20
    LSR 
    LSR 
    LSR 
    LSR 
    REP #$20
    AND #$0F0F
    TAY 
    RTS 
}

---------------------------------------------

sub_00ECF8 {
    LDA $14
    SEC 
    SBC #$0008
    JSR $&sub_00ECEB
    STY $14
    LDA $16
    JSR $&sub_00ECEB
    STY $16
    RTS 
}

---------------------------------------------

sub_00ED0B {
    LDA $14
    BEQ code_00ED19
    LDY $06BE
    JSL $@func_028000
    STA $06C0
}

code_00ED19 {
    LDA $16
    BEQ code_00ED27
    LDY $06C2
    JSL $@func_028000
    STA $06C4
}

code_00ED27 {
    RTS 
}

---------------------------------------------

sub_00ED28 {
    LDY $0650
    INC $0650
    LDA $0000, Y
    AND #$00FF
    ASL 
    TAY 
    LDA $&dir_sprite_01ABDE, Y
    STA $0000
    XBA 
    AND #$00FF
    ASL 
    TAY 
    LDA $&table_01B086, Y
    STA $2E
    RTS 
}

---------------------------------------------

sub_00ED48 {
    LDY $0650
    INC $0650
    LDA $0000, Y
    AND #$00FF
    ASL 
    TAY 
    LDA $&dir_sprite_01ABDE, Y
    STA $0000
    XBA 
    AND #$00FF
    ASL 
    TAY 
    LDA $&table_01B086, Y
    STA $2C
    RTS 
}

---------------------------------------------

sub_00ED68 {
    LDA $0650
    TAY 
    CLC 
    ADC #$0004
    STA $0650
    LDA $0000, Y
    CLC 
    ADC $14
    STA $14
    LDA $0002, Y
    CLC 
    ADC $16
    STA $16
    RTS 
}

---------------------------------------------

sub_00ED84 {
    LDY $player_actor
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    LDA $10
    ORA #$0008
    AND #$FDFF
    STA $0010, Y
    LDA $28
    STA $0028, Y
    LDA #$0000
    STA $0008, Y
    RTS 
}

---------------------------------------------

sub_00EDA8 {
    LDA $0018
    CMP $001C
    BNE code_00EDB5
    LDA #$0000
    BRA code_00EE10
}

code_00EDB5 {
    LDY $0018
    LDA $001C
    LSR 
    LSR 
    LSR 
    LSR 
    BNE code_00EDDD
    BRA code_00EDDC
}

code_00EDC3 {
    LDA $001C
    CMP $0018
    BNE code_00EDD0
    LDA #$0000
    BRA code_00EE10
}

code_00EDD0 {
    LDY $001C
    LDA $0018
    LSR 
    LSR 
    LSR 
    LSR 
    BNE code_00EDDD
}

code_00EDDC {
    INC 
}

code_00EDDD {
    SEP #$20
    JSL $@func_0281E8
    REP #$20
    AND #$00FF
    CMP #$0018
    BPL code_00EDF4
    CMP #$0011
    BPL code_00EE02
    BRA code_00EE08
}

code_00EDF4 {
    SEC 
    SBC #$0010
    EOR #$FFFF
    INC 
    CLC 
    ADC #$0010
    BRA code_00EE10
}

code_00EE02 {
    SEC 
    SBC #$0010
    BRA code_00EE10
}

code_00EE08 {
    EOR #$FFFF
    INC 
    CLC 
    ADC #$0010
}

code_00EE10 {
    STA $7F0010, X
    LDA #$0000
    STA $7F0012, X
    RTS 
}

---------------------------------------------

sub_00EE1C {
    LDA $7F0010, X
    ASL 
    ASL 
    ASL 
    ASL 
    ASL 
    TAY 
    LDA $7F0012, X
    STA $0004
    ASL 
    STA $0006
    TYA 
    CLC 
    ADC $0006
    TAY 
    LDA $7F0014, X
    STA $0000
    CLC 
    ADC $0004
    AND #$000F
    STA $0008
    STA $7F0012, X
    PHX 
    TYX 
    STZ $0002

  code_00EE51:
    LDA $@binary_00F193, X
    CLC 
    ADC $0002
    STA $0002
    INX 
    INX 
    INC $0004
    LDA $0004
    BIT #$FFF0
    BEQ code_00EE75
    TXA 
    SEC 
    SBC #$0020
    TAX 
    LDA #$0000
    STA $0004
}

code_00EE75 {
    CMP $0008
    BNE code_00EE51
    PLX 
    RTS 
}

---------------------------------------------

sub_00EE7C {
    LDA $7F0010, X
    CMP #$000D
    BPL code_00EE9A
    CMP #$0005
    BPL code_00EEA2
    BRA code_00EEAA
}

code_00EE8C {
    LDA $7F0010, X
    CMP #$000D
    BPL code_00EEAA
    CMP #$0005
    BPL code_00EEA2
}

code_00EE9A {
    LDA #$0000
    STA $0002
    BRA code_00EEB0
}

code_00EEA2 {
    LDA #$0001
    STA $0002
    BRA code_00EEB0
}

code_00EEAA {
    LDA #$0002
    STA $0002
}

code_00EEB0 {
    LDA $0000
    CLC 
    ADC $0002
    AND #$000F
    STA $0004
    LDA $7F000A, X
    LDA $7F000E, X
    BMI code_00EF1C
    SEC 
    SBC $0004
    BMI code_00EEE0
    BEQ code_00EF1C
    CMP #$0001
    BEQ code_00EF1C
    CMP #$000F
    BEQ code_00EF1C
    CMP #$0009
    BPL code_00EF0B
    BRA code_00EEF1
}

code_00EEE0 {
    CMP #$FFFF
    BEQ code_00EF1C
    CMP #$FFF1
    BEQ code_00EF1C
    CMP #$FFF9
    BPL code_00EF0B
    BRA code_00EEF1
}

code_00EEF1 {
    LDA $7F000E, X
    DEC 
    STA $7F000E, X
    STA $0004
    BPL code_00EF29
    LDA #$000F
    STA $7F000E, X
    STA $0004
    BRA code_00EF29
}

code_00EF0B {
    LDA $7F000E, X
    INC 
    AND #$000F
    STA $7F000E, X
    STA $0004
    BRA code_00EF29
}

code_00EF1C {
    LDA $0004
    STA $7F000E, X
    LDA #$FFFF
    STA $0000
}

code_00EF29 {
    LDA $0004, X
    TAY 
    LDA $7F000A, X
    BMI code_00EF40
    CLC 
    ADC $0004
    STA $0028, Y
    LDA #$0000
    STA $002A, Y
}

code_00EF40 {
    LDA $7F000A, X
    BMI code_00EF52
    PHX 
    TYX 
    TYA 
    TCD 
    JSL $@func_03CA55
    PLA 
    TXY 
    TAX 
    TCD 
}

code_00EF52 {
    LDA $7F000A, X
    STA $0006
    LDA $7F000E, X
    AND #$000F
    PHX 
    ASL 
    TAX 
    CLC 
    LDA $0006
    BPL code_00EF6A
    SEC 
}

code_00EF6A {
    LDA $@table_00EF72, X
    DEC 
    PLX 
    PHA 
    RTS 
}

---------------------------------------------

table_00EF72 [
  &code_00EF92   ;00
  &code_00EFB0   ;01
  &code_00EFCE   ;02
  &code_00EFEC   ;03
  &code_00F00A   ;04
  &code_00F028   ;05
  &code_00F049   ;06
  &code_00F06A   ;07
  &code_00F08B   ;08
  &code_00F0AC   ;09
  &code_00F0CD   ;0A
  &code_00F0EE   ;0B
  &code_00F10F   ;0C
  &code_00F130   ;0D
  &code_00F151   ;0E
  &code_00F172   ;0F
]

code_00EF92 {
    BCS code_00EF9D
    LDA $000E, Y
    AND #$3FFF
    STA $000E, Y
}

code_00EF9D {
    LDA $0000
    BMI code_00EFAF
    LDA #$0001
    STA $0000
    LDA #$0010
    STA $7F0010, X
}

code_00EFAF {
    RTS 
}

code_00EFB0 {
    BCS code_00EFBB
    LDA $000E, Y
    AND #$3FFF
    STA $000E, Y
}

code_00EFBB {
    LDA $0000
    BMI code_00EFCD
    LDA #$0001
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00EFCD {
    RTS 
}

code_00EFCE {
    BCS code_00EFD9
    LDA $000E, Y
    AND #$3FFF
    STA $000E, Y
}

code_00EFD9 {
    LDA $0000
    BMI code_00EFEB
    LDA #$0002
    STA $0000
    LDA #$0000
    STA $7F0010, X
}

code_00EFEB {
    RTS 
}

code_00EFEC {
    BCS code_00EFF7
    LDA $000E, Y
    AND #$3FFF
    STA $000E, Y
}

code_00EFF7 {
    LDA $0000
    BMI code_00F009
    LDA #$0002
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F009 {
    RTS 
}

code_00F00A {
    BCS code_00F015
    LDA $000E, Y
    AND #$3FFF
    STA $000E, Y
}

code_00F015 {
    LDA $0000
    BMI code_00F027
    LDA #$0003
    STA $0000
    LDA #$0010
    STA $7F0010, X
}

code_00F027 {
    RTS 
}

code_00F028 {
    BCS code_00F036
    LDA $000E, Y
    AND #$3FFF
    ORA #$8000
    STA $000E, Y
}

code_00F036 {
    LDA $0000
    BMI code_00F048
    LDA #$0003
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F048 {
    RTS 
}

code_00F049 {
    BCS code_00F057
    LDA $000E, Y
    AND #$3FFF
    ORA #$8000
    STA $000E, Y
}

code_00F057 {
    LDA $0000
    BMI code_00F069
    LDA #$0004
    STA $0000
    LDA #$0000
    STA $7F0010, X
}

code_00F069 {
    RTS 
}

code_00F06A {
    BCS code_00F078
    LDA $000E, Y
    AND #$3FFF
    ORA #$8000
    STA $000E, Y
}

code_00F078 {
    LDA $0000
    BMI code_00F08A
    LDA #$0004
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F08A {
    RTS 
}

code_00F08B {
    BCS code_00F099
    LDA $000E, Y
    AND #$3FFF
    ORA #$8000
    STA $000E, Y
}

code_00F099 {
    LDA $0000
    BMI code_00F0AB
    LDA #$0005
    STA $0000
    LDA #$0010
    STA $7F0010, X
}

code_00F0AB {
    RTS 
}

code_00F0AC {
    BCS code_00F0BA
    LDA $000E, Y
    AND #$3FFF
    ORA #$C000
    STA $000E, Y
}

code_00F0BA {
    LDA $0000
    BMI code_00F0CC
    LDA #$0005
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F0CC {
    RTS 
}

code_00F0CD {
    BCS code_00F0DB
    LDA $000E, Y
    AND #$3FFF
    ORA #$C000
    STA $000E, Y
}

code_00F0DB {
    LDA $0000
    BMI code_00F0ED
    LDA #$0006
    STA $0000
    LDA #$0000
    STA $7F0010, X
}

code_00F0ED {
    RTS 
}

code_00F0EE {
    BCS code_00F0FC
    LDA $000E, Y
    AND #$3FFF
    ORA #$C000
    STA $000E, Y
}

code_00F0FC {
    LDA $0000
    BMI code_00F10E
    LDA #$0006
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F10E {
    RTS 
}

code_00F10F {
    BCS code_00F11D
    LDA $000E, Y
    AND #$3FFF
    ORA #$4000
    STA $000E, Y
}

code_00F11D {
    LDA $0000
    BMI code_00F12F
    LDA #$0007
    STA $0000
    LDA #$0010
    STA $7F0010, X
}

code_00F12F {
    RTS 
}

code_00F130 {
    BCS code_00F13E
    LDA $000E, Y
    AND #$3FFF
    ORA #$4000
    STA $000E, Y
}

code_00F13E {
    LDA $0000
    BMI code_00F150
    LDA #$0007
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F150 {
    RTS 
}

code_00F151 {
    BCS code_00F15F
    LDA $000E, Y
    AND #$3FFF
    ORA #$4000
    STA $000E, Y
}

code_00F15F {
    LDA $0000
    BMI code_00F171
    LDA #$0008
    STA $0000
    LDA #$0000
    STA $7F0010, X
}

code_00F171 {
    RTS 
}

code_00F172 {
    BCS code_00F180
    LDA $000E, Y
    AND #$3FFF
    ORA #$4000
    STA $000E, Y
}

code_00F180 {
    LDA $0000
    BMI code_00F192
    LDA #$0008
    STA $0000
    LDA #$0008
    STA $7F0010, X
}

code_00F192 {
    RTS 
}

---------------------------------------------

binary_00F193 #01000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100000001000100010001000100010001000100010001000100010000000100010001000100010001000100000001000100010001000100000001000100010001000000010001000100010001000000010001000100010000000100010001000000010001000100000001000100010000000100010000000100010001000000010000000100010001000000010001000000010001000000010001000000010000000100010000000100010000000100000001000100000001000000010000000100000001000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000100000001000000010000000000010000000000010000000100000000000100000000000100000001000000000001000000000000000100000001000000000000000100000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000000010000000000000000000000010000000000000000000000000001000000000000000000000000000000010000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000