?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_it1B_trial [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1B_trial {
    COP [D1] ( #$011C, #01, &code_04F902 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04F941 )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$2200
    STA $0E
    LDA #$0020
    STA $7F0010, X
    LDA #$003C
    STA $7F0012, X
    COP [C1]
    LDA $0AEC
    BEQ code_04F904
    LDA $7F0012, X
    DEC 
    BEQ code_04F8D9
    STA $7F0012, X
    BRA code_04F8F3
}

code_04F8D9 {
    LDA #$003C
    STA $7F0012, X
    SED 
    LDA $7F0010, X
    SEC 
    SBC #$0001
    CLD 
    STA $7F0010, X
    BEQ code_04F904
    COP [07] ( #10 )
}

code_04F8F3 {
    JSR $&s_it1B_04FAB2
    LDA $7F0010, X
    STA $0000
    JSL $@func_03BAF1
    RTL 
}

code_04F902 {
    COP [E0]
}

code_04F904 {
    JSR $&s_it1B_04FAB2
    LDA $7F0010, X
    STA $0000
    JSL $@func_03BAF1
    LDA $0AEC
    BEQ code_04F91E
    COP [BF] ( &widestring_04FA25 )
    COP [C1]
    RTL 
}

code_04F91E {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04FA65 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [08] ( #$0F0F )
    COP [32] ( #1C )
    COP [33]
    COP [CD] ( #$011C )
    COP [C1]
    RTL 
}

widestring_04F941 `[DLG:3,6][SIZ:D,4][LU1:31]Tribe: This[N]is the final shape[N]of those touched[N]by the [LU2:55]light.[FIN]They are horrible[N]creatures whose hearts [N]are filled [LU1:F0][N]hatred and destruction.[FIN]If you can [LU1:88][LU1:E6][N]within 20 seconds, [LU1:1F][N][LU1:97]you the Incan [N]Statue. Ku ku ku... [END]`

widestring_04FA25 `[DLG:3,11][SIZ:D,4][LU1:31]Tribe: [N]In [LU1:D7]case, I [LU1:78][N][LU1:97]you the statue. [N]Ku ku ku... [END]`

widestring_04FA65 `[DLG:3,11][SIZ:D,3][LU1:31]Tribe:[N][LU1:1C]hey! Good boy![N]Ku ku ku...[FIN]Then [LU1:1F][LU1:97]you [N]the Incan Statue. [END]`

---------------------------------------------

s_it1B_04FAB2 {
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