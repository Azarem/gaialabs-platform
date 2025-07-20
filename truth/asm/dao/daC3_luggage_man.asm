
!inventory_slots                0AB4

---------------------------------------------

h_daC3_luggage_man [
  h_actor < #1F, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_luggage_man {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_08B167 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08B167 {
    COP [D0] ( #B8, #00, &code_08B172 )
    COP [BF] ( &widestring_08B1CD )
    RTL 
}

code_08B172 {
    COP [BF] ( &widestring_08B1EF )
    COP [BE] ( #02, #02, &code_list_08B17C )
}

code_list_08B17C [
  &code_08B182   ;00
  &code_08B187   ;01
  &code_08B182   ;02
]

code_08B182 {
    COP [BF] ( &widestring_08B27F )
    RTL 
}

code_08B187 {
    COP [BF] ( &widestring_08B21A )
    SEP #$20
    STZ $0000
    LDY #$0000

  code_08B193:
    LDA $inventory_slots, Y
    BNE code_08B19B
    INC $0000
}

code_08B19B {
    INY 
    CPY #$0010
    BNE code_08B193
    REP #$20
    LDA $0000
    AND #$00FF
    CMP #$0002
    BCC code_08B1C8
    COP [D4] ( #25, &code_08B1C7 )
    COP [D4] ( #26, &code_08B1C7 )
    COP [CC] ( #B8 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08B25A )
}

code_08B1C7 {
    RTL 
}

code_08B1C8 {
    COP [BF] ( &widestring_08B2B2 )
    RTL 
}

widestring_08B1CD `[DEF]This is a hotel for[N][LU2:B1]merchants.[END]`

widestring_08B1EF `[DEF]Would you happen to [N]be Will? [N] Yes [N] No `

widestring_08B21A `[CLR]Good! A [LU2:7F]and some[N]luggage [LU1:98]arrived[N][LU1:8E][LU1:CF]named[N]Bill and Lola.[FIN]`

widestring_08B25A `[CLR][SFX:0][DLY:9]You get a [LU2:7F]and [N][LU1:FE][LU1:92]journal![PAU:78][END]`

widestring_08B27F `[CLR]Hmmm. I [LU2:71]he [N]arrives soon. [N]Very distressing... [END]`

widestring_08B2B2 `[DEF][CLR]Somehow, [LU1:FE][LU1:A0][N]is full. Reduce [LU1:FE][N]possessions somewhere. [END]`