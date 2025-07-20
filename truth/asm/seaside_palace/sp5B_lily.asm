
!joypad_mask_std                065A

---------------------------------------------

h_sp5B_lily [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_sp5B_lily {
    COP [D0] ( #6F, #01, &code_068707 )
    COP [C1]
    COP [21] ( #02, &code_068696 )
    RTL 
}

code_068696 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #0F )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_068709 )
    COP [81] ( #28, #03 )
    COP [89]
    COP [80] ( #24 )
    COP [89]
    COP [BF] ( &widestring_068721 )
    COP [85] ( #28, #02, #12 )
    COP [8A]
    COP [80] ( #24 )
    COP [89]
    COP [BF] ( &widestring_068765 )
    COP [DA] ( #3B )
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #33, #08 )
    COP [8A]
    COP [BF] ( &widestring_06882D )
    COP [85] ( #33, #03, #02 )
    COP [8A]
    COP [BF] ( &widestring_06885B )
    COP [CC] ( #6F )
    LDA #$0000
    STA $0688
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_068707 {
    COP [E0]
}

widestring_068709 `[TPL:A][TPL:2]Lilly:[N]Waaah!![PAU:14][PAL:0][CLD]`

widestring_068721 `[TPL:A][TPL:2][LU1:2A]Hey... [N]You scared me!! [FIN]I practically had a [N]heart attack!! [END]`

widestring_068765 `[TPL:A][TPL:2][LU1:2A]I saw Erik in [N]the [LU1:BD]room, but [N]something's strange. [FIN]His [LU1:72]is half[N]transparent. I can[N]see [LU1:DC]it.[FIN]And he [LU1:CC]to be[N]unconscious, as if his[N]spirit is lost...[FIN][LU1:2B]stick together. [N]We [LU1:82][LU1:A4][LU1:F7][N][LU1:EF]happen.[PAL:0][END]`

widestring_06882D `[TPL:A][TPL:2][LU1:2A][N][LU1:1F]borrow Will's [N]pocket for a while.[PAL:0][END]`

widestring_06885B `[PAU:1E][TPL:9][TPL:2]Lilly:[N][LU1:63]let's go.[PAL:0][END]`