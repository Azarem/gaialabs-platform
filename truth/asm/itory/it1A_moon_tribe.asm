?INCLUDE 'thinker_00B7FE'


---------------------------------------------

h_it1A_moon_tribe1 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1A_moon_tribe1 {
    LDA #$0200
    TSB $12
    COP [D0] ( #2A, #01, &code_09D137 )
    PHX 
    LDX #$00E0
    LDA #$0000

  code_09D10A:
    STA $7F0B00, X
    INX 
    INX 
    CPX #$0100
    BNE code_09D10A
    PLX 
    COP [C1]
    COP [21] ( #02, &code_09D11E )
    RTL 
}

code_09D11E {
    COP [BF] ( &widestring_09D1FC )
    COP [BE] ( #03, #01, &code_list_09D128 )
}

code_list_09D128 [
  &code_09D130   ;00
  &code_09D130   ;01
  &code_09D130   ;02
  &code_09D130   ;03
]

code_09D130 {
    COP [BF] ( &widestring_09D2D0 )
    COP [DA] ( #27 )
}

code_09D137 {
    LDA #$2000
    TRB $10
    COP [CC] ( #2A )
    COP [3C] ( @e_thinker_00B7FE )
    COP [0B]
    COP [C0] ( &code_09D1D3 )
    COP [C1]
    COP [82] ( #27, #3B )
    COP [89]
    RTL 
}

---------------------------------------------

h_it1A_moon_tribe2 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1A_moon_tribe2 {
    COP [D2] ( #2A, #01 )
    LDA #$2000
    TRB $10
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_09D1D8 )
    COP [C1]
    COP [82] ( #27, #3B )
    COP [89]
    RTL 
}

---------------------------------------------

h_it1A_moon_tribe3 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1A_moon_tribe3 {
    COP [D2] ( #2A, #01 )
    LDA #$2000
    TRB $10
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_09D1DD )
    COP [C1]
    COP [82] ( #27, #3B )
    COP [89]
    RTL 
}

---------------------------------------------

h_it1A_moon_tribe4 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1A_moon_tribe4 {
    COP [D2] ( #2A, #01 )
    LDA #$2000
    TRB $10
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_09D1F2 )
    COP [C1]
    COP [82] ( #27, #3B )
    COP [89]
    RTL 
}

---------------------------------------------

h_it1A_moon_tribe5 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1A_moon_tribe5 {
    COP [D2] ( #2A, #01 )
    LDA #$2000
    TRB $10
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_09D1F7 )
    COP [C1]
    COP [82] ( #27, #3B )
    COP [89]
    RTL 
}

code_09D1D3 {
    COP [BF] ( &widestring_09D30F )
    RTL 
}

code_09D1D8 {
    COP [BF] ( &widestring_09D388 )
    RTL 
}

code_09D1DD {
    COP [BF] ( &widestring_09D462 )
    COP [BE] ( #02, #01, &code_list_09D1E7 )
}

code_list_09D1E7 [
  &code_09D1ED   ;00
  &code_09D1ED   ;01
  &code_09D1ED   ;02
]

code_09D1ED {
    COP [BF] ( &widestring_09D4AD )
    RTL 
}

code_09D1F2 {
    COP [BF] ( &widestring_09D4DC )
    RTL 
}

code_09D1F7 {
    COP [BF] ( &widestring_09D574 )
    RTL 
}

widestring_09D1FC `[DEF][LU1:46]Voice:[N]Good evening....[N]Out for a stroll?[FIN][TPL:0]Will: [N]Who is it? [FIN][PAL:0][LU1:46]Voice:[N]Up, up. This body[N]is lighter [LU2:B5]air.[FIN][PAL:4]Will: [N][LU1:62]are you? [FIN][PAL:0][LU1:46]Voice: Guess who? [N] Cotton candy's relative[N] Bird man[N] Old man's ghost...`

widestring_09D2D0 `[CLR][LU1:46]Voice: Wrong![N][LU2:1]we are the [N][LU1:31]Tribe, [LU2:48][N]known as "Shadows.ˮ[END]`

widestring_09D30F `[DEF][LU1:31]Tribe:[N]Wherever [LU1:DB]light,[N][LU1:D9]are shadows.[FIN]We, who [LU1:F2][LU1:7F]by[N][LU1:77]bathed in the[N][LU1:A8][LU2:89]once...[FIN][LU1:EF]spend our future in[N]a [LU1:F5][LU1:F8]light.[END]`

widestring_09D388 `[DEF][LU1:31]Tribe: The [LU1:7B]is[N]a vehicle of destruction[N]whose evil [LU1:A8]has[N][LU1:7F]all creatures.[FIN][LU1:31]Tribe:[N][LU1:1D]a remnant of a[N]weapon [LU1:8E]a terrible[N]battle [LU1:A6]ago.[FIN][TPL:0]Will: The [LU1:F5][N][LU1:EF]be unbearable? [FIN][PAL:0][LU1:31]Tribe: [N]Yes. [LU1:69]bright, but [N][LU1:FF][LU1:D3]immature. [END]`

widestring_09D462 `[DEF][LU1:31]Tribe: One of my  [N]party has [LU1:70]kidnapped. [FIN]Know [LU1:FE]destination?[N] Yes[N] No`

widestring_09D4AD `[CLR][LU1:31]Tribe:[N][LU1:30]someone's chasing[N][LU2:C7]Ku ku ku .....[END]`

widestring_09D4DC `[DEF][LU1:31]Tribe: It comes [N]once every 800 years. [N]This is the fourth time.[FIN]The [LU1:B7][LU1:A8]that[N]reaches you,[N]the stronger the [LU1:C][N]Power.[FIN][LU1:62][LU1:EF]be born[N]of the [LU1:A8][LU1:D6]time...[END]`

widestring_09D574 `[DEF][LU1:31]Tribe:[N][LU2:41]transcended time,[N]and [LU1:98]lived long...[FIN]We saw the destruction [N]of the Incan Empire. [FIN]The Incan [LU1:48]sleeps [N]in the cave below... [N]If you like, we'll [LU1:97][N]it to [LU2:C7][FIN]At any rate, go look[N]in the cave...[N]Ku ku ku...[END]`