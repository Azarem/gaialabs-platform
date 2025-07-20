
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_eu91_intro [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_eu91_intro {
    COP [D0] ( #A5, #01, &code_07BEB2 )
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
    COP [A5] ( @code_07BED1, #00, #00, #$2000 )
    COP [9C] ( @code_07BEB4, #$2800 )
    COP [DA] ( #27 )
    COP [85] ( #08, #10, #02 )
    COP [8A]
    COP [86] ( #07, #1E, #02 )
    COP [8A]
    LDY $player_actor
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    COP [CC] ( #A5 )
    LDA #$0800
    TRB $10
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07C011 )
    COP [DA] ( #3B )
    LDA #$0404
    STA $064A
    COP [26] ( #96, #$00A0, #$0090, #03, #$1100 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_07BEB2 {
    COP [E0]
}

code_07BEB4 {
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

code_07BED1 {
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07BEDA )
    COP [E0]
}

widestring_07BEDA `[DEF][TPL:0][SFX:10][DLY:2]We crossed the desert[N]and [LU2:66]arrived in[N]the [LU1:EC]of Euro.[PAU:78][CLR]Euro was a bustling[N]city, larger than[N]I had imagined.[PAU:B4][CLR][LU1:37]parents lived [N]there, and ran a [N][LU1:7C][LU2:54]Rolek.[PAU:78][CLR][LU2:23]hadn't [LU1:70][LU1:D9][N]for three years.[N]His parents welcomed[N]him home.[PAU:78][CLR]They set off fireworks. [N]There [LU1:F2]dancers. [N]It [LU2:80][LU1:A5]a [N]festival had started.[PAU:B4][PAL:0][CLD]`

widestring_07C011 `[DEF][TPL:0][SFX:10][DLY:2]This is the [LU2:70][N][LU1:F4][LU1:37]parents [N]live. We [LU1:F2]shown [N]to the guest room.[PAL:0][END]`