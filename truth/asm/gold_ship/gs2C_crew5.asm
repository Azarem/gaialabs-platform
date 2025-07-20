?INCLUDE 'gs2C_crew4'


---------------------------------------------

h_gs2C_crew5 [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_gs2C_crew5 {
    COP [D0] ( #4E, #00, &code_0583D9 )
    COP [D0] ( #F8, #00, &code_0583D9 )
    COP [BC] ( #20, #00 )
}

code_0583D9 {
    COP [0B]
    COP [C0] ( &code_0583E2 )
    COP [C1]
    RTL 
}

code_0583E2 {
    COP [BF] ( &widestring_0583E7 )
    RTL 
}

widestring_0583E7 [
  `[DEF]Look, look! [N]The [LU1:27]has returned! [FIN]And he's much shorter![END]`   ;00
  `[JMP:&widestring_058394+M]`   ;01
]