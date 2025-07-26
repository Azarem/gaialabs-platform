
?INCLUDE 'func_0AA41C'

!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_dm3D_flayzer1 [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_dm3D_flayzer1 {
    LDA #$0002
    TSB $12
    COP [BB]

  code_0AAA5E:
    COP [27] ( #10 )
    COP [CA] ( #02 )
    COP [58] ( #$0000 )
    COP [C8] ( &code_0AAE41 )
    COP [58] ( &code_0AAABE )
    COP [21] ( #04, &code_0AAABE )
    COP [CB]
    COP [CA] ( #14 )
    COP [23]
    AND #$0003
    STA $08
    COP [21] ( #04, &code_0AAABE )
    COP [CB]
    BRA code_0AAA5E
}

---------------------------------------------

h_dm3D_flayzer2 [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_dm3D_flayzer2 {
    LDA #$0002
    TSB $12

  code_0AAA92:
    COP [27] ( #10 )
    COP [CA] ( #02 )
    COP [58] ( #$0000 )
    COP [C8] ( &code_0AADC6 )
    COP [58] ( &code_0AAABE )
    COP [21] ( #04, &code_0AAABE )
    COP [CB]
    COP [CA] ( #14 )
    COP [23]
    AND #$0003
    STA $08
    COP [21] ( #04, &code_0AAABE )
    COP [CB]
    BRA code_0AAA92
}

code_0AAABE {
    COP [58] ( #$0000 )
    LDA #$0002
    TRB $12
    JMP $&code_0AAB59
}

---------------------------------------------

h_dm3D_flayzer3 [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_dm3D_flayzer3 {
    COP [23]
    AND #$003F
    STA $08

  code_0AAAD4:
    COP [C2]
    COP [CA] ( #02 )
    COP [21] ( #04, &code_0AAB59 )
    COP [16] ( &code_0AAAEE )
    COP [82] ( #03, #11 )
    COP [89]
    COP [CB]
    COP [C8] ( &code_0AAB36 )
}

code_0AAAEE {
    COP [C2]
    COP [CA] ( #02 )
    COP [21] ( #04, &code_0AAB59 )
    COP [15] ( &code_0AAB08 )
    COP [82] ( #04, #12 )
    COP [89]
    COP [CB]
    COP [C8] ( &code_0AAB36 )
}

code_0AAB08 {
    COP [C2]
    COP [CA] ( #02 )
    COP [17] ( &code_0AAB1E )
    COP [81] ( #05, #12 )
    COP [89]
    COP [21] ( #04, &code_0AAB59 )
    COP [CB]
}

code_0AAB1E {
    COP [C2]
    COP [CA] ( #02 )
    COP [18] ( &code_0AAAD4 )
    COP [81] ( #85, #11 )
    COP [89]
    COP [21] ( #04, &code_0AAB59 )
    COP [CB]
    BRA code_0AAAD4
}

code_0AAB36 {
    COP [84] ( #02, #40 )
    COP [8A]
    COP [21] ( #04, &code_0AAB59 )
    COP [84] ( #00, #10 )
    COP [8A]
    COP [21] ( #04, &code_0AAB59 )
    COP [84] ( #82, #40 )
    COP [8A]
    COP [21] ( #04, &code_0AAB59 )
    COP [C5]
}

code_0AAB59 {
    LDA #$0001
    TSB $12
    COP [2C] ( &code_0AAB64, &code_0AAB9B )
}

code_0AAB64 {
    COP [C2]
    COP [2A] ( #$0030, &code_0AABDE, &code_0AAB70, &code_0AAC12 )
}

code_0AAB70 {
    COP [2A] ( #$0000, &code_0AAB8B, &code_0AAB7A, &code_0AAB7A )
}

code_0AAB7A {
    LDA #$0100
    TSB $12
    COP [C8] ( &code_0AAE15 )
    LDA #$0100
    TRB $10
    JMP $&code_0AAC12
}

code_0AAB8B {
    LDA #$0100
    TSB $12
    COP [C8] ( &code_0AAD9A )
    LDA #$0100
    TRB $10
    BRA code_0AABDE
}

code_0AAB9B {
    COP [C2]
    COP [2B] ( #$0030, &code_0AAC7A, &code_0AABA7, &code_0AAC46 )
}

code_0AABA7 {
    COP [2B] ( #$0000, &code_0AABB1, &code_0AABC2, &code_0AABC2 )
}

code_0AABB1 {
    LDA #$0100
    TSB $12
    COP [C8] ( &code_0AAD1E )
    LDA #$0100
    TRB $10
    JMP $&code_0AAC7A
}

code_0AABC2 {
    LDA #$0100
    TSB $12
    COP [C8] ( &code_0AACA2 )
    LDA #$0100
    TRB $10
    BRA code_0AAC46
}

---------------------------------------------

func_0AABD2 {
    COP [C2]
    COP [17] ( &code_0AAC12 )
    COP [81] ( #05, #12 )
    COP [89]
}

code_0AABDE {
    COP [80] ( #02 )
    COP [89]

  code_0AABE3:
    COP [17] ( &code_0AAC06 )
    COP [81] ( #05, #12 )
    COP [89]
    COP [2C] ( &code_0AABF3, &code_0AAC46 )
}

code_0AABF3 {
    COP [2A] ( #$0080, &code_0AABFD, &code_0AABFD, &code_0AAC12 )
}

code_0AABFD {
    COP [C2]
    COP [21] ( #04, &code_0AAB59 )
    BRA code_0AABE3
}

code_0AAC06 {
    COP [C2]
    COP [18] ( &code_0AAC46 )
    COP [81] ( #85, #11 )
    COP [89]
}

code_0AAC12 {
    COP [80] ( #82 )
    COP [89]

  code_0AAC17:
    COP [18] ( &code_0AAC3A )
    COP [81] ( #85, #11 )
    COP [89]
    COP [2C] ( &code_0AAC27, &code_0AAC46 )
}

code_0AAC27 {
    COP [2A] ( #$0080, &code_0AABFD, &code_0AAC31, &code_0AAC31 )
}

code_0AAC31 {
    COP [C2]
    COP [21] ( #04, &code_0AAB59 )
    BRA code_0AAC17
}

code_0AAC3A {
    COP [C2]
    COP [16] ( &code_0AAC7A )
    COP [82] ( #03, #11 )
    COP [89]
}

code_0AAC46 {
    COP [80] ( #00 )
    COP [89]

  code_0AAC4B:
    COP [16] ( &code_0AAC6E )
    COP [82] ( #03, #11 )
    COP [89]
    COP [2C] ( &code_0AABDE, &code_0AAC5B )
}

code_0AAC5B {
    COP [2B] ( #$0080, &code_0AAC99, &code_0AAC65, &code_0AAC65 )
}

code_0AAC65 {
    COP [C2]
    COP [21] ( #04, &code_0AAB59 )
    BRA code_0AAC4B
}

code_0AAC6E {
    COP [C2]
    COP [15] ( &code_0AABDE )
    COP [82] ( #04, #12 )
    COP [89]
}

code_0AAC7A {
    COP [80] ( #01 )
    COP [89]

  code_0AAC7F:
    COP [15] ( &func_0AABD2 )
    COP [82] ( #04, #12 )
    COP [89]
    COP [2C] ( &code_0AABDE, &code_0AAC8F )
}

code_0AAC8F {
    COP [2B] ( #$0080, &code_0AAC99, &code_0AAC99, &code_0AAC65 )
}

code_0AAC99 {
    COP [C2]
    COP [21] ( #04, &code_0AAB59 )
    BRA code_0AAC7F
}

code_0AACA2 {
    LDA $14
    STA $7F0018, X
    LDA $player_y_pos
    AND #$FFF0
    SEC 
    SBC #$0010
    STA $7F001A, X
    LDA #$0008
    TSB $10
    LDA #$0010
    TSB $12
    COP [22] ( #09, #02 )
    LDA #$0010
    TRB $12
    LDA #$0008
    TRB $10
    COP [80] ( #09 )
    COP [89]
    COP [07] ( #23 )
    LDA #$0010
    TSB $12
    COP [80] ( #06 )
    COP [89]
    COP [A4] ( @code_0AAEA4, #F0, #D0, #$0202 )
    COP [A4] ( @code_0AAFB5, #F0, #D4, #$0302 )
    COP [A4] ( @code_0AAFB5, #F0, #D8, #$0302 )
    COP [A4] ( @code_0AAFB5, #F0, #DC, #$0302 )
    COP [A4] ( @code_0AAFB5, #F0, #E0, #$0302 )
    COP [A4] ( @code_0AAFC4, #F0, #E4, #$0302 )
    COP [80] ( #13 )
    COP [89]
    JMP $&code_0AAE8E
}

code_0AAD1E {
    LDA $14
    STA $7F0018, X
    LDA $player_y_pos
    AND #$FFF0
    CLC 
    ADC #$0050
    STA $7F001A, X
    LDA #$0008
    TSB $10
    LDA #$0010
    TSB $12
    COP [22] ( #0A, #02 )
    LDA #$0010
    TRB $12
    LDA #$0008
    TRB $10
    COP [80] ( #0A )
    COP [89]
    COP [07] ( #23 )
    LDA #$0010
    TSB $12
    COP [80] ( #07 )
    COP [89]
    COP [A4] ( @code_0AAEC9, #10, #E0, #$0200 )
    COP [A4] ( @code_0AAFB5, #11, #DC, #$0300 )
    COP [A4] ( @code_0AAFB5, #12, #D8, #$0300 )
    COP [A4] ( @code_0AAFB5, #14, #D4, #$0300 )
    COP [A4] ( @code_0AAFB5, #12, #D0, #$0300 )
    COP [A4] ( @code_0AAFD0, #0C, #D0, #$0300 )
    COP [80] ( #14 )
    COP [89]
    JMP $&code_0AAE8E
}

code_0AAD9A {
    LDA $player_x_pos
    AND #$FFF0
    CLC 
    ADC #$0048
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$0008
    TSB $10
    LDA #$0010
    TSB $12
    COP [22] ( #0B, #02 )
    LDA #$0010
    TRB $12
    LDA #$0008
    TRB $10
}

code_0AADC6 {
    COP [80] ( #0B )
    COP [89]
    COP [07] ( #23 )
    LDA #$0010
    TSB $12
    COP [80] ( #08 )
    COP [89]
    COP [A4] ( @code_0AAEEE, #DE, #C0, #$0200 )
    COP [A4] ( @code_0AAFBA, #E0, #C4, #$0300 )
    COP [A4] ( @code_0AAFBA, #E2, #C8, #$0300 )
    COP [A4] ( @code_0AAFBA, #E3, #CC, #$0300 )
    COP [A4] ( @code_0AAFBA, #E3, #D0, #$0300 )
    COP [A4] ( @code_0AAFDD, #E3, #E8, #$0300 )
    COP [80] ( #15 )
    COP [89]
    BRA code_0AAE8E
}

code_0AAE15 {
    LDA $player_x_pos
    AND #$FFF0
    SEC 
    SBC #$0038
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA #$0008
    TSB $10
    LDA #$0010
    TSB $12
    COP [22] ( #8B, #02 )
    LDA #$0010
    TRB $12
    LDA #$0008
    TRB $10
}

code_0AAE41 {
    COP [80] ( #8B )
    COP [89]
    COP [07] ( #23 )
    LDA #$0010
    TSB $12
    COP [80] ( #88 )
    COP [89]
    COP [A4] ( @code_0AAF0B, #14, #C4, #$0200 )
    COP [A4] ( @code_0AAFBA, #16, #C8, #$0300 )
    COP [A4] ( @code_0AAFBA, #18, #CC, #$0300 )
    COP [A4] ( @code_0AAFBA, #19, #D0, #$0300 )
    COP [A4] ( @code_0AAFBA, #1A, #D4, #$0300 )
    COP [A4] ( @code_0AAFE9, #1B, #D8, #$0300 )
    COP [80] ( #95 )
    COP [89]
}

code_0AAE8E {
    COP [DA] ( #4F )
    LDA #$0010
    TRB $12
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [C5]
}

code_0AAEA4 {
    LDA #$FFF4
    STA $7F100C, X
    LDA #$FFFC
    STA $7F100E, X
    COP [8D] ( #10 )
    LDA $16
    CLC 
    ADC #$0060
    STA $7F001A, X
    COP [2A] ( #$0018, &code_0AAF69, &code_0AAF5C, &code_0AAF69 )
}

code_0AAEC9 {
    LDA #$000C
    STA $7F100C, X
    LDA #$FFFC
    STA $7F100E, X
    COP [8D] ( #11 )
    LDA $16
    SEC 
    SBC #$0040
    STA $7F001A, X
    COP [2A] ( #$0018, &code_0AAF75, &code_0AAF5C, &code_0AAF75 )
}

code_0AAEEE {
    LDA #$FFE8
    STA $7F100C, X
    LDA #$FFEA
    STA $7F100E, X
    COP [8D] ( #12 )
    LDA $14
    SEC 
    SBC #$0050
    STA $7F0018, X
    BRA code_0AAF2B
}

code_0AAF0B {
    LDA #$0012
    STA $7F100C, X
    LDA #$FFEB
    STA $7F100E, X
    COP [8D] ( #92 )
    LDA #$0002
    TSB $12
    LDA $14
    CLC 
    ADC #$0050
    STA $7F0018, X
}

code_0AAF2B {
    LDA $16
    CLC 
    ADC #$0030
    STA $16
    COP [2B] ( #$0018, &code_0AAF4E, &code_0AAF3D, &code_0AAF4E )
}

code_0AAF3D {
    LDA $16
    SEC 
    SBC #$0030
    STA $16
    LDA $player_y_pos
    STA $7F001A, X
    BRA code_0AAF7F
}

code_0AAF4E {
    LDA $16
    STA $7F001A, X
    SEC 
    SBC #$0030
    STA $16
    BRA code_0AAF7F
}

code_0AAF5C {
    LDA $player_x_pos
    CLC 
    ADC #$0008
    STA $7F0018, X
    BRA code_0AAF7F
}

code_0AAF69 {
    LDA $14
    CLC 
    ADC #$0010
    STA $7F0018, X
    BRA code_0AAF7F
}

code_0AAF75 {
    LDA $14
    SEC 
    SBC #$0010
    STA $7F0018, X
}

code_0AAF7F {
    LDA $24
    STA $7F0010, X
    COP [22] ( #FF, #08 )
    LDA #$0100
    TRB $10
    COP [DA] ( #1D )
    LDA $7F0010, X
    TAY 
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $7F0018, X
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $7F001A, X
    COP [22] ( #FF, #04 )
    COP [C1]
    RTL 
}

code_0AAFB5 {
    COP [8D] ( #0E )
    BRA code_0AAFBD
}

code_0AAFBA {
    COP [8D] ( #0F )
}

code_0AAFBD {
    COP [C1]
    JSL $@func_0AA41C
    RTL 
}

code_0AAFC4 {
    COP [8D] ( #0E )
    COP [C2]
    COP [BC] ( #04, #18 )
    COP [C1]
    RTL 
}

code_0AAFD0 {
    COP [8D] ( #0E )
    COP [DA] ( #0F )
    COP [BC] ( #00, #24 )
    COP [C1]
    RTL 
}

code_0AAFDD {
    COP [8D] ( #0F )
    COP [C2]
    COP [BC] ( #06, #04 )
    COP [C1]
    RTL 
}

code_0AAFE9 {
    COP [8D] ( #0F )
    COP [C2]
    COP [BC] ( #FA, #13 )
    COP [C1]
    RTL 
}