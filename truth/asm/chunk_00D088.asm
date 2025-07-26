?BANK 00

?INCLUDE 'player_character'
?INCLUDE 'binary_01D8BE'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2

---------------------------------------------

sub_00D088 {
    LDA $0E
    ASL 
    ASL 
    PHX 
    LDX $player_actor
    STA $7F0020, X
    LDA #$0000
    STA $002C, X
    STA $002E, X
    STA $0008, X
    PLX 
    LDA #$0F00
    TSB $joypad_mask_std
    LDA #$0800
    TSB $player_flags
    RTS 
}

---------------------------------------------

sub_00D0AE {
    STZ $09E0
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$0008
    TSB $10
    LDA #$0200
    TRB $10
    LDA #$8000
    TSB $0658
    LDA #$0002
    TRB $player_flags
    JSR $&sub_00D58A
    RTS 
}

---------------------------------------------

head_00D0D1 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

func_00D0D4 {
    LDY $player_actor
    LDA $16
    SEC 
    SBC #$0008
    CMP $0016, Y
    BCC code_00D0E3
    RTL 
}

code_00D0E3 {
    CLC 
    ADC #$0020
    CMP $0016, Y
    BCS code_00D0ED
    RTL 
}

code_00D0ED {
    LDA $0014, Y
    CMP $14
    BEQ code_00D0F5
    RTL 
}

code_00D0F5 {
    JSR $&sub_00D204
    BCC code_00D0FB
    RTL 
}

code_00D0FB {
    LDA $0028, Y
    CMP #$0012
    BEQ code_00D109
    CMP #$0013
    BEQ code_00D109
    RTL 
}

code_00D109 {
    LDA #$&func_00D218
    STA $0000, Y
    LDA #$*func_00D218
    STA $0002, Y
    JSR $&sub_00D088
    RTL 
}

---------------------------------------------

head_00D119 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

func_00D11C {
    LDY $player_actor
    LDA $16
    SEC 
    SBC #$0008
    CMP $0016, Y
    BCC code_00D12B
    RTL 
}

code_00D12B {
    CLC 
    ADC #$0020
    CMP $0016, Y
    BCS code_00D135
    RTL 
}

code_00D135 {
    LDA $0014, Y
    CMP $14
    BEQ code_00D13D
    RTL 
}

code_00D13D {
    JSR $&sub_00D204
    BCC code_00D143
    RTL 
}

code_00D143 {
    LDA $0028, Y
    CMP #$0015
    BEQ code_00D151
    CMP #$0016
    BEQ code_00D151
    RTL 
}

code_00D151 {
    LDA #$&func_00D246
    STA $0000, Y
    LDA #$*func_00D246
    STA $0002, Y
    JSR $&sub_00D088
    RTL 
}

---------------------------------------------

head_00D161 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

