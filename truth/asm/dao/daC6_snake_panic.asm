?INCLUDE 'stats_01ABF0'

!player_flags                   09AE
!jewels_collected               0AB0

---------------------------------------------

h_daC6_snake_panic [
  h_actor < #1F, #00, #10 >   ;00
]

---------------------------------------------

e_daC6_snake_panic {
    LDA #$0200
    TSB $12
    COP [9E] ( @code_08B0D4, #$FFD0, #$0010, #$0300 )
    COP [9E] ( @code_08B0D4, #$0000, #$0010, #$0300 )
    COP [9E] ( @code_08B0D4, #$0030, #$0010, #$0300 )
    COP [0B]
    COP [CE] ( #04 )
    COP [C0] ( &code_08AEA4 )
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_08AECA )
    COP [9C] ( @code_08AFB4, #$2000 )
    COP [CE] ( #03 )

  code_08AE8D:
    COP [D0] ( #04, #01, &code_08AE99 )
    COP [C1]
    COP [89]
    BRA code_08AE8D
}

code_08AE99 {
    COP [C0] ( &code_08AECF )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08AEA4 {
    COP [BF] ( &widestring_08AED4 )
    COP [BE] ( #02, #02, &code_list_08AEAE )
}

code_list_08AEAE [
  &code_08AEB4   ;00
  &code_08AEB9   ;01
  &code_08AEB4   ;02
]

code_08AEB4 {
    COP [BF] ( &widestring_08AEF7 )
    RTL 
}

code_08AEB9 {
    COP [BF] ( &widestring_08AF16 )
    COP [CC] ( #01 )
    STZ $0AAC
    LDA #$0008
    TRB $player_flags
    RTL 
}

code_08AECA {
    COP [BF] ( &widestring_08AF94 )
    RTL 
}

code_08AECF {
    COP [BF] ( &widestring_08B0B3 )
    RTL 
}

widestring_08AED4 `[DEF][LU2:27]the game[N][LU1:F0]the snakes?[N] Yes[N] No`

widestring_08AEF7 `[CLR]Too bad. [LU1:9][LU1:73]if[N]you [LU2:52][LU1:FE]mind.[END]`

widestring_08AF16 `[CLR]The rules are simple. [N]Hit as [LU1:B6]snakes as [N]you can in one minute. [FIN]Hit whatever pot[N]you like! That's the[N]start of the game!![END]`

widestring_08AF94 `[DEF][LU1:1C]hey. There's[N]plenty of them.[END]`

code_08AFB4 {
    COP [D2] ( #02, #01 )
    PHX 
    LDX #$0000

  code_08AFBC:
    STZ $0410, X
    INX 
    INX 
    CPX #$0010
    BNE code_08AFBC
    PLX 
    LDA #$0055
    STA $041E
    COP [23]
    COP [23]
    COP [23]
    COP [23]
    COP [23]
    COP [23]
    COP [23]
    COP [23]
    COP [23]
    STZ $24
    COP [C1]
    LDA $24
    CMP #$0E10
    BEQ code_08AFED
    INC $24
    RTL 
}

code_08AFED {
    COP [D0] ( #E7, #01, &code_08AFFB )
    LDA $0AAC
    CMP #$0051
    BCS code_08B010
}

code_08AFFB {
    COP [BF] ( &widestring_08B025 )

  code_08AFFF:
    COP [CE] ( #01 )
    COP [CE] ( #02 )
    COP [CC] ( #03 )
    LDA #$0008
    TSB $player_flags
    COP [E0]
}

code_08B010 {
    COP [CC] ( #E7 )
    COP [BF] ( &widestring_08B052 )
    SED 
    LDA $jewels_collected
    CLC 
    ADC #$0002
    STA $jewels_collected
    CLD 
    BRA code_08AFFF
}

widestring_08B025 `[TPL:A][DLY:2]OK! Stop![N][LU1:67]hit [BCD:3,AAC] snakes.[N]Try again![END]`

widestring_08B052 `[TPL:A][DLY:2]Wow [BCD:3,AAC] snakes. Very[N]good![FIN]For [LU1:FE]prize, [LU1:1F][LU1:97][N]you two Red Jewels. [FIN][LU1:1F]send [LU1:E6]to[N]the Jeweler.[END]`

widestring_08B0B3 `[TPL:A][LU1:67]hit [BCD:3,AAC] snakes.[N]Try again![END]`

code_08B0D4 {
    LDA #$&stats_01ABF0
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [0B]

  code_08B0E2:
    COP [8D] ( #24 )
    COP [D2] ( #01, #01 )
    LDA #$0200
    TRB $10
    LDA #$00FF
    STA $7F0026, X
    COP [58] ( &code_08B0FD )
    COP [D2] ( #02, #01 )
}

code_08B0FD {
    COP [CC] ( #02 )
    COP [58] ( &code_08B138 )

  code_08B104:
    COP [D0] ( #03, #01, &code_08B133 )
    LDA #$00FF
    STA $7F0026, X
    COP [23]
    AND #$000F
    ASL 
    ASL 
    ASL 
    STA $08
    COP [C2]
    LDA #$0200
    TRB $10
    COP [80] ( #24 )
    COP [89]

  code_08B127:
    COP [80] ( #25 )
    COP [89]
    LDA #$0200
    TSB $10
    BRA code_08B104
}

code_08B133 {
    COP [CC] ( #04 )
    BRA code_08B0E2
}

code_08B138 {
    COP [07] ( #0D )
    SED 
    LDA $0AAC
    CLC 
    ADC #$0001
    STA $0AAC
    CLD 
    LDA #$0200
    TSB $10
    COP [58] ( &code_08B138 )
    BRA code_08B127
}