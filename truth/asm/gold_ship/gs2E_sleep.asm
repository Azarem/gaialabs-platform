?INCLUDE 'entry_points_00C418'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_gs2E_sleep [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_gs2E_sleep {
    COP [C0] ( &code_0586AE )
    COP [0B]
    COP [D2] ( #4E, #01 )
    COP [D2] ( #4F, #01 )
    COP [DA] ( #01 )
    LDA #$0002
    STA $06F6
    COP [C1]
    COP [D0] ( #F8, #01, &code_05864F )
    RTL 
}

code_05864F {
    COP [C1]
    COP [45] ( #0B, #04, #0C, #06, &code_05865A )
    RTL 
}

code_05865A {
    COP [CA] ( #1E )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CB]
    COP [BF] ( &widestring_0586CC )
    LDY $player_actor
    LDA #$*func_00C45E
    STA $0002, Y
    LDA #$&func_00C45E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA $0016, Y
    SEC 
    SBC #$0008
    STA $0016, Y
    COP [DA] ( #3B )
    COP [CC] ( #4D )
    LDA #$0000
    STA $06F6
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #2A, #$00A0, #$0070, #03, #$1100 )
    RTL 
}

code_0586AE {
    COP [D0] ( #4E, #00, &code_0586C7 )
    COP [D0] ( #4F, #00, &code_0586C7 )
    COP [D0] ( #F8, #01, &code_0586C2 )
    BRA code_0586C7
}

code_0586C2 {
    COP [BF] ( &widestring_058759 )
    RTL 
}

code_0586C7 {
    COP [BF] ( &widestring_05870A )
    RTL 
}

widestring_0586CC `[DEF][TPL:0]Will: I fell [LU1:A1]a [N]deep sleep, and was [N]pulled [LU1:A2]a dream.[PAL:0][END]`

widestring_05870A `[DEF]Oh, King.[N][LU2:1A][LU1:6D]the ship?[FIN]But I expect you're[N]tired. Look around,[N][LU2:B6][LU2:9C]in [LU1:D6]bed.[END]`

widestring_058759 `[DEF]I'm sorry [LU1:D7][LU1:9F]so[N]shabby, but [LU2:8E]try[N]to get [LU1:D0]rest.[END]`