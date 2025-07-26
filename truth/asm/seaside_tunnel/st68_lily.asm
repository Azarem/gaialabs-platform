
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A

---------------------------------------------

h_st68_lily [
  h_actor < #23, #00, #10 >   ;00
]

---------------------------------------------

e_st68_lily {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06B4FB )
}

code_list_06B4FB [
  &code_06B501   ;00
  &code_06B51F   ;01
  &code_06B571   ;02
]

code_06B501 {
    COP [D2] ( #01, #01 )
    COP [DA] ( #3F )
    COP [80] ( #25 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_06B578 )
    COP [D2] ( #04, #01 )
    COP [80] ( #23 )
    COP [89]
    COP [C1]
    RTL 
}

code_06B51F {
    COP [25] ( #11, #1C )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06B606 )
    COP [85] ( #28, #02, #12 )
    COP [8A]
    COP [84] ( #24, #28 )
    COP [8A]
    COP [85] ( #28, #02, #02 )
    COP [8A]
    COP [84] ( #24, #1E )
    COP [8A]
    COP [BF] ( &widestring_06B661 )
    LDA #$0003
    JSL $@func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_06B67B )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #68, #$0160, #$01C0, #00, #$2211 )
    COP [C1]
    RTL 
}

code_06B571 {
    COP [25] ( #19, #1D )
    COP [C1]
    RTL 
}

code_06B578 {
    COP [BF] ( &widestring_06B57D )
    RTL 
}

widestring_06B57D `[TPL:B][TPL:2]Lilly:[N][LU1:3D]are strange...[FIN]I am afraid the longer [N]we travel in [LU1:D6]tunnel, [N]the easier it [LU1:EF]be to [N][LU2:6A]why we are [LU2:74][FIN][LU1:30]all [LU1:6F][N][LU1:C1][LU1:F2][LU1:D7]way.[PAL:0][END]`

widestring_06B606 `[TPL:A][TPL:0]Eighth day in the [N]tunnel.[FIN]Unable to sleep. [N]I stared at an  [N]underground river.....[PAL:0][END]`

widestring_06B661 `[TPL:A][TPL:2]Lilly:[N]Can't sleep?[PAL:0][END]`

widestring_06B67B `[PAU:1E][TPL:B][TPL:0]Will: No. [N]I'm [LU1:AB]for [LU1:B7][N]mushrooms, [LU1:A3]kidding. [FIN][TPL:2][LU1:2A]Will. [N][LU1:67][LU1:7F]during [N][LU1:D6]journey. [FIN][LU1:49]you've [N]grown up. [FIN][TPL:0]Will: [N]I [LU1:82][LU1:E9]it [N]myself, but.... [FIN]I can use [LU1:D0]strange[N]power, and my [LU1:72]has[N][LU1:7F]to the body[N]of a warrior.[FIN]The [LU2:52][LU1:CC]to [N][LU1:98][LU1:CB][LU1:F6]my [N][LU2:67][LU2:C1]to the [N]Tower of Babel. [FIN]I'm [LU1:A3]starting to[N][LU1:E9][LU1:D7]power.[FIN]Why did you join this[N]dangerous expedition?[FIN][TPL:2][LU1:2A]At [LU2:61]it was [N][LU1:A3]for fun. But now [N][LU1:9F]a secret. Heh heh. [FIN]We [LU1:EF]walk all day [N]again tomorrow... [N][LU1:2B]get [LU1:D0]sleep...[PAL:0][END]`