
?INCLUDE 'func_00C6E4'

!scene_current                  0644
!joypad_mask_std                065A

---------------------------------------------

h_btDE_monologue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_btDE_monologue {
    LDA $scene_current
    CMP #$00DE
    BEQ code_0998C6
    CMP #$00DF
    BEQ code_0998E4
    COP [C1]
    RTL 
}

code_0998C6 {
    COP [D0] ( #D2, #01, &code_0998E2 )
    COP [CC] ( #D2 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [BF] ( &widestring_099914 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_0998E2 {
    COP [E0]
}

code_0998E4 {
    COP [D0] ( #D3, #01, &code_099912 )
    COP [C1]
    COP [45] ( #3F, #19, #40, #1D, &code_0998F5 )
    RTL 
}

code_0998F5 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    LDA #$0001
    JSL $@func_00C6E4
    COP [CC] ( #D3 )
    COP [BF] ( &widestring_099952 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_099912 {
    COP [E0]
}

widestring_099914 `[TPL:A][TPL:0]The Tower of Babel was[N]deathly quiet. Time[N]stood still...[END]`

widestring_099952 `[TPL:9][TPL:0]The Flute I had was[N][LU2:5B]here.[END]`