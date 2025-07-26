?BANK 02

?INCLUDE 'chunk_02CFD0'

!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

e_actor_02B42B {
    COP [C1]
    PHX 
    LDX $player_actor
    LDA $0010, X
    BIT #$00C0
    BEQ code_02B443
    LDA $7F0028, X
    BMI code_02B443
    PLX 
    JMP $&code_02B55B
}

code_02B443 {
    PLX 
    LDA $player_speed_ew
    ORA $player_speed_ns
    BEQ code_02B4C0
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDY $player_actor
    LDA $0014, Y
    STA $1A
    LDA $0016, Y
    SEC 
    SBC #$0008
    STA $1E
    JSR $&sub_02E2AF
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_02B57C, X
    BEQ code_02B474
    DEC 
    PHA 
    RTS 
}

code_02B474 {
    TXA 
    LSR 
    CMP #$0006
    BEQ code_02B483
    CMP #$0009
    BEQ code_02B483
    JMP $&code_02B550
}

code_02B483 {
    JSR $&sub_02E313
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$0005
    BNE code_02B498
    JMP $&code_02B53D
}

code_02B498 {
    CMP #$000A
    BNE code_02B4A0
    JMP $&code_02B542
}

code_02B4A0 {
    JSR $&sub_02E32B
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    CMP #$0005
    BNE code_02B4B5
    JMP $&code_02B53D
}

code_02B4B5 {
    CMP #$000A
    BNE code_02B4BD
    JMP $&code_02B542
}

code_02B4BD {
    JMP $&code_02B550
}

code_02B4C0 {
    LDA $player_flags
    BIT #$1000
    BNE code_02B4CB
    JMP $&code_02B55B
}

code_02B4CB {
    STZ $09B6
    STZ $09B8
    PHX 
    PHD 
    LDY $player_actor
    LDA $player_x_pos
    STA $001A
    LDA $player_y_pos
    STA $001E
    LDA #$0000
    TCD 
    JSR $&sub_02E2AF
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_02B57C, X
    BNE code_02B535
    JSR $&sub_02E343
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_02B57C, X
    BNE code_02B535
    JSR $&sub_02E313
    STX $00
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_02B57C, X
    BNE code_02B535
    JSR $&sub_02E343
    SEP #$20
    JSR $&sub_02E2FC
    REP #$20
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_02B57C, X
    BEQ code_02B550
}

code_02B535 {
    DEC 
    PHA 
    RTS 
}

---------------------------------------------

func_02B538 {
    JSR $&sub_02B5E2
    BRA code_02B54A
}

code_02B53D {
    JSR $&sub_02B59C
    BRA code_02B54A
}

code_02B542 {
    JSR $&code_02B5BC
    BRA code_02B54A
}

---------------------------------------------

code_02B547 {
    JSR $&sub_02B5FE
}

code_02B54A {
    JSR $&sub_02B61E
    PLD 
    PLX 
    RTL 
}

---------------------------------------------

code_02B550 {
    JSR $&sub_02B61E
    STZ $09C6
    STZ $09B6
    PLD 
    PLX 
}

code_02B55B {
    LDA $player_speed_ew
    BEQ code_02B564
    JSR $&sub_02B675
    RTL 
}

code_02B564 {
    LDA $player_flags
    BIT #$1000
    BEQ code_02B572
    AND #$EFFF
    STA $player_flags
}

code_02B572 {
    LDA $player_speed_ns
    BNE code_02B578
    RTL 
}

code_02B578 {
    JSR $&sub_02B714
    RTL 
}

---------------------------------------------

table_02B57C [
  #$0000   ;00
  #$0000   ;01
  #$0000   ;02
  &func_02B538   ;03
  #$0000   ;04
  &code_02B53D   ;05
  #$0000   ;06
  #$0000   ;07
  #$0000   ;08
  #$0000   ;09
  &code_02B542   ;0A
  #$0000   ;0B
  &code_02B547   ;0C
  #$0000   ;0D
  #$0000   ;0E
  #$0000   ;0F
]

---------------------------------------------

sub_02B59C {
    LDA $09B6
    AND #$000F
    ASL 
    CLC 
    ADC $09BA
    TAY 
    LDA $0000, Y
    EOR #$FFFF
    INC 
    CLC 
    ADC $player_speed_ew
    STA $player_speed_ew
    BEQ code_02B5D8
    INC $09B6
    RTS 
}

code_02B5BC {
    LDA $09B6
    AND #$000F
    ASL 
    CLC 
    ADC $09BA
    TAY 
    LDA $0000, Y
    CLC 
    ADC $player_speed_ew
    STA $player_speed_ew
    BEQ code_02B5D8
    INC $09B6
    RTS 
}

code_02B5D8 {
    STZ $09B6
    LDA #$1000
    TSB $player_flags
    RTS 
}

---------------------------------------------

sub_02B5E2 {
    LDA $09B6
    AND #$000F
    ASL 
    CLC 
    ADC $09BC
    TAY 
    LDA $0000, Y
    CLC 
    ADC $player_speed_ns
    STA $player_speed_ns
    BEQ code_02B5D8
    INC $09B6
    RTS 
}

---------------------------------------------

sub_02B5FE {
    LDA $09B6
    AND #$000F
    ASL 
    CLC 
    ADC $09BC
    TAY 
    LDA $0000, Y
    EOR #$FFFF
    INC 
    CLC 
    ADC $player_speed_ns
    STA $player_speed_ns
    BEQ code_02B5D8
    INC $09B6
    RTS 
}

---------------------------------------------

