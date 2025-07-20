
!joypad_mask_std                065A

---------------------------------------------

h_pyDD_mystic_statue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDD_mystic_statue {
    COP [C1]
    LDA $0AEC
    BEQ code_08CE1D
    RTL 
}

code_08CE1D {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [BF] ( &widestring_08CE60 )
    LDA #$0004
    STA $0AAC
    LDA #$00CD
    STA $0B12
    LDA #$0007
    STA $0B08
    STA $0B0A
    LDA #$0009
    STA $0B0C
    STA $0B0E
    LDA #$0000
    STA $0B10
    COP [26] ( #FD, #$0000, #$0000, #00, #$1100 )
    LDA #$0000
    STA $0AD4
    COP [E0]
}

widestring_08CE60 `[DEF][TPL:0][LU2:6]the spirit[N]of the Pyramid,[N]he obtained[N]a Mystic Statue!![PAL:0][END]`