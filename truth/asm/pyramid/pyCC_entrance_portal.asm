
?INCLUDE 'py_actor_08B6F4'

!player_actor                   09AA

---------------------------------------------

h_pyCC_entrance_portal [
  h_actor < #1C, #01, #10 >   ;00
]

---------------------------------------------

e_pyCC_entrance_portal {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08B6B1 )
    COP [C1]
    RTL 
}

code_08B6B1 {
    COP [BF] ( &widestring_08B70D )
    COP [BE] ( #02, #02, &code_list_08B6BB )
}

code_list_08B6BB [
  &code_08B6C1   ;00
  &code_08B6C1   ;01
  &code_08B6C6   ;02
]

code_08B6C1 {
    COP [BF] ( &widestring_08B74B )
    RTL 
}

code_08B6C6 {
    COP [BF] ( &widestring_08B74B )
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [9C] ( @e_py_actor_08B6F4, #$1800 )
    LDA #$0303
    STA $0648
    LDA #$0303
    STA $064A
    COP [26] ( #CC, #$01F8, #$0130, #03, #$4400 )
    RTL 
}

---------------------------------------------

widestring_08B70D `[TPL:B]The [LU2:58]to the Pyramid[N]appears in the light...[N] Quit[N] Jump in`

widestring_08B74B `[CLD]`