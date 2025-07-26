
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_wa78_children [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_children {
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0003
    CLC 
    ADC #$0012
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_078BE4 )
    COP [0B]
    COP [C1]
    RTL 
}

code_078BE4 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_078BEF )
}

code_list_078BEF [
  &code_078BF9   ;00
  &code_078BFE   ;01
  &code_078C03   ;02
  &code_078C08   ;03
  &code_078C0D   ;04
]

code_078BF9 {
    COP [BF] ( &widestring_078C12 )
    RTL 
}

code_078BFE {
    COP [BF] ( &widestring_078C59 )
    RTL 
}

code_078C03 {
    COP [BF] ( &widestring_078CC5 )
    RTL 
}

code_078C08 {
    COP [BF] ( &widestring_078D02 )
    RTL 
}

code_078C0D {
    COP [BF] ( &widestring_078D5A )
    RTL 
}

widestring_078C12 `[DEF][SFX:10][LU2:5]If [LU1:FF]bitten [N]by a snake, you [LU1:CA][N]run [LU1:6D][LU1:A5]crazy [N]and he'll let go. [END]`

widestring_078C59 `[DEF][SFX:10][LU2:5]I was bitten by a[N]snake [LU1:F6]I [LU2:C1]to the[N][LU1:16]Wall of China...[FIN][LU1:39]the snakes around[N][LU2:73]bite you, they[N][LU1:82]let go![END]`

widestring_078CC5 `[DEF][SFX:10]Sabas: My father's[N]an [LU2:5F][LU2:38]he[N][LU1:EF][LU1:90]the [LU1:19]Ship[N]and [LU1:79]home!!![END]`

widestring_078D02 `[DEF][SFX:10]Child:[N][LU1:1F][LU2:AD]you something.[FIN][LU2:42]on the[N][LU2:94]side [LU2:51]the[N]gambling house.[N]A lotus leaf [LU1:EF]come.[END]`

widestring_078D5A `[DEF][SFX:10][LU2:5]This is[N]Watermia.[END]`