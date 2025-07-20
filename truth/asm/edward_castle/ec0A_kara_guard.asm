
!joypad_mask_std                065A
!player_speed_ew                09B2

---------------------------------------------

h_ec0A_kara_guard [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_kara_guard {
    COP [B6] ( #30 )
    COP [D0] ( #21, #01, &code_04C9CC )
    COP [D0] ( #19, #01, &code_04C991 )
    COP [D0] ( #1A, #01, &code_04C991 )
    COP [0B]
    COP [0D] ( #00, #FF )
    COP [0D] ( #00, #01 )
    COP [C0] ( &code_04C9D7 )
    COP [D2] ( #01, #01 )
    COP [C0] ( #$0000 )
    COP [D2] ( #02, #01 )
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CA41 )
    COP [0C]
    COP [0E] ( #00, #01 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04C991 {
    COP [C0] ( &code_04C9E5 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [D2] ( #03, #01 )
    COP [82] ( #1E, #11 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [BF] ( &widestring_04CB20 )
    COP [CE] ( #03 )
    COP [D2] ( #19, #01 )

  code_04C9BC:
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_04C9CC {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04CA08 )
    BRA code_04C9BC
}

code_04C9D7 {
    COP [BF] ( &widestring_04CA0D )
    COP [CC] ( #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    RTL 
}

code_04C9E5 {
    COP [D0] ( #19, #01, &code_04C9F0 )
    COP [BF] ( &widestring_04CAE1 )
    RTL 
}

code_04C9F0 {
    COP [BF] ( &widestring_04CAF5 )
    COP [0C]
    LDA #$0008
    STA $player_speed_ew
    LDA $0656
    ORA #$0100
    STA $0656
    COP [0B]
    RTL 
}

code_04CA08 {
    COP [BF] ( &widestring_04CB3F )
    RTL 
}

widestring_04CA0D `[TPL:A][LU1:45]This is the[N]Princess's room.[N]Strangers [LU1:78]enter.[END]`

widestring_04CA41 `[TPL:A]Soldier:[N]This is [LU1:A3]a shabby boy.[FIN][TPL:0]Will: [N][LU1:1D]me, Kara.[FIN][TPL:1][LU1:25][N]Oh...That voice...[FIN]Let him in, or I'll[N][LU2:AD][LU1:89]your[N]old nickname.[FIN][PAL:0][SFX:10]Soldier:[N]Oh, pardon me![N][LU1:3B]enter![END]`

widestring_04CAE1 `[TPL:8]I'm at a loss... [END]`

widestring_04CAF5 `[TPL:9][LU1:68]business is[N]finished. Get out![FIN]Now![PAU:A][CLD]`

widestring_04CB20 `[TPL:9]Soldier:[N]Princess, let's go.[END]`

widestring_04CB3F `[TPL:9]Soldier:[N]Zzzzz...Zzzzz..[END]`