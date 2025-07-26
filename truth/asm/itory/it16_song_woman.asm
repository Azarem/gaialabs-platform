
---------------------------------------------

h_it16_song_woman [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_it16_song_woman {
    COP [C0] ( &code_04DF91 )
    COP [0B]
    COP [C1]
    RTL 
}

code_04DF91 {
    COP [BF] ( &widestring_04DF96 )
    RTL 
}

widestring_04DF96 `[DEF]The Incas who lived here[N][LU1:F2]a tribe without[N]a [LU2:C3]language.[FIN]Their legends are[N][LU1:AE]in song.[FIN][LU1:12]in seemingly[N]meaningless melodies,[N][LU1:D9]is a message.[END]`