
?INCLUDE 'func_06B9F2'
?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

---------------------------------------------

h_wa78_centipede_man [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_centipede_man {
    JSL $@func_06B9F2
    COP [C0] ( &code_0782A4 )
    LDA #$0002
    STA $7F0026, X
    JSL $@func_00C718

  code_078298:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_078298
}

code_0782A4 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_0782AF )
}

code_list_0782AF [
  &code_0782B3   ;00
  &code_0782B8   ;01
]

code_0782B3 {
    COP [BF] ( &widestring_0782BD )
    RTL 
}

code_0782B8 {
    COP [BF] ( &widestring_078371 )
    RTL 
}

widestring_0782BD `[DEF][SFX:10][LU1:32]I [LU1:99][LU1:D7]a[N][LU1:9C]centipede [LU2:54]a[N]Sand Fanger lives in[N]the [LU1:16]Wall of China.[FIN]They say fluid [LU1:8E][LU1:9F][N][LU1:72]can cure [LU2:49][FIN]Chinese medicine has[N][LU1:B6][LU1:C7]things,[N]but drinking an insect's[N]bodily fluids...[END]`

widestring_078371 `[DEF][SFX:10]On full moon nights [LU2:AB][N]play [LU2:2D]Glass, [N]the [LU2:88]dangerous [N]game you can play. [FIN]But [LU1:FF][LU1:D3]young.[N]I [LU1:82][LU1:DA]you'd[N]throw away [LU1:FE]life.[END]`