?INCLUDE 'func_09E8E4'


---------------------------------------------

h_sF7_actor_09DFF8 [
  h_actor < #00, #00, #A5 >   ;00
]

---------------------------------------------

e_sF7_actor_09DFF8 {
    COP [B6] ( #30 )
    LDA #$0200
    STA $14
    COP [99] ( @e_actor_09DDA7 )
    STZ $0AD4
    COP [8F] ( #00 )
    COP [89]
    COP [C1]
    RTL 

  code_09E013:
    LDA #$2000
    TRB $10
    LDA #$0033
    JSL $@func_09E8E4
    LDA $16
    CLC 
    ADC #$0002
    STA $16

  code_09E026:
    COP [90] ( #0E, #02 )
    COP [89]
    BRA code_09E026

  code_09E02E:
    COP [8F] ( #0E )
    COP [89]
    BRA code_09E02E

  code_09E035:
    COP [8F] ( #00 )
    COP [89]
    BRA code_09E035

  code_09E03C:
    COP [8F] ( #01 )
    COP [89]
    BRA code_09E03C

  code_09E043:
    COP [8F] ( #02 )
    COP [89]
    BRA code_09E043

  code_09E04A:
    COP [8F] ( #03 )
    COP [89]
    BRA code_09E04A

  code_09E051:
    COP [8F] ( #08 )
    COP [89]
    BRA code_09E051

  code_09E058:
    COP [8F] ( #09 )
    COP [89]
    BRA code_09E058

  code_09E05F:
    COP [8F] ( #0A )
    COP [89]
    BRA code_09E05F

  code_09E066:
    COP [8F] ( #0B )
    COP [89]
    BRA code_09E066

  code_09E06D:
    COP [8F] ( #0C )
    COP [89]
    BRA code_09E06D

  code_09E074:
    COP [8F] ( #0D )
    COP [89]
    BRA code_09E074

  code_09E07B:
    COP [8F] ( #11 )
    COP [89]
    BRA code_09E07B

  code_09E082:
    COP [8F] ( #12 )
    COP [89]
    BRA code_09E082

  code_09E089:
    COP [8F] ( #18 )
    COP [89]
    BRA code_09E089

  code_09E090:
    COP [8F] ( #19 )
    COP [89]
    BRA code_09E090

  code_09E097:
    COP [8F] ( #1C )
    COP [89]
    BRA code_09E097

  code_09E09E:
    COP [8F] ( #26 )
    COP [89]
    BRA code_09E09E

  code_09E0A5:
    COP [8F] ( #27 )
    COP [89]
    BRA code_09E0A5

  code_09E0AC:
    COP [8F] ( #2C )
    COP [89]
    BRA code_09E0AC

  code_09E0B3:
    COP [8F] ( #32 )
    COP [89]
    BRA code_09E0B3

  code_09E0BA:
    COP [8F] ( #36 )
    COP [89]
    BRA code_09E0BA

  code_09E0C1:
    COP [8F] ( #38 )
    COP [89]
    BRA code_09E0C1

  code_09E0C8:
    COP [8F] ( #3A )
    COP [89]
    BRA code_09E0C8

  code_09E0CF:
    COP [8F] ( #3C )
    COP [89]
    BRA code_09E0CF

  code_09E0D6:
    COP [8F] ( #44 )
    COP [89]
    BRA code_09E0D6

  code_09E0DD:
    COP [8E] ( #04 )

  code_09E0E0:
    COP [80] ( #02 )
    COP [89]
    BRA code_09E0E0

  code_09E0E7:
    COP [80] ( #06 )
    COP [89]
    BRA code_09E0E7

  code_09E0EE:
    COP [8E] ( #04 )

  code_09E0F1:
    COP [80] ( #0C )
    COP [89]
    BRA code_09E0F1

  code_09E0F8:
    COP [80] ( #0D )
    COP [89]
    BRA code_09E0F8

  code_09E0FF:
    COP [80] ( #0E )
    COP [89]
    BRA code_09E0FF

  code_09E106:
    COP [8E] ( #04 )

  code_09E109:
    COP [80] ( #1A )
    COP [89]
    BRA code_09E109

  code_09E110:
    COP [80] ( #1C )
    COP [89]
    BRA code_09E110

  code_09E117:
    COP [80] ( #1D )
    COP [89]
    BRA code_09E117

  code_09E11E:
    COP [80] ( #1E )
    COP [89]
    BRA code_09E11E

  code_09E125:
    COP [8E] ( #04 )

  code_09E128:
    COP [80] ( #1F )
    COP [89]
    BRA code_09E128

  code_09E12F:
    COP [80] ( #23 )
    COP [89]
    BRA code_09E12F

  code_09E136:
    COP [80] ( #24 )
    COP [89]
    BRA code_09E136

  code_09E13D:
    COP [80] ( #25 )
    COP [89]
    BRA code_09E13D

  code_09E144:
    COP [80] ( #26 )
    COP [89]
    BRA code_09E144
}

---------------------------------------------

e_actor_09DDA7 {
    LDA $00E4
    BPL code_09DDAD
    RTL 
}

code_09DDAD {
    COP [69] ( #$012C )
    COP [6A] ( &code_09E013 )
    COP [69] ( #$01CC )
    COP [6A] ( &code_09E02E )
    COP [69] ( #$0CA8 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$0E10 )
    COP [6A] ( &code_09E058 )
    COP [69] ( #$0EB8 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$0F78 )
    COP [6A] ( &code_09E043 )
    COP [69] ( #$1168 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$1774 )
    COP [6A] ( &code_09E043 )
    COP [69] ( #$1968 )
    COP [6A] ( &code_09E02E )
    COP [69] ( #$1968 )
    COP [6A] ( &code_09E02E )
    COP [69] ( #$2138 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$2390 )
    COP [6A] ( &code_09E0DD )
    COP [69] ( #$23B0 )
    COP [6A] ( &code_09E0E7 )
    COP [69] ( #$23CC )
    COP [6A] ( &code_09E0C1 )
    COP [69] ( #$23EE )
    COP [6A] ( &code_09E0CF )
    COP [69] ( #$244E )
    COP [6A] ( &code_09E0BA )
    COP [69] ( #$245F )
    COP [6A] ( &code_09E0D6 )
    COP [69] ( #$2488 )
    COP [6A] ( &code_09E0C8 )
    COP [69] ( #$24C8 )
    COP [6A] ( &code_09E051 )
    COP [69] ( #$2540 )
    COP [6A] ( &code_09E06D )
    COP [69] ( #$2608 )
    COP [6A] ( &code_09E0EE )
    COP [69] ( #$2618 )
    COP [6A] ( &code_09E0F8 )
    COP [69] ( #$2658 )
    COP [6A] ( &code_09E0FF )
    COP [69] ( #$2668 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$26C8 )
    COP [6A] ( &code_09E0B3 )
    COP [69] ( #$2740 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$2770 )
    COP [6A] ( &code_09E106 )
    COP [69] ( #$2790 )
    COP [6A] ( &code_09E12F )
    COP [69] ( #$27AE )
    COP [6A] ( &code_09E136 )
    COP [69] ( #$27C7 )
    COP [6A] ( &code_09E13D )
    COP [69] ( #$27DB )
    COP [6A] ( &code_09E144 )
    COP [69] ( #$27EA )
    COP [6A] ( &code_09E12F )
    COP [69] ( #$27F6 )
    COP [6A] ( &code_09E136 )
    COP [69] ( #$2802 )
    COP [6A] ( &code_09E13D )
    COP [69] ( #$280B )
    COP [6A] ( &code_09E144 )
    COP [69] ( #$2814 )
    COP [6A] ( &code_09E110 )
    COP [69] ( #$282C )
    COP [6A] ( &code_09E117 )
    COP [69] ( #$287C )
    COP [6A] ( &code_09E11E )
    COP [69] ( #$28EC )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$291C )
    COP [6A] ( &code_09E09E )
    COP [69] ( #$293C )
    COP [6A] ( &code_09E0AC )
    COP [69] ( #$29CC )
    COP [6A] ( &code_09E0A5 )
    COP [69] ( #$29EC )
    COP [6A] ( &code_09E07B )
    COP [69] ( #$2A4C )
    COP [6A] ( &code_09E074 )
    COP [69] ( #$2AB0 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$2AF8 )
    COP [6A] ( &code_09E051 )
    COP [69] ( #$2B10 )
    COP [6A] ( &code_09E125 )
    COP [69] ( #$2B88 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$2C00 )
    COP [6A] ( &code_09E043 )
    COP [69] ( #$2CFA )
    COP [6A] ( &code_09E082 )
    COP [69] ( #$2DBA )
    COP [6A] ( &code_09E089 )
    COP [69] ( #$2DDA )
    COP [6A] ( &code_09E090 )
    COP [69] ( #$2E52 )
    COP [6A] ( &code_09E097 )
    COP [69] ( #$2E72 )
    COP [6A] ( &code_09E035 )
    COP [69] ( #$2F6C )
    COP [6A] ( &code_09E043 )
    COP [69] ( #$3066 )
    COP [6A] ( &code_09E03C )
    COP [69] ( #$3138 )
    COP [6A] ( &code_09E07B )
    COP [69] ( #$3634 )
    COP [6A] ( &code_09E043 )
    COP [69] ( #$3840 )
    COP [6A] ( &code_09E035 )
    COP [69] ( #$3A34 )
    COP [6A] ( &code_09E04A )
    COP [69] ( #$3CB4 )
    COP [6A] ( &code_09E058 )
    COP [69] ( #$3D68 )
    COP [6A] ( &code_09E04A )
    COP [69] ( #$4164 )
    COP [6A] ( &code_09E066 )
    COP [69] ( #$417C )
    COP [6A] ( &code_09E04A )
    COP [69] ( #$42CC )
    COP [6A] ( &code_09E125 )
    COP [69] ( #$43F8 )
    COP [6A] ( &code_09E04A )
    COP [69] ( #$46C8 )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$4830 )
    COP [6A] ( &code_09E04A )
    COP [69] ( #$4A4C )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$4D1C )
    COP [6A] ( &code_09E02E )
    COP [69] ( #$6C0C )
    COP [6A] ( &code_09E05F )
    COP [69] ( #$6D1A )
    COP [6A] ( &code_09E043 )
    COP [69] ( #$6D38 )
    COP [6A] ( &code_09E035 )
    COP [C1]
    RTL 
}