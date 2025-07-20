?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'


---------------------------------------------

h_daC3_man1 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_man1 {
    COP [C0] ( &code_08A814 )
    LDA #$0002
    STA $7F0026, X
    JSL $@func_00C718

  code_08A808:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_08A808
}

code_08A814 {
    COP [BF] ( &widestring_08A819 )
    RTL 
}

widestring_08A819 `[DEF]This is Dao, the desert[N][LU2:BD]Children don't[N][LU1:79]to places [LU1:A5]this[N][LU1:ED]often.[END]`