?INCLUDE 'hidden_red_jewel'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_wa79_lance [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_wa79_lance {
    COP [D0] ( #97, #01, &code_07ACEC )
    COP [D0] ( #96, #01, &code_07ACD6 )
    COP [D0] ( #91, #01, &code_07ACD4 )
    COP [D0] ( #90, #00, &code_07ACD4 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC #$0002
    STA $0016, Y
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07AD31 )
    COP [CC] ( #01 )
    COP [D2] ( #03, #01 )
    COP [DA] ( #27 )
    COP [BF] ( &widestring_07AD63 )
    COP [81] ( #09, #11 )
    COP [89]
    COP [82] ( #06, #13 )
    COP [89]
    COP [82] ( #07, #11 )
    COP [89]
    COP [CC] ( #04 )
}

code_07ACD4 {
    COP [E0]
}

code_07ACD6 {
    COP [25] ( #07, #09 )
    COP [80] ( #02 )
    COP [89]
    COP [C0] ( &code_07AD02 )
    COP [0B]
    COP [BC] ( #00, #F8 )
    COP [C1]
    RTL 
}

code_07ACEC {
    COP [25] ( #07, #09 )
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [BC] ( #00, #F8 )
    COP [C0] ( &code_07AD07 )
    COP [C1]
    RTL 
}

code_07AD02 {
    COP [BF] ( &widestring_07ADA9 )
    RTL 
}

code_07AD07 {
    COP [D0] ( #A5, #01, &code_07AD15 )
    COP [BF] ( &widestring_07ADEA )
    COP [CC] ( #01 )
    RTL 
}

code_07AD15 {
    COP [D0] ( #E2, #01, &code_07AD2C )
    COP [BF] ( &widestring_07AEDE )
    COP [D4] ( #01, &code_07AD28 )
    COP [CC] ( #E2 )
    RTL 
}

code_07AD28 {
    JML $@code_00C6A1
}

code_07AD2C {
    COP [BF] ( &widestring_07AFA7 )
    RTL 
}

widestring_07AD31 `[TPL:A][TPL:4]Lance: [LU1:2B][LU1:98][LU2:18][N][LU2:4C]party [LU2:BF][N]we're all together. [END]`

widestring_07AD63 `[TPL:A][TPL:4]Lance: Ah, Lilly. [N]Can I [LU2:AC]to you [N]for a minute? [FIN][LU1:1F]wait outside.[END]`

widestring_07ADA9 `[TPL:A][TPL:4]Lance: I [LU1:B3]my [LU2:67][N][LU1:ED]happy before. [FIN]I [LU1:DA]he [LU1:EF]slowly[N]recover.[PAL:0][END]`

widestring_07ADEA `[TPL:B][TPL:4]Lance: I'm sorry, but [N]I [LU1:F1]to stay [LU2:74][N]I [LU1:78]neglect [N]my father. [FIN]And so...[N][PAU:78]I [LU1:91]a [LU1:A7]awkward.[FIN]I [LU1:FC]to spend[N][LU1:DF][LU1:F0]Lilly.[FIN]Of course, I [LU1:82][LU1:91][N][LU1:94][LU1:6B]it. I [LU1:FC][N]to go on [LU1:F0]everyone. [FIN]And I [LU1:FC]to[N]stay [LU1:F0]Lilly.[FIN][LU1:20]enjoyed the[N]journey. I hope[N][LU1:FF]successful.[PAL:0][END]`

widestring_07AEDE `[TPL:B][TPL:4]Lance: [N]My [LU1:92]getting [N][LU2:50]every day. [FIN]Now we can talk.[N]I [LU2:71]you get to[N]see [LU1:FE][LU2:67]soon.[FIN]Right. I believe you[N][LU1:98][LU1:70]collecting[N]Red Jewels.[FIN]I [LU1:8F]a Red Jewel in[N]my [LU1:92]possessions.[N][LU1:3B][LU1:E7]it.[FIN][PAL:0]Will [LU2:6D]a Red Jewel![END]`

widestring_07AFA7 `[TPL:B][TPL:4]I [LU2:71]you get to[N]see [LU1:FE][LU2:67]soon.[PAL:0][END]`