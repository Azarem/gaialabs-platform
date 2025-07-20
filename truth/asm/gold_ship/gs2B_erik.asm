?INCLUDE 'func_00CFAE'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_gs2B_erik [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_gs2B_erik {
    COP [D0] ( #51, #01, &code_0591AB )
    COP [0B]
    COP [C0] ( &code_05923B )
    COP [C1]
    RTL 
}

code_0591AB {
    COP [A0] ( @code_05927E, #$01D8, #$0260, #$1000 )
    COP [25] ( #19, #26 )
    COP [80] ( #0D )
    COP [89]
    COP [D2] ( #01, #01 )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0593DA )
    COP [CC] ( #02 )
    COP [08] ( #$1515 )
    COP [9C] ( @code_058598, #$2B00 )
    COP [9C] ( @code_0591F8, #$2000 )
    COP [DA] ( #4F )
    COP [63] ( #08, #07, #00 )
    COP [AA] ( #06 )

  code_0591EA:
    COP [64]
    CMP #$0000
    BMI code_0591F5
    COP [C2]
    BRA code_0591EA
}

code_0591F5 {
    COP [C1]
    RTL 
}

code_0591F8 {
    COP [DA] ( #77 )
    LDA #$0008
    TSB $12
    LDA #$0200
    TSB $06EE
    LDA #$EFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [63] ( #08, #07, #00 )
    COP [AA] ( #03 )

  code_059221:
    COP [64]
    CMP #$0000
    BMI code_059239
    LDY $player_actor
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    COP [C2]
    BRA code_059221
}

code_059239 {
    COP [E0]
}

code_05923B {
    COP [BF] ( &widestring_059240 )
    RTL 
}

widestring_059240 `[DEF][TPL:3]Erik: [N]I was surprised!! [FIN]Oh, [LU1:9F]you, Will. [N][LU1:D]scare me!![PAL:0][END]`

code_05927E {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [81] ( #08, #02 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    COP [BF] ( &widestring_0592FF )
    COP [08] ( #$1515 )
    COP [9C] ( @func_00CFAE, #$2000 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #EF )
    COP [CC] ( #01 )

  code_0592AA:
    COP [23]
    AND #$0060
    BEQ code_0592C2
    STA $08
    COP [C2]
    COP [9C] ( @func_00CFAE, #$2000 )
    LDA #$FFFF
    STA $0024, Y
}

code_0592C2 {
    COP [D0] ( #02, #01, &code_0592CD )
    COP [C4] ( @code_0592AA )
}

code_0592CD {
    COP [DA] ( #63 )
    COP [63] ( #08, #07, #00 )
    COP [AA] ( #07 )

  code_0592D8:
    COP [64]
    CMP #$0000
    BMI code_0592E3
    COP [C2]
    BRA code_0592D8
}

code_0592E3 {
    COP [CE] ( #4D )
    LDA #$0000
    STA $0AA6
    LDA #$0808
    STA $064A
    COP [26] ( #2F, #$0070, #$00B0, #03, #$1100 )
    COP [C1]
    RTL 
}

widestring_0592FF `[TPL:E][TPL:4]Lance: [N][LU1:62][LU1:9D]to Seth? [N][LU1:4B]happened! [FIN][TPL:3][DLY:0]Erik: [N]Eeeeeeeh!!! [N][LU1:1D]Seth!!... [FIN]A huge, enormous, giant [N][LU2:62]ran [LU1:A1]the ship![N]Sob... [FIN]Seth fell in the [N]water! Sob... [FIN]He was swallowed!  [N]Gulp...Sob... [FIN][TPL:4]Lance: [N][LU1:62]was that?[PAL:0][END]`

widestring_0593DA `[TPL:E][TPL:3]Erik: Aaaggh! [LU1:1D][LU1:D7][N][LU2:62]again! [LU2:3E][N]all be dessert!! [FIN][TPL:4]Lance: Stop crying, and [N]grab this, or  you'll [N]fall overboard!![PAL:0][END]`

---------------------------------------------

code_058598 {
    LDA $06C2
    STA $16
    LDA #$0000
    STA $7F000A, X

  code_0585A4:
    PHX 
    LDA $7F000A, X
    TAX 
    LDA $@binary_058606, X
    STA $0000
    LDA $@binary_058606+1, X
    STA $0002
    PLX 
    LDA #$0000
    SEP #$20
    LDA $0000
    BPL code_0585C6
    XBA 
    DEC 
    XBA 
}

code_0585C6 {
    REP #$20
    STA $7F0010, X
    LDA $0002
    AND #$00FF
    BEQ code_0585FD
    STA $7F0012, X
    COP [C1]
    LDA $7F0012, X
    BEQ code_0585F1
    DEC 
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC $06C2
    STA $06C2
    RTL 
}

code_0585F1 {
    LDA $7F000A, X
    INC 
    INC 
    STA $7F000A, X
    BRA code_0585A4
}

code_0585FD {
    LDA #$0020
    STA $7F000A, X
    BRA code_0585A4
}

---------------------------------------------

binary_058606 #0404FC060406FC060406FC060406FC060805F8060806F8060806F8061006F0081008F0080000