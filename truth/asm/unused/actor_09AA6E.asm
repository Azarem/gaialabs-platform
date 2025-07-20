?INCLUDE 'stats_01ABF0'
?INCLUDE 'func_00F3C9'
?INCLUDE 'func_0AA36E'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_0AA41C'
?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_028000'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_actor_09AA6E [
  h_actor < #00, #10, #01 >   ;00
]

---------------------------------------------

e_actor_09AA6E {
    LDA #$8011
    TSB $12
    LDA $14
    SEC 
    SBC #$0008
    STA $14
    LDA $16
    CLC 
    ADC #$0100
    STA $16
    LDA #$0000
    STA $06BE
    STA $06C2
    STA $06C0
    STA $06C4
    COP [9C] ( @code_09B719, #$2300 )
    COP [9C] ( @code_09B6FC, #$2300 )
    COP [9C] ( @code_09B747, #$2300 )
    COP [A1] ( @code_09B5C7, #$2000 )
    COP [A4] ( @func_09B30E, #C8, #33, #$0111 )
    COP [A4] ( @code_09B36A, #38, #33, #$0111 )
    COP [A4] ( @code_09B586, #BF, #0B, #$0301 )
    COP [A4] ( @func_09B57F, #41, #0B, #$0301 )
    STZ $24
    COP [80] ( #00 )
    COP [89]
    COP [C1]
    LDA $24
    BNE code_09AAE3
    RTL 
}

code_09AAE3 {
    LDA #$0100
    TRB $10
    LDA #$0003
    STA $0000
    LDY $06

  code_09AAF0:
    LDA $0010, Y
    AND #$FEFF
    STA $0010, Y
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_09AAF0

  code_09AB02:
    LDY $06
    LDA #$&func_09B58E
    STA $0000, Y
    LDA $0006, Y
    TAY 
    LDA #$&func_09B58E
    STA $0000, Y
    LDA #$021C
    STA $7F0000, X
    COP [C1]
    LDA $24
    BEQ code_09AB6C
    LDA $7F0000, X
    DEC 
    STA $7F0000, X
    BMI code_09AB2D
    RTL 
}

code_09AB2D {
    LDY $06
    LDA $0006, Y
    TAY 
    LDA $0006, Y
    TAY 
    LDA $0026, Y
    BNE code_09AB42
    LDA #$&func_09B37A
    STA $0000, Y
}

code_09AB42 {
    LDA $0006, Y
    TAY 
    LDA $0026, Y
    BNE code_09AB51
    LDA #$&func_09B31E
    STA $0000, Y
}

code_09AB51 {
    LDA #$00B4
    STA $7F0000, X
    COP [C1]
    LDA $24
    BEQ code_09AB6C
    LDA $7F0000, X
    DEC 
    STA $7F0000, X
    BMI code_09AB6A
    RTL 
}

code_09AB6A {
    BRA code_09AB02
}

code_09AB6C {
    COP [80] ( #03 )
    COP [89]
    COP [57] ( @code_09ABF5 )

  code_09AB76:
    COP [A5] ( @code_09B9BE, #00, #00, #$2000 )
    LDA #$0010
    TRB $10
    COP [DA] ( #1D )
    COP [58] ( &code_09ABEE )

  code_09AB8B:
    COP [80] ( #01 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [07] ( #29 )
    COP [A5] ( @code_09B8B6, #00, #00, #$0202 )
    COP [80] ( #19 )
    COP [89]
    COP [A5] ( @code_09B9C5, #00, #00, #$2000 )
    COP [58] ( #$0000 )
    COP [DB] ( #$00B3 )
    LDA #$0010
    TSB $10
    LDY $06
    LDA #$&func_09B5AD
    STA $0000, Y
    LDA $0006, Y
    TAY 
    LDA #$&func_09B5AD
    STA $0000, Y
    LDY $06
    LDA $0006, Y
    TAY 
    LDA $0006, Y
    TAY 
    LDA #$&func_09B3EA
    STA $0000, Y
    LDA $0006, Y
    TAY 
    LDA #$&func_09B3EA
    STA $0000, Y
    COP [DB] ( #$01DF )
    BRA code_09AB76
}

code_09ABEE {
    COP [80] ( #03 )
    COP [89]
    BRA code_09AB8B
}

code_09ABF5 {
    COP [A5] ( @code_09B9C5, #00, #00, #$2000 )
    COP [80] ( #04 )
    COP [89]
    LDY $04
    LDA #$&func_09B6A6
    STA $0000, Y
    LDA #$0001
    STA $26
    COP [C1]
    LDA $26
    BEQ code_09AC17
    RTL 
}

code_09AC17 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [CC] ( #F5 )
    COP [4F] ( $7EE000, #$5000, #$0800 )
    COP [4F] ( $7EE800, #$5400, #$0800 )
    COP [4F] ( $7EF000, #$5800, #$0800 )
    COP [4F] ( $7EF800, #$5C00, #$0800 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [A5] ( @code_09AC55, #00, #00, #$0012 )
    COP [E0]
}

code_09AC55 {
    COP [57] ( @code_09B1D5 )
    LDA #$&stats_01ABF0+15C
    STA $7F0020, X
    LDA $&stats_01ABF0+15C
    AND #$00FF
    STA $7F0026, X
    COP [B6] ( #30 )
    COP [A4] ( @code_09ADB3, #EA, #E0, #$2200 )
    COP [A4] ( @code_09ADEB, #16, #E0, #$2200 )
    COP [80] ( #1E )
    COP [89]
    LDA #$0080
    STA $7F0018, X
    STA $7F001A, X
    COP [52] ( #1E, #FF, #FF )
    COP [53]
    COP [84] ( #1E, #04 )
    COP [8A]
    LDA #$0010
    TRB $10

  code_09ACA2:
    COP [58] ( &code_09AD11 )
    COP [C1]
    LDA $0036
    LSR 
    BCS code_09ACBF
    LDA $player_actor
    LDA $0014, Y
    STA $0018
    LDA $0016, Y
    STA $001C
    BRA code_09ACCD
}

code_09ACBF {
    COP [23]
    STA $0018
    LDA $0411
    AND #$00FF
    STA $001C
}

code_09ACCD {
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $0018
    CMP #$0020
    BCS code_09ACE0
    RTL 
}

code_09ACE0 {
    CMP #$00E0
    BCC code_09ACE6
    RTL 
}

code_09ACE6 {
    STA $7F0018, X
    LDA $0411
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $001C
    CMP #$0040
    BCS code_09ACFE
    RTL 
}

code_09ACFE {
    CMP #$00E0
    BCC code_09AD04
    RTL 
}

code_09AD04 {
    STA $7F001A, X
    COP [52] ( #1E, #FF, #FF )
    COP [53]
    BRA code_09ACA2
}

code_09AD11 {
    LDA #$0001
    STA $26
    COP [80] ( #42 )
    COP [89]
    COP [80] ( #1F )
    COP [89]
    COP [80] ( #20 )
    COP [89]
    COP [A5] ( @code_09AD3F, #00, #EC, #$0211 )
    COP [80] ( #21 )
    COP [89]
    STZ $26
    JMP $&code_09ACA2
}

---------------------------------------------

func_09AD38 {
    COP [80] ( #1E )
    COP [89]
    BRA func_09AD38
}

code_09AD3F {
    COP [57] ( @code_09ADA7 )
    COP [5B] ( #$0080 )
    COP [86] ( #22, #10, #07 )
    COP [8A]
    COP [DA] ( #13 )
    COP [80] ( #23 )
    COP [89]
    LDA #$0210
    TRB $10
    LDA #$&stats_01ABF0+158
    STA $7F0020, X
    LDA $&stats_01ABF0+158
    AND #$00FF
    STA $7F0026, X

  code_09AD6D:
    COP [58] ( &code_09ADA0 )
    COP [C1]
    COP [23]
    CMP #$0014
    BCS code_09AD7B
    RTL 
}

code_09AD7B {
    CMP #$00E0
    BCC code_09AD81
    RTL 
}

code_09AD81 {
    STA $7F0018, X
    COP [23]
    CMP #$0014
    BCS code_09AD8D
    RTL 
}

code_09AD8D {
    CMP #$00E0
    BCC code_09AD93
    RTL 
}

code_09AD93 {
    STA $7F001A, X
    COP [52] ( #24, #02, #FF )
    COP [53]
    BRA code_09AD6D
}

code_09ADA0 {
    COP [80] ( #25 )
    COP [89]
    BRA code_09AD6D
}

code_09ADA7 {
    COP [80] ( #26 )
    COP [89]
    COP [80] ( #27 )
    COP [89]
    COP [E0]
}

code_09ADB3 {
    COP [A4] ( @code_09AE52, #B0, #00, #$0202 )
    COP [A4] ( @code_09B2AE, #C0, #00, #$0202 )
    COP [A4] ( @func_09B28D, #D0, #00, #$0202 )
    COP [A4] ( @func_09B28D, #E0, #00, #$0202 )
    COP [A4] ( @func_09B28D, #F0, #00, #$0202 )
    COP [A4] ( @code_09B29B, #00, #00, #$0202 )
    BRA code_09AE21
}

code_09ADEB {
    COP [A4] ( @code_09B147, #50, #E0, #$0202 )
    COP [A4] ( @code_09B2AE, #40, #E0, #$0202 )
    COP [A4] ( @func_09B28D, #30, #E0, #$0202 )
    COP [A4] ( @func_09B28D, #20, #E0, #$0202 )
    COP [A4] ( @func_09B28D, #10, #E0, #$0202 )
    COP [A4] ( @code_09B29B, #00, #E0, #$0202 )
}

code_09AE21 {
    LDA $14
    LDY $24
    SEC 
    SBC $0014, Y
    STA $7F100C, X
    LDA $16
    LDY $24
    SEC 
    SBC $0016, Y
    STA $7F100E, X
    COP [C1]
    LDY $24
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $16
    RTL 
}

code_09AE52 {
    COP [8D] ( #29 )
    LDA #$0000
    STA $7F0010, X
    LDA #$0070
    STA $7F0012, X
    COP [C1]
    LDA $7F001C, X
    TAY 
    LDA $0010, Y
    BIT #$0010
    BEQ code_09AE76
    JSR $&sub_09B255
    RTL 
}

code_09AE76 {
    COP [C6] ( &code_09AE76 )
    COP [2D]
    PHX 
    AND #$0007
    STA $0000
    TAX 
    LDA $@binary_09B25C, X
    PLX 
    AND #$00FF
    STA $7F100C, X
    SEP #$20
    SEC 
    SBC $7F0010, X
    REP #$20
    BPL code_09AECA

  code_09AE9B:
    LDY $24
    JSL $@func_00F3C9
    JSR $&sub_09B274
    COP [8D] ( #FF )
    COP [C2]
    LDA $7F0010, X
    CLC 
    ADC #$0002
    AND #$00FF
    STA $7F0010, X
    SEC 
    SBC $7F100C, X
    BPL code_09AEC3
    EOR #$FFFF
    INC 
}

code_09AEC3 {
    CMP #$0003
    BCS code_09AE9B
    BRA code_09AE76
}

code_09AECA {
    AND #$00FF
    CMP #$0010
    BCC code_09AF02
    LDY $24
    JSL $@func_00F3C9
    JSR $&sub_09B274
    COP [8D] ( #FF )
    COP [C2]
    LDA $7F0010, X
    SEC 
    SBC #$0002
    AND #$00FF
    STA $7F0010, X
    SEC 
    SBC $7F100C, X
    BPL code_09AEFA
    EOR #$FFFF
    INC 
}

code_09AEFA {
    CMP #$0003
    BCS code_09AECA
    JMP $&code_09AE76
}

code_09AF02 {
    LDA $7F0010, X
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    PHX 
    TAX 
    LDA $@binary_09B26C, X
    PLX 
    AND #$00FF
    STA $0000
    LDA $0410
    AND #$0001
    SEC 
    SBC #$0001
    CLC 
    ADC $0000
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_09AF32 )
}

code_list_09AF32 [
  &code_09AF42   ;00
  &code_09AF66   ;01
  &code_09AF8A   ;02
  &code_09AFAE   ;03
  &code_09AFD2   ;04
  &code_09AFF6   ;05
  &code_09B01A   ;06
  &code_09B03E   ;07
]

code_09AF42 {
    COP [8D] ( #2A )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @func_09B0A6, #00, #F8, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09AF66 {
    COP [8D] ( #2F )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B0B8, #08, #F8, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09AF8A {
    COP [8D] ( #2C )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B0CA, #08, #00, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09AFAE {
    COP [8D] ( #30 )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B0DC, #08, #08, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09AFD2 {
    COP [8D] ( #29 )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B0EE, #00, #08, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09AFF6 {
    COP [8D] ( #2D )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B0FF, #F8, #08, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09B01A {
    COP [8D] ( #2B )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B110, #F8, #00, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

code_09B03E {
    COP [8D] ( #2E )
    JSR $&sub_09B084
    COP [CA] ( #10 )
    JSR $&sub_09B255
    COP [CB]
    COP [A5] ( @code_09B121, #F8, #F8, #$0202 )
    COP [CA] ( #0A )
    JSR $&sub_09B255
    COP [CB]
    JSR $&sub_09B062
    COP [C5]
}

---------------------------------------------

sub_09B062 {
    LDA $7F001C, X
    TAY 
    LDA $0026, Y
    BNE code_09B082
    LDA $0010, Y
    BIT #$0040
    BNE code_09B082
    LDA #$&code_09ACA2
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    CLC 
    RTS 
}

code_09B082 {
    SEC 
    RTS 
}

---------------------------------------------

sub_09B084 {
    LDA $7F001C, X
    TAY 
    LDA $0026, Y
    BNE code_09B0A4
    LDA $0010, Y
    BIT #$0040
    BNE code_09B0A4
    LDA #$&func_09AD38
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    CLC 
    RTS 
}

code_09B0A4 {
    SEC 
    RTS 
}

---------------------------------------------

func_09B0A6 {
    COP [07] ( #23 )
    COP [80] ( #33 )
    COP [89]
    COP [8D] ( #3B )
    COP [AC] ( #00, #08 )
    JMP $&code_09B134
}

code_09B0B8 {
    COP [07] ( #23 )
    COP [80] ( #38 )
    COP [89]
    COP [8D] ( #40 )
    COP [AC] ( #05, #06 )
    JMP $&code_09B134
}

code_09B0CA {
    COP [07] ( #23 )
    COP [80] ( #35 )
    COP [89]
    COP [8D] ( #3D )
    COP [AC] ( #07, #00 )
    JMP $&code_09B134
}

code_09B0DC {
    COP [07] ( #23 )
    COP [80] ( #39 )
    COP [89]
    COP [8D] ( #41 )
    COP [AC] ( #05, #05 )
    JMP $&code_09B134
}

code_09B0EE {
    COP [07] ( #23 )
    COP [80] ( #32 )
    COP [89]
    COP [8D] ( #3A )
    COP [AC] ( #00, #07 )
    BRA code_09B134
}

code_09B0FF {
    COP [07] ( #23 )
    COP [80] ( #36 )
    COP [89]
    COP [8D] ( #3E )
    COP [AC] ( #06, #05 )
    BRA code_09B134
}

code_09B110 {
    COP [07] ( #23 )
    COP [80] ( #34 )
    COP [89]
    COP [8D] ( #3C )
    COP [AC] ( #08, #00 )
    BRA code_09B134
}

code_09B121 {
    COP [07] ( #23 )
    COP [80] ( #37 )
    COP [89]
    COP [8D] ( #3F )
    COP [AC] ( #06, #06 )
    BRA code_09B134
}

---------------------------------------------

func_09B132 {
    COP [B1]
}

code_09B134 {
    COP [C1]
    COP [89]
    LDA $10
    BIT #$4000
    BEQ func_09B132
    COP [B1]
    COP [C1]
    COP [89]
    COP [E0]
}

code_09B147 {
    COP [8D] ( #29 )
    LDA #$0000
    STA $7F0010, X
    LDA #$0070
    STA $7F0012, X
    COP [C1]
    LDA $7F001C, X
    TAY 
    LDA $0010, Y
    BIT #$0010
    BEQ code_09B16B
    JSR $&sub_09B255
    RTL 
}

code_09B16B {
    COP [C6] ( &code_09B16B )
    LDA $0410
    LSR 
    BCS code_09B17B
    JMP $&code_09AF02
    COP [8D] ( #29 )
}

code_09B17B {
    COP [23]
    STA $7F100C, X
    LDA $0036
    LSR 
    BCC code_09B1AE

  code_09B187:
    LDY $24
    JSL $@func_00F3C9
    JSR $&sub_09B274
    COP [8D] ( #FF )
    COP [C2]
    LDA $7F0010, X
    INC 
    AND #$00FF
    STA $7F0010, X
    LDA $7F100C, X
    DEC 
    STA $7F100C, X
    BPL code_09B187
    COP [C5]
}

code_09B1AE {
    LDY $24
    JSL $@func_00F3C9
    JSR $&sub_09B274
    COP [8D] ( #FF )
    COP [C2]
    LDA $7F0010, X
    DEC 
    AND #$00FF
    STA $7F0010, X
    LDA $7F100C, X
    DEC 
    STA $7F100C, X
    BPL code_09B1AE
    COP [C5]
}

code_09B1D5 {
    LDA #$0001
    STA $26
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
    COP [A5] ( @code_09B1FA, #00, #00, #$2000 )
    COP [A5] ( @func_09BA38, #00, #00, #$2000 )
    COP [DA] ( #1D )
    COP [E0]
}

code_09B1FA {
    COP [88] ( @table_0EE000 )
    COP [CA] ( #0A )
    COP [A5] ( @code_09B21E, #00, #C8, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_09B22B, #00, #C8, #$0302 )
    COP [DA] ( #02 )
    COP [CB]
    COP [E0]
}

code_09B21E {
    JSR $&sub_09B238
    COP [07] ( #06 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_09B22B {
    JSR $&sub_09B238
    COP [07] ( #06 )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_09B238 {
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $14
    STA $14
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $16
    STA $16
    RTS 
}

---------------------------------------------

sub_09B255 {
    LDY $24
    JSL $@func_00F3C9
    RTS 
}

---------------------------------------------

binary_09B25C #8060282000E0C0A0

---------------------------------------------

binary_09B264 #29302C2F2A2E2B2D

---------------------------------------------

binary_09B26C #0403020100070605

---------------------------------------------

sub_09B274 {
    LDA $7F0010, X
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0007
    PHX 
    TAX 
    LDA $@binary_09B264, X
    PLX 
    AND #$00FF
    STA $28
    RTS 
}

---------------------------------------------

func_09B28D {
    COP [8D] ( #28 )
    STZ $08
    JSR $&sub_09B2B8
    COP [C1]
    JSR $&sub_09B2CD
    RTL 
}

code_09B29B {
    COP [8D] ( #28 )
    STZ $08
    JSR $&sub_09B2B8
    COP [C1]
    JSR $&sub_09B2CD
    LDA $0014, Y
    STA $14
    RTL 
}

code_09B2AE {
    COP [8D] ( #28 )
    COP [C1]
    JSL $@func_0AA41C
    RTL 
}

---------------------------------------------

sub_09B2B8 {
    LDA $14
    STA $7F100C, X
    STA $7F0010, X
    LDA $16
    STA $7F100E, X
    STA $7F0012, X
    RTS 
}

---------------------------------------------

sub_09B2CD {
    LDY $06
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    CLC 
    BPL code_09B2DB
    SEC 
}

code_09B2DB {
    ROR 
    STA $14
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    CLC 
    BPL code_09B2EA
    SEC 
}

code_09B2EA {
    ROR 
    STA $16
    LDA $7F0010, X
    STA $7F100C, X
    LDA $7F0012, X
    STA $7F100E, X
    LDY $04
    LDA $0014, Y
    STA $7F0010, X
    LDA $0016, Y
    STA $7F0012, X
    RTS 
}

---------------------------------------------

func_09B30E {
    JSR $&sub_09BA14
    COP [57] ( @code_09B3C6 )

  code_09B316:
    COP [80] ( #05 )
    COP [89]
    COP [C1]
    RTL 
}

---------------------------------------------

func_09B31E {
    LDY $24
    LDA $0024, Y
    CMP #$0001
    BEQ code_09B32E
    LDA $0036
    LSR 
    BCC code_09B316
}

code_09B32E {
    COP [07] ( #21 )
    COP [80] ( #06 )
    COP [89]
    COP [80] ( #07 )
    COP [89]
    LDA #$0010
    TRB $10
    COP [80] ( #16 )
    COP [89]
    COP [07] ( #15 )
    COP [A5] ( @code_09B528, #10, #00, #$0202 )
    COP [80] ( #07 )
    COP [89]
    COP [DA] ( #77 )
    COP [80] ( #1B )
    COP [89]
    LDA #$0010
    TSB $10
    COP [80] ( #05 )
    COP [89]
    BRA code_09B316
}

code_09B36A {
    JSR $&sub_09BA14
    COP [57] ( @code_09B3C6 )

  code_09B372:
    COP [80] ( #85 )
    COP [89]
    COP [C1]
    RTL 
}

---------------------------------------------

func_09B37A {
    LDY $24
    LDA $0024, Y
    CMP #$0001
    BEQ code_09B38A
    LDA $0036
    LSR 
    BCS code_09B372
}

code_09B38A {
    COP [07] ( #21 )
    COP [80] ( #86 )
    COP [89]
    COP [80] ( #87 )
    COP [89]
    LDA #$0010
    TRB $10
    COP [80] ( #96 )
    COP [89]
    COP [07] ( #15 )
    COP [A5] ( @code_09B4E7, #F0, #00, #$0202 )
    COP [80] ( #87 )
    COP [89]
    COP [DA] ( #77 )
    COP [80] ( #9B )
    COP [89]
    LDA #$0010
    TSB $10
    COP [80] ( #85 )
    COP [89]
    BRA code_09B372
}

code_09B3C6 {
    LDA #$0001
    STA $26
    LDY $24
    LDA $0024, Y
    LSR 
    STA $0024, Y
    COP [A5] ( @code_09B479, #00, #00, #$0300 )
    LDA #$0002
    TSB $12

  code_09B3E2:
    COP [80] ( #0B )
    COP [89]
    COP [C1]
    RTL 
}

---------------------------------------------

func_09B3EA {
    COP [80] ( #1C )
    COP [89]
    COP [07] ( #20 )
    COP [A5] ( @code_09B3FD, #00, #00, #$0302 )
    BRA code_09B3E2
}

code_09B3FD {
    LDA #$0080
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0010
    STA $7F001A, X
    COP [B6] ( #30 )
    COP [22] ( #0C, #02 )
    COP [80] ( #0C )
    COP [89]
    LDA $0E
    BIT #$C000
    BEQ code_09B447
    COP [07] ( #21 )
    COP [80] ( #0D )
    COP [89]
    COP [07] ( #1D )
    COP [86] ( #0E, #06, #0C )
    COP [8A]
    LDA #$2000
    TSB $10
    COP [CA] ( #0E )
    COP [9C] ( @code_09B449, #$0202 )
    COP [DA] ( #0E )
    COP [CB]
}

code_09B447 {
    COP [E0]
}

code_09B449 {
    COP [07] ( #23 )
    COP [23]
    STA $14
    COP [23]
    LSR 
    BCS code_09B467

  code_09B455:
    COP [86] ( #0F, #14, #03 )
    COP [8A]
    LDA $16
    BMI code_09B455
    CMP #$0120
    BCC code_09B455
    COP [E0]
}

code_09B467 {
    COP [86] ( #0F, #14, #05 )
    COP [8A]
    LDA $16
    BMI code_09B467
    CMP #$0120
    BCC code_09B467
    COP [E0]
}

code_09B479 {
    COP [B6] ( #30 )
    LDA #$0002
    TSB $12

  code_09B481:
    COP [23]
    LDA $0036
    LSR 
    BCS code_09B492
    COP [9C] ( @code_09B4C9, #$0302 )
    BRA code_09B499
}

code_09B492 {
    COP [9C] ( @code_09B4D8, #$0302 )
}

code_09B499 {
    LDA $0410
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $14
    STA $0014, Y
    LDA $0411
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $16
    STA $0016, Y
    COP [86] ( #05, #07, #01 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_09B481
    COP [E0]
}

code_09B4C9 {
    COP [88] ( @table_0EE000 )
    COP [07] ( #06 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_09B4D8 {
    COP [88] ( @table_0EE000 )
    COP [07] ( #06 )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

code_09B4E7 {
    COP [B6] ( #30 )
    LDA #$0005
    STA $26

  code_09B4EF:
    COP [9C] ( @code_09B500, #$0202 )
    LDA $26
    STA $0026, Y
    DEC 
    STA $26
    BNE code_09B4EF
}

code_09B500 {
    COP [5B] ( #$0010 )
    LDA $26
    PHX 
    TAX 
    LDA $@binary_09B57A, X
    AND #$00FF
    PLX 
    STA $7F001A, X
    LDA #$0008
    STA $7F0018, X
    COP [B1]
    COP [84] ( #11, #20 )
    COP [8A]
    COP [AA] ( #08 )
    BRA code_09B567
}

code_09B528 {
    COP [B6] ( #30 )
    LDA #$0005
    STA $26

  code_09B530:
    COP [9C] ( @code_09B541, #$0202 )
    LDA $26
    STA $0026, Y
    DEC 
    STA $26
    BNE code_09B530
}

code_09B541 {
    COP [5B] ( #$0010 )
    LDA $26
    PHX 
    TAX 
    LDA $@binary_09B57A, X
    AND #$00FF
    PLX 
    STA $7F001A, X
    LDA #$0007
    STA $7F0018, X
    COP [B1]
    COP [84] ( #91, #20 )
    COP [8A]
    COP [AA] ( #07 )
}

code_09B567 {
    COP [C1]
    LDA $10
    BIT #$4000
    BNE code_09B571
    RTL 
}

code_09B571 {
    LDA #$0014
    STA $08
    COP [C2]
    COP [E0]
}

---------------------------------------------

binary_09B57A #0301000204

---------------------------------------------

func_09B57F {
    LDA #$0002
    TSB $12
    COP [BB]
}

code_09B586 {
    COP [80] ( #08 )
    COP [89]
    COP [C1]
    RTL 
}

---------------------------------------------

func_09B58E {
    COP [CA] ( #05 )
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [A5] ( @code_09B7A8, #00, #00, #$0202 )
    COP [80] ( #1A )
    COP [89]
    COP [CB]
    BRA code_09B586
}

---------------------------------------------

func_09B5AD {
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [A5] ( @code_09B7A8, #00, #00, #$0202 )
    COP [80] ( #1A )
    COP [89]
    BRA code_09B586
}

code_09B5C7 {
    LDY $06
    LDA $0014, Y
    STA $20
    LDA $0016, Y
    STA $22
    LDA #$0000
    STA $7F0010, X
    LDA #$0010
    STA $7F0012, X
    LDA $16
    STA $7F100C, X
    LDA $16
    SEC 
    SBC #$0100
    STA $26
    COP [C1]
    LDA $16
    BEQ code_09B62E
    SEC 
    SBC #$0002
    STA $16
    LDA #$FFFE
    STA $001C
    STZ $0018
    LDY $06
    CLC 
    ADC $0016, Y
    STA $0016, Y
    JSR $&sub_09B9CC
    LDA $16
    SEC 
    SBC $26
    BMI code_09B618
    RTL 
}

code_09B618 {
    EOR #$FFFF
    INC 
    STA $001C
    STZ $16
    LDY $06
    CLC 
    ADC $0016, Y
    STA $0016, Y
    JSR $&sub_09B9CC
    RTL 
}

code_09B62E {
    LDY $24
    LDA #$0003
    STA $0024, Y
    BRA code_09B64D
}

---------------------------------------------

func_09B638 {
    CLC 
    ADC #$0002
    STA $7F0010, X
    COP [23]
    AND #$003F
    CLC 
    ADC #$0028
    STA $08
    COP [C2]
}

code_09B64D {
    COP [C1]
    LDA $7F0010, X
    CMP #$0040
    BEQ func_09B638
    CMP #$00C0
    BEQ func_09B638
    CLC 
    ADC #$0002
    AND #$00FF
    STA $7F0010, X
    JSR $&sub_09BA59
    CLC 
    ADC $7F100C, X
    STA $16
    LDY $06
    LDA $20
    SEC 
    SBC $14
    EOR #$FFFF
    INC 
    STA $0018
    CLC 
    ADC $0014, Y
    STA $0014, Y
    LDA $22
    SEC 
    SBC $16
    EOR #$FFFF
    INC 
    STA $001C
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA $14
    STA $20
    LDA $16
    STA $22
    JSR $&sub_09B9CC
    RTL 
}

---------------------------------------------

func_09B6A6 {
    LDA $14
    STA $7F0010, X
    COP [CA] ( #80 )
    COP [23]
    LDA $16
    CLC 
    ADC #$0002
    STA $16
    LDA #$0002
    STA $001C
    LDY $06
    CLC 
    ADC $0016, Y
    STA $0016, Y
    LDA $14
    PHA 
    LDA $0410
    AND #$0003
    SEC 
    SBC #$0001
    CLC 
    ADC $7F0010, X
    STA $14
    SEC 
    SBC $01, S
    STA $0018
    PLA 
    LDA $0018
    CLC 
    ADC $0014, Y
    STA $0014, Y
    JSR $&sub_09B9CC
    COP [CB]
    LDY $06
    LDA #$0000
    STA $0026, Y
    COP [E0]
}

code_09B6FC {
    LDY $24
    LDA $0026, Y
    BNE code_09B70A
    COP [37] ( #63 )
    COP [39]
    BRA code_09B6FC
}

code_09B70A {
    COP [C1]
    LDY $24
    LDA $0026, Y
    CMP #$0002
    BEQ code_09B717
    RTL 
}

code_09B717 {
    COP [E0]
}

code_09B719 {
    COP [37] ( #62 )
    COP [39]
    COP [23]
    CMP #$00C0
    BCC code_09B73E
    COP [37] ( #66 )
    COP [39]
    COP [23]
    AND #$0007
    CLC 
    ADC #$0004
    STA $08
    COP [C2]
    COP [37] ( #66 )
    COP [39]
    COP [23]
}

code_09B73E {
    STA $08
    STA $072A
    COP [C2]
    BRA code_09B719
}

code_09B747 {
    COP [B6] ( #30 )
    LDA #$00A0
    STA $14
    LDA #$00C0
    STA $16
    COP [C1]
    LDY $24
    LDA $0016, Y
    SEC 
    SBC #$0030
    SEC 
    SBC $16
    BMI code_09B765
    RTL 
}

code_09B765 {
    COP [C1]
    COP [9C] ( @code_09B787, #$0300 )
    LDA $0410
    AND #$0003
    CLC 
    ADC #$0005
    STA $08
    LDY $24
    LDA $0010, Y
    BIT #$0040
    BNE code_09B785
    RTL 
}

code_09B785 {
    COP [E0]
}

code_09B787 {
    COP [23]
    AND #$0007
    SEC 
    SBC #$0003
    CLC 
    ADC $16
    STA $16
    LDA $0411
    AND #$0003
    CLC 
    ADC $14
    STA $14
    COP [81] ( #15, #08 )
    COP [89]
    COP [E0]
}

code_09B7A8 {
    LDA #$0080
    TSB $12
    COP [07] ( #1E )
    LDA $0E
    BIT #$4000
    BEQ code_09B7C1
    COP [BC] ( #04, #FA )
    COP [AC] ( #01, #02 )
    BRA code_09B7C9
}

code_09B7C1 {
    COP [BC] ( #FC, #FA )
    COP [AC] ( #02, #02 )
}

code_09B7C9 {
    LDA #$0020
    TSB $12
    LDA #$0000
    STA $7F0026, X
    COP [57] ( @code_09B84F )
    COP [B6] ( #30 )
    COP [80] ( #14 )
    COP [89]
    COP [B1]
    COP [80] ( #17 )
    COP [89]
    LDA #$0200
    TRB $10
    LDA #$&loc_09B802
    STA $7F001E, X
    STA $00
    LDA $0B02
    CLC 
    ADC #$0005
    STA $7F0014, X

  loc_09B802:
    COP [C1]
    COP [23]
    LDY $player_actor
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $0014, Y
    STA $7F0018, X
    BPL code_09B81B
    RTL 
}

code_09B81B {
    CMP #$0108
    BCC code_09B821
    RTL 
}

code_09B821 {
    LDA $0411
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $0016, Y
    STA $7F001A, X
    BPL code_09B836
    RTL 
}

code_09B836 {
    CMP #$00E8
    BCC code_09B83C
    RTL 
}

code_09B83C {
    COP [22] ( #18, #02 )
    LDA $10
    BIT #$4000
    BNE code_09B87E
    COP [84] ( #18, #02 )
    COP [8A]
    COP [CB]
}

code_09B84F {
    COP [88] ( @table_0EE000 )
    LDA $16
    SEC 
    SBC #$0008
    STA $16
    LDA #$0003
    STA $24

  code_09B861:
    COP [9C] ( @code_09B880, #$0202 )
    DEC $24
    BPL code_09B861
    STZ $24
    LDA $16
    CLC 
    ADC #$0004
    STA $16
    COP [07] ( #1D )
    COP [80] ( #02 )
    COP [89]
}

code_09B87E {
    COP [E0]
}

code_09B880 {
    PEA $&func_09B8AF-1
    LDY $24
    LDA $0024, Y
    INC 
    STA $0024, Y
    CMP #$0001
    BEQ code_09B8AA
    CMP #$0002
    BEQ code_09B8A5
    CMP #$0003
    BEQ code_09B8A0
    COP [AC] ( #01, #01 )
    RTS 
}

code_09B8A0 {
    COP [AC] ( #01, #02 )
    RTS 
}

code_09B8A5 {
    COP [AC] ( #02, #01 )
    RTS 
}

code_09B8AA {
    COP [AC] ( #02, #02 )
    RTS 
}

---------------------------------------------

func_09B8AF {
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_09B8B6 {
    COP [B6] ( #30 )
    COP [86] ( #12, #02, #03 )
    COP [8A]
    COP [84] ( #12, #02 )
    COP [8A]
    COP [07] ( #1E )
    COP [23]
    STA $26
    COP [9C] ( @code_09B8F3, #$0202 )
    LDA $26
    CLC 
    ADC #$0055
    AND #$00FF
    STA $0026, Y
    COP [9C] ( @code_09B8F3, #$0202 )
    LDA $26
    CLC 
    ADC #$00AA
    AND #$00FF
    STA $0026, Y
}

code_09B8F3 {
    LDA $26
    STA $7F0010, X
    LDA #$0000
    STA $7F0012, X
    LDA $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$0001
    STA $7F100E, X
    STA $7F100C, X
    COP [8D] ( #13 )

  code_09B91A:
    COP [8B]
    LDA $2A
    BEQ code_09B91A
    LDA $08
    STZ $08
    STA $26

  code_09B926:
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
    BCS code_09B970
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
    BPL code_09B926
    BRA code_09B91A
}

code_09B970 {
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
    BRA code_09B99F
}

---------------------------------------------

func_09B991 {
    COP [8B]
    LDA $2A
    BEQ func_09B991
    LDA $08
    STZ $08
    STA $26

  code_09B99D:
    COP [C2]
}

code_09B99F {
    LDA $7F100C, X
    STA $7F002C, X
    LDA $7F100E, X
    STA $7F002E, X
    LDA $10
    BIT #$4000
    BNE code_09B9BC
    DEC $26
    BPL code_09B99D
    BRA func_09B991
}

code_09B9BC {
    COP [E0]
}

code_09B9BE {
    COP [37] ( #6A )
    COP [39]
    COP [E0]
}

code_09B9C5 {
    COP [37] ( #69 )
    COP [39]
    COP [E0]
}

---------------------------------------------

sub_09B9CC {
    PHX 
    LDX $0006, Y
    STY $0000

  code_09B9D3:
    LDA $0000
    CMP $7F001C, X
    BNE code_09B9F6
    LDA $0014, X
    CLC 
    ADC $0018
    STA $0014, X
    LDA $0016, X
    CLC 
    ADC $001C
    STA $0016, X
    LDA $0006, X
    TAX 
    BRA code_09B9D3
}

code_09B9F6 {
    PLX 
    LDA $0018
    EOR #$FFFF
    INC 
    CLC 
    ADC $06C0
    STA $06C0
    LDA $001C
    EOR #$FFFF
    INC 
    CLC 
    ADC $06C4
    STA $06C4
    RTS 
}

---------------------------------------------

sub_09BA14 {
    LDA #$8011
    TSB $12
    LDA $7F002A, X
    ORA #$0080
    STA $7F002A, X
    LDA #$&stats_01ABF0+154
    STA $7F0020, X
    LDA $&stats_01ABF0+154
    AND #$00FF
    STA $7F0026, X
    STZ $26
    RTS 
}

---------------------------------------------

func_09BA38 {
    LDA #$8000
    TSB $joypad_mask_std
    COP [DA] ( #EF )
    LDA #$0000
    STA $0AD4
    LDA #$0404
    STA $064A
    COP [26] ( #E5, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

---------------------------------------------

sub_09BA59 {
    LDA $7F0010, X
    TAY 
    SEP #$20
    CLC 
    LDA $&binary_01C455, Y
    BPL code_09BA6A
    EOR #$FF
    INC 
    SEC 
}

code_09BA6A {
    XBA 
    LDA $7F0012, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code_09BA7F
    EOR #$FFFF
    INC 
}

code_09BA7F {
    RTS 
}