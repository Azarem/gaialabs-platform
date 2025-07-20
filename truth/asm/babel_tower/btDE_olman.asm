?INCLUDE 'table_0EDA00'
?INCLUDE 'chunk_028000'
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_btDE_olman [
  h_actor < #00, #01, #10 >   ;00
]

---------------------------------------------

e_btDE_olman {
    LDA #$1200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #02 )
    COP [D0] ( #FD, #01, &code_098891 )
    COP [0B]
    COP [C0] ( &code_0988D2 )
    COP [D2] ( #01, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [C0] ( #$0000 )
    COP [9E] ( @code_0988DA, #$0000, #$FFE0, #$1800 )
    COP [04] ( #0E )
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_0989A2 )
    COP [05] ( #1B )
    COP [DB] ( #$012B )
    COP [C1]
    JSL $@func_02A10A
    BCC code_098857
    RTL 
}

code_098857 {
    COP [DA] ( #1D )
    LDA #$0005
    STA $0AAC
    LDA #$00DE
    STA $0B12
    LDA #$0017
    STA $0B08
    STA $0B0A
    LDA #$000B
    STA $0B0C
    STA $0B0E
    LDA #$1201
    STA $0B10
    LDA #$0104
    STA $064A
    COP [26] ( #FD, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

code_098891 {
    COP [9E] ( @code_0988F3, #$0000, #$FFE0, #$1800 )
    LDA #$0001
    JSL $@func_00C6E4
    LDY $player_actor
    LDA #$0001
    STA $0028, Y
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_098CAA )
    LDA #$0003
    STA $0648
    LDA #$0404
    STA $064A
    COP [26] ( #E4, #$00F0, #$0140, #80, #$2200 )
    COP [C1]
    RTL 
}

code_0988D2 {
    COP [BF] ( &widestring_098903 )
    COP [CC] ( #01 )
    RTL 
}

code_0988DA {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [CA] ( #28 )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
}

code_0988F3 {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [C1]
    COP [80] ( #04 )
    COP [89]
    RTL 
}

widestring_098903 `[TPL:9][TPL:0][SFX:0]One worn-out [LU1:72]is[N]quietly laid down...[FIN]In his head, a familiar [N][LU1:EE]speaks. [FIN][TPL:4][SFX:10][DLY:2]Will. [LU1:1D]me, [N]Olman, [LU1:FE]father. [FIN]My [LU1:72]has decayed, but[N]I [LU1:AF]on [LU1:A5]this...[PAL:0][END]`

widestring_0989A2 `[TPL:B][TPL:0][DLY:1]Will: Father![N]Why are you in that[N]form!!![FIN][TPL:4][DLY:2]There's a [LU1:C7]room[N]in the Tower of Babel,[N]filled [LU1:F0]the light[N]of the comet.[FIN]Time goes so fast there[N][LU1:D7][LU1:C1]evolve[N][LU1:ED]quickly...[FIN][TPL:0][DLY:1]Will: [N]Why are [LU1:26]and I [N]able to live?! [FIN][TPL:4][DLY:2]Will's father: [N]Because you two are [N]evolved humans. [FIN][TPL:1][DLY:1][LU1:25][N]Us...? [FIN][TPL:4][DLY:2]Will's father: Long ago [N][LU1:D9]existed biological [N]technology using the [N][LU1:A8]of the comet. [FIN][LU1:3D]freely [LU2:BB]the[N][LU1:C2]to make[N]plants and animals.[FIN]For example, [LU2:AB][LU1:B3][N]the camel. It can go [N]for [LU1:A6]periods [N][LU1:F8]food or water. [FIN][LU1:61][LU1:C1]realized the[N][LU1:C2][LU1:7A]be [LU2:BB]as[N]a weapon,[N][LU1:87][LU1:F2]developed.[FIN]The [LU1:F5]was on the[N]brink of ruin...[FIN]At [LU1:D7]time, the Knights [N]of Darkness and Light [N][LU1:F2]developed to decide [N]the [LU2:6B]of humanity. [FIN]They are [LU1:FE]ancestors.[FIN]The six Mystic Statues[N][LU1:F2][LU1:B3]by the[N]Knights.[FIN]The [LU2:79]Mystic [LU1:48][N]is entrusted to [LU2:C7][END]`

widestring_098CAA `[TPL:B][TPL:4][DLY:2][LU2:38]the [LU1:7B][LU1:EF][N]be [LU1:ED]close.[FIN][PAU:1E]By then, the two of you [N][LU1:B2]go to the roof [N]of the tower. [N][PAU:28][DLY:4]Close [LU1:FE]eyes....[END]`