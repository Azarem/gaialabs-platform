
?INCLUDE 'func_00C718'
?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C725'
?INCLUDE 'chunk_028000'

!player_flags                   09AE

---------------------------------------------

h_sp5A_villagers [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_sp5A_villagers {
    COP [D0] ( #70, #00, &code_068A8E )
    LDA #$0008
    TSB $player_flags
    LDA $0E
    AND #$0030
    LSR 
    CLC 
    ADC #$0002
    STA $7F0026, X
    JSL $@func_00C718
    JSL $@func_06B9F2
    COP [C0] ( &code_068A90 )

  code_068A82:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_068A82
}

code_068A8E {
    COP [E0]
}

code_068A90 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_068A9B )
}

code_list_068A9B [
  &code_068AB7   ;00
  &code_068ABC   ;01
  &code_068AC1   ;02
  &code_068AC6   ;03
  &code_068ACB   ;04
  &code_068AD0   ;05
  &code_068AD5   ;06
  &code_068ADA   ;07
  &code_068ADF   ;08
  &code_068AE4   ;09
  &code_068AE9   ;0A
  &code_068B13   ;0B
  &code_068B18   ;0C
  &code_068B1D   ;0D
]

code_068AB7 {
    COP [BF] ( &widestring_068B22 )
    RTL 
}

code_068ABC {
    COP [BF] ( &widestring_068BB6 )
    RTL 
}

code_068AC1 {
    COP [BF] ( &widestring_068C33 )
    RTL 
}

code_068AC6 {
    COP [BF] ( &widestring_068CBD )
    RTL 
}

code_068ACB {
    COP [BF] ( &widestring_068CF6 )
    RTL 
}

code_068AD0 {
    COP [BF] ( &widestring_068D29 )
    RTL 
}

code_068AD5 {
    COP [BF] ( &widestring_068D7A )
    RTL 
}

code_068ADA {
    COP [BF] ( &widestring_068DD0 )
    RTL 
}

code_068ADF {
    COP [BF] ( &widestring_068E20 )
    RTL 
}

code_068AE4 {
    COP [BF] ( &widestring_068E67 )
    RTL 
}

code_068AE9 {
    COP [D0] ( #85, #01, &code_068B13 )
    JSL $@func_02A10A
    BCS code_068B0D
    COP [D4] ( #10, &code_068B0E )
    COP [CC] ( #85 )
    COP [BF] ( &widestring_068EA9 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_068ED4 )
}

code_068B0D {
    RTL 
}

code_068B0E {
    COP [BF] ( &widestring_068F02 )
    RTL 
}

code_068B13 {
    COP [BF] ( &widestring_068F53 )
    RTL 
}

code_068B18 {
    COP [BF] ( &widestring_068F89 )
    RTL 
}

code_068B1D {
    COP [BF] ( &widestring_068FC0 )
    RTL 
}

widestring_068B22 `[DEF]Saved!![N]Thank you!![FIN]I was [LU1:75]to [LU1:D6][N][LU2:93][LU1:8E]Freejia and [N][LU1:7F]to a demon... [FIN][TPL:2][LU1:2C]speaks from[N]his pocket.[FIN]What?! All the demons[N]we saw [LU1:74]were[N][LU1:9A]beings...?[PAL:0][END]`

widestring_068BB6 `[DEF]I [LU1:A4]now what[N]it feels [LU1:A5]to be [N]close to death. [N]Death is terrifying! [FIN]I [LU1:F9]if the [N][LU2:46]we eat [LU1:91]the [N][LU1:CD]way I felt [LU2:94][N][LU1:74]death. [END]`

widestring_068C33 `[DEF]We [LU1:F2][LU1:AD]traders,[N]arrested for the crime[N]of buying and selling[N][LU1:9A]beings...[FIN]But the party officials[N]sold us to a vampire![N]I [LU1:78]believe it...[END]`

widestring_068CBD `[DEF][LU1:63]well. This is the[N]result of [LU1:77]tempted[N]by a [LU1:76]woman...[END]`

widestring_068CF6 `[DEF]A nice guy asked me,[N]so I [LU2:63]him...[N]I [LU1:82]trust men![END]`

widestring_068D29 `[DEF]The man sleeping in[N][LU1:D6]coffin is surely a[N]vampire. They're[N]plotting something...[END]`

widestring_068D7A `[DEF]A [LU2:BE]couple lives [N]in the coffins. [FIN]They [LU2:4E][LU1:C1]here,[N][LU2:B9][LU1:E6][LU1:A1]demons,[N]and use [LU1:E6]for labor.[END]`

widestring_068DD0 `[DEF]This [LU2:93]is connected[N]to the land of Mu.[N]The vampires are looking[N]for [LU1:C8]there...[END]`

widestring_068E20 `[DEF]We [LU1:F2][LU2:47][LU1:7F][N][LU1:A1]demons. I'm afraid of[N][LU1:F7]might [LU1:98][LU1:9D][N]if you had [LU1:79]later... [END]`

widestring_068E67 `[DEF]I overheard the vampires[N]say [LU1:C8][LU1:A5][N]the Mystic [LU1:48]can [N]be [LU1:8F]in Mu. [END]`

widestring_068EA9 `[DEF]I stole a key [LU1:8E]the[N][LU2:BE]woman.[N]Here, [LU1:E7]it.[FIN]`

widestring_068ED4 `[CLR][SFX:0][DLY:9]You received the key to [N]the [LU2:32]Palace![PAU:78][END]`

widestring_068F02 `[DEF]I stole a key [LU1:8E]the[N][LU2:BE]woman. I'd like[N]to [LU1:97]it to you, but[N][LU1:FE]inventory's full...[END]`

widestring_068F53 `[DEF]On the top [LU2:65]of the[N][LU2:93]is a passageway[N]leading to Mu.[END]`

widestring_068F89 `[DEF][LU1:62][LU1:EF]we do now,[N]deserted in the middle[N]of the ocean...[END]`

widestring_068FC0 `[DEF][LU1:30]we [LU1:7A]seize[N]the [LU2:93]and live[N][LU1:D9]together...[END]`