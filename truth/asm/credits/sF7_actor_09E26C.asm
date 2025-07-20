?INCLUDE 'func_09E8E4'


---------------------------------------------

h_sF7_actor_09E26C [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sF7_actor_09E26C {
    COP [99] ( @e_actor_09E14B )
    COP [88] ( $7E6000 )

  code_09E279:
    COP [C1]
    RTL 

  code_09E27C:
    COP [80] ( #00 )
    COP [89]
    BRA code_09E27C

  code_09E283:
    COP [80] ( #01 )
    COP [89]
    BRA code_09E283

  code_09E28A:
    COP [80] ( #02 )
    COP [89]
    BRA code_09E28A

  code_09E291:
    LDA #$0031
    JSL $@func_09E8E4

  code_09E297:
    COP [81] ( #03, #01 )
    COP [89]
    BRA code_09E297

  code_09E29F:
    COP [81] ( #03, #02 )
    COP [89]
    BRA code_09E29F

  code_09E2A7:
    COP [80] ( #03 )
    COP [89]
    BRA code_09E2A7

  code_09E2AE:
    COP [81] ( #04, #12 )
    COP [89]
    BRA code_09E2AE

  code_09E2B6:
    COP [82] ( #04, #01 )
    COP [89]
    BRA code_09E2B6

  code_09E2BE:
    COP [80] ( #05 )
    COP [89]
    BRA code_09E2BE

  code_09E2C5:
    COP [82] ( #05, #02 )
    COP [89]
    BRA code_09E2C5

  code_09E2CD:
    COP [80] ( #06 )
    COP [89]
    BRA code_09E2CD

  code_09E2D4:
    COP [81] ( #07, #11 )
    COP [89]
    BRA code_09E2D4

  code_09E2DC:
    LDA #$0031
    JSL $@func_09E8E4

  code_09E2E2:
    COP [81] ( #07, #01 )
    COP [89]
    BRA code_09E2E2

  code_09E2EA:
    COP [80] ( #08 )
    COP [89]
    BRA code_09E2EA

  code_09E2F1:
    COP [81] ( #08, #11 )
    COP [89]
    BRA code_09E2F1

  code_09E2F9:
    LDA #$0035
    JSL $@func_09E8E4

  code_09E2FF:
    COP [81] ( #08, #02 )
    COP [89]
    BRA code_09E2FF

  code_09E307:
    COP [80] ( #09 )
    COP [89]
    BRA code_09E307

  code_09E30E:
    COP [80] ( #11 )
    COP [89]

  code_09E313:
    COP [80] ( #03 )
    COP [89]
    BRA code_09E313
}

---------------------------------------------

e_actor_09E14B {
    LDA $00E4
    BPL code_09E151
    RTL 
}

code_09E151 {
    COP [69] ( #$0F00 )
    COP [6A] ( &code_09E291 )
    COP [69] ( #$0F78 )
    COP [6A] ( &code_09E2A7 )
    COP [69] ( #$1068 )
    COP [6A] ( &code_09E30E )
    COP [69] ( #$1168 )
    COP [6A] ( &code_09E297 )
    COP [69] ( #$118C )
    COP [6A] ( &code_09E2D4 )
    COP [69] ( #$11A4 )
    COP [6A] ( &code_09E2CD )
    COP [69] ( #$1774 )
    COP [6A] ( &code_09E28A )
    COP [69] ( #$1968 )
    COP [6A] ( &code_09E2EA )
    COP [69] ( #$1E78 )
    COP [6A] ( &code_09E2F1 )
    COP [69] ( #$1F70 )
    COP [6A] ( &code_09E279 )
    COP [69] ( #$2F58 )
    COP [6A] ( &code_09E2DC )
    COP [69] ( #$2FD0 )
    COP [6A] ( &code_09E2A7 )
    COP [69] ( #$3066 )
    COP [6A] ( &code_09E2E2 )
    COP [69] ( #$3096 )
    COP [6A] ( &code_09E283 )
    COP [69] ( #$3138 )
    COP [6A] ( &code_09E307 )
    COP [69] ( #$35E8 )
    COP [6A] ( &code_09E2B6 )
    COP [69] ( #$35F8 )
    COP [6A] ( &code_09E28A )
    COP [69] ( #$3A24 )
    COP [6A] ( &code_09E2C5 )
    COP [69] ( #$3A34 )
    COP [6A] ( &code_09E28A )
    COP [69] ( #$3CB4 )
    COP [6A] ( &code_09E2BE )
    COP [69] ( #$3D68 )
    COP [6A] ( &code_09E2E2 )
    COP [69] ( #$3D80 )
    COP [6A] ( &code_09E2A7 )
    COP [69] ( #$4164 )
    COP [6A] ( &code_09E29F )
    COP [69] ( #$417C )
    COP [6A] ( &code_09E2A7 )
    COP [69] ( #$46C8 )
    COP [6A] ( &code_09E297 )
    COP [69] ( #$4748 )
    COP [6A] ( &code_09E279 )
    COP [69] ( #$48AC )
    COP [6A] ( &code_09E2F9 )
    COP [69] ( #$4920 )
    COP [6A] ( &code_09E28A )
    COP [69] ( #$4A4C )
    COP [6A] ( &code_09E2CD )
    COP [69] ( #$4D1C )
    COP [6A] ( &code_09E2EA )
    COP [69] ( #$6C0C )
    COP [6A] ( &code_09E2CD )
    COP [69] ( #$6D1A )
    COP [6A] ( &code_09E28A )
    COP [69] ( #$6D38 )
    COP [6A] ( &code_09E27C )
    COP [69] ( #$6E64 )
    COP [6A] ( &code_09E2AE )
    COP [69] ( #$6E74 )
    COP [6A] ( &code_09E27C )
    COP [C1]
    RTL 
}