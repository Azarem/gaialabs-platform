
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_wa78_men [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_men {
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0003
    CLC 
    ADC #$0002
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_078537 )
    COP [0B]
    LDA $24
    CMP #$0005
    BEQ code_07852D

  code_07852A:
    COP [C1]
    RTL 
}

code_07852D {
    COP [D0] ( #9D, #00, &code_07852A )
    COP [0C]
    COP [E0]
}

code_078537 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_078542 )
}

code_list_078542 [
  &code_07855A   ;00
  &code_07855F   ;01
  &code_078564   ;02
  &code_078569   ;03
  &code_0785A1   ;04
  &code_0785A6   ;05
  &code_0785AB   ;06
  &code_0785B0   ;07
  &code_0785B5   ;08
  &code_0785BA   ;09
  &code_0785BF   ;0A
  &code_0785BF   ;0B
]

code_07855A {
    COP [BF] ( &widestring_0785C9 )
    RTL 
}

code_07855F {
    COP [BF] ( &widestring_078607 )
    RTL 
}

code_078564 {
    COP [BF] ( &widestring_078674 )
    RTL 
}

code_078569 {
    COP [BF] ( &widestring_0786C1 )
    COP [BE] ( #02, #02, &code_list_078573 )
}

code_list_078573 [
  &code_078579   ;00
  &code_078579   ;01
  &code_07857E   ;02
]

code_078579 {
    COP [BF] ( &widestring_078724 )
    RTL 
}

code_07857E {
    COP [BF] ( &widestring_078741 )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$02D4, #$01A4, #00, #22 )
    COP [26] ( #01, #$00F0, #$02E0, #03, #$4300 )
    RTL 
}

code_0785A1 {
    COP [BF] ( &widestring_07876E )
    RTL 
}

code_0785A6 {
    COP [BF] ( &widestring_07879B )
    RTL 
}

code_0785AB {
    COP [BF] ( &widestring_0787DA )
    RTL 
}

code_0785B0 {
    COP [BF] ( &widestring_07881B )
    RTL 
}

code_0785B5 {
    COP [BF] ( &widestring_078881 )
    RTL 
}

code_0785BA {
    COP [BF] ( &widestring_0788DE )
    RTL 
}

code_0785BF {
    COP [BF] ( &widestring_0788E0 )
    RTL 
    COP [BF] ( &widestring_078960 )
    RTL 
}

widestring_0785C9 `[DEF][SFX:10][LU1:32]This is[N][LU2:43]The [LU2:77]are[N]built on rafts. We like[N]to [LU1:B5]around.[END]`

widestring_078607 `[DEF][SFX:10]Man:[N]This animal is called[N]a Kruk.[FIN][LU1:1D][LU1:94]for crossing[N]the desert. It can live[N][LU1:F8]food or water[N]for a [LU1:A6]time.[END]`

widestring_078674 `[DEF][SFX:10][LU1:32]This is a gambling[N]house. A child would[N][LU1:98]to be [LU1:ED]poor to[N][LU1:79]to [LU1:D6]place.[END]`

widestring_0786C1 `[DEF]I'm the Sky Deliveryman. [N]My tame birds [LU1:EF][LU1:E7][N]you to [LU1:85]towns. [FIN]Do you [LU1:F1]to[N]go to [LU1:47]Cape?[N] Quit[N] Go`

widestring_078724 `[CLR]OK. In [LU1:D7]case,[N]use [LU1:E6]later.[END]`

widestring_078741 `[CLR][LU1:9]here, birds.[N][LU2:3F]taking [LU1:D6]person[N]to [LU1:47]Cape![END]`

widestring_07876E `[DEF]This leaf is full.[N]Find [LU1:6E]if you[N][LU1:F1]to ride.[END]`

widestring_07879B `[DEF][SFX:10]Luke:[N]Take [LU2:57]of my house.[N]Make yourself at home[N][LU2:BF]I'm gone.[END]`

widestring_0787DA `[DEF]If you [LU1:BA]a lot of[N]money, go to the raft[N]at the [LU1:BF]of[N][LU1:D6]building.[END]`

widestring_07881B `[DEF][SFX:10]Betting small money[N][LU1:FA][LU2:84]you[N]big money.[FIN]Of course, if you want[N]to risk [LU1:FE]life, you[N]can [LU2:84]a fortune.[END]`

widestring_078881 `[DEF]Life is [LU1:A5]a gamble.[N]Make one mistake,[N]and you're[N]on the [LU2:9B]to ruin.[FIN][LU1:3D]do that[N]unconsciously.[END]`

widestring_0788DE `[DEF][END]`

widestring_0788E0 `[DEF]There's an old man in[N]the [LU1:E2]who's a little[N]bit crazy.[FIN]He was [LU1:F0]the explorer, [N]Olman, on his[N]expedition to the[N]Tower of Babel. [END]`

widestring_078960 `[DEF][END]`