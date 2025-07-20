
!joypad_mask_std                065A

---------------------------------------------

h_it17_lily [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_it17_lily {
    COP [D0] ( #37, #01, &code_04E5F2 )
    COP [C0] ( &code_04E5F4 )
    COP [0B]
    COP [D2] ( #02, #01 )
    COP [80] ( #1A )
    COP [89]
    COP [BF] ( &widestring_04E7C9 )
    COP [CE] ( #02 )
    COP [D2] ( #03, #01 )
    COP [BF] ( &widestring_04E869 )
    COP [CC] ( #37 )
    LDA #$0000
    STA $0D60
    LDA #$0002
    STA $0D62
    LDA #$0404
    STA $064A
    COP [65] ( #$00C4, #$02B4, #00, #05 )
    COP [26] ( #1A, #$0150, #$01A0, #00, #$2200 )
    COP [C1]
    RTL 
}

code_04E5F2 {
    COP [E0]
}

code_04E5F4 {
    COP [D6] ( #03, &code_04E609 )
    COP [D0] ( #47, #01, &code_04E604 )
    COP [BF] ( &widestring_04E62C )
    RTL 
}

code_04E604 {
    COP [BF] ( &widestring_04E679 )
    RTL 
}

code_04E609 {
    COP [BF] ( &widestring_04E6E6 )
    COP [BE] ( #02, #01, &code_list_04E613 )
}

code_list_04E613 [
  &code_04E619   ;00
  &code_04E61E   ;01
  &code_04E619   ;02
]

code_04E619 {
    COP [BF] ( &widestring_04E78B )
    RTL 
}

code_04E61E {
    COP [BF] ( &widestring_04E778 )
    COP [CC] ( #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    RTL 
}

widestring_04E62C `[TPL:B][TPL:2][LU1:2A]The [LU2:A]is in [N]the [LU2:68]garden. He's [N][LU1:ED]old, but [LU1:ED]wise.[N][LU2:34]we go see him?[PAL:0][END]`

widestring_04E679 `[TPL:A][TPL:2][LU1:2A]What? Inca[N]Statue?[FIN][LU1:1D][LU1:D4]that[N][LU1:9F]in a cave on the[N][LU2:8C]of town....[FIN]Seems [LU1:DB]a wall[N][LU1:D9][LU1:D7]sounds[N][LU1:86][LU1:F6]struck...[PAL:0][END]`

widestring_04E6E6 `[TPL:B][TPL:2]Lilly:[N]What? [LU1:31]Tribe?[FIN]I know.[N]Not a tribe, [LU1:B7]like[N]a [LU1:C7]shadow form.[FIN]A high mountain peak[N]near [LU2:73]has[N][LU1:71][LU1:E1]home.[FIN][LU2:34]we go?[N][PAL:0] [LU1:6A]let's go.[N] [LU1:2B]quit.`

widestring_04E778 `[CLR][TPL:2][LU1:2A]OK.[N][LU1:1F]lead.[PAL:0][END]`

widestring_04E78B `[CLR][TPL:2][LU1:2A]If you[N][LU2:84]him mad, you'll[N][LU2:81][LU1:FE]life,[N]so you'd [LU2:50]stop it.[PAL:0][END]`

widestring_04E7C9 `[TPL:A][TPL:2][LU1:2A]No! [N][LU1:1D]too dangerous [N]for princesses! [FIN]If you [LU1:82][LU1:F1]to [N]bother Will, [LU1:A3][N]wait [LU2:73]quietly. [FIN][TPL:1][LU1:25][N]I [LU2:9E]to be the [LU2:89][N]one [LU1:AE]out. [FIN]So [LU1:1F][LU2:AC]to[N][LU1:17]Lola.[N]Nyaa nyaa!!![PAL:0][END]`

widestring_04E869 `[TPL:A][TPL:0]Will: [N][LU2:33]sulking... [FIN][TPL:2]Lilly:[N][LU1:1D][LU1:94]medicine for[N]a selfish girl.[FIN]The mountain pass will[N]be difficult, but let's[N]do the [LU2:4D]we can.[FIN][DLG:3,6][SIZ:D,3][PAL:0]So Will and [LU1:2C]go to [N]the peak [LU1:F4]the [N][LU1:31]Tribe lives. [END]`