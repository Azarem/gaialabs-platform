?INCLUDE 'func_09E8E4'


---------------------------------------------

h_sF7_actor_09E591 [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sF7_actor_09E591 {
    COP [99] ( @e_actor_09E538 )

  code_09E599:
    COP [C1]
    RTL 

  code_09E59C:
    LDA #$0042
    JSL $@func_09E8E4

  code_09E5A2:
    COP [81] ( #01, #12 )
    COP [89]
    BRA code_09E5A2

  code_09E5AA:
    COP [81] ( #01, #11 )
    COP [89]
    BRA code_09E5AA

  code_09E5B2:
    COP [80] ( #01 )
    COP [89]
    BRA code_09E5B2

  code_09E5B9:
    LDA #$0032
    JSL $@func_09E8E4

  code_09E5BF:
    COP [81] ( #2B, #02 )
    COP [89]
    BRA code_09E5BF

  code_09E5C7:
    COP [80] ( #27 )
    COP [89]
    BRA code_09E5C7

  code_09E5CE:
    COP [81] ( #27, #02 )
    COP [89]
    BRA code_09E5CE

  code_09E5D6:
    COP [81] ( #27, #01 )
    COP [89]
    BRA code_09E5D6
}

---------------------------------------------

e_actor_09E538 {
    LDA $00E4
    BPL code_09E53E
    RTL 
}

code_09E53E {
    COP [69] ( #$04B0 )
    COP [6A] ( &code_09E59C )
    COP [69] ( #$05A0 )
    COP [6A] ( &code_09E5B2 )
    COP [69] ( #$0AC8 )
    COP [6A] ( &code_09E5AA )
    COP [69] ( #$0BD0 )
    COP [6A] ( &code_09E599 )
    COP [69] ( #$3FFC )
    COP [6A] ( &code_09E5B9 )
    COP [69] ( #$402C )
    COP [6A] ( &code_09E5C7 )
    COP [69] ( #$4164 )
    COP [6A] ( &code_09E5CE )
    COP [69] ( #$417C )
    COP [6A] ( &code_09E5C7 )
    COP [69] ( #$46C8 )
    COP [6A] ( &code_09E5D6 )
    COP [69] ( #$4748 )
    COP [6A] ( &code_09E599 )
    COP [C1]
    RTL 
}