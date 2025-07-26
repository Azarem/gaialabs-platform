
?INCLUDE 'func_00C806'

!joypad_mask_std                065A

---------------------------------------------

h_btE3_kara [
  h_actor < #1C, #00, #03 >   ;00
]

---------------------------------------------

e_btE3_kara {
    COP [D0] ( #D4, #01, &btE3_kara_destroy )
    COP [28] ( #$0080, #$01A0, &code_098529 )
    JMP $&btE3_kara_destroy
}

code_098529 {
    COP [BC] ( #08, #00 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [81] ( #20, #12 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [BF] ( &widestring_098577 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [9C] ( @func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0004
    STA $7F0010, X
    LDA #$001A
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    LDA #$1000
    TRB $10
    LDA #$0B00
    TSB $10
    COP [CC] ( #D4 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

widestring_098577 `[TPL:A][TPL:0]Will: [N]Kara! [N][LU1:65]did you go?! [FIN][TPL:1][LU1:25]There was [LU2:AC][N][LU1:D7]the [LU2:BE][N][LU2:C4]had come... [FIN]They say [LU1:D7]her [LU1:72][N]is eternal... [FIN]They say [LU1:D7]once the[N][LU1:7B]is gone,[FIN]she'll be able to[N][LU2:9C]in peace.[END]`

---------------------------------------------

btE3_kara_destroy {
    COP [E0]
}