?INCLUDE 'thinker_00B7E0'
?INCLUDE 'thinker_00B7EA'
?INCLUDE 'table_0EDA00'

!joypad_mask_std                065A

---------------------------------------------

h_mu63_spirits [
  h_actor < #0E, #00, #30 >   ;00
]

---------------------------------------------

e_mu63_spirits {
    COP [45] ( #10, #00, #20, #10, &code_069AC1 )
    COP [D0] ( #7B, #01, &code_069AAE )
    COP [D2] ( #7B, #01 )
    COP [A0] ( @code_069ABB, #$0080, #$0058, #$1000 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #0F )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [3C] ( @e_thinker_00B7E0 )
    COP [DA] ( #BF )
    COP [A0] ( @code_069C14, #$0020, #$00C0, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$00E0, #$00C0, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$0040, #$0090, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$00C0, #$0090, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$0070, #$0070, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$0090, #$0070, #$1800 )
    COP [DA] ( #3B )
    COP [A0] ( @code_069BDA, #$0050, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [A0] ( @code_069BDA, #$0070, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [A0] ( @code_069BDA, #$0090, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [A0] ( @code_069BDA, #$00B0, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [BF] ( &widestring_069BAA )
    COP [08] ( #$2525 )
    COP [DA] ( #3B )
    COP [CC] ( #02 )
    COP [DA] ( #77 )
    COP [3C] ( @e_thinker_00B7EA )
    COP [DA] ( #7F )
    STZ $0688
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_069AAE {
    COP [A0] ( @code_069ABB, #$0080, #$0058, #$1000 )
    COP [E0]
}

code_069ABB {
    COP [80] ( #30 )
    COP [89]
    RTL 
}

code_069AC1 {
    COP [D0] ( #7E, #01, &code_069B9D )
    COP [D2] ( #7E, #01 )
    COP [A0] ( @code_069ABB, #$0180, #$0058, #$1000 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #0F )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [3C] ( @e_thinker_00B7E0 )
    COP [DA] ( #BF )
    COP [A0] ( @code_069C14, #$0120, #$00C0, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$01E0, #$00C0, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$0140, #$0090, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$01C0, #$0090, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$0170, #$0070, #$1800 )
    COP [DA] ( #27 )
    COP [A0] ( @code_069C14, #$0190, #$0070, #$1800 )
    COP [DA] ( #3B )
    COP [A0] ( @code_069BDA, #$0150, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [A0] ( @code_069BDA, #$0170, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [A0] ( @code_069BDA, #$0190, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [A0] ( @code_069BDA, #$01B0, #$00C8, #$1800 )
    COP [DA] ( #77 )
    COP [BF] ( &widestring_069BAA )
    COP [08] ( #$2525 )
    COP [DA] ( #3B )
    COP [CC] ( #02 )
    COP [DA] ( #77 )
    COP [3C] ( @e_thinker_00B7EA )
    COP [DA] ( #7F )
    STZ $0688
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_069B9D {
    COP [A0] ( @code_069ABB, #$0180, #$0058, #$1000 )
    COP [E0]
}

widestring_069BAA `[TPL:A]The Sun god...[N]Rama...[FIN]The [LU2:8A]holds[N]a power...[END]`

code_069BDA {
    COP [B6] ( #30 )
    COP [8D] ( #0E )
    COP [08] ( #$2626 )
    COP [CA] ( #1E )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]

  code_069BF5:
    COP [C2]
    COP [C1]
    COP [8B]
    COP [D0] ( #02, #00, &code_069BF5 )
    COP [CA] ( #1E )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
    COP [E0]
}

code_069C14 {
    COP [88] ( @table_0EDA00 )
    COP [08] ( #$2525 )

  code_069C1D:
    COP [80] ( #06 )
    COP [89]
    COP [D0] ( #02, #00, &code_069C1D )
    COP [E0]
}