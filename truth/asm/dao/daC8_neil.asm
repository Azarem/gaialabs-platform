
!joypad_mask_std                065A

---------------------------------------------

h_daC8_neil [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_daC8_neil {
    COP [D0] ( #D2, #01, &code_08A5ED )
    COP [0B]
    COP [C0] ( &code_08A5EF )
    COP [D0] ( #B4, #01, &code_08A5EA )
    COP [CC] ( #B4 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #0F )
    COP [0C]
    COP [82] ( #16, #01 )
    COP [89]
    COP [0B]
    COP [C1]
    COP [8B]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_08A61D )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_08A5EA {
    COP [C1]
    RTL 
}

code_08A5ED {
    COP [E0]
}

code_08A5EF {
    COP [D0] ( #D0, #01, &code_08A5FA )
    COP [BF] ( &widestring_08A700 )
    RTL 
}

code_08A5FA {
    COP [BF] ( &widestring_08A73C )
    LDA #$000B
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$0094, #$0114, #00, #21 )
    COP [26] ( #DC, #$0000, #$0000, #00, #$1100 )
    RTL 
}

widestring_08A61D `[TPL:B][TPL:6][LU1:36]Will!! I [LU1:BB][N][LU1:D8]I'd [LU2:87]you [N]in a [LU2:90][LU1:A5]this! [FIN][TPL:0]Neil! [LU1:67][LU1:71][N]the [LU1:7C]president?! [FIN][TPL:6][LU1:36]Yes. I [N][LU1:DD]replacing the [N][LU1:AD]trade [LU1:F0][N]pepper imports. [FIN]This led me all [N]the way to Dao. [FIN]There's a pyramid near [N][LU2:74]I [LU1:F9]if a [N]Mystic [LU1:48]is there?[PAL:0][END]`

widestring_08A700 `[TPL:B][TPL:6]I [LU1:80]to Dao to replace [N]the [LU1:AD]trade [LU1:F0][N]pepper imports.[PAL:0][END]`

widestring_08A73C `[TPL:B][TPL:6][LU1:36][N]Really.... [N]Do you [LU1:98]to go? [FIN][LU1:39]you [LU2:84]up your[N]mind to do something[N][LU1:B9]can stop you.[FIN]OK. [LU1:1F][LU1:E7]Will to the [N]Tower of Babel, [LU2:B6][N][LU1:E7][LU1:26]and Erik [N]to [LU1:47]Cape. [FIN]This [LU1:DF]the airplane[N][LU1:FA]crash![PAL:0][END]`