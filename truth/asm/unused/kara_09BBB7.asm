

---------------------------------------------

h_kara_09BBB7 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_kara_09BBB7 {
    LDA #$0800
    TSB $10
    LDA #$1000
    TSB $12
    COP [9C] ( @code_09BBCE, #$2000 )
    COP [C1]
    RTL 
}

code_09BBCE {
    COP [DA] ( #03 )
    LDA #$0078
    STA $24

  code_09BBD6:
    COP [0A] ( #00 )
    COP [BF] ( &widestring_09BBF7 )
    COP [04] ( #02 )
    COP [DA] ( #3B )
    COP [0A] ( #00 )
    COP [BF] ( &widestring_09BBF7 )
    COP [04] ( #04 )
    COP [DA] ( #3B )
    COP [40] ( #$0080, &code_09BBD6 )
    RTL 
}

widestring_09BBF7 `[DLG:3,6][SIZ:D,3][TPL:1][LU1:25][LU1:1D]terrible! [N]Leave me alone! How [N]far [LU1:EF]you go?![PAL:0][END]`