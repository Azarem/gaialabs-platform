
!joypad_mask_std                065A

---------------------------------------------

h_nvAE_kara [
  h_actor < #0B, #00, #30 >   ;00
]

---------------------------------------------

e_nvAE_kara {
    COP [D0] ( #B6, #01, &code_08956C )
    COP [D0] ( #CF, #01, &code_08956E )
    COP [D2] ( #BF, #01 )
    COP [D2] ( #C0, #01 )
    COP [D2] ( #C1, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    LDA #$2000
    TRB $10
    COP [86] ( #0F, #03, #02 )
    COP [8A]
    COP [80] ( #0B )
    COP [89]
    COP [0B]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_0895C9 )
    COP [CC] ( #CF )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_089585 )
    COP [C1]
    RTL 
}

code_08956C {
    COP [E0]
}

code_08956E {
    LDA #$2000
    TRB $10
    COP [25] ( #07, #0A )
    COP [80] ( #0B )
    COP [89]
    COP [0B]
    COP [C0] ( &code_089585 )
    COP [C1]
    RTL 
}

code_089585 {
    COP [BF] ( &widestring_08963C )
    COP [BE] ( #02, #02, &code_list_08958F )
}

code_list_08958F [
  &code_089595   ;00
  &code_08959A   ;01
  &code_089595   ;02
]

code_089595 {
    COP [BF] ( &widestring_0896F9 )
    RTL 
}

code_08959A {
    COP [BF] ( &widestring_08971E )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0004
    STA $0D64
    LDA #$0404
    STA $064A
    COP [65] ( #$0124, #$01A4, #00, #1D )
    COP [26] ( #C4, #$0078, #$00A0, #00, #$1100 )
    RTL 
}

widestring_0895C9 `[DEF][TPL:1]Kara:[N]I [LU2:BB]sign language to[N][LU2:AC]to the villagers.[FIN]The [LU2:46]have[N][LU2:96]to the forest.[N]They no longer prey[N]on each other.[PAL:0][END]`

widestring_08963C `[DEF][TPL:1]Labor traders [LU1:80][N][LU1:8E]a [LU1:E2]in [N]the northwest. They [N]took [LU1:B6]villagers. [FIN]I [LU1:78]believe [LU2:AB][N][LU1:F3][LU1:E7]advantage [N]of [LU1:C1]stricken [N][LU1:F0]famine! [FIN]Travel to the [LU1:AD][N]trader's village? [N] [LU1:6A]let's go! [N] [LU2:42]a while. `

widestring_0896F9 `[CLR][TPL:1]Then [LU2:84]preparations[N]and [LU1:79]back.[PAL:0][END]`

widestring_08971E `[CLR][TPL:1][LU1:2B]get going![PAL:0][END]`