sub_02B61E {
    LDA $player_speed_ew
    BEQ code_02B649
    BPL code_02B63B
    EOR #$FFFF
    INC 
    CMP $09C8
    BPL code_02B62F
    RTS 
}

code_02B62F {
    LDA $09C8
    DEC 
    EOR #$FFFF
    INC 
    STA $player_speed_ew
    RTS 
}

code_02B63B {
    CMP $09C8
    BPL code_02B641
    RTS 
}

code_02B641 {
    LDA $09C8
    DEC 
    STA $player_speed_ew
    RTS 
}

code_02B649 {
    LDA $player_speed_ns
    BNE code_02B64F
    RTS 
}

code_02B64F {
    BPL code_02B667
    EOR #$FFFF
    INC 
    CMP $09CA
    BPL code_02B65B
    RTS 
}

code_02B65B {
    LDA $09CA
    DEC 
    EOR #$FFFF
    INC 
    STA $player_speed_ns
    RTS 
}

code_02B667 {
    CMP $09CA
    BPL code_02B66D
    RTS 
}

code_02B66D {
    LDA $09CA
    DEC 
    STA $player_speed_ns
    RTS 
}

---------------------------------------------

sub_02B675 {
    LDA $player_flags
    BIT #$1000
    BEQ code_02B67E
    RTS 
}

code_02B67E {
    LDA $player_speed_ew
    BPL code_02B687
    EOR #$FFFF
    INC 
}

code_02B687 {
    CMP #$0003
    BPL code_02B690
    STZ $player_speed_ew
    RTS 
}

code_02B690 {
    LDA $player_speed_ew
    BMI code_02B6D1
    LDA $0656
    BIT #$0100
    BEQ code_02B69E
    RTS 
}

code_02B69E {
    JSR $&sub_02B701
    BEQ code_02B6B0
    EOR #$FFFF
    INC 
    CLC 
    ADC $player_speed_ew
    STA $player_speed_ew
    BEQ code_02B6CD
}

code_02B6B0 {
    LDA $0656
    BIT #$0200
    BNE code_02B6B9
    RTS 
}

code_02B6B9 {
    JSR $&sub_02B701
    BNE code_02B6BF
    RTS 
}

code_02B6BF {
    EOR #$FFFF
    INC 
    CLC 
    ADC $player_speed_ew
    STA $player_speed_ew
    BEQ code_02B6CD
    RTS 
}

code_02B6CD {
    STZ $09B8
    RTS 
}

code_02B6D1 {
    LDA $0656
    BIT #$0200
    BEQ code_02B6DA
    RTS 
}

code_02B6DA {
    JSR $&sub_02B701
    BEQ code_02B6E8
    CLC 
    ADC $player_speed_ew
    STA $player_speed_ew
    BEQ code_02B6CD
}

code_02B6E8 {
    LDA $0656
    BIT #$0100
    BNE code_02B6F1
    RTS 
}

code_02B6F1 {
    JSR $&sub_02B701
    BNE code_02B6F7
    RTS 
}

code_02B6F7 {
    CLC 
    ADC $player_speed_ew
    STA $player_speed_ew
    BEQ code_02B6CD
    RTS 
}

---------------------------------------------

sub_02B701 {
    LDA $09B8
    INC $09B8
    AND #$000F
    ASL 
    CLC 
    ADC $09C2
    TAY 
    LDA $0000, Y
    RTS 
}

---------------------------------------------

sub_02B714 {
    LDA $player_flags
    BIT #$1000
    BEQ code_02B71D
    RTS 
}

code_02B71D {
    LDA $player_speed_ns
    BPL code_02B726
    EOR #$FFFF
    INC 
}

code_02B726 {
    CMP #$0003
    BPL code_02B72F
    STZ $player_speed_ns
    RTS 
}

code_02B72F {
    LDA $player_speed_ns
    BMI code_02B770
    LDA $0656
    BIT #$0400
    BEQ code_02B73D
    RTS 
}

code_02B73D {
    JSR $&sub_02B7A0
    BEQ code_02B74F
    EOR #$FFFF
    INC 
    CLC 
    ADC $player_speed_ns
    STA $player_speed_ns
    BEQ code_02B76C
}

code_02B74F {
    LDA $0656
    BIT #$0800
    BNE code_02B758
    RTS 
}

code_02B758 {
    JSR $&sub_02B7A0
    BNE code_02B75E
    RTS 
}

code_02B75E {
    EOR #$FFFF
    INC 
    CLC 
    ADC $player_speed_ns
    STA $player_speed_ns
    BEQ code_02B76C
    RTS 
}

code_02B76C {
    STZ $09B6
    RTS 
}

code_02B770 {
    LDA $0656
    BIT #$0800
    BEQ code_02B779
    RTS 
}

code_02B779 {
    JSR $&sub_02B7A0
    BEQ code_02B787
    CLC 
    ADC $player_speed_ns
    STA $player_speed_ns
    BEQ code_02B76C
}

code_02B787 {
    LDA $0656
    BIT #$0400
    BNE code_02B790
    RTS 
}

code_02B790 {
    JSR $&sub_02B7A0
    BNE code_02B796
    RTS 
}

code_02B796 {
    CLC 
    ADC $player_speed_ns
    STA $player_speed_ns
    BEQ code_02B76C
    RTS 
}

---------------------------------------------

sub_02B7A0 {
    LDA $09B8
    INC $09B8
    AND #$000F
    ASL 
    CLC 
    ADC $09C2
    TAY 
    LDA $0000, Y
    RTS 
}