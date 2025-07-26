
?INCLUDE 'func_00C806'

!joypad_mask_std                065A

---------------------------------------------

h_eu97_clerk2 [
  h_actor < #2C, #00, #03 >   ;00
]

---------------------------------------------

e_eu97_clerk2 {
    COP [28] ( #$0170, #$00D0, &code_07CC86 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [81] ( #30, #14 )
    COP [89]
    COP [80] ( #2C )
    COP [89]
    COP [BF] ( &widestring_07CC88 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [9C] ( @func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0004
    STA $7F0010, X
    LDA #$002A
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    LDA #$0800
    TSB $10
    COP [C1]
    COP [C1]
    COP [8B]
    RTL 
}

code_07CC86 {
    COP [E0]
}

widestring_07CC88 `[TPL:A]Clerk: [N]Aren't you Neil, [N][LU1:8E][LU1:D6]village?! [FIN][LU1:44]manages this[N]store, too.[FIN]I understand.[N][LU1:3B][LU1:E7]whatever[N]you like.[END]`