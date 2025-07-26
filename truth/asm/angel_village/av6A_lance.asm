
---------------------------------------------

h_av6A_lance [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_av6A_lance {
    COP [D0] ( #8D, #01, &av6A_lance_destroy )
    COP [D0] ( #8C, #01, &code_06BC07 )
    COP [C0] ( &code_06BC19 )
    COP [0B]
    COP [C1]
    RTL 
}

code_06BC07 {
    COP [25] ( #1C, #0C )
    COP [0B]
    COP [C0] ( &code_06BC14 )
    COP [C1]
    RTL 
}

code_06BC14 {
    COP [BF] ( &widestring_06BFBE )
    RTL 
}

code_06BC19 {
    COP [D0] ( #74, #01, &code_06BC57 )
    COP [CC] ( #74 )
    COP [BF] ( &widestring_06BC5C )
    COP [BE] ( #02, #01, &code_list_06BC2C )
}

code_list_06BC2C [
  &code_06BC36   ;00
  &code_06BC32   ;01
  &code_06BC36   ;02
]

code_06BC32 {
    COP [BF] ( &widestring_06BD1A )
}

code_06BC36 {
    COP [BF] ( &widestring_06BD4A )

  code_06BC3A:
    COP [BE] ( #03, #00, &code_list_06BC40 )
}

code_list_06BC40 [
  &code_06BC3A   ;00
  &code_06BC48   ;01
  &code_06BC4D   ;02
  &code_06BC52   ;03
]

code_06BC48 {
    COP [BF] ( &widestring_06BE1F )
    RTL 
}

code_06BC4D {
    COP [BF] ( &widestring_06BE85 )
    RTL 
}

code_06BC52 {
    COP [BF] ( &widestring_06BF0A )
    RTL 
}

code_06BC57 {
    COP [BF] ( &widestring_06BF7C )
    RTL 
}

widestring_06BC5C `[TPL:A][TPL:4]Lance: [N]Will. I [LU1:F1]to [LU2:AC]to [N]you [LU1:6B]something. [FIN][TPL:4][LU1:1D]hard to [LU2:AC]about,[N]but I [LU2:9E]to [LU1:98]fallen [N]in love [LU1:F0]Lilly...[FIN]I dream [LU2:89]of her...[N]I [LU1:F1]her to[N]notice me.[FIN][LU1:1D]not [LU1:A5]me, is it?[N][PAL:0] Right[N] Not true`

widestring_06BD1A `[CLR][TPL:0]Will: I [LU1:83][LU1:DA] [N]I'd [LU2:5D][LU1:9B]you [N]say a [LU1:E3][LU1:A5]that. [FIN]`

widestring_06BD4A `[CLR][TPL:0]Will: But you've spent [N]a lot of [LU1:DF]together. [N]It [LU1:CC][LU2:89]natural. [FIN][CLR][TPL:4]Lance: [LU2:38]it [LU1:EF]be [N][LU2:18]15th birthday. [FIN]I [LU1:F1]to [LU1:97]her a[N]present and [LU2:AD]her[N]how I feel.[FIN][LU1:62]would[N]you [LU1:97]her?[FIN] A [LU2:4F]of flowers[N] A [LU2:92]necklace[N] A sweet kiss`

widestring_06BE1F `[CLR][TPL:0]Will: [N]Any [LU2:C4][LU1:F3][LU1:A5]a [N][LU2:4F]of flowers. [FIN][TPL:4]Lance: I know. [LU1:1F]send [N]a [LU2:4F]of rose buds [N]to show my love. [FIN][JMP:&widestring_06BF7C]`

widestring_06BE85 `[CLR][TPL:0]Will: Of course, [N][LU1:C8]she'd wear [N][LU1:F3]be nice. [FIN][LU1:61]she sees it, she'll [N][LU1:DA]of [LU2:C7][FIN][TPL:4]Lance: Of course. [N][LU1:1F][LU1:90]stones and [N][LU2:84]a necklace. [FIN][JMP:&widestring_06BF7C]`

widestring_06BF0A `[CLR][TPL:0]Will: [N]That's the [LU2:89][LU1:E3][N]she'd like, right? [FIN][TPL:4]Lance: It might be too [N]sudden, but if you [LU1:DA][N][LU1:9F]OK, [LU1:1F]try it. [FIN][JMP:&widestring_06BF7C]`

widestring_06BF7C `[TPL:A][TPL:4]Lance: Thanks for [N]the advice. [FIN][LU1:1F][LU1:DA][LU1:6B]it.[N][LU1:1D][LU1:94]to[N][LU1:98]friends.[PAL:0][END]`

widestring_06BFBE `[TPL:B][TPL:4]Lance: [N][LU1:2C][LU1:EF][LU1:98]her [N][LU2:4C][LU2:BF]we're in [N]the Floating City...[PAL:0][END]`

---------------------------------------------

av6A_lance_destroy {
    COP [E0]
}