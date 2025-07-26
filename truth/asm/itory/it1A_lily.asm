
?INCLUDE 'func_00C806'

!joypad_mask_std                065A

---------------------------------------------

h_it1A_lily [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_it1A_lily {
    COP [D0] ( #4A, #01, &code_04F4E9 )
    COP [9C] ( @code_04F77B, #$2000 )
    COP [9C] ( @code_04F828, #$2000 )
    COP [D0] ( #49, #01, &code_04F4C0 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04F53C )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$1000
    TRB $10
    LDA #$0300
    TSB $10
    COP [9C] ( @func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0004
    STA $7F0010, X
    LDA #$001A
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    COP [C0] ( #$0000 )
    COP [C1]
    COP [C1]
    COP [8B]
    COP [D0] ( #49, #01, &code_04F4AC )
    RTL 
}

code_04F4AC {
    COP [A9]
    LDA #$0000
    STA $2A
    COP [C2]
    COP [BF] ( &widestring_04F575 )
    COP [C0] ( &code_04F4EB )
    COP [C1]
    RTL 
}

code_04F4C0 {
    COP [25] ( #0D, #1A )
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C0] ( &code_04F4F0 )
    COP [D2] ( #4A, #01 )
    COP [0C]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [85] ( #21, #04, #01 )
    COP [8A]
    COP [86] ( #1E, #03, #01 )
    COP [8A]
}

code_04F4E9 {
    COP [E0]
}

code_04F4EB {
    COP [BF] ( &widestring_04F575 )
    RTL 
}

code_04F4F0 {
    COP [D6] ( #04, &code_04F4FA )
    COP [BF] ( &widestring_04F591 )
    RTL 
}

code_04F4FA {
    COP [CC] ( #4A )
    COP [BF] ( &widestring_04F5EA )
    COP [BE] ( #02, #02, &code_list_04F507 )
}

code_list_04F507 [
  &code_04F50D   ;00
  &code_04F511   ;01
  &code_04F50D   ;02
]

code_04F50D {
    COP [BF] ( &widestring_04F653 )
}

code_04F511 {
    COP [BF] ( &widestring_04F68F )
    LDA #$0000
    STA $0D60
    LDA #$0002
    STA $0D62
    LDA #$0404
    STA $064A
    COP [65] ( #$0094, #$0254, #00, #06 )
    COP [26] ( #1C, #$0070, #$0160, #00, #$2200 )
    COP [C1]
    RTL 
}

widestring_04F53C `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A]Ah, we've[N]arrived. This is the[N][LU1:31]Tribe's home.[END]`

widestring_04F575 `[DLG:3,6][SIZ:D,3][TPL:2]Lilly:[N][LU1:1F]wait here.[END]`

widestring_04F591 `[DLG:3,6][SIZ:D,3][TPL:2]Lilly:[N][LU1:62]happened?[FIN]......... I can see[N]in [LU1:FE]face.....[FIN][LU1:D]be depressed,[N]try again.[END]`

widestring_04F5EA `[DLG:3,6][SIZ:D,4][TPL:2]Lilly:[N]Oh, [LU1:D7]statue![N]You are great!! [FIN]There are two statues. [N]Go to the Incan ruins? [N][PAL:0] Yes[N] No`

widestring_04F653 `[CLR][TPL:2][LU1:2A][N]Will, I [LU1:A4]you're. [N]lying. You [LU1:B2]go [N]no [LU1:B8][LU1:F7]you say. [FIN]`

widestring_04F68F `[CLR][TPL:0]Will: [N]Yes. My [LU2:67][N]summoned me... [FIN]I [LU1:82][LU1:F1]to fight [N]the demons, but if my [N][LU1:92]alive, [LU1:1F]risk [N][LU1:6C]to see him. [FIN]You [LU1:82]really[N][LU1:E9][LU2:BC]you[N][LU2:81][LU1:FE]parents...[FIN][TPL:2]Lilly:[N]Typical....[FIN]I understand.[N][LU1:2B]go to the ruins.[FIN][PAL:0][SFX:10]They headed to [N]the Incan ruins. [END]`

code_04F77B {
    COP [0F] ( #15, #1C )
    COP [0F] ( #16, #1C )

  code_04F783:
    COP [C1]
    COP [D0] ( #4A, #01, &code_04F7B7 )
    COP [45] ( #15, #1B, #17, #1C, &code_04F794 )
    RTL 
}

code_04F794 {
    COP [40] ( #$0400, &code_04F79F )
    COP [C4] ( @code_04F783 )
}

code_04F79F {
    COP [D0] ( #49, #01, &code_04F7AE )
    COP [BF] ( &widestring_04F7C1 )
    COP [C4] ( @code_04F783 )
}

code_04F7AE {
    COP [BF] ( &widestring_04F7F7 )
    COP [C4] ( @code_04F783 )
}

code_04F7B7 {
    COP [10] ( #15, #1C )
    COP [10] ( #16, #1C )
    COP [E0]
}

widestring_04F7C1 `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A]Wait! We came[N][LU2:73]for a reason! We[N][LU1:78][LU1:A3]leave![END]`

widestring_04F7F7 `[DLG:3,6][SIZ:D,3][TPL:0]Will: [N](I [LU1:78]go [LU1:F8]the [N]Incan Statue...)[PAL:0][END]`

code_04F828 {
    COP [0F] ( #0C, #18 )
    COP [D0] ( #2A, #01, &code_04F857 )

  code_04F832:
    COP [C1]
    COP [45] ( #0C, #19, #0D, #1A, &code_04F83D )
    RTL 
}

code_04F83D {
    COP [40] ( #$0800, &code_04F848 )
    COP [C4] ( @code_04F832 )
}

code_04F848 {
    COP [D0] ( #2A, #01, &code_04F857 )
    COP [BF] ( &widestring_04F860 )
    COP [C4] ( @code_04F832 )
}

code_04F857 {
    COP [CC] ( #49 )
    COP [10] ( #0C, #18 )
    COP [E0]
}

widestring_04F860 `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A][LU1:2B][LU2:AC]to the[N][LU1:31]Tribe, and then[N][LU1:98]a [LU1:A9]around.[END]`