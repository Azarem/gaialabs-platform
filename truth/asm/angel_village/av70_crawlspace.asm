
!scene_current                  0644
!player_y_pos                   09A4
!player_flags                   09AE

---------------------------------------------

h_av70_crawlspace [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_av70_crawlspace {
    LDA $scene_current
    CMP #$0070
    BEQ code_06D64C
    COP [C1]
    LDA $player_y_pos
    CMP #$01D0
    BEQ code_06D645
    RTL 
}

code_06D645 {
    COP [40] ( #$0400, &code_06D65E )
    RTL 
}

code_06D64C {
    COP [C1]
    LDA $player_y_pos
    CMP #$02D0
    BEQ code_06D657
    RTL 
}

code_06D657 {
    COP [40] ( #$0400, &code_06D65E )
    RTL 
}

code_06D65E {
    LDA $player_flags
    BIT #$0002
    BEQ code_06D667
    RTL 
}

code_06D667 {
    COP [BF] ( &widestring_06D66C )
    RTL 
}

widestring_06D66C `[TPL:A][TPL:0]The entrance is[N]too small![PAL:0][END]`