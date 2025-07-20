?BANK 04

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_sc02_card [
  h_actor < #34, #00, #10 >   ;00
]

---------------------------------------------

e_sc02_card {
    COP [B6] ( #30 )
    COP [BC] ( #08, #00 )
    COP [C1]
    RTL 

  code_04AFBF:
    COP [8D] ( #38 )
    STZ $08
    COP [C1]
    LDA $player_x_pos
    CLC 
    ADC #$0008
    SEC 
    SBC $14
    BPL code_04AFD6
    EOR #$FFFF
    INC 
}

code_04AFD6 {
    CMP #$0008
    BCS code_04AFF6
    LDA $player_y_pos
    CLC 
    ADC #$000A
    SEC 
    SBC $16
    BPL code_04AFEB
    EOR #$FFFF
    INC 
}

code_04AFEB {
    CMP #$0008
    BCS code_04AFF6
    COP [40] ( #$8001, &code_04B000 )
}

code_04AFF6 {
    COP [D0] ( #08, #01, &code_04AFFD )
    RTL 
}

code_04AFFD {
    COP [C1]
    RTL 
}

code_04B000 {
    COP [BF] ( &widestring_04B00F )
    COP [CC] ( #08 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [E0]
}

widestring_04B00F `[DLG:3,6][SIZ:D,3]Will picks up a card.[FIN]It is the Ace of[N]Diamonds, of course![END]`