
?INCLUDE 'func_09E8E4'

---------------------------------------------

h_sF7_actor_09E3EB [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sF7_actor_09E3EB {
    COP [99] ( @e_actor_09E31A )

  code_09E3F3:
    COP [C1]
    RTL 

  code_09E3F6:
    COP [80] ( #03 )
    COP [89]
    BRA code_09E3F6

  code_09E3FD:
    COP [81] ( #03, #11 )
    COP [89]
    BRA code_09E3FD

  code_09E405:
    COP [80] ( #04 )
    COP [89]
    BRA code_09E405

  code_09E40C:
    COP [80] ( #05 )
    COP [89]
    BRA code_09E40C

  code_09E413:
    COP [80] ( #06 )
    COP [89]
    BRA code_09E413

  code_09E41A:
    COP [81] ( #06, #01 )
    COP [89]
    BRA code_09E41A

  code_09E422:
    COP [80] ( #07 )
    COP [89]
    BRA code_09E422

  code_09E429:
    COP [81] ( #07, #01 )
    COP [89]
    BRA code_09E429

  code_09E431:
    LDA #$0031
    JSL $@func_09E8E4

  code_09E437:
    COP [81] ( #08, #01 )
    COP [89]
    BRA code_09E437

  code_09E43F:
    COP [80] ( #2E )
    COP [89]
    BRA code_09E43F

  code_09E446:
    COP [81] ( #2E, #02 )
    COP [89]
    BRA code_09E446

  code_09E44E:
    COP [81] ( #2E, #01 )
    COP [89]
    BRA code_09E44E

  code_09E456:
    LDA #$0042
    JSL $@func_09E8E4

  code_09E45C:
    COP [81] ( #33, #02 )
    COP [89]
    BRA code_09E45C
}

---------------------------------------------

e_actor_09E31A {
    LDA $00E4
    BPL code_09E320
    RTL 
}

code_09E320 {
    COP [69] ( #$1770 )
    COP [6A] ( &code_09E431 )
    COP [69] ( #$17E8 )
    COP [6A] ( &code_09E422 )
    COP [69] ( #$17EB )
    COP [6A] ( &code_09E40C )
    COP [69] ( #$17EE )
    COP [6A] ( &code_09E413 )
    COP [69] ( #$17F2 )
    COP [6A] ( &code_09E405 )
    COP [69] ( #$17F6 )
    COP [6A] ( &code_09E422 )
    COP [69] ( #$17FB )
    COP [6A] ( &code_09E40C )
    COP [69] ( #$1800 )
    COP [6A] ( &code_09E413 )
    COP [69] ( #$1806 )
    COP [6A] ( &code_09E405 )
    COP [69] ( #$180C )
    COP [6A] ( &code_09E422 )
    COP [69] ( #$1813 )
    COP [6A] ( &code_09E40C )
    COP [69] ( #$181A )
    COP [6A] ( &code_09E413 )
    COP [69] ( #$1822 )
    COP [6A] ( &code_09E405 )
    COP [69] ( #$182A )
    COP [6A] ( &code_09E422 )
    COP [69] ( #$1968 )
    COP [6A] ( &code_09E429 )
    COP [69] ( #$1988 )
    COP [6A] ( &code_09E41A )
    COP [69] ( #$19B0 )
    COP [6A] ( &code_09E3F6 )
    COP [69] ( #$1E78 )
    COP [6A] ( &code_09E3FD )
    COP [69] ( #$1F70 )
    COP [6A] ( &code_09E3F3 )
    COP [69] ( #$3DA4 )
    COP [6A] ( &code_09E456 )
    COP [69] ( #$3DEC )
    COP [6A] ( &code_09E43F )
    COP [69] ( #$4164 )
    COP [6A] ( &code_09E446 )
    COP [69] ( #$417C )
    COP [6A] ( &code_09E43F )
    COP [69] ( #$46C8 )
    COP [6A] ( &code_09E44E )
    COP [69] ( #$4748 )
    COP [6A] ( &code_09E3F3 )
    COP [C1]
    RTL 
}