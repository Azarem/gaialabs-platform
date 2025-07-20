?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_mu67_bomb [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_mu67_bomb {
    COP [A3] ( @code_06A69E, #$0080, #$00F0, #$2B00 )
    COP [0B]
    COP [0D] ( #01, #00 )
    COP [BC] ( #08, #00 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_06A4C9 )

  code_06A431:
    COP [80] ( #24 )
    COP [89]
    LDA $0AEC
    BNE code_06A431
    LDA $0AD4
    BEQ code_06A466
    LDY $player_actor
    LDA #$*func_08F37D
    STA $0002, Y
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_06A466
    RTL 
}

code_06A466 {
    COP [32] ( #46 )
    COP [33]
    COP [32] ( #47 )
    COP [33]
    COP [CD] ( #$0146 )
    COP [CD] ( #$0147 )

  code_06A478:
    COP [80] ( #24 )
    COP [89]
    COP [D0] ( #01, #00, &code_06A478 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [04] ( #1B )
    COP [DA] ( #77 )
    COP [08] ( #$2C2C )
    COP [C0] ( #$0000 )
    COP [DA] ( #3B )
    COP [CA] ( #3C )
    LDA #$2000
    TRB $10
    COP [C2]
    LDA #$2000
    TSB $10
    COP [CB]
    COP [BC] ( #F8, #00 )
    COP [0C]
    COP [0E] ( #01, #00 )
    COP [BF] ( &widestring_06A57F )
    COP [CC] ( #03 )
    COP [32] ( #93 )
    COP [33]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_06A4C9 {
    COP [BF] ( &widestring_06A4E9 )
    COP [BE] ( #02, #01, &code_list_06A4D3 )
}

code_list_06A4D3 [
  &code_06A4D9   ;00
  &code_06A4D9   ;01
  &code_06A4E1   ;02
]

code_06A4D9 {
    COP [BF] ( &widestring_06A54E )
    COP [CC] ( #01 )
    RTL 
}

code_06A4E1 {
    COP [BF] ( &widestring_06A566 )
    COP [CC] ( #01 )
    RTL 
}

widestring_06A4E9 `[TPL:E][TPL:0]There's a red wire and[N]a blue wire sticking[N]out of the bomb...[FIN]Cut which one?[N] Red one[N] Blue one`

widestring_06A54E `[CLR]The red wire is cut![PAL:0][END]`

widestring_06A566 `[CLR]The blue wire is cut![PAL:0][END]`

widestring_06A57F `[PAU:28][TPL:A][TPL:0]Will: The bomb [N]has [LU1:70]defused... [FIN][TPL:3]Erik: [N]Saved... [FIN][TPL:2][LU1:2C]speaks from[N]his pocket.[FIN][LU1:2A]Sorry, Will... [N]There was [LU1:B9][N]I [LU1:7A]do... [FIN]My legs gave out from[N]fear. I couldn't [LU1:B5]or[N][LU2:84]a sound.[FIN]Up to now I [LU1:D8]I[N]was strong, but in a[N]crisis...[FIN]..............[N][LU2:35]for staying in[N][LU1:FE]pocket for so long.[PAL:0][END]`

code_06A69E {
    COP [D2] ( #02, #01 )
    COP [B7] ( #02 )
    LDA #$0140
    STA $26
    LDA #$0000
    STA $7F0010, X

  code_06A6B1:
    COP [D0] ( #01, #01, &code_06A6F5 )
    COP [CA] ( #3C )
    LDA $26
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [D0] ( #01, #01, &code_06A6F5 )
    LDA $09EC
    BIT #$2000
    BEQ code_06A6D7
    LDA $26
    BRA code_06A6E9
}

code_06A6D7 {
    COP [07] ( #10 )
    SED 
    LDA $26
    SEC 
    SBC #$0001
    STA $26
    CLD 
    BPL code_06A6E9
    JMP $&code_06A6F7
}

code_06A6E9 {
    STA $0000
    JSL $@func_03BAF1
    COP [C4] ( @code_06A6B1 )
}

code_06A6F5 {
    COP [E0]
}

code_06A6F7 {
    LDA $0AEC
    BEQ code_06A712
    COP [0A] ( #7F )
    STZ $0688
    COP [08] ( #$1515 )
    SEP #$20
    LDA #$00
    STA $0ACE
    REP #$20
    COP [C1]
    RTL 
}

code_06A712 {
    COP [BF] ( &widestring_06A719 )
    COP [C1]
    RTL 
}

widestring_06A719 `[DEF][TPL:0]...........[FIN]It was a dud.[N]I'm saved...[PAL:0][END]`