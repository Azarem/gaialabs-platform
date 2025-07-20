?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'


---------------------------------------------

h_daC9_businessman [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_daC9_businessman {
    COP [C0] ( &code_08A919 )
    LDA #$0002
    STA $7F0026, X
    JSL $@func_00C718

  code_08A90D:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_08A90D
}

code_08A919 {
    COP [BF] ( &widestring_08A91E )
    RTL 
}

widestring_08A91E `[DEF][LU1:67][LU1:79]all the way[N]to [LU1:D6][LU1:E2]to[N]buy labor...[FIN]I [LU1:78][LU2:84]up my mind[N]if I [LU1:CA]do business[N][LU1:F0][LU2:C7]You [LU1:78][N]put a price on people...[END]`