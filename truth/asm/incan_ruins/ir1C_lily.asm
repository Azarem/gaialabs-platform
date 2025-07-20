?INCLUDE 'sE6_gaia'
?INCLUDE 'func_00C806'
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_ir1C_lily [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_ir1C_lily {
    COP [D0] ( #4B, #01, &code_09CAB1 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_09CAE5 )
    COP [0F] ( #06, #19 )
    COP [0F] ( #07, #19 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [9C] ( @func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0003
    STA $7F0010, X
    LDA #$001A
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    COP [C0] ( #$0000 )
    LDA #$0800
    TSB $10
    COP [C1]
    COP [C1]
    COP [8B]
    COP [D0] ( #01, #01, &code_09CA54 )
    RTL 
}

code_09CA54 {
    LDA #$0800
    TRB $10
    COP [A9]
    COP [10] ( #06, #19 )
    COP [10] ( #07, #19 )
    COP [D2] ( #03, #01 )
    LDA #$0000
    JSL $@func_00C6E4
    COP [80] ( #1A )
    COP [89]
    COP [BF] ( &widestring_09CCD0 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    LDA $16
    AND #$FFF0
    STA $16
    COP [82] ( #1E, #11 )
    COP [89]
    COP [84] ( #1A, #06 )
    COP [8A]
    COP [84] ( #1C, #06 )
    COP [8A]
    COP [84] ( #1B, #14 )
    COP [8A]
    COP [BF] ( &widestring_09CE01 )
    COP [CC] ( #4B )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [85] ( #20, #04, #12 )
    COP [8A]
}

code_09CAB1 {
    COP [80] ( #1A )
    COP [89]
    COP [25] ( #16, #13 )
    COP [0B]
    COP [C0] ( &code_09CAE0 )
    LDA $0AD4
    BEQ code_09CADD
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F37D
    STA $0002, Y
    REP #$20
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0800
    TSB $player_flags
}

code_09CADD {
    COP [C1]
    RTL 
}

code_09CAE0 {
    COP [BF] ( &widestring_09CE01 )
    RTL 
}

widestring_09CAE5 `[DLG:3,11][SIZ:D,4][TPL:2][LU1:2A]Here's the[N]entrance to the ruins.[FIN]They say [LU1:D7][LU1:D6]is [N][LU1:F4]the puzzle of the [N]Incan legend is hidden. [FIN]I [LU1:99][LU1:D6]story from[N]the [LU2:A]when[N]I was a child...[FIN]After [LU1:77]invaded, the[N]Incas decided to leave[N][LU1:E1]native land to[N][LU1:90]a new world.[FIN]They secretly built[N]a [LU1:9C]ship and filled[N]it [LU1:F0]priceless[N]gold artifacts.[FIN]But [LU1:DB]no record of[N]the ship leaving...[FIN]That's [LU2:8F]the Incan [N][LU1:19]Ship in the story. [FIN]I [LU1:82][LU1:DA]the Elder[N]has [LU2:5D]told [LU1:D7]story[N]to any outsider.[FIN]I [LU1:F9][LU1:F7]he wants[N]you to do...[PAL:0][END]`

---------------------------------------------

widestring_09CCB3 `[DLG:3,6][SIZ:D,3][TPL:2]Lilly:[N][LU1:9][LU2:73]a moment.[END]`

widestring_09CCD0 `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A]Why are you in a[N][LU2:90][LU1:A5]this![N][LU1:1D]dangerous![FIN][TPL:1][LU1:25]Lola told me [N][LU1:6B][LU1:D6]place. [LU1:20][N][LU1:70]waiting! [FIN]I [LU1:D8]you'd left[N]me. You [LU1:CA][LU2:AD]me[N][LU1:F4][LU1:FF]going!![FIN][LU1:62]is Will [LU1:AB][N]for in the ruins? [FIN]I [LU1:78][LU1:A3]wait [LU1:6D][N]and eat [LU2:BF]Will is [N]working so hard. [FIN]I'm [LU1:FD][LU2:73]for [N]Will to return. [FIN][TPL:2][LU1:2A][LU1:63]a princess[N][LU1:FB]understand...[FIN][LU1:1F]wait for [N]you [LU2:74]OK? [END]`

widestring_09CE01 `[DLG:3,6][SIZ:D,4][TPL:2][LU1:2A][N]Will. I remember [LU1:F7][N]the [LU2:A]said. [FIN]"Put the [LU1:C9]on the [N][LU2:19]Cliff below the [N][LU2:9A][LU1:F4]the spirits'[N][LU2:4B]cannot reach. [FIN]The valley [LU2:C5][LU1:EF][N]lead you to the [N][LU1:19]Shipˮ.  [PAL:0][END]`