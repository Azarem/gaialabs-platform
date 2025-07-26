
?INCLUDE 'nv_actor_0881A5'

!joypad_mask_std                065A
!camera_bounds_y                06DC
!player_actor                   09AA

---------------------------------------------

h_nvAC_kara [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_nvAC_kara {
    LDA #$0220
    STA $camera_bounds_y
    COP [D0] ( #B6, #01, &code_0880D4 )
    COP [D0] ( #CF, #01, &code_0880D4 )
    COP [D0] ( #B2, #01, &code_0881BE )
    COP [D0] ( #AF, #01, &code_088152 )
    COP [D0] ( #B0, #01, &code_0880D6 )
    COP [D0] ( #AD, #01, &code_0880D4 )
    COP [D0] ( #AC, #01, &code_0880B8 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0881E2 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #AC )
    COP [CC] ( #01 )
    COP [87] ( #10, #08, #02, #14 )
    COP [8A]
    COP [81] ( #10, #02 )
    COP [89]
    COP [86] ( #0F, #06, #02 )
    COP [8A]
}

code_0880B8 {
    COP [25] ( #0B, #0E )
    COP [80] ( #0B )
    COP [89]
    COP [0B]
    COP [C0] ( &code_0881D0 )
    COP [D2] ( #AD, #01 )
    COP [0C]
    COP [86] ( #0F, #03, #02 )
    COP [8A]
}

code_0880D4 {
    COP [E0]
}

code_0880D6 {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [DA] ( #03 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_0882C7 )
    COP [DA] ( #3B )
    COP [A0] ( @code_088A60, #$0158, #$0040, #$1000 )
    COP [A0] ( @code_088A90, #$0018, #$00C0, #$1000 )
    COP [A0] ( @code_088AAF, #$00B8, #$0180, #$1000 )
    COP [D2] ( #01, #01 )
    COP [BF] ( &widestring_08830F )
    COP [CA] ( #02 )
    COP [DA] ( #27 )
    COP [08] ( #$0505 )
    COP [CB]
    COP [DA] ( #27 )
    COP [CA] ( #04 )
    COP [08] ( #$0505 )
    COP [DA] ( #18 )
    COP [CB]
    LDA #$0404
    STA $064A
    COP [26] ( #AC, #$0080, #$00F0, #03, #$2200 )
    COP [CC] ( #AF )
    COP [C1]
    RTL 
}

code_088152 {
    COP [A0] ( @e_nv_actor_0881A5, #$0088, #$00FE, #$1002 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [25] ( #06, #10 )
    COP [80] ( #2E )
    COP [89]
    COP [0B]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_08839D )
    COP [CC] ( #01 )
    COP [D2] ( #02, #01 )
    COP [BF] ( &widestring_0887C6 )
    COP [CE] ( #02 )
    COP [D2] ( #03, #01 )
    COP [BF] ( &widestring_088811 )
    COP [CE] ( #03 )
    COP [D2] ( #05, #01 )
    COP [9C] ( @code_0881AE, #$1002 )
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_0881DD )
    COP [C1]
    RTL 
}

---------------------------------------------

code_0881BE {
    COP [25] ( #12, #0C )
    COP [80] ( #0C )
    COP [89]
    COP [0B]
    COP [C0] ( &code_0881D8 )
    COP [C1]
    RTL 
}

code_0881D0 {
    COP [BF] ( &widestring_08826B )
    COP [CC] ( #AD )
    RTL 
}

code_0881D8 {
    COP [BF] ( &widestring_0884A4 )
    RTL 
}

code_0881DD {
    COP [BF] ( &widestring_0884FB )
    RTL 
}

widestring_0881E2 `[TPL:A][TPL:1][LU1:25][N][LU1:1D]as hot as [N]the tropics... [FIN][TPL:3]Erik: [N]I see the [LU1:F5]tilted, [N]my [LU2:60]blurred... [FIN][TPL:0]Will: There's [LU1:B9]we [N]can do. [LU1:2B]stay in [N][LU1:D6][LU1:EC]today.[PAL:0][END]`

widestring_08826B `[TPL:A][TPL:1][LU1:25]Strange. Not a [N]soul here, and skeletons[N][LU2:9F]around... [FIN]Should we go into[N]the houses?[PAL:0][END]`

widestring_0882C7 `[TPL:E][TPL:0]Exhausted [LU1:8E]the[N]trip, [LU2:AB]fall into[N]a deep sleep...[FIN]A [LU1:A6][LU1:DF]passes...[PAL:0][END]`

widestring_08830F `[TPL:E][TPL:0][DLY:2]Will:[N]What... Hamlet... Let me[N]sleep a [LU2:BF]longer...[FIN][TPL:1][DLY:1][LU1:25]Uhhn.... [N]What? Will... [LU1:D][N]be so noisy...[FIN][CLD][PAU:3C][TPL:E][TPL:1][DLY:0][LU1:25]AH! [N]Who! Who are you?![PAL:0][END]`

widestring_08839D `[TPL:A][TPL:0][SFX:0]They [LU2:9E]to be [N][LU1:ED]hungry... [FIN][TPL:1][SFX:10][LU1:25]Look. Those [N][LU1:7D][LU1:A9]so upset... [FIN][TPL:0]Will: That's right... [N]The servant boy [LU1:D4][N][LU1:D7]in Freejia. [FIN]There's so much famine [N]in [LU1:D6]country... [FIN][TPL:1][LU1:25]Those bones are the[N]bodies of [LU1:C1]who've [N]starved to death. [FIN][TPL:3]Erik: [N]Oh, no! [LU2:3E]be next!![PAL:0][END]`

widestring_0884A4 `[TPL:E][TPL:1][LU1:25]I learned a [N]word [LU1:8E]the children. [FIN]It [LU1:CC][LU1:D7](Ramapoe)[N]means (Hello)[N]in [LU1:D6]region.[PAL:0][END]`

widestring_0884FB `[TPL:F][TPL:1][LU1:25][N]He [LU1:A3]jumped [LU1:A1][N]the fire... [FIN]Hamlet, noble pig... [N]I [LU1:EF]miss you...[PAL:0][END]`

---------------------------------------------

widestring_0887C6 `[TPL:A][TPL:1][DLY:2][LU1:25]Hamlet... [N]Why [LU1:CE]a sad look? [FIN][LU1:1D]as if we [LU1:EF]soon [N]be separated...[PAL:0][END]`

widestring_088811 `[TPL:A][TPL:1][LU1:25][N]A-a-a-a-a-a!!!!! [FIN][DLY:0]Hamlet!! Hamlet!! [FIN][TPL:0][DLY:1]Will: [N]Hamlet... Why? [PAL:0][END]`

---------------------------------------------

code_088A60 {
    COP [85] ( #20, #02, #02 )
    COP [8A]
    COP [86] ( #1E, #04, #01 )
    COP [8A]
    COP [85] ( #20, #02, #02 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [DA] ( #3B )
    COP [85] ( #20, #02, #12 )
    COP [8A]
    COP [86] ( #1F, #05, #12 )
    COP [8A]
    COP [CC] ( #01 )
    COP [E0]
}

code_088A90 {
    COP [85] ( #21, #04, #01 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [DA] ( #4F )
    COP [85] ( #21, #02, #11 )
    COP [8A]
    COP [86] ( #1F, #05, #12 )
    COP [8A]
    COP [E0]
}

code_088AAF {
    COP [86] ( #1F, #06, #02 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [DA] ( #27 )
    COP [86] ( #1F, #05, #12 )
    COP [8A]
    COP [E0]
}