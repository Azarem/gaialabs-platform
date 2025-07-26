
---------------------------------------------

h_dc30_kara [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_dc30_kara {
    COP [D0] ( #56, #00, &code_05AAB0 )
    COP [C0] ( &code_05AAB2 )
    COP [0B]
    COP [C1]
    RTL 
}

code_05AAB0 {
    COP [E0]
}

code_05AAB2 {
    COP [BF] ( &widestring_05AADD )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0404
    STA $064A
    COP [65] ( #$0254, #$0354, #00, #09 )
    COP [26] ( #32, #$0130, #$0350, #00, #$4500 )
    COP [C1]
    RTL 
}

widestring_05AADD `[DEF][TPL:1][LU1:25]This dog's [N]name is Turbo. [N]Isn't he cute? [FIN][LU1:63]let's go. [LU1:30][N]we'll see Lilly, Lance, [N]and Erik. [FIN][TPL:6]So [LU2:AB][LU2:C1]to [N]Freejia....[PAL:0][END]`