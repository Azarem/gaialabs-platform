
?INCLUDE 'chunk_008000'
?INCLUDE 'table_0EE000'
?INCLUDE 'f_inventory_full'

---------------------------------------------

h_gw82_necklace_stone [
  h_actor < #02, #01, #10 >   ;00
]

---------------------------------------------

e_gw82_necklace_stone {
    LDA #$0200
    TSB $12
    LDA $0E
    STA $24
    PHX 
    TAX 
    LDA $@flag_array, X
    AND #$00FF
    PLX 
    JSL $@func_00B4B7
    BCS code_07B5EF
    LDA #$2000
    STA $0E
    COP [88] ( @table_0EE000 )
    COP [C0] ( &code_07B5D2 )

  code_07B5C8:
    COP [80] ( #02 )
    COP [89]
    COP [DA] ( #3B )
    BRA code_07B5C8
}

code_07B5D2 {
    COP [BF] ( &widestring_07B611 )
    COP [D6] ( #17, &code_07B5E0 )
    COP [D4] ( #17, &code_07B5F1 )
}

code_07B5E0 {
    PHX 
    LDX $24
    LDA $@flag_array, X
    AND #$00FF
    PLX 
    JSL $@func_00B4BE
}

code_07B5EF {
    COP [E0]
}

code_07B5F1 {
    JML $@f_inventory_full
}

---------------------------------------------

flag_array [
  #98   ;00
  #99   ;01
  #9A   ;02
  #9B   ;03
  #9C   ;04
]

---------------------------------------------

widestring_07B5FA `[TPL:A][TPL:0]A small [LU2:9D]falls.[PAL:0][END]`

widestring_07B611 `[TPL:A][TPL:0]A small [LU2:9D]falls.[FIN]Ha! This is part of the [N]necklace Lance [LU1:B3][N]for Lilly! [FIN]I picked up the stones.[PAL:0][END]`