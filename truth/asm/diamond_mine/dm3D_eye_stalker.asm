
!scene_current                  0644
!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_dm3D_eye_stalker1 [
  h_actor < #16, #00, #03 >   ;00
]

---------------------------------------------

e_dm3D_eye_stalker1 {
    COP [5B] ( #$0008 )
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    COP [21] ( #03, &code_0AB0C9 )
    RTL 
}

code_0AB0C9 {
    COP [80] ( #1B )
    COP [89]
    COP [0C]
    LDA #$0300
    TRB $10
    JMP $&code_0AB125
}

---------------------------------------------

h_sE9_eye_stalker2 [
  h_actor < #16, #00, #03 >   ;00
]

---------------------------------------------

e_sE9_eye_stalker2 {
    COP [5B] ( #$0008 )
    COP [B7] ( #04 )
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    COP [21] ( #03, &code_0AB0F1 )
    RTL 
}

code_0AB0F1 {
    COP [B7] ( #00 )
    COP [80] ( #1B )
    COP [89]
    COP [0C]
    LDA #$0300
    TRB $10
    JMP $&code_0AB125
}

---------------------------------------------

h_dm3D_eye_stalker3 [
  h_actor < #16, #00, #00 >   ;00
]

---------------------------------------------

e_dm3D_eye_stalker3 {
    COP [5B] ( #$0008 )

  code_0AB10A:
    COP [27] ( #0F )
    LDA $10
    BIT #$4000
    BNE code_0AB10A

  code_0AB114:
    COP [21] ( #03, &code_0AB12B )

  code_0AB119:
    COP [21] ( #05, &code_0AB148 )
    LDA $10
    BIT #$4000
    BNE code_0AB10A
}

code_0AB125 {
    COP [C8] ( &code_0AB14E )
    BRA code_0AB114
}

code_0AB12B {
    LDA $scene_current
    CMP #$00E9
    BNE code_0AB138
    COP [C4] ( @code_0AB119 )
}

code_0AB138 {
    LDA #$0300
    TSB $10
    COP [C8] ( &code_0AB3CA )
    LDA #$0300
    TRB $10
    BRA code_0AB114
}

code_0AB148 {
    COP [C8] ( &code_0AB220 )
    BRA code_0AB125
}

code_0AB14E {
    LDA $28
    SEC 
    SBC #$0016
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB160 )
}

code_list_0AB160 [
  &code_0AB16E   ;00
  &code_0AB19C   ;01
  &code_0AB1CA   ;02
  &code_0AB1F8   ;03
]

---------------------------------------------

func_0AB168 {
    COP [C2]
    COP [17] ( &code_0AB19C )
}

code_0AB16E {
    COP [80] ( #18 )
    COP [89]

  code_0AB173:
    COP [17] ( &code_0AB196 )
    COP [81] ( #18, #02 )
    COP [89]
    COP [2C] ( &code_0AB183, &code_0AB1CA )
}

code_0AB183 {
    COP [2A] ( #$0080, &code_0AB18D, &code_0AB18D, &code_0AB19C )
}

code_0AB18D {
    COP [C2]
    COP [21] ( #05, &code_0AB114 )
    BRA code_0AB173
}

code_0AB196 {
    COP [C2]
    COP [18] ( &code_0AB1CA )
}

code_0AB19C {
    COP [80] ( #98 )
    COP [89]

  code_0AB1A1:
    COP [18] ( &code_0AB1C4 )
    COP [81] ( #98, #01 )
    COP [89]
    COP [2C] ( &code_0AB1B1, &code_0AB1CA )
}

code_0AB1B1 {
    COP [2A] ( #$0080, &code_0AB18D, &code_0AB1BB, &code_0AB1BB )
}

code_0AB1BB {
    COP [C2]
    COP [21] ( #05, &code_0AB114 )
    BRA code_0AB1A1
}

code_0AB1C4 {
    COP [C2]
    COP [16] ( &code_0AB1F8 )
}

code_0AB1CA {
    COP [80] ( #16 )
    COP [89]

  code_0AB1CF:
    COP [16] ( &code_0AB1F2 )
    COP [82] ( #16, #01 )
    COP [89]
    COP [2C] ( &code_0AB16E, &code_0AB1DF )
}

code_0AB1DF {
    COP [2B] ( #$0080, &code_0AB217, &code_0AB1E9, &code_0AB1E9 )
}

code_0AB1E9 {
    COP [C2]
    COP [21] ( #05, &code_0AB114 )
    BRA code_0AB1CF
}

code_0AB1F2 {
    COP [C2]
    COP [15] ( &code_0AB16E )
}

code_0AB1F8 {
    COP [80] ( #17 )
    COP [89]

  code_0AB1FD:
    COP [15] ( &func_0AB168 )
    COP [82] ( #17, #02 )
    COP [89]
    COP [2C] ( &code_0AB16E, &code_0AB20D )
}

code_0AB20D {
    COP [2B] ( #$0080, &code_0AB217, &code_0AB217, &code_0AB1E9 )
}

code_0AB217 {
    COP [C2]
    COP [21] ( #05, &code_0AB114 )
    BRA code_0AB1FD
}

code_0AB220 {
    COP [2A] ( #$0030, &code_0AB22A, &code_0AB2B2, &code_0AB26E )
}

code_0AB22A {
    COP [80] ( #18 )
    COP [89]
    JSR $&sub_0ADD66
    LDA $7F0018, X
    CLC 
    ADC #$0060
    STA $7F0018, X
    LDA #$0008
    TSB $10
    BRA code_0AB24E
}

---------------------------------------------

func_0AB245 {
    JSR $&sub_0ADD83
    COP [22] ( #18, #02 )
    BRA code_0AB256
}

code_0AB24E {
    COP [22] ( #18, #02 )
    COP [1F] ( &func_0AB245 )
}

code_0AB256 {
    LDA #$0008
    TRB $10
    COP [80] ( #24 )
    COP [89]
    COP [A4] ( @code_0AB39E, #E8, #EB, #$2200 )
    COP [DA] ( #05 )
    COP [C5]
}

code_0AB26E {
    COP [80] ( #98 )
    COP [89]
    JSR $&sub_0ADD66
    LDA $7F0018, X
    SEC 
    SBC #$0050
    STA $7F0018, X
    LDA #$0008
    TSB $10
    BRA code_0AB292
}

---------------------------------------------

func_0AB289 {
    JSR $&sub_0ADD83
    COP [22] ( #98, #02 )
    BRA code_0AB29A
}

code_0AB292 {
    COP [22] ( #98, #02 )
    COP [1F] ( &func_0AB289 )
}

code_0AB29A {
    LDA #$0008
    TRB $10
    COP [80] ( #A4 )
    COP [89]
    COP [A4] ( @code_0AB399, #18, #EB, #$2200 )
    COP [DA] ( #05 )
    COP [C5]
}

code_0AB2B2 {
    COP [2B] ( #$0030, &code_0AB2BC, &code_0AB2BC, &code_0AB300 )
}

code_0AB2BC {
    COP [80] ( #17 )
    COP [89]
    JSR $&sub_0ADD66
    LDA $7F001A, X
    CLC 
    ADC #$0060
    STA $7F001A, X
    LDA #$0008
    TSB $10
    BRA code_0AB2E0
}

---------------------------------------------

func_0AB2D7 {
    JSR $&sub_0ADD83
    COP [22] ( #17, #02 )
    BRA code_0AB2E8
}

code_0AB2E0 {
    COP [22] ( #17, #02 )
    COP [1F] ( &func_0AB2D7 )
}

code_0AB2E8 {
    LDA #$0008
    TRB $10
    COP [80] ( #23 )
    COP [89]
    COP [A4] ( @code_0AB344, #00, #F8, #$2200 )
    COP [DA] ( #05 )
    COP [C5]
}

code_0AB300 {
    COP [80] ( #16 )
    COP [89]
    JSR $&sub_0ADD66
    LDA $7F001A, X
    SEC 
    SBC #$0060
    STA $7F001A, X
    LDA #$0008
    TSB $10
    BRA code_0AB324
}

---------------------------------------------

func_0AB31B {
    JSR $&sub_0ADD83
    COP [22] ( #16, #02 )
    BRA code_0AB32C
}

code_0AB324 {
    COP [22] ( #16, #02 )
    COP [1F] ( &func_0AB31B )
}

code_0AB32C {
    LDA #$0008
    TRB $10
    COP [80] ( #22 )
    COP [89]
    COP [A4] ( @code_0AB36D, #00, #07, #$2202 )
    COP [DA] ( #05 )
    COP [C5]
}

code_0AB344 {
    COP [B6] ( #30 )
    LDA #$2000
    TSB $12
    LDA #$2000
    TRB $10
    COP [07] ( #20 )
    COP [82] ( #25, #03 )
    COP [89]
    COP [82] ( #26, #05 )
    COP [89]
    COP [82] ( #27, #07 )
    COP [89]
    LDA #$0002
    TSB $10
    BRA code_0AB384
}

code_0AB36D {
    COP [B6] ( #30 )
    LDA #$2000
    TRB $10
    COP [07] ( #20 )
    COP [82] ( #25, #03 )
    COP [89]
    COP [82] ( #26, #03 )
    COP [89]
}

code_0AB384 {
    COP [82] ( #27, #05 )
    COP [89]

  code_0AB38A:
    COP [82] ( #28, #07 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AB38A
    COP [E0]
}

code_0AB399 {
    LDA #$4000
    TSB $12
}

code_0AB39E {
    COP [B6] ( #30 )
    LDA #$2000
    TRB $10
    COP [07] ( #20 )
    COP [81] ( #29, #04 )
    COP [89]
    COP [81] ( #2A, #04 )
    COP [89]
    COP [81] ( #2B, #06 )
    COP [89]

  code_0AB3BB:
    COP [81] ( #2C, #08 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AB3BB
    COP [E0]
}

code_0AB3CA {
    LDA $28
    SEC 
    SBC #$0016
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB3DC )
}

code_list_0AB3DC [
  &code_0AB3E4   ;00
  &code_0AB408   ;01
  &code_0AB42C   ;02
  &code_0AB42C   ;03
]

code_0AB3E4 {
    COP [0B]
    COP [80] ( #19 )
    COP [89]
    COP [CA] ( #0C )
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [21] ( #03, &code_0AB3FB )
    BRA code_0AB3FF
}

code_0AB3FB {
    COP [CB]
    BRA code_0AB479
}

code_0AB3FF {
    COP [80] ( #1B )
    COP [89]
    COP [0C]
    COP [C5]
}

code_0AB408 {
    COP [0B]
    COP [80] ( #1C )
    COP [89]
    COP [CA] ( #0C )
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [21] ( #03, &code_0AB41F )
    BRA code_0AB423
}

code_0AB41F {
    COP [CB]
    BRA code_0AB479
}

code_0AB423 {
    COP [80] ( #1E )
    COP [89]
    COP [0C]
    COP [C5]
}

code_0AB42C {
    COP [0B]
    LDA $0E
    BIT #$4000
    BNE code_0AB457
    COP [80] ( #1F )
    COP [89]
    COP [CA] ( #0C )
    COP [84] ( #20, #08 )
    COP [8A]
    COP [21] ( #03, &code_0AB44A )
    BRA code_0AB44E
}

code_0AB44A {
    COP [CB]
    BRA code_0AB479
}

code_0AB44E {
    COP [80] ( #21 )
    COP [89]
    COP [0C]
    COP [C5]
}

code_0AB457 {
    COP [80] ( #9F )
    COP [89]
    COP [CA] ( #0C )
    COP [84] ( #A0, #08 )
    COP [8A]
    COP [21] ( #03, &code_0AB46C )
    BRA code_0AB470
}

code_0AB46C {
    COP [CB]
    BRA code_0AB479
}

code_0AB470 {
    COP [80] ( #A1 )
    COP [89]
    COP [0C]
    COP [C5]
}

code_0AB479 {
    LDA #$0300
    TRB $10
    COP [0C]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AB48E )
}

code_list_0AB48E [
  &code_0AB22A   ;00
  &code_0AB26E   ;01
  &code_0AB2BC   ;02
  &code_0AB300   ;03
]

---------------------------------------------

sub_0ADD66 {
    LDA $player_x_pos
    AND #$FFF0
    CLC 
    ADC #$0008
    STA $7F0018, X
    LDA $player_y_pos
    AND #$FFF0
    CLC 
    ADC #$0020
    STA $7F001A, X
    RTS 
}

---------------------------------------------

sub_0ADD83 {
    LDA $14
    SEC 
    SBC #$0008
    AND #$FFF0
    CLC 
    ADC #$0008
    STA $7F0018, X
    LDA $16
    AND #$FFF0
    STA $7F001A, X
    RTS 
}