
?INCLUDE 'thinker_00B7F4'
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_av74_kara [
  h_actor < #16, #00, #10 >   ;00
]

---------------------------------------------

e_av74_kara {
    COP [D0] ( #8C, #01, &code_06D258 )
    COP [BC] ( #08, #FD )
    COP [B6] ( #10 )
    COP [9E] ( @code_06D251, #$0000, #$0010, #$3000 )
    COP [C1]
    COP [D6] ( #14, &code_06D171 )
    RTL 
}

code_06D171 {
    COP [0F] ( #0B, #0C )
    COP [D2] ( #01, #01 )
    COP [D2] ( #8A, #01 )
    LDA #$FFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$00
    STA $CGWSEL
    LDA #$21
    STA $CGADSUB
    REP #$20
    COP [3C] ( @e_thinker_00B7F4 )
    COP [DA] ( #3B )
    LDA #$2000
    TSB $10
    COP [3C] ( @e_thinker_00B7F4 )
    COP [DA] ( #3B )
    LDA #$2000
    TSB $10
    COP [51] ( @gfx_na49_actors, $7E7000 )
    COP [4F] ( $7E7000, #$5000, #$0800 )
    COP [4F] ( $7E7800, #$5400, #$0800 )
    COP [4F] ( $7E8000, #$5800, #$0800 )
    COP [4F] ( $7E8800, #$5C00, #$0800 )
    COP [50] ( @pal_na49_actors, #00, #A0, #50 )
    COP [51] ( @spm_na49_actors, $7E4000 )
    COP [25] ( #0B, #10 )
    COP [B6] ( #20 )
    LDA #$2000
    TRB $10
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [84] ( #1B, #3C )
    COP [8A]
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [81] ( #20, #12 )
    COP [89]
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06D339 )
    LDA #$0003
    JSL $@func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_06D364 )
    COP [81] ( #20, #02 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [BF] ( &widestring_06D3CC )
    COP [CC] ( #8C )
    LDA #$0404
    STA $064A
    COP [26] ( #6A, #$01A0, #$00B0, #03, #$1200 )
    COP [C1]
    RTL 
}

code_06D251 {
    COP [C0] ( &code_06D25A )
    COP [C1]
    RTL 
}

code_06D258 {
    COP [E0]
}

code_06D25A {
    COP [D0] ( #89, #00, &code_06D273 )
    COP [D0] ( #01, #01, &code_06D26B )
    COP [BF] ( &widestring_06D278 )
    RTL 
}

code_06D26B {
    COP [BF] ( &widestring_06D2A4 )
    COP [CC] ( #8A )
    RTL 
}

code_06D273 {
    COP [BF] ( &widestring_06D2FF )
    RTL 
}

widestring_06D278 `[TPL:A][TPL:0][SFX:10]Will: [N]If I [LU1:82]spread [N]magic dust...[PAL:0][END]`

widestring_06D2A4 `[TPL:E][TPL:0][SFX:10]Will: [N][LU1:26]- [LU2:8E]return to [N][LU1:FE][LU1:C0]form.... [FIN][SFX:0]Will gently kisses the [N]picture of Kara...[PAL:0][END]`

widestring_06D2FF `[TPL:A][TPL:0][SFX:10]Will: Kara's picture. [N]She is contained [N][LU1:A2]it....[PAL:0][END]`

widestring_06D339 `[TPL:A][TPL:1][SFX:1B][LU1:25][N]Will....Sorry [N]for [LU1:77]so selfish.[FIN]`

widestring_06D364 `[TPL:A][CLR][TPL:0][SFX:10]Will: Kara!! [N]You [LU2:84]me so mad!! [FIN]You are not the [LU2:89][N]person on [LU1:D6]journey!  [FIN][TPL:1][SFX:1B][LU1:25][N]............[PAL:0][END]`

widestring_06D3CC `[TPL:A][TPL:1][SFX:1B][LU1:25][N]Whaaaaaah! [N]Sob....Sniff.... [FIN]I...Sob... I don't[N][LU1:A4][LU1:F7]I'm doing[N]myself...Sob...[FIN][LU1:61]I was in the[N]castle....I [LU1:7A]have[N][LU1:6C]I wanted...[FIN]But I was a completely[N][LU1:86]person[N][LU1:74][LU1:D6]trip...[FIN][TPL:0][SFX:10]Will: Naturally! [LU1:1D]a [N]mistake to [LU1:DA]you [N]can control everything!![FIN][TPL:1][SFX:1B][LU1:25]No! [FIN][LU1:61]I'm far away, I [LU1:91][N]close to it.[FIN][LU1:61]I'm close,[N]I [LU1:91]far away. [N]I realize [LU1:D7]now... [FIN][LU1:1D]all [LU2:94]if you[N][LU1:82]understand...[FIN]I [LU1:EF][LU1:BB]forget[N][LU1:F7][LU1:9D]today.[PAL:0][END]`