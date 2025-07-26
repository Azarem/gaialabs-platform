
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00C9B8'

!joypad_mask_std                065A
!player_flags                   09AE
!jewels_collected               0AB0

---------------------------------------------

h_dm40_trapped_slave [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_dm40_trapped_slave {
    COP [D0] ( #D9, #01, &code_05D796 )
    COP [9C] ( @code_05D7CB, #$1000 )
    COP [BC] ( #08, #08 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0031
    TSB $12

  code_05D760:
    LDA #$00FF
    STA $7F0026, X
    COP [C1]
    LDA $7F0026, X
    CMP #$00FF
    BNE code_05D782
    COP [45] ( #08, #14, #0A, #17, &code_05D77E )
    COP [CE] ( #00 )
    RTL 
}

code_05D77E {
    COP [CC] ( #00 )
    RTL 
}

code_05D782 {
    LDA $player_flags
    BIT #$0002
    BNE code_05D78F
    DEC $24
    BMI code_05D760
    RTL 
}

code_05D78F {
    COP [9C] ( @func_00C9B8, #$3000 )
}

code_05D796 {
    COP [CC] ( #D9 )
    COP [4B] ( #08, #11, #D5 )
    COP [4B] ( #09, #11, #D4 )
    COP [4B] ( #08, #12, #EC )
    COP [4B] ( #09, #12, #DC )
    COP [4B] ( #08, #13, #F4 )
    COP [4B] ( #09, #13, #E4 )
    COP [4B] ( #08, #14, #02 )
    COP [4B] ( #09, #14, #02 )
    COP [0F] ( #08, #13 )
    COP [0F] ( #09, #13 )
    COP [E0]
}

code_05D7CB {
    COP [BC] ( #08, #00 )
    LDA #$2000
    TSB $10
    COP [80] ( #0C )
    COP [89]
    COP [D2] ( #D9, #01 )
    LDA #$2000
    TRB $10
    SED 
    LDA $jewels_collected
    CLC 
    ADC #$0003
    STA $jewels_collected
    CLD 
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #77 )
    COP [CE] ( #00 )
    COP [BF] ( &widestring_05D819 )
    LDA #$EFF0
    TRB $joypad_mask_std
    LDA #$0080
    TSB $09EC
    COP [86] ( #0D, #08, #01 )
    COP [8A]
    LDA #$0080
    TRB $09EC
    COP [E0]
}

widestring_05D819 `[DEF]Thank you.[N]I was buried in[N]the cave-in...[FIN][LU1:62][LU1:F3]happen if[N]we took longer...[FIN]We [LU1:F1]to [LU1:97]you a[N][LU1:C3]I'm sending 3[N]Red [LU1:22]to[N]the Jeweler.[END]`