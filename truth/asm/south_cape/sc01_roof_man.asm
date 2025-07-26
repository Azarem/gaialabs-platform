
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

---------------------------------------------

h_sc01_roof_man [
  h_actor < #0D, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_roof_man {
    LDA #$000A
    STA $7F0026, X
    JSL $@func_00C718
    COP [C0] ( &code_0484B2 )

  code_0484A6:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_0484A6
}

code_0484B2 {
    COP [BF] ( &widestring_0484B7 )
    RTL 
}

widestring_0484B7 `[DEF][LU1:1C]Will. How many[N][LU2:AA][LU1:98]I told you[N]not to [LU1:79]up here...[FIN]You [LU1:98]a habit of[N]jumping down from[N]places. [LU1:63]I guess[N]I [LU1:78][LU2:95]stop you.[END]`