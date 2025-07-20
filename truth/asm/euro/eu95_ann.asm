?INCLUDE 'hidden_red_jewel'


---------------------------------------------

h_eu95_ann [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_eu95_ann {
    COP [0B]
    COP [C0] ( &code_07DF10 )
    COP [C1]
    RTL 
}

code_07DF10 {
    COP [D0] ( #D6, #01, &code_07DF33 )
    COP [BF] ( &widestring_07DF7A )
    COP [BE] ( #02, #02, &code_list_07DF20 )
}

code_list_07DF20 [
  &code_07DF26   ;00
  &code_07DF2E   ;01
  &code_07DF26   ;02
]

code_07DF26 {
    COP [BF] ( &widestring_07E092 )
    COP [CC] ( #D6 )
    RTL 
}

code_07DF2E {
    COP [BF] ( &widestring_07E03D )
    RTL 
}

code_07DF33 {
    COP [D0] ( #E5, #01, &code_07DF75 )
    COP [D6] ( #28, &code_07DF43 )
    COP [BF] ( &widestring_07E0DE )
    RTL 
}

code_07DF43 {
    COP [D0] ( #E3, #00, &code_07DF63 )
    COP [D0] ( #E4, #00, &code_07DF68 )
    COP [D5] ( #28 )
    COP [BF] ( &widestring_07E10A )
    COP [D4] ( #01, &code_07DF5F )
    COP [CC] ( #E5 )
    RTL 
}

code_07DF5F {
    JML $@code_00C6A1
}

code_07DF63 {
    COP [CC] ( #E3 )
    BRA code_07DF6D
}

code_07DF68 {
    COP [CC] ( #E4 )
    BRA code_07DF6D
}

code_07DF6D {
    COP [D5] ( #28 )
    COP [BF] ( &widestring_07E0E5 )
    RTL 
}

code_07DF75 {
    COP [BF] ( &widestring_07E19D )
    RTL 
}

widestring_07DF7A `[TPL:B][TPL:1]Ann: A few days ago, a [N]man wearing a cloak [N][LU1:80]around. [FIN]He asked if anyone named[N][LU1:26]had [LU1:79]to town. [FIN]I shrank [LU1:F0]fear [LU1:F6][N]I saw his cold eyes. [FIN]Should I [LU2:AD][LU1:26][N][LU1:6B]it? [N] If you must! [N] No, [LU2:8E]don't! `

widestring_07E03D `[CLR]I [LU1:82][LU1:A5][LU1:D7]Kara. [N]She acts [LU1:A5][LU1:D0]kind [N]of princess. [FIN]You [LU2:A8]be so[N]cruel, talking [LU1:D7]way.[PAL:0][END]`

widestring_07E092 `[CLR]Heh heh.[N][LU1:20][LU1:8F]a weakness.[FIN][::]Aah.[N]I [LU1:F1]an apple. Let's[N]go to the marketplace![PAL:0][END]`

widestring_07E0DE `[TPL:B][TPL:1][JMP:&widestring_07E092+M]`

widestring_07E0E5 `[TPL:B][TPL:1]Ann: Thanks.[N]I [LU1:78]eat any more.[PAL:0][END]`

widestring_07E10A `[TPL:B][TPL:1]Ann:[N]Why are you [LU2:44]going[N]to the market and coming[N][LU1:73][LU1:F0]apples..?[FIN]For Kara...? [N]Or...? [FIN][LU1:18]As a present I'll[N][LU1:97]you [LU1:D6]jewel.[FIN][PAL:0]Will [LU2:6D]a Red Jewel![END]`

widestring_07E19D `[TPL:B][TPL:1]Ann: [LU1:1F][LU1:E7][N][LU2:57]of Kara...[PAL:0][END]`