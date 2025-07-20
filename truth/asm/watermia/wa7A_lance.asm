
!joypad_mask_std                065A

---------------------------------------------

h_wa7A_lance [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_wa7A_lance {
    COP [D0] ( #90, #01, &code_07AB69 )
    COP [C0] ( &code_07AB6B )
    COP [0B]
    COP [D2] ( #02, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [04] ( #1B )
    STZ $0688
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07AB82 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_07AB6F )
    COP [D2] ( #90, #01 )
    COP [C1]
    COP [45] ( #07, #07, #08, #0A, &code_07AB34 )
    RTL 
}

code_07AB34 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [81] ( #18, #02 )
    COP [89]
    COP [82] ( #17, #02 )
    COP [89]
    COP [80] ( #14 )
    COP [89]
    COP [BF] ( &widestring_07AC08 )
    COP [81] ( #18, #02 )
    COP [89]
    COP [82] ( #16, #13 )
    COP [89]
    COP [82] ( #17, #11 )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07AB69 {
    COP [E0]
}

code_07AB6B {
    COP [CC] ( #02 )
    RTL 
}

code_07AB6F {
    COP [D0] ( #01, #01, &code_07AB7A )
    COP [BF] ( &widestring_07AB82 )
    RTL 
}

code_07AB7A {
    COP [BF] ( &widestring_07ABC4 )
    COP [CC] ( #90 )
    RTL 
}

widestring_07AB82 `[TPL:A][TPL:4][SFX:1C]Lance: Will, do you [N]recognize [LU1:D6]person? [FIN]He's my father.[PAL:0][END]`

widestring_07ABC4 `[TPL:A][TPL:4][SFX:1C]Lance: He [LU1:CC]to [LU1:98][N][LU2:7A]his memory.[FIN]I [LU2:66]met my[N][LU2:7A]father, but...[PAL:0][END]`

widestring_07AC08 `[TPL:A][TPL:4][SFX:1C]Lance: [N]Will, wait. [N][LU1:1F]go, too. [FIN]I'm preparing Lilly's[N][LU2:4C]party. I want[N]to finish by dark.[FIN][LU1:2B]go to our room.[PAL:0][END]`