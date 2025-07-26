
?INCLUDE 'func_00C6E4'
?INCLUDE 'actor_00E256'

!joypad_mask_std                065A

---------------------------------------------

h_sc02_seth [
  h_actor < #33, #00, #10 >   ;00
]

---------------------------------------------

e_sc02_seth {
    COP [A0] ( @e_sc02_actor_04B051, #$00E8, #$00C0, #$0300 )
    COP [D0] ( #4C, #01, &code_04B55D )
    COP [B6] ( #30 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [D0] ( #20, #01, &code_04B583 )
    COP [D0] ( #16, #01, &code_04B551 )
    COP [C0] ( &code_04B58F )
    LDA #$0800
    TSB $10

  code_04B488:
    COP [80] ( #33 )
    COP [89]
    COP [D0] ( #03, #00, &code_04B488 )
    LDA #$0800
    TRB $10
    LDA #$0200
    TRB $12
    COP [DA] ( #1D )
    COP [80] ( #12 )
    COP [89]
    COP [D2] ( #03, #00 )
    COP [C0] ( &code_04B597 )
    COP [80] ( #14 )
    COP [89]
    COP [C1]
    COP [28] ( #$0078, #$0090, &code_04B4BD )
    RTL 
}

code_04B4BD {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0000
    JSL $@func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_04B652 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #05 )
    COP [C0] ( &code_04B5AC )
    LDY $06
    LDA $0014, Y
    STA $7F0010, X
    LDA $0016, Y
    STA $7F0012, X
    COP [C1]
    LDY $06
    LDA $0014, Y
    CMP $7F0010, X
    BNE code_04B504
    LDA $0016, Y
    CMP $7F0012, X
    BNE code_04B504
    RTL 
}

code_04B504 {
    COP [DA] ( #1F )
    COP [BF] ( &widestring_04B75D )
    COP [CC] ( #06 )
    COP [C8] ( &code_04B55F )
    COP [C0] ( &code_04B5B1 )
    COP [D2] ( #08, #01 )
    COP [C0] ( #$0000 )
    COP [C8] ( &code_04B55F )
    COP [D2] ( #09, #01 )
    COP [82] ( #16, #11 )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    COP [BF] ( &widestring_04B7DE )
    COP [CC] ( #0A )
    LDA #$0800
    TSB $10
    LDA #$0200
    TSB $12
    COP [82] ( #17, #12 )
    COP [89]
    COP [80] ( #14 )
    COP [89]
    COP [D2] ( #0B, #01 )
}

code_04B551 {
    COP [C0] ( &code_04B592 )
    COP [C1]
    COP [80] ( #33 )
    COP [89]
    RTL 
}

code_04B55D {
    COP [E0]
}

code_04B55F {
    COP [86] ( #14, #04, #04 )
    COP [8A]
    COP [86] ( #14, #04, #03 )
    COP [8A]
    COP [84] ( #14, #10 )
    COP [8A]
    COP [86] ( #14, #04, #04 )
    COP [8A]
    COP [86] ( #14, #04, #03 )
    COP [8A]
    COP [C5]
}

code_04B583 {
    COP [C0] ( &code_04B59C )
    COP [C1]
    COP [80] ( #33 )
    COP [89]
    RTL 
}

code_04B58F {
    COP [CC] ( #02 )
}

code_04B592 {
    COP [BF] ( &widestring_04B5B6 )
    RTL 
}

code_04B597 {
    COP [BF] ( &widestring_04B612 )
    RTL 
}

code_04B59C {
    COP [D0] ( #25, #01, &code_04B5A7 )
    COP [BF] ( &widestring_04B5B6 )
    RTL 
}

code_04B5A7 {
    COP [BF] ( &widestring_04B5ED )
    RTL 
}

code_04B5AC {
    COP [BF] ( &widestring_04B72B )
    RTL 
}

code_04B5B1 {
    COP [BF] ( &widestring_04B77C )
    RTL 
}

widestring_04B5B6 `[TPL:A][TPL:5]Seth:[N]Ah ha ha. I'm going[N]to win again for sure.[PAL:0][END]`

widestring_04B5ED `[TPL:A][TPL:5]Seth:[N]Why do I keep losing...?[PAL:0][END]`

widestring_04B612 `[TPL:A][TPL:5]Seth: I'm not[N]interested in girls. I[N][LU1:A5]adventures better.[PAL:0][END]`

widestring_04B652 `[TPL:A][TPL:5]Seth:[N]Everyone's here.[N][LU1:62][LU1:CA]we do today?[FIN][TPL:3]Erik: [N]I [LU1:F1]to see Will's[N]mysterious power.[FIN]You haven't [LU2:A7]it? [N]He can [LU1:B5][LU1:E0][N][LU1:F8]touching them.[FIN][TPL:4]Lance: He moved [N]the [LU1:C9]that's in the[N]corner of the cave.[FIN]Will. [N][LU2:37]me again.[PAL:0][END]`

widestring_04B72B `[TPL:A][TPL:5]Seth: [N]Face the [LU1:C9]and[N]push the L/R Buttons.[PAL:0][END]`

widestring_04B75D `[TPL:A][TPL:4]Lance: Oh![N]It moved!![PAL:0][PAU:28][CLD]`

widestring_04B77C `[TPL:A][TPL:5]Seth: No [LU1:B8]how[N][LU1:B6][LU2:AA]I see it,[N]I'm [LU1:D3]amazed.[FIN]But why can you [LU1:B5]the[N][LU1:C9][LU1:F6]you can't[N][LU1:B5][LU1:6C]else...?[PAL:0][END]`

widestring_04B7DE `[TPL:A][TPL:5]Seth: Yeah, it [LU1:B2]be[N][LU1:D0]kind of psychic[N][LU1:C2]thing.[FIN]If I [LU1:83][LU1:A4]better,[N]I'd [LU1:DA]it was magic.[FIN]Most [LU1:C1]have[N]five senses... [N]sight, [FIN]hearing, [FIN]taste, [FIN]smell, [FIN]and touch. [FIN]I [LU1:DA]Will's psychic[N][LU1:C2]is [LU1:D0]kind[N]of sixth sense.[PAL:0][END]`

---------------------------------------------

e_sc02_actor_04B051 {
    COP [0B]
    COP [A2] ( @e_actor_00E256, #$2300 )
    COP [C1]
    COP [80] ( #37 )
    COP [89]
    RTL 
}