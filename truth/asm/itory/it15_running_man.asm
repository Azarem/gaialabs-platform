

---------------------------------------------

h_it15_running_man [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_it15_running_man {
    COP [0B]
    COP [C0] ( &code_04DE2D )
    COP [C1]
    RTL 
}

code_04DE2D {
    COP [BF] ( &widestring_04DE32 )
    RTL 
}

widestring_04DE32 `[DEF]Try [LU2:97]down that[N]hill, and keep running.[N]You'll be surprised.[END]`