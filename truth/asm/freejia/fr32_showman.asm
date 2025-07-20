?BANK 05

!joypad_mask_std                065A

---------------------------------------------

h_fr32_showman [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_showman {
    COP [0B]
    COP [C0] ( &code_05BDB6 )
    COP [D2] ( #0F, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [84] ( #04, #3C )
    COP [8A]
    COP [A2] ( @code_05BDEB, #$1002 )
    COP [DA] ( #B3 )
    COP [0C]
    COP [86] ( #06, #02, #03 )
    COP [8A]
    COP [85] ( #08, #04, #04 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_05BDB6 {
    COP [BF] ( &widestring_05BDBE )
    COP [CC] ( #0F )
    RTL 
}

widestring_05BDBE `[DEF]No one can put on a[N]show [LU1:A5]I can.[N][LU2:14]a look![END]`

code_05BDEB {
    COP [07] ( #21 )
    COP [84] ( #32, #3C )
    COP [8A]
    COP [84] ( #33, #0F )
    COP [8A]
    COP [80] ( #34 )
    COP [89]
    COP [C1]
    LDY $04
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    RTL 
}