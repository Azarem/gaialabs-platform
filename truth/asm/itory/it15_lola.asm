
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A

---------------------------------------------

h_it15_lola [
  h_actor < #32, #00, #10 >   ;00
]

---------------------------------------------

e_it15_lola {
    COP [C0] ( &code_04F114 )
    COP [0B]
    COP [D0] ( #47, #01, &code_04F0C6 )
    COP [D0] ( #3B, #01, &code_04F0C3 )
    COP [C1]
    COP [45] ( #40, #26, #42, #28, &code_04F0CC )
    RTL 
}

code_04F0C3 {
    COP [C1]
    RTL 
}

code_04F0C6 {
    COP [C0] ( &code_04F119 )
    BRA code_04F0C3
}

code_04F0CC {
    COP [CC] ( #3B )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0003
    JSL $@func_00C6E4
    COP [80] ( #34 )
    COP [89]
    COP [BF] ( &widestring_04F11E )
    COP [84] ( #32, #08 )
    COP [8A]
    COP [84] ( #35, #08 )
    COP [8A]
    COP [BF] ( &widestring_04F1BA )
    COP [84] ( #32, #08 )
    COP [8A]
    COP [84] ( #34, #08 )
    COP [8A]
    COP [BF] ( &widestring_04F210 )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [80] ( #32 )
    COP [89]
    COP [C1]
    RTL 
}

code_04F114 {
    COP [BF] ( &widestring_04F249 )
    RTL 
}

code_04F119 {
    COP [BF] ( &widestring_04F277 )
    RTL 
}

widestring_04F11E `[TPL:E][TPL:3][LU1:2E]Will! Will! [N]Over here! [FIN][TPL:4]Bill:[N][LU1:69]safe.[N]Good...good...[FIN][TPL:3]Lola:[N]A [LU1:DE]thing[N][LU1:9D]to us![FIN]A man [LU2:54]the Jackal[N][LU1:80]to the [LU2:70][N][LU1:F0][LU1:D0]soldiers... [FIN][TPL:4][LU1:6]He[N][LU2:47]got us![PAL:0][END]`

widestring_04F1BA `[TPL:E][TPL:3][LU1:2E][LU1:1A][N]panicked. [FIN]I [LU2:59][LU1:E1][N]digestion [LU1:F0]a [N]poisoned marsupial pie. [FIN]Then I ran away.[PAL:0][END]`

widestring_04F210 `[TPL:F][TPL:3][LU1:2E]Lilly,  [N]thank [LU2:C7]I [LU1:83][N][LU1:A4][LU1:D7]Princess [N][LU1:26]came, too.[PAL:0][END]`

widestring_04F249 `[TPL:F][TPL:3][LU1:2E]I'm afraid that[N][LU1:C8]bad[N]is [LU1:93]to happen.[PAL:0][END]`

widestring_04F277 `[TPL:F][TPL:3]Lola:[N]There's an old legend[N]in [LU1:D6]village.[FIN]A child [LU1:F0]a good[N]heart who controls the[N][LU1:C][LU2:25][LU1:EF]set out[N]to [LU1:D1]the world...[FIN]At [LU1:D7]time, a huge[N][LU1:7B][LU1:EF]enter Earth's[N]orbit, and a [LU1:C]Power[N][LU1:EF]arise...[FIN][LU1:5E]are the words of [N]the Itory legend.[PAL:0][END]`