
!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_x_tile                  09A6

---------------------------------------------

h_av75_voice_rooms [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_av75_voice_rooms {
    LDA $player_y_pos
    CMP #$00F0
    BCC code_06D8CA
    JMP $&code_06DA0C
}

code_06D8CA {
    COP [CF] ( #$0149 )
    COP [CF] ( #$014A )
    COP [CF] ( #$014B )
    COP [CF] ( #$014C )
    COP [CF] ( #$014D )
    COP [CF] ( #$014E )
    COP [CF] ( #$014F )
    COP [CF] ( #$0150 )
    LDA $player_x_tile
    AND #$0010
    BNE code_06D90B
    INC $0AA6
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06DA14 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_06D90B {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06DA6B )
    COP [DA] ( #1D )
    COP [9C] ( @code_06DBF3, #$1002 )
    LDA $player_x_pos
    STA $0014, Y
    LDA $player_y_pos
    STA $0016, Y
    COP [C1]
    COP [40] ( #$8001, &code_06D937 )
    RTL 
}

code_06D937 {
    LDY $06
    LDA $0014, Y
    STA $24
    LDA $0016, Y
    STA $26
    COP [A9]
    LDA $player_x_tile
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    STA $0000
    COP [D9] ( #$0000, &code_list_06D956 )
}

code_list_06D956 [
  &code_06D95E   ;00
  &code_06D98A   ;01
  &code_06D9B4   ;02
  &code_06D9DE   ;03
]

code_06D95E {
    LDA $24
    CMP #$01B0
    BCC code_06D980
    CMP #$01C0
    BCS code_06D980
    LDA $26
    CMP #$0070
    BCC code_06D980
    CMP #$0090
    BCS code_06D980
    COP [BF] ( &widestring_06DAF0 )
    INC $0AA6
    JMP $&code_06DA0C
}

code_06D980 {
    COP [BF] ( &widestring_06DAA0 )
    DEC $0AA6
    JMP $&code_06DA0C
}

code_06D98A {
    LDA $24
    CMP #$0330
    BCC code_06D9AB
    CMP #$0350
    BCS code_06D9AB
    LDA $26
    CMP #$00A0
    BCC code_06D9AB
    CMP #$00C0
    BCS code_06D9AB
    COP [BF] ( &widestring_06DB2C )
    INC $0AA6
    BRA code_06DA0C
}

code_06D9AB {
    COP [BF] ( &widestring_06DAA0 )
    DEC $0AA6
    BRA code_06DA0C
}

code_06D9B4 {
    LDA $24
    CMP #$0570
    BCC code_06D9D5
    CMP #$0590
    BCS code_06D9D5
    LDA $26
    CMP #$0070
    BCC code_06D9D5
    CMP #$0090
    BCS code_06D9D5
    COP [BF] ( &widestring_06DB4F )
    INC $0AA6
    BRA code_06DA0C
}

code_06D9D5 {
    COP [BF] ( &widestring_06DAA0 )
    DEC $0AA6
    BRA code_06DA0C
}

code_06D9DE {
    LDA $24
    CMP #$0790
    BCC code_06DA03
    CMP #$07B0
    BCS code_06DA03
    LDA $26
    CMP #$00A0
    BCC code_06DA03
    CMP #$00C0
    BCS code_06DA03
    COP [BF] ( &widestring_06DB9F )
    COP [CC] ( #89 )
    COP [CD] ( #$0151 )
    BRA code_06DA0C
}

code_06DA03 {
    COP [BF] ( &widestring_06DAA0 )
    DEC $0AA6
    BRA code_06DA0C
}

code_06DA0C {
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

widestring_06DA14 `[TPL:9][LU2:16][LU1:EE]resounds.[FIN]Learn well the condition[N]of [LU1:D7]room.[FIN][LU1:61]you've learned it, [N][LU1:AC]the room. [END]`

widestring_06DA6B `[TPL:9][LU2:16][LU1:EE]resounds.[FIN][LU2:37]how [LU1:9F]different[N][LU1:8E]the room before.[END]`

widestring_06DAA0 `[TPL:A]How are [LU1:FE]powers[N]of observation?[FIN]Now [LU1:FE]trip will[N]get [LU1:B7]difficult![FIN]Try again!![END]`

widestring_06DAF0 `[TPL:A][LU2:2C]answer![N]The jar has[N][LU1:7F]color![FIN]Good.[N]Go on to the [LU1:BC]room.[END]`

widestring_06DB2C `[TPL:A][LU2:2C]answer![FIN][LU1:18]Go on[N]to the [LU1:BC]room.[END]`

widestring_06DB4F `[TPL:A][LU2:2C]answer![N]How [LU1:98]the contents of[N]the Jewel Box changed?[FIN][LU1:18]Go on[N]to the [LU1:BC]room.[END]`

widestring_06DB9F `[TPL:A][LU2:2C]answer![N]The [LU2:C5]blew your[N]hair around.[FIN]You [LU1:98]passed my[N]test well.[N]You may return.[END]`

code_06DBF3 {
    COP [B6] ( #30 )
    COP [80] ( #19 )
    COP [89]
    COP [C1]
    COP [40] ( #$0801, &code_06DC16 )

  code_06DC03:
    COP [40] ( #$0401, &code_06DC23 )

  code_06DC09:
    COP [40] ( #$0201, &code_06DC30 )

  code_06DC0F:
    COP [40] ( #$0101, &code_06DC40 )

  code_06DC15:
    RTL 
}

code_06DC16 {
    LDA $16
    CMP #$0008
    BCC code_06DC03
    DEC $16
    DEC $16
    BRA code_06DC03
}

code_06DC23 {
    LDA $16
    CMP #$00D0
    BCS code_06DC09
    INC $16
    INC $16
    BRA code_06DC09
}

code_06DC30 {
    LDA $14
    AND #$00FF
    CMP #$0008
    BCC code_06DC0F
    DEC $14
    DEC $14
    BRA code_06DC0F
}

code_06DC40 {
    LDA $14
    AND #$00FF
    CMP #$00F8
    BCS code_06DC15
    INC $14
    INC $14
    BRA code_06DC15
}