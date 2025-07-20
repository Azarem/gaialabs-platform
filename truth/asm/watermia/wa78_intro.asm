
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_wa78_intro [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_wa78_intro {
    COP [D0] ( #8D, #01, &code_07808E )
    LDA #$0008
    TSB $12
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDA #$0800
    TRB $10
    COP [DA] ( #01 )
    LDA #$0800
    TSB $10
    COP [A5] ( @code_0780AD, #00, #00, #$2000 )
    COP [9C] ( @code_078090, #$2800 )
    COP [86] ( #07, #08, #02 )
    COP [8A]
    COP [87] ( #07, #10, #11, #02 )
    COP [8A]
    LDY $player_actor
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    COP [CC] ( #8D )
    LDA #$0800
    TRB $10
    COP [DA] ( #1D )
    COP [BF] ( &widestring_078139 )
    COP [DA] ( #3B )
    LDA #$0404
    STA $064A
    COP [26] ( #79, #$0070, #$00B0, #00, #$1100 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_07808E {
    COP [E0]
}

code_078090 {
    LDY $04
    LDA $0014, Y
    SEC 
    SBC #$0080
    STA $06BE
    STA $06C0
    LDA $0016, Y
    SEC 
    SBC #$0080
    STA $06C2
    STA $06C4
    RTL 
}

code_0780AD {
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0780B6 )
    COP [E0]
}

widestring_0780B6 `[DEF][TPL:0][SFX:10][DLY:3]We [LU2:C1]to the Water[N]City, Watermia.[PAU:78][N]A [LU1:76][LU1:E2]with[N][LU2:77]built on rafts.[PAU:78][CLR]The [LU2:AE]have[N]kindly put us up at[N]the [LU2:70]of young Luke.[PAU:B4][PAL:0][CLD]`

widestring_078139 `[DEF][CLR][TPL:0][SFX:10][DLY:0]This is Luke's house.[N]He is a loveable[N]young fisherman.[FIN]I am [LU1:93]out on[N]a [LU1:A6]fishing voyage.[N]You can use my house[N][LU2:BF]I'm gone.[PAL:0][END]`