?BANK 05

!joypad_mask_std                065A
!W12SEL                         2123
!WOBJSEL                        2125

---------------------------------------------

h_gs2A_shira [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_gs2A_shira {
    COP [9C] ( @code_059637, #$3800 )
    LDA #$0040
    STA $00F6
    STA $00FA
    LDA #$0120
    STA $00FE
    SEP #$20
    LDA #$33
    STA $W12SEL
    LDA #$03
    STA $WOBJSEL
    REP #$20
    COP [C0] ( &code_059484 )
    COP [0B]
    COP [C1]
    RTL 
}

code_059484 {
    COP [CC] ( #0E )
    COP [BF] ( &widestring_0594B8 )
    COP [BE] ( #02, #01, &code_list_059491 )
}

code_list_059491 [
  &code_059497   ;00
  &code_059497   ;01
  &code_05949D   ;02
]

code_059497 {
    COP [BF] ( &widestring_0595B4 )
    BRA code_0594A1
}

code_05949D {
    COP [BF] ( &widestring_0595E6 )
}

code_0594A1 {
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #2D, #$00B0, #$0050, #03, #$1300 )
    RTL 
}

widestring_0594B8 `[PAU:50][TPL:A][TPL:0]Will: [N]Mother?! [FIN][TPL:2]Will's Mother, Shira: [N]Look in the sky. The [N][LU1:7B]is so beautiful. [FIN]After [LU2:C6]and years[N]the [LU1:7B]approaches[N]Earth, [LU2:B6]recedes.[FIN]Some say [LU1:9F]an [N]unlucky star. Some [N]say [LU1:9F]a lucky star... [FIN]Will. [LU1:62]do you think? [N] Unlucky star [N] Lucky star `

widestring_0595B4 `[CLR]All right...[N]Then [LU2:71][LU1:D7]the bad[N]luck [LU1:84]come....[FIN][JMP:&widestring_0595E6+M]`

widestring_0595E6 `[CLR]All right...[N]Then [LU2:71][LU1:D7]happiness[N][LU1:84]slip away....[FIN][::]Will. I am [LU2:44][N]watching [LU1:BE]you.[PAL:0][END]`

code_059637 {
    LDA #$7000
    TSB $joypad_mask_std
    RTL 
}