
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_sp5C_key_coffin [
  h_actor < #00, #02, #30 >   ;00
]

---------------------------------------------

e_sp5C_key_coffin {
    COP [D1] ( #$013A, #01, &code_069092 )
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_069094 )
    COP [D2] ( #01, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EE000 )
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $16
    COP [85] ( #33, #04, #14 )
    COP [8A]
    COP [84] ( #33, #04 )
    COP [8A]
    LDA #$0300
    STA $7F0018, X
    LDA #$009C
    STA $7F001A, X
    COP [22] ( #33, #01 )
    LDA #$2000
    TSB $10
    COP [DA] ( #3B )
    COP [32] ( #3A )
    COP [33]
    COP [CD] ( #$013A )
    COP [DA] ( #3B )
    LDA #$0300
    STA $14
    LDA #$00A0
    STA $16
    LDA #$2000
    TRB $10
    COP [BF] ( &widestring_069167 )
    COP [84] ( #33, #04 )
    COP [8A]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [22] ( #33, #01 )
    LDA #$2000
    TSB $10
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_069092 {
    COP [E0]
}

code_069094 {
    COP [D0] ( #6F, #01, &code_06909F )
    COP [BF] ( &widestring_0690A7 )
    RTL 
}

code_06909F {
    COP [BF] ( &widestring_0690CF )
    COP [CC] ( #01 )
    RTL 
}

widestring_0690A7 `[DEF][TPL:0]Will: The coffins are [N]lined up...[PAL:0][END]`

widestring_0690CF `[DEF][TPL:0]Will: [N]I [LU1:78][LU2:9E]to open [N]the lid... [FIN][TPL:2][LU1:2C]speaks from[N]his pocket.[FIN][TPL:2][LU1:2A][LU2:42]a minute.[N]Isn't [LU1:D9]a hole in[N]the coffin?[FIN]I [LU1:7A]get in [LU1:DC][N]the hole. I [LU2:50][N][LU1:98]a look.[PAL:0][END]`

widestring_069167 `[DEF][TPL:2][LU1:2A]Strange...[N]There's a key fastened[N][LU1:A2][LU1:D6]coffin. No[N][LU1:F9]it [LU1:83]open.[PAL:0][END]`