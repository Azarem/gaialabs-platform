?BANK 09

?INCLUDE 'chunk_03BAE1'
?INCLUDE 'ec11_button_voice'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_ec11_countdown [
  h_actor < #00, #00, #23 >   ;00
]

---------------------------------------------

e_ec11_countdown {
    COP [D1] ( #$0113, #01, &code_09BE6D )
    COP [D2] ( #02, #01 )
    COP [C1]
    COP [21] ( #03, &code_09BDCB )
    RTL 
}

code_09BDCB {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_09BE70 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    LDA #$CFF0
    TRB $joypad_mask_std

  code_09BDE4:
    COP [C1]
    LDA #$2200
    STA $0E
    COP [CA] ( #78 )
    COP [D0] ( #03, #01, &code_09BE67 )
    COP [CB]
    COP [07] ( #10 )
    COP [CA] ( #3C )
    COP [D0] ( #03, #01, &code_09BE67 )
    JSR $&sub_09BEFC
    LDA #$0001
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [CA] ( #78 )
    COP [D0] ( #03, #01, &code_09BE67 )
    COP [CB]
    COP [07] ( #10 )
    COP [CA] ( #3C )
    COP [D0] ( #03, #01, &code_09BE67 )
    JSR $&sub_09BEFC
    LDA #$0002
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [CA] ( #63 )
    COP [D0] ( #03, #01, &code_09BE67 )
    COP [CB]
    COP [CC] ( #01 )
    COP [07] ( #11 )
    COP [CA] ( #28 )
    COP [D0] ( #02, #00, &code_09BE6D )
    JSR $&sub_09BEFC
    LDA #$0003
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [CE] ( #01 )
    COP [BF] ( &widestring_09BD58 )
}

code_09BE67 {
    COP [CE] ( #03 )
    JMP $&code_09BDE4
}

code_09BE6D {
    COP [C1]
    RTL 
}

widestring_09BE70 `[TPL:B][TPL:2][::][LU1:46]Voice: The [LU2:58][N][LU1:FA]open unless you [N]push [LU1:D6]switch on [N]the count of three. [FIN][LU1:61]I shout, push [N]the switch. [FIN][LU1:1F]count 1, 2, 3.[N][LU1:D][LU2:84]a mistake.[END]`

---------------------------------------------

sub_09BEFC {
    LDA $player_x_pos
    CLC 
    ADC #$0007
    STA $14
    LDA $player_y_pos
    SEC 
    SBC #$0020
    STA $16
    RTS 
}