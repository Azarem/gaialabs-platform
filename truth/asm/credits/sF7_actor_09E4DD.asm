?INCLUDE 'func_09E8E4'


---------------------------------------------

h_sF7_actor_09E4DD [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sF7_actor_09E4DD {
    COP [99] ( @e_actor_09E464 )

  code_09E4E5:
    COP [C1]
    RTL 

  code_09E4E8:
    LDA #$0025
    JSL $@func_09E8E4

  code_09E4EE:
    COP [81] ( #00, #12 )
    COP [89]
    BRA code_09E4EE

  code_09E4F6:
    COP [81] ( #00, #11 )
    COP [89]
    BRA code_09E4F6

  code_09E4FE:
    COP [80] ( #00 )
    COP [89]
    BRA code_09E4FE

  code_09E505:
    COP [80] ( #1D )
    COP [89]
    BRA code_09E505

  code_09E50C:
    COP [81] ( #1D, #02 )
    COP [89]
    BRA code_09E50C

  code_09E514:
    COP [81] ( #1D, #01 )
    COP [89]
    BRA code_09E514

  code_09E51C:
    COP [80] ( #1F )
    COP [89]
    BRA code_09E51C

  code_09E523:
    COP [80] ( #20 )
    COP [89]
    BRA code_09E523

  code_09E52A:
    LDA #$0022
    JSL $@func_09E8E4

  code_09E530:
    COP [81] ( #23, #02 )
    COP [89]
    BRA code_09E530
}

---------------------------------------------

e_actor_09E464 {
    LDA $00E4
    BPL code_09E46A
    RTL 
}

code_09E46A {
    COP [69] ( #$0438 )
    COP [6A] ( &code_09E4E8 )
    COP [69] ( #$0528 )
    COP [6A] ( &code_09E4FE )
    COP [69] ( #$0B70 )
    COP [6A] ( &code_09E4F6 )
    COP [69] ( #$0C78 )
    COP [6A] ( &code_09E4E5 )
    COP [69] ( #$3F0C )
    COP [6A] ( &code_09E52A )
    COP [69] ( #$3F54 )
    COP [6A] ( &code_09E505 )
    COP [69] ( #$4164 )
    COP [6A] ( &code_09E50C )
    COP [69] ( #$417C )
    COP [6A] ( &code_09E505 )
    COP [69] ( #$4434 )
    COP [6A] ( &code_09E51C )
    COP [69] ( #$4470 )
    COP [6A] ( &code_09E505 )
    COP [69] ( #$447A )
    COP [6A] ( &code_09E523 )
    COP [69] ( #$44AC )
    COP [6A] ( &code_09E505 )
    COP [69] ( #$46C8 )
    COP [6A] ( &code_09E514 )
    COP [69] ( #$4748 )
    COP [6A] ( &code_09E4E5 )
    COP [C1]
    RTL 
}