
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

---------------------------------------------

h_sc04_poverty [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_sc04_poverty {
    LDA #$0012
    STA $7F0026, X
    JSL $@func_00C718
    COP [C0] ( &code_048F98 )

  code_048F8C:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_048F8C
}

code_048F98 {
    COP [BF] ( &widestring_048F9D )
    RTL 
}

widestring_048F9D `[DEF][LU1:1D]the [LU1:A7]things[N]in [LU1:B0][LU1:D7][LU2:84]you[N]rich or poor.[FIN][LU1:63][LU1:99]any good[N]stories?[END]`