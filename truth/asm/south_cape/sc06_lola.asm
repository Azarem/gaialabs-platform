?INCLUDE 'f_inventory_full'

!joypad_mask_std                065A
!APUIO1                         2141

---------------------------------------------

h_sc06_lola [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_sc06_lola {
    COP [D0] ( #21, #01, &code_0499B9 )
    COP [D0] ( #1C, #01, &code_049968 )
    COP [D0] ( #3E, #01, &code_04995B )
    COP [D0] ( #1B, #01, &code_049934 )
    COP [D0] ( #16, #01, &code_04988C )
    COP [C0] ( &code_0499BB )
    COP [0B]
    COP [C1]
    RTL 
}

code_04988C {
    COP [25] ( #07, #09 )
    COP [0B]
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_0499C0 )
    COP [D2] ( #03, #01 )
    COP [84] ( #0D, #1E )
    COP [8A]
    COP [BF] ( &widestring_049A3F )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [DA] ( #0B )
    COP [84] ( #0D, #10 )
    COP [8A]
    COP [84] ( #0A, #10 )
    COP [8A]
    COP [84] ( #0C, #10 )
    COP [8A]
    COP [84] ( #0A, #10 )
    COP [8A]
    COP [C0] ( #$0000 )
    COP [D2] ( #06, #01 )
    LDA #$0800
    TSB $10
    COP [DA] ( #3F )
    COP [0C]
    COP [82] ( #0E, #11 )
    COP [89]
    COP [85] ( #10, #04, #12 )
    COP [8A]
    COP [82] ( #0F, #12 )
    COP [89]
    COP [25] ( #03, #19 )
    COP [CA] ( #02 )
    COP [82] ( #0E, #11 )
    COP [89]
    COP [81] ( #11, #11 )
    COP [89]
    COP [CB]
    COP [80] ( #0D )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #1B, #01 )
    LDA #$1000
    TSB $12
    COP [85] ( #11, #03, #11 )
    COP [8A]
    COP [86] ( #0F, #02, #12 )
    COP [8A]
    COP [85] ( #11, #04, #11 )
    COP [8A]
    COP [86] ( #0E, #02, #11 )
    COP [8A]
}

code_049934 {
    COP [80] ( #0C )
    COP [89]
    COP [25] ( #0C, #1B )
    COP [0B]
    COP [C0] ( &code_0499C5 )
    COP [D2] ( #0B, #01 )
    COP [BF] ( &widestring_049B82 )
    COP [CC] ( #3E )
    LDA #$CFF0
    TRB $joypad_mask_std

  code_049954:
    COP [C0] ( &code_0499D3 )
    COP [C1]
    RTL 
}

code_04995B {
    COP [80] ( #0C )
    COP [89]
    COP [25] ( #0C, #1B )
    COP [0B]
    BRA code_049954
}

code_049968 {
    COP [25] ( #0C, #1B )
    COP [C0] ( &code_0499D8 )
    COP [0B]
    COP [80] ( #0C )
    COP [89]
    COP [D0] ( #35, #01, &code_0499B6 )
    COP [C1]
    COP [D6] ( #09, &code_049985 )
    RTL 
}

code_049985 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [CC] ( #35 )
    COP [04] ( #19 )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_049D29 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_0499AA
    RTL 
}

code_0499AA {
    COP [04] ( #1C )
    COP [DA] ( #59 )
    LDA #$FFF0
    TRB $joypad_mask_std
}

code_0499B6 {
    COP [C1]
    RTL 
}

code_0499B9 {
    COP [E0]
}

code_0499BB {
    COP [BF] ( &widestring_0499F1 )
    RTL 
}

code_0499C0 {
    COP [BF] ( &widestring_049ABB )
    RTL 
}

code_0499C5 {
    COP [BF] ( &widestring_049B18 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #0A )
    RTL 
}

code_0499D3 {
    COP [BF] ( &widestring_049B82+M )
    RTL 
}

code_0499D8 {
    COP [D0] ( #35, #01, &code_0499E8 )
    COP [BF] ( &widestring_049BE5 )
    COP [D4] ( #09, &code_0499ED )
    RTL 
}

code_0499E8 {
    COP [BF] ( &widestring_049D94 )
    RTL 
}

code_0499ED {
    JML $@f_inventory_full
}

widestring_0499F1 `[DEF][TPL:3][LU1:2E]Welcome home,[N]Will. Dinner isn't ready[N]yet. Go [LU1:BF]and[N]play for a while.[PAL:0][END]`

widestring_049A3F `[TPL:A][TPL:3][LU1:2E] Ah ha ha.[N]Oh, you!! Bringing up[N]a [LU1:E3][LU1:A5]that![FIN]Will, you [LU2:A8]be[N][LU2:A5]to [LU1:9B]that.[FIN]The [LU2:6C]who was singing[N][LU1:F0]me a minute ago...[PAL:0][END]`

widestring_049ABB `[TPL:B][TPL:3][LU1:2E]Welcome home,[N]Will. [LU1:61]I sing opera,[N]I [LU2:81]track of[N]the time...[FIN]Dinner's not ready yet.[PAL:0][END]`

widestring_049B18 `[TPL:A][TPL:3][LU1:2E][LU1:11]Castle...[N]There's a big viaduct[N][LU1:EA]the castle.[FIN][LU1:68]grandfather designed[N]it.[FIN][TPL:0]Will: [N]What! Really?[PAL:0][END]`

widestring_049B82 `[PAU:40][::][TPL:A][TPL:3]Lola:[N]Enough serious talk.[N][LU1:2B]eat dinner.[FIN][LU1:20][LU1:B3]a delicious[N]pie. [LU1:2B]sit at the[N]table upstairs.[PAL:0][END]`

widestring_049BE5 `[TPL:B][TPL:3][LU1:2E][N]Good morning, Will.[N]A [LU2:7F]has [LU1:79]for[N]you [LU1:8E][LU1:27]Edward.[FIN][PAL:0][DLG:3,6][SIZ:D,4]This is [LU1:F7]is written[N]in the letter.[FIN][TPL:B][TPL:4]Bring the [LU1:7]Ring[N][LU1:8E]Olman's things[N]to [LU1:11]Castle.[N]           [LU1:27]Edward[FIN][TPL:3][LU1:2E][LU1:20][LU1:70]in a[N]bad mood [LU2:5D][LU2:A4]I[N]saw [LU1:D6]letter.[FIN]Oh, Will. [LU1:1F]teach[N]you a spell. [LU1:61]I'm[N]upset, humming [LU1:D6]tune[N]makes me [LU1:91]better.[FIN]Lola hummed a strange[N]melody.[PAL:0][END]`

widestring_049D29 `[TPL:A][TPL:0][SFX:0][DLY:5]That's pretty.[N][PAU:78][CLR][LU1:12]though Will had[N][LU1:BB][LU1:99]it before,[N]it [LU2:A0]oddly familiar.[PAU:F0][CLR][PAL:0][LU1:67]learned[N][LU1:2D]melody![PAU:FF][CLD]`

widestring_049D94 `[TPL:B][TPL:3]Lola:[N]Be careful.[PAL:0][END]`