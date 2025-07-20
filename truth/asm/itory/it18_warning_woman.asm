

---------------------------------------------

h_it18_warning_woman [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_it18_warning_woman {
    COP [0B]
    COP [C0] ( &code_04DE7C )
    COP [C1]
    RTL 
}

code_04DE7C {
    COP [BF] ( &widestring_04DE81 )
    RTL 
}

widestring_04DE81 `[TPL:A]The [LU2:98]are an ancient[N]tomb. Why [LU1:78]you[N][LU1:AC][LU1:E6]alone?[END]`