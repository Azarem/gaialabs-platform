?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A

---------------------------------------------

h_na4B_lily [
  h_actor < #23, #00, #10 >   ;00
]

---------------------------------------------

e_na4B_lily {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_05F0B6 )
    COP [0C]
    COP [86] ( #26, #0C, #11 )
    COP [8A]
    COP [85] ( #29, #06, #11 )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05F0BB )
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [25] ( #10, #09 )
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05F0B6 )
    COP [D2] ( #03, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #27 )
    COP [BF] ( &widestring_05F148 )
    COP [0C]
    COP [81] ( #28, #02 )
    COP [89]
    COP [CC] ( #08 )
    LDA #$0002
    JSL $@func_00C6E4
    COP [81] ( #28, #02 )
    COP [89]
    COP [80] ( #24 )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_05F160 )
    COP [CC] ( #0A )
    COP [D2] ( #09, #01 )
    COP [C0] ( &code_05F0C3 )
    COP [0C]
    COP [85] ( #29, #02, #01 )
    COP [8A]
    COP [86] ( #26, #0B, #01 )
    COP [8A]
    COP [85] ( #29, #05, #01 )
    COP [8A]
    COP [86] ( #26, #07, #01 )
    COP [8A]
    COP [81] ( #29, #01 )
    COP [89]
    COP [80] ( #25 )
    COP [89]
    COP [0B]
    COP [D2] ( #0C, #01 )
    COP [80] ( #22 )
    COP [89]
    LDA #$0800
    TSB $10
    COP [D2] ( #0D, #01 )
    COP [81] ( #29, #11 )
    COP [89]
    COP [82] ( #27, #12 )
    COP [89]
    COP [80] ( #23 )
    COP [89]
    COP [C1]
    RTL 
}

code_05F0B6 {
    COP [BF] ( &widestring_05F0C8 )
    RTL 
}

code_05F0BB {
    COP [BF] ( &widestring_05F0FE )
    COP [CC] ( #07 )
    RTL 
}

code_05F0C3 {
    COP [BF] ( &widestring_05F1C3 )
    RTL 
}

widestring_05F0C8 `[DEF][TPL:2][LU1:2A]The ancients were[N]amazing. I [LU1:F9]why[N][LU2:AB][LU1:B3]this...[PAL:0][END]`

widestring_05F0FE `[DEF][TPL:2][LU1:2A]Doesn't there[N][LU2:9E]to be a pattern in[N]the way the rocks are[N][LU2:9F]around?[PAL:0][END]`

widestring_05F148 `[DEF][TPL:2][LU1:2A]Aaaah![N][LU1:20]got it!!![END]`

widestring_05F160 `[PAU:28][DEF][TPL:2][DLY:0]Look! Look [LU1:F4]the[N]rocks are on the ground![FIN][LU1:5D]positioned like[N]the stars in the[N][LU1:7E]of Cygnus![PAL:0][END]`

widestring_05F1C3 `[DEF][TPL:2][LU1:2A]A riddle[N]in a constellation.[N]Kind of romantic.[PAL:0][END]`