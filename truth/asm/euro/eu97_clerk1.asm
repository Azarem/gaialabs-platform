
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_eu97_clerk1 [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_eu97_clerk1 {
    COP [0B]
    COP [C0] ( &code_07CBDE )
    COP [28] ( #$0170, #$00D0, &code_07CBA9 )
    COP [C1]
    RTL 
}

code_07CBA9 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [81] ( #08, #02 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [BF] ( &widestring_07CC0A )
    COP [9C] ( @code_07CBD3, #$2000 )
    COP [82] ( #06, #01 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [C1]
    RTL 
}

code_07CBD3 {
    LDY $player_actor
    LDA $0016, Y
    INC 
    STA $0016, Y
    RTL 
}

code_07CBDE {
    COP [BF] ( &widestring_07CBE3 )
    RTL 
}

widestring_07CBE3 `[TPL:A]Clerk: Going home?[N]Thank you [LU1:ED]much.[END]`

widestring_07CC0A `[TPL:A]Clerk: This is the[N]exit. [LU1:3B]use the[N]entrance![END]`