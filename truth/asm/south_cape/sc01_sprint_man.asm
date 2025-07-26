
---------------------------------------------

h_sc01_sprint_man [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_sprint_man {
    COP [C0] ( &code_049238 )
    COP [0B]
    COP [C1]
    RTL 
}

code_049238 {
    COP [BF] ( &widestring_04923D )
    RTL 
}

widestring_04923D `[DEF]You [LU1:A9][LU1:A5]a fast[N]runner. To run, push the[N]Control Pad twice.[END]`