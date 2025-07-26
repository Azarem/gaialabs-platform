
?INCLUDE 'stats_01ABF0'
?INCLUDE 'chunk_00E683'

!joypad_mask_std                065A
!camera_bounds_y                06DC
!player_y_pos                   09A4
!player_actor                   09AA
!_TM                            212C
!CGADSUB                        2131

---------------------------------------------

h_sEA_solid_arm [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_sEA_solid_arm {
    LDA #$0011
    TSB $12
    LDA #$0100
    STA $camera_bounds_y
    COP [9A] ( @func_08F9F2, #$2000 )
    LDA #$*binary_08F9EA
    AND #$00FF
    STA $0AF6
    LDA #$&binary_08F9EA
    STA $0AF4
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #13 )
    COP [07] ( #0E )
    COP [32] ( #9C )
    COP [33]
    COP [D0] ( #E8, #01, &code_08F754 )
    COP [05] ( #1B )
    COP [DB] ( #$0120 )
    COP [CC] ( #E8 )
    COP [BF] ( &widestring_08FA31 )
}

code_08F754 {
    COP [DA] ( #0F )
    COP [04] ( #0F )
    COP [DA] ( #31 )
    LDA #$EFF0
    TRB $joypad_mask_std

  code_08F763:
    COP [80] ( #00 )
    COP [89]

  code_08F768:
    LDA $player_y_pos
    CMP #$0070
    BCS code_08F773
    JMP $&code_08F83E
}

code_08F773 {
    COP [2A] ( #$0010, &code_08F7AA, &code_08F77D, &code_08F7AA )
}

code_08F77D {
    COP [80] ( #0E )
    COP [89]
    COP [9E] ( @code_08F8B4, #$0000, #$FFE8, #$0200 )
    COP [9E] ( @code_08F8E6, #$0000, #$FFE8, #$0200 )
    COP [9E] ( @code_08F900, #$0000, #$FFE8, #$0200 )
    COP [80] ( #16 )
    COP [89]
    BRA code_08F763
}

code_08F7AA {
    COP [2A] ( #$0050, &code_08F7B4, &code_08F822, &code_08F7B4 )
}

code_08F7B4 {
    COP [2A] ( #$0070, &code_08F822, &code_08F7BE, &code_08F822 )
}

code_08F7BE {
    COP [2A] ( #$0000, &code_08F7C8, &code_08F7F5, &code_08F7F5 )
}

code_08F7C8 {
    COP [80] ( #0D )
    COP [89]
    COP [9E] ( @code_08F937, #$FFF0, #$FFE6, #$0200 )
    COP [80] ( #17 )
    COP [89]
    COP [80] ( #0D )
    COP [89]
    COP [9E] ( @code_08F937, #$FFF0, #$FFE6, #$0200 )
    COP [80] ( #17 )
    COP [89]
    JMP $&code_08F768
}

code_08F7F5 {
    COP [80] ( #0F )
    COP [89]
    COP [9E] ( @code_08F957, #$0010, #$FFE6, #$0200 )
    COP [80] ( #18 )
    COP [89]
    COP [80] ( #0F )
    COP [89]
    COP [9E] ( @code_08F957, #$0010, #$FFE6, #$0200 )
    COP [80] ( #18 )
    COP [89]
    JMP $&code_08F768
}

code_08F822 {
    COP [2A] ( #$0000, &code_08F82C, &code_08F835, &code_08F835 )
}

code_08F82C {
    COP [81] ( #07, #12 )
    COP [89]
    JMP $&code_08F768
}

code_08F835 {
    COP [81] ( #05, #11 )
    COP [89]
    JMP $&code_08F768
}

code_08F83E {
    COP [2A] ( #$0040, &code_08F8A2, &code_08F848, &code_08F8AB )
}

code_08F848 {
    COP [2A] ( #$0000, &code_08F852, &code_08F87A, &code_08F87A )
}

code_08F852 {
    COP [07] ( #02 )
    LDA #$0010
    TSB $10
    LDA #$&stats_01ABF0+180
    STA $7F0020, X
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    LDA #$&stats_01ABF0+17C
    STA $7F0020, X
    LDA #$0010
    TRB $10
    JMP $&code_08F768
}

code_08F87A {
    COP [07] ( #02 )
    LDA #$0010
    TSB $10
    LDA #$&stats_01ABF0+180
    STA $7F0020, X
    COP [80] ( #0B )
    COP [89]
    COP [80] ( #0C )
    COP [89]
    LDA #$&stats_01ABF0+17C
    STA $7F0020, X
    LDA #$0010
    TRB $10
    JMP $&code_08F768
}

code_08F8A2 {
    COP [81] ( #08, #02 )
    COP [89]
    JMP $&code_08F768
}

code_08F8AB {
    COP [81] ( #06, #01 )
    COP [89]
    JMP $&code_08F768
}

code_08F8B4 {
    COP [5B] ( #$0010 )
    COP [B2]
    COP [B6] ( #30 )
    COP [80] ( #10 )
    COP [89]
    COP [83] ( #13, #06, #11 )
    COP [89]
    COP [83] ( #13, #04, #01 )
    COP [89]
    COP [83] ( #13, #02, #03 )
    COP [89]
    COP [86] ( #13, #04, #07 )
    COP [8A]
    LDA #$0008
    STA $26
    JMP $&code_08F977
}

code_08F8E6 {
    COP [5B] ( #$0010 )
    COP [B2]
    COP [B6] ( #30 )
    COP [07] ( #1E )
    COP [80] ( #10 )
    COP [89]
    COP [86] ( #13, #0C, #07 )
    COP [8A]
    COP [E0]
}

code_08F900 {
    COP [5B] ( #$0010 )
    COP [B2]
    COP [B6] ( #30 )
    COP [80] ( #10 )
    COP [89]
    COP [83] ( #13, #05, #11 )
    COP [89]
    COP [83] ( #13, #03, #01 )
    COP [89]
    COP [83] ( #13, #01, #03 )
    COP [89]
    COP [82] ( #13, #07 )
    COP [89]
    COP [86] ( #13, #04, #07 )
    COP [8A]
    LDA #$0008
    STA $26
    BRA code_08F977
}

code_08F937 {
    COP [5B] ( #$0010 )
    COP [B2]
    COP [B6] ( #30 )
    COP [07] ( #1E )
    COP [80] ( #11 )
    COP [89]
    COP [87] ( #13, #05, #06, #05 )
    COP [8A]
    LDA #$000A
    STA $26
    BRA code_08F977
}

code_08F957 {
    COP [5B] ( #$0010 )
    COP [B2]
    COP [B6] ( #30 )
    COP [07] ( #1E )
    COP [80] ( #12 )
    COP [89]
    COP [87] ( #13, #05, #05, #05 )
    COP [8A]
    LDA #$0006
    STA $26
    BRA code_08F977
}

code_08F977 {
    COP [A2] ( @func_00E683, #$2000 )
    LDA #$8013
    STA $7F000A, X
    LDA #$0003
    STA $7F0014, X
    LDA $player_actor
    STA $0024, Y
    PHX 
    TYX 
    LDA $26
    STA $7F000E, X
    PLX 
    COP [84] ( #13, #03 )
    COP [8A]
    PHX 
    LDX $06
    LDA $7F002C, X
    STA $0000
    LDA $7F002E, X
    PLX 
    STA $7F100E, X
    LDA $0000
    STA $7F100C, X
    COP [A9]
    COP [8D] ( #13 )

  code_08F9C0:
    COP [C1]
    COP [8B]
    LDA $08
    STA $24
    STZ $08
    COP [C1]
    LDA $7F100C, X
    STA $7F002C, X
    LDA $7F100E, X
    STA $7F002E, X
    DEC $24
    BMI code_08F9E1
    RTL 
}

code_08F9E1 {
    LDA $10
    BIT #$4000
    BEQ code_08F9C0
    COP [E0]
}

---------------------------------------------

binary_08F9EA #E978039000000044

---------------------------------------------

func_08F9F2 {
    SEP #$20
    LDA #$15
    STA $_TM
    LDA #$21
    STA $CGADSUB
    REP #$20
    LDA $0AEC
    BEQ code_08FA06
    RTL 
}

code_08FA06 {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [05] ( #1B )
    COP [DB] ( #$0120 )
    COP [BF] ( &widestring_08FBC8 )
    LDA #$0202
    STA $0648
    LDA #$0404
    STA $064A
    COP [26] ( #E3, #$0280, #$01A0, #80, #$2310 )
    COP [E0]
}

widestring_08FA31 `[DEF]Welcome to my home.[FIN]The Jeweler Gem is a[N][LU2:B4]form. The[N]true form is called[N]Solid Arm.[FIN]Long ago the Blazer [N][LU1:80]down [LU1:8E]the sky, [N]and I was put to sleep [N]for a long, [LU1:A6]time... [FIN]My [LU1:C2]is contained in[N]Red [LU1:22]scattered[N][LU1:6D]the world[FIN][LU1:20][LU1:DD][LU1:B6]things[N]to [LU2:4E][LU1:6B]my[N]own resurrection.[FIN]It is I who manipulated[N]the [LU1:AD]trade.[FIN]I [LU1:DD]using forced[N][LU1:AD]to [LU1:90]them,[N]but it [LU1:83]restore[N]my [LU1:C2]fast enough.[FIN]I'm sorry, but I will[N][LU1:98]to defeat you too![END]`

widestring_08FBC8 `[DEF]A quiet [LU1:EE]is heard.[FIN][DLY:4]I was defeated again...[FIN]Blazer was strong, [N]but you are stronger... [FIN]Danger approaches[N][LU1:D6]planet. You should[N]hurry to the[N]Tower of Babel...[END]`