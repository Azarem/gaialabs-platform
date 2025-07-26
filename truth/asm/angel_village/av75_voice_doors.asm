
?INCLUDE 'table_0EE000'

!player_y_pos                   09A4

---------------------------------------------

h_av75_voice_doors [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_av75_voice_doors {
    LDA #$0200
    TSB $12
    COP [D0] ( #89, #01, &code_06D7BB )
    STZ $067F
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    LDA $player_y_pos
    CMP #$00F0
    BCC code_06D7BB
    COP [BC] ( #08, #02 )
    LDA $0E
    AND #$000F
    STA $24
    STZ $0E
    COP [C0] ( &code_06D7BD )
    COP [C1]
    RTL 
}

code_06D7BB {
    COP [E0]
}

code_06D7BD {
    LDA $0AA6
    CMP $24
    BCC code_06D834
    BNE code_06D839
    COP [07] ( #0E )
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06D7D4 )
}

code_list_06D7D4 [
  &code_06D7E4   ;00
  &code_06D7EE   ;01
  &code_06D7F8   ;02
  &code_06D802   ;03
  &code_06D80C   ;04
  &code_06D816   ;05
  &code_06D820   ;06
  &code_06D82A   ;07
]

code_06D7E4 {
    COP [32] ( #49 )
    COP [33]
    COP [CD] ( #$0149 )
    RTL 
}

code_06D7EE {
    COP [32] ( #4A )
    COP [33]
    COP [CD] ( #$014A )
    RTL 
}

code_06D7F8 {
    COP [32] ( #4B )
    COP [33]
    COP [CD] ( #$014B )
    RTL 
}

code_06D802 {
    COP [32] ( #4C )
    COP [33]
    COP [CD] ( #$014C )
    RTL 
}

code_06D80C {
    COP [32] ( #4D )
    COP [33]
    COP [CD] ( #$014D )
    RTL 
}

code_06D816 {
    COP [32] ( #4E )
    COP [33]
    COP [CD] ( #$014E )
    RTL 
}

code_06D820 {
    COP [32] ( #4F )
    COP [33]
    COP [CD] ( #$014F )
    RTL 
}

code_06D82A {
    COP [32] ( #50 )
    COP [33]
    COP [CD] ( #$0150 )
    RTL 
}

code_06D834 {
    COP [BF] ( &widestring_06D83E )
    RTL 
}

code_06D839 {
    COP [BF] ( &widestring_06D87B )
    RTL 
}

widestring_06D83E `[TPL:A][LU2:16][LU1:EE]resounds.[FIN][LU1:D]hurry.[N]Open the doors in order[N][LU1:8E]the left.[END]`

widestring_06D87B `[TPL:A][LU2:16][LU1:EE]resounds.[FIN]That [LU2:58]is already[N]open. There's no[N][LU1:BA]to open it.[END]`