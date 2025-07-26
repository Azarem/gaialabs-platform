
?INCLUDE 'dm_actor_05D49E'
?INCLUDE 'f_inventory_full'

!joypad_mask_std                065A
!APUIO1                         2141

---------------------------------------------

h_dm47_sam [
  h_actor < #28, #00, #10 >   ;00
]

---------------------------------------------

e_dm47_sam {
    COP [D0] ( #5E, #01, &dm47_sam_destroy )
    COP [9C] ( @e_dm_actor_05D49E, #$0100 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D299 )
    COP [0B]
    COP [C1]
    LDY $06
    LDA $0010, Y
    BIT #$0040
    BNE code_05D24B
    RTL 
}

code_05D24B {
    COP [C0] ( &code_05D29E )
    COP [D2] ( #5E, #01 )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [04] ( #1E )
    COP [DA] ( #77 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_05D271
    RTL 
}

code_05D271 {
    COP [D6] ( #08, &code_05D286 )
    COP [BF] ( &widestring_05D40C )
    COP [D5] ( #02 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_05D286 {
    COP [BF] ( &widestring_05D377 )
    COP [D5] ( #02 )
    COP [D5] ( #08 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_05D299 {
    COP [BF] ( &widestring_05D2C0 )
    RTL 
}

code_05D29E {
    COP [D0] ( #5E, #01, &code_05D2BB )
    COP [BF] ( &widestring_05D2DA )
    COP [D0] ( #5E, #01, &code_05D2B6 )
    COP [D4] ( #0D, &code_05D2B7 )
    COP [CC] ( #5E )
}

code_05D2B6 {
    RTL 
}

code_05D2B7 {
    JML $@f_inventory_full
}

code_05D2BB {
    COP [BF] ( &widestring_05D48E )
    RTL 
}

widestring_05D2C0 `[DEF][TPL:5]Sam: [N]Cut the chain![PAL:0][END]`

widestring_05D2DA `[DEF][TPL:5]Sam: [N]Thank [LU2:C7][FIN]I [LU1:99][LU1:8E]Erik [LU1:D7][N][LU1:FE]friend has [LU2:7A][N]his memory. [FIN]Legend says [LU1:D7]there[N]is a song [LU1:D7]brings[N][LU1:73]the past. Please[N]let him [LU1:9B]it.[FIN]Sam hums a [N][LU1:C7]melody.[PAL:0][END]`

widestring_05D377 `[DEF][LU1:67]learned[N]the [LU2:1D]Melody![FIN][TPL:5]Sam: [N]I [LU1:BA]a favor... [FIN]May I [LU1:98]the prison[N]key and the [LU1:34]of[N]the [LU2:3D]as a souvenir[N]of our meeting?[FIN]I'm [LU2:A6][LU1:1F]never[N]use it again.[END]`

widestring_05D40C `[DEF][LU1:67]learned[N]the [LU2:1D]Melody![FIN][TPL:5]Sam: [N]I [LU1:BA]a favor... [FIN]May I [LU1:98]the Prison[N]Key as a souvenir[N]of meeting you?[FIN]I'm [LU2:A6][LU1:1F]never[N]use it again.[END]`

widestring_05D48E `[DEF][TPL:5][LU1:1F][LU1:BB][LU2:6A]you![PAL:0][END]`

---------------------------------------------

dm47_sam_destroy {
    COP [E0]
}