func_00D164 {
    COP [BC] ( #F8, #00 )
    BRA func_00D16D
}

---------------------------------------------

head_00D16A [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

func_00D16D {
    COP [C1]
    LDY $player_actor
    LDA $14
    SEC 
    SBC #$0008
    CMP $0014, Y
    BCC code_00D17E
    RTL 
}

code_00D17E {
    CLC 
    ADC #$0020
    CMP $0014, Y
    BCS code_00D188
    RTL 
}

code_00D188 {
    LDA $0016, Y
    SEC 
    SBC $16
    BEQ code_00D191
    RTL 
}

code_00D191 {
    JSR $&sub_00D204
    BCC code_00D197
    RTL 
}

code_00D197 {
    LDA $0028, Y
    CMP #$000F
    BEQ code_00D1A5
    CMP #$0010
    BEQ code_00D1A5
    RTL 
}

code_00D1A5 {
    LDA #$&func_00D274
    STA $0000, Y
    LDA #$*func_00D274
    STA $0002, Y
    JSR $&sub_00D088
    RTL 
}

---------------------------------------------

head_00D1B5 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

func_00D1B8 {
    LDY $player_actor
    LDA $14
    SEC 
    SBC #$0008
    CMP $0014, Y
    BCC code_00D1C7
    RTL 
}

code_00D1C7 {
    CLC 
    ADC #$0020
    CMP $0014, Y
    BCS code_00D1D1
    RTL 
}

code_00D1D1 {
    LDA $0016, Y
    SEC 
    SBC $16
    BEQ code_00D1DA
    RTL 
}

code_00D1DA {
    LDY $player_actor
    JSR $&sub_00D204
    BCC code_00D1E3
    RTL 
}

code_00D1E3 {
    LDY $player_actor
    LDA $0028, Y
    CMP #$000C
    BEQ code_00D1F4
    CMP #$000D
    BEQ code_00D1F4
    RTL 
}

code_00D1F4 {
    LDA #$&func_00D2A2
    STA $0000, Y
    LDA #$*func_00D2A2
    STA $0002, Y
    JSR $&sub_00D088
    RTL 
}

---------------------------------------------

sub_00D204 {
    PHX 
    TYX 
    SEP #$20
    LDA $7F0008, X
    CMP #$8F
    REP #$20
    BEQ code_00D215
    PLX 
    SEC 
    RTS 
}

code_00D215 {
    PLX 
    CLC 
    RTS 
}

---------------------------------------------

func_00D218 {
    LDA #$2200
    TSB $10
    LDA #$0008
    TRB $10
    COP [C1]
    LDA $14
    SEC 
    SBC #$0004
    STA $14
    LDA $7F0020, X
    DEC 
    BEQ code_00D238
    STA $7F0020, X
    RTL 
}

code_00D238 {
    LDA #$2000
    TRB $10
    COP [80] ( #14 )
    COP [89]
    JSR $&sub_00D0AE
    RTL 
}

---------------------------------------------

func_00D246 {
    LDA #$2200
    TSB $10
    LDA #$0008
    TRB $10
    COP [C1]
    LDA $14
    CLC 
    ADC #$0004
    STA $14
    LDA $7F0020, X
    DEC 
    BEQ code_00D266
    STA $7F0020, X
    RTL 
}

code_00D266 {
    LDA #$2000
    TRB $10
    COP [80] ( #17 )
    COP [89]
    JSR $&sub_00D0AE
    RTL 
}

---------------------------------------------

func_00D274 {
    LDA #$2200
    TSB $10
    LDA #$0008
    TRB $10
    COP [C1]
    LDA $16
    SEC 
    SBC #$0004
    STA $16
    LDA $7F0020, X
    DEC 
    BEQ code_00D294
    STA $7F0020, X
    RTL 
}

code_00D294 {
    LDA #$2000
    TRB $10
    COP [80] ( #11 )
    COP [89]
    JSR $&sub_00D0AE
    RTL 
}

---------------------------------------------

func_00D2A2 {
    LDA #$2200
    TSB $10
    LDA #$0008
    TRB $10
    COP [C1]
    LDA $16
    CLC 
    ADC #$0004
    STA $16
    LDA $7F0020, X
    DEC 
    BEQ code_00D2C2
    STA $7F0020, X
    RTL 
}

code_00D2C2 {
    LDA #$2000
    TRB $10
    COP [80] ( #0E )
    COP [89]
    JSR $&sub_00D0AE
    RTL 
}

---------------------------------------------

sub_00D58A {
    PHX 
    LDX $player_actor
    LDA #$*code_02C3C8
    STA $0002, X
    LDA #$&code_02C3C8
    STA $0000, X
    LDA #$0000
    STA $002C, X
    STA $002E, X
    STA $0008, X
    LDA $0010, X
    AND #$FDFF
    ORA #$0008
    STA $0010, X
    LDA #$0F00
    TRB $joypad_mask_std
    LDA #$0800
    TRB $player_flags
    PLX 
    RTS 
}

---------------------------------------------

func_00D5C0 {
    PHX 
    LDX $04
    LDA $7F0020, X
    ASL 
    CLC 
    ADC $7F0020, X
    TAX 
    LDA $@array_01D90B+2, X
    AND #$00FF
    TAY 
    LDA $@array_01D90B, X
    SEC 
    SBC #$&array_01D90B
    PLX 
    STA $7F0010, X
    TYA 
    STA $7F0014, X
    STZ $2A
    LDA #$&loc_00D5F1
    STA $7F001E, X

  loc_00D5F1:
    PHX 
    LDA $7F0010, X
    CLC 
    ADC $2A
    INC $2A
    TAX 
    LDA $@array_01D90B, X
    AND #$00FF
    BIT #$0080
    BEQ code_00D60B
    ORA #$FF00
}

code_00D60B {
    LDX $04
    CLC 
    ADC $0016, X
    STA $0016, X
    PLX 
    COP [CB]
    LDA $7F0012, X
    STA $player_speed_ew
    JSR $&sub_00D58A
    LDA #$0000
    STA $09B6
    LDA #$0007
    STA $09B8
    COP [E0]
}