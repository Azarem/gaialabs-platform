
---------------------------------------------

h_ec0A_edwina [
  h_actor < #2B, #00, #18 >   ;00
]

---------------------------------------------

e_ec0A_edwina {
    LDA #$0200
    TSB $12
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04C588 )
    COP [D2] ( #0B, #01 )
    COP [CC] ( #0C )
    COP [C1]
    RTL 
}

code_04C588 {
    COP [BF] ( &widestring_04C58D )
    RTL 
}

widestring_04C58D `[DEF][TPL:3]Queen Edwina:[N]The [LU1:27]sent you the[N]letter. Talk to him.[PAL:0][END]`