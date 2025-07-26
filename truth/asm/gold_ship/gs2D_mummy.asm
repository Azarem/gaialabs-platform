
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A

---------------------------------------------

h_gs2D_mummy [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_gs2D_mummy {
    LDA #$0200
    TSB $12
    COP [BC] ( #08, #00 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    COP [C0] ( &code_058B38 )
    COP [C1]
    RTL 
}

code_058B38 {
    COP [D0] ( #01, #01, &code_058B47 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #01 )
}

code_058B47 {
    COP [BF] ( &widestring_058B4F )
    COP [CC] ( #02 )
    RTL 
}

widestring_058B4F `[TPL:A][TPL:0]The Queen's mummy[N]sleeps silently.[FIN]There's a gold ring [N]on her long, slender, [N]bony finger...[PAL:0][END]`