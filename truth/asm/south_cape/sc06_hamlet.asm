
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_sc06_hamlet [
  h_actor < #23, #00, #10 >   ;00
]

---------------------------------------------

e_sc06_hamlet {
    COP [D0] ( #1B, #01, &code_04A2EB )
    COP [D0] ( #3D, #01, &code_04A2ED )
    COP [D0] ( #16, #00, &code_04A2EB )
    COP [C0] ( &code_04A30C )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [84] ( #27, #02 )
    COP [8A]
    COP [80] ( #23 )
    COP [89]
    COP [BF] ( &widestring_04A311 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [0B]
    COP [C1]
    COP [28] ( #$0038, #$01A0, &code_04A238 )
    COP [28] ( #$0038, #$019F, &code_04A238 )
    COP [28] ( #$0038, #$019E, &code_04A238 )
    COP [28] ( #$0038, #$019D, &code_04A238 )
    COP [28] ( #$0038, #$019C, &code_04A238 )
    RTL 
}

code_04A238 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [CA] ( #1E )
    LDY $player_actor
    LDA #$0038
    STA $0014, Y
    LDA #$01A0
    STA $0016, Y
    COP [CB]
    COP [82] ( #26, #01 )
    COP [89]
    COP [85] ( #28, #06, #02 )
    COP [8A]
    COP [82] ( #27, #12 )
    COP [89]
    COP [84] ( #29, #04 )
    COP [8A]
    COP [9C] ( @code_04A2F9, #$2000 )
    COP [85] ( #29, #08, #11 )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    COP [CC] ( #01 )
    LDA #$0800
    TSB $10

  code_04A288:
    COP [80] ( #25 )
    COP [89]
    COP [D0] ( #02, #00, &code_04A288 )
    COP [82] ( #27, #12 )
    COP [89]
    COP [85] ( #29, #06, #11 )
    COP [8A]
    COP [82] ( #26, #11 )
    COP [89]
    COP [85] ( #29, #04, #11 )
    COP [8A]
    COP [82] ( #27, #12 )
    COP [89]
    COP [0B]

  code_04A2B5:
    COP [80] ( #28 )
    COP [89]
    COP [D0] ( #04, #00, &code_04A2B5 )
    COP [0C]
    COP [25] ( #0D, #1A )

  code_04A2C6:
    COP [80] ( #28 )
    COP [89]
    COP [D0] ( #09, #00, &code_04A2C6 )
    LDA #$0800
    TSB $10
    COP [86] ( #26, #03, #11 )
    COP [8A]
    COP [85] ( #28, #10, #12 )
    COP [8A]
    COP [86] ( #26, #03, #11 )
    COP [8A]
}

code_04A2EB {
    COP [E0]
}

code_04A2ED {
    COP [25] ( #0B, #19 )
    COP [0B]
    COP [C0] ( &code_04A30C )
    BRA code_04A2B5
}

code_04A2F9 {
    COP [CA] ( #40 )
    LDY $player_actor
    LDA $0014, Y
    INC 
    STA $0014, Y
    COP [C2]
    COP [CB]
    COP [E0]
}

code_04A30C {
    COP [BF] ( &widestring_04A356 )
    RTL 
}

widestring_04A311 `[TPL:9][TPL:0]The pig's wrecking[N]the room![FIN]But why is there[N]a pig in my house?[END]`

widestring_04A356 `[TPL:8][LU1:3A] oink[END]`