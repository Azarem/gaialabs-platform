
?INCLUDE 'func_09E8E4'

---------------------------------------------

h_sF7_actor_09E607 [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sF7_actor_09E607 {
    COP [99] ( @func_09E5DE )

  code_09E60F:
    COP [C1]
    RTL 

  code_09E612:
    LDA #$0035
    JSL $@func_09E8E4

  code_09E618:
    COP [81] ( #02, #12 )
    COP [89]
    BRA code_09E618

  code_09E620:
    COP [81] ( #02, #11 )
    COP [89]
    BRA code_09E620

  code_09E628:
    COP [80] ( #02 )
    COP [89]
    BRA code_09E628
}

---------------------------------------------

func_09E5DE {
    LDA $00E4
    BPL code_09E5E4
    RTL 
}

code_09E5E4 {
    COP [69] ( #$0564 )
    COP [6A] ( &code_09E612 )
    COP [69] ( #$0624 )
    COP [6A] ( &code_09E628 )
    COP [69] ( #$099C )
    COP [6A] ( &code_09E620 )
    COP [69] ( #$0A74 )
    COP [6A] ( &code_09E60F )
    COP [C1]
    RTL 
}