
?INCLUDE 'table_0EDA00'
?INCLUDE 'thinker_00B7CC'
?INCLUDE 'thinker_00B7D6'

!joypad_mask_std                065A
!jewels_collected               0AB0
!CGADSUB                        2131

---------------------------------------------

h_awBF_spirit_guide [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_awBF_spirit_guide {
    COP [D0] ( #BE, #01, &code_089B6B )
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [0D] ( #01, #00 )
    COP [C0] ( &code_089B6D )
    COP [BC] ( #08, #00 )
    COP [D0] ( #BD, #01, &code_089AD4 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_089AD4 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_089C5B )
    SEP #$20
    LDA #$15
    STA $CGADSUB
    REP #$20
    COP [3C] ( @e_thinker_00B7CC )
    COP [DA] ( #EF )
    LDA #$2000
    TSB $10
    COP [10] ( #0F, #0A )
    COP [10] ( #10, #0A )
    COP [3C] ( @e_thinker_00B7D6 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_089E2E )
    COP [D4] ( #1D, &code_089B27 )

  code_089B10:
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_089EE0 )
    COP [CC] ( #BE )

  code_089B1F:
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_089B27 {
    COP [D6] ( #01, &code_089B31 )
    COP [D6] ( #06, &code_089B54 )
}

code_089B31 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_089EAB )
    COP [D5] ( #01 )
    SED 
    LDA $jewels_collected
    CLC 
    ADC #$0001
    STA $jewels_collected
    CLD 
    COP [D4] ( #1D, &code_089B1F )
    BRA code_089B10
}

code_089B54 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_089EFC )
    COP [D5] ( #06 )
    COP [D4] ( #1D, &code_089B1F )
    BRA code_089B10
}

code_089B6B {
    COP [E0]
}

code_089B6D {
    COP [BF] ( &widestring_089B8B )
    COP [CC] ( #BD )
    LDA #$0004
    STA $064A
    LDA #$0002
    STA $0648
    COP [26] ( #C0, #$0000, #$0000, #00, #$4400 )
    RTL 
}

widestring_089B8B `[DEF][TPL:2]Will.. [LU1:20][LU1:70][LU1:FD][N]for you to [LU1:79]for [N][LU2:B8]of years... [FIN][TPL:0]Will: [N]What?! Who are you... [FIN][TPL:2]I am dreaming. Time has [N]passed [LU2:A4]the dream [N]began, and my [LU1:72][N]became [LU1:F7]you see. [FIN]I'm [LU1:93]to show you[N]a [LU1:C7]image.[N]Close [LU1:FE]eyes.[END]`

widestring_089C5B `[DEF][TPL:0]Will: [N]Huh? [LU1:62]was that? [FIN][TPL:2]That is the new world...[FIN][TPL:0]Will: [N]That [LU1:F5]is all [N]grey... [FIN]This [LU1:F5]has blue [N]water, green mountains, [N]brown earth all over. [FIN][TPL:2]You [LU1:EF]usher in[N][LU1:D7]world...[FIN][TPL:0]Will: Me? Such a [N][LU1:C7]world?! [FIN][TPL:2]Tall trees replaced [N]by buildings, rivers [N]replaced by roads... [FIN]No [LU1:B8][LU1:F7]kind of[N][LU1:F5][LU1:C1]have, if[N][LU2:AB][LU1:DA]they're[N]happy, they'll be happy.[FIN]Go to the [LU1:EC]and[N]restore those turned[N]to [LU2:9D]to their[N][LU1:C0]condition.[FIN]Release those who have[N][LU1:70][LU2:B3]grey back[N]to [LU1:E1]natural state.[PAL:0][END]`

widestring_089E2E `[TPL:B][TPL:0][LU1:61]the blinding [N][LU1:A8]stopped, I stood [N]quietly, as if [LU1:B9][N]had happened. [FIN]Then I [LU1:8F]the [LU2:13][N][LU2:68]held tightly [N]within my hand...[PAL:0][END]`

widestring_089EAB `[TPL:A]A [LU1:C7][LU1:EE]says...[N]Let me [LU1:E7][LU2:57]of one[N]of [LU1:FE]Red Jewels...[END]`

widestring_089EE0 `[TPL:A][SFX:0][DLY:9]You [LU1:98]the[N][LU2:13]Flower![PAU:78][END]`

widestring_089EFC `[TPL:A]A [LU1:C7][LU1:EE]says...[N]Let me [LU1:E7][LU2:57]of one[N]of [LU1:FE]herbs...[END]`