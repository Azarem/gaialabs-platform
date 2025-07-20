
!joypad_mask_std                065A

---------------------------------------------

h_gs2E_crew2 [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_gs2E_crew2 {
    COP [0B]
    COP [C0] ( &code_05893B )
    COP [C1]
    COP [D6] ( #38, &code_0588F6 )
    RTL 
}

code_0588F6 {
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA #$1000
    TRB $10
    COP [DA] ( #01 )
    COP [D5] ( #38 )
    COP [0A] ( #7F )
    LDA #$0000
    STA $0AAC
    LDA #$002E
    STA $0B12
    LDA #$0025
    STA $0B08
    STA $0B0A
    LDA #$001A
    STA $0B0C
    STA $0B0E
    LDA #$2310
    STA $0B10
    COP [26] ( #FD, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

code_05893B {
    COP [BF] ( &widestring_058940 )
    RTL 
}

widestring_058940 `[TPL:A]The Mystic [LU1:48]is [N]in [LU1:D6]box. [FIN]Preparations are being[N][LU1:B3]to set sail.[FIN]Well? Are you [LU1:93]to [N]the crow's nest? You can[N]watch the ship set sail.[END]`