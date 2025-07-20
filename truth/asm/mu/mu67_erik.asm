
!joypad_mask_std                065A

---------------------------------------------

h_mu67_erik [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_mu67_erik {
    LDA $0AD4
    BEQ code_06A2CB
    LDA #$FFFF
    STA $24
}

code_06A2CB {
    COP [0B]
    COP [0D] ( #01, #00 )
    COP [BC] ( #08, #00 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_06A34F )
    COP [D0] ( #86, #01, &code_06A305 )
    COP [C1]
    COP [45] ( #01, #13, #0F, #15, &code_06A2EF )
    RTL 
}

code_06A2EF {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #17 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06A36B )
    COP [CC] ( #86 )
}

code_06A305 {
    COP [D2] ( #04, #01 )
    LDA #$2000
    TSB $10
    COP [D2] ( #88, #01 )
    COP [80] ( #0A )
    COP [89]
    LDA #$2000
    TRB $10
    COP [D2] ( #06, #01 )
    LDA #$0800
    TSB $10
    COP [86] ( #0E, #02, #01 )
    COP [8A]
    COP [81] ( #11, #13 )
    COP [89]
    COP [85] ( #11, #03, #01 )
    COP [8A]
    COP [86] ( #0E, #04, #01 )
    COP [8A]
    COP [85] ( #10, #02, #02 )
    COP [8A]
    COP [80] ( #0B )
    COP [89]
    COP [C1]
    RTL 
}

code_06A34F {
    COP [D0] ( #01, #01, &code_06A35A )
    COP [BF] ( &widestring_06A38D )
    RTL 
}

code_06A35A {
    LDA $24
    CMP #$FFFF
    BEQ code_06A366
    COP [BF] ( &widestring_06A3E6 )
    RTL 
}

code_06A366 {
    COP [BF] ( &widestring_06A3B8 )
    RTL 
}

widestring_06A36B `[DEF][TPL:3]Erik: [N]Heeeeelp!! [N][LU1:4D][LU1:D1]me! ![PAL:0][END]`

widestring_06A38D `[DEF][TPL:3]First, defuse the bomb![N]Hurry! Hurry![PAL:0][END]`

widestring_06A3B8 `[DEF][TPL:3]Erik: [N][LU1:D][LU2:AD]anyone [LU1:D7][N]Will's in disguise.[PAL:0][END]`

widestring_06A3E6 `[DEF][TPL:3]Erik: [N][LU1:39]again Will has [N]saved me...[PAL:0][END]`