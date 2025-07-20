
!joypad_mask_std                065A

---------------------------------------------

h_fr32_slaver2 [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_slaver2 {
    COP [D0] ( #5A, #01, &code_05B87E )
    COP [0B]
    COP [C0] ( &code_05B880 )
    COP [DA] ( #07 )

  code_05B864:
    COP [80] ( #20 )
    COP [89]
    COP [D0] ( #5A, #00, &code_05B864 )
    COP [0C]
    COP [85] ( #20, #04, #02 )
    COP [8A]
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_05B87E {
    COP [E0]
}

code_05B880 {
    COP [BF] ( &widestring_05B8CD )
    COP [BE] ( #02, #02, &code_list_05B88A )
}

code_list_05B88A [
  &code_05B890   ;00
  &code_05B895   ;01
  &code_05B890   ;02
]

code_05B890 {
    COP [BF] ( &widestring_05B8F1 )
    RTL 
}

code_05B895 {
    COP [BF] ( &widestring_05B90C )
    COP [BE] ( #02, #02, &code_list_05B89F )
}

code_list_05B89F [
  &code_05B8A5   ;00
  &code_05B8AA   ;01
  &code_05B8A5   ;02
]

code_05B8A5 {
    COP [BF] ( &widestring_05B9AF+M )
    RTL 
}

code_05B8AA {
    COP [D0] ( #59, #01, &code_05B8B5 )
    COP [BF] ( &widestring_05B9AF )
    RTL 
}

code_05B8B5 {
    COP [D4] ( #01, &code_05B8C8 )
    COP [BF] ( &widestring_05B94D )
    COP [CC] ( #5A )
    LDA #$EFF0
    TSB $joypad_mask_std
    RTL 
}

code_05B8C8 {
    COP [BF] ( &widestring_05B9EE )
    RTL 
}

widestring_05B8CD `[DEF]A [LU2:7E]escaped.[N][LU2:14]you [LU2:A7]him?[N] Yes[N] No`

widestring_05B8F1 `[CLR]Hmm.[N][LU2:3B]me if you see him.[END]`

widestring_05B90C `[CLR][LU2:3B]me [LU1:F4]and I'll[N][LU1:97]you [LU1:D6]Red Jewel.[N] [LU2:3B]location.[N] Laugh and lie.`

widestring_05B94D `[CLR]Will tells [LU1:F4]the [N][LU2:7E]is hiding. [FIN][LU1:32]Thank you.[N]Here's a present.[N][LU1:3B]accept it.[FIN]Will [LU2:6D]a Red Jewel. [END]`

widestring_05B9AF `[CLR]But Will [LU1:84][LU1:A4][N][LU1:F4]the [LU2:7E]is. [FIN][::][CLR]Man:[N][LU2:15][LU1:D]play[N]jokes on an adult!![END]`

widestring_05B9EE `[CLR]Man:[N]Is [LU1:FE][LU1:A0]full?[N]Too bad...[END]`