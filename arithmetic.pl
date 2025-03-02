% Arithmetic expressions
aexp(zero).
aexp(suc(N)) :- aexp(N).
aexp(pred(N)) :- aexp(N).
aexp(add(A1,A2)) :- aexp(A1), aexp(A2).
aexp(subt(A1,A2)) :- aexp(A1), aexp(A2).
aexp(prod(A1,A2)) :- aexp(A1), aexp(A2).

% Evaluation of arithmetic expressions
aeval(zero,0,0).
aeval(suc(N),N1,N1) :- aeval(N,N2,N2), N1 is N2 + 1.

% Evaluation of arithmetic operations
aeval(add(A0,A1),S,N) :- aeval(A0,S0,N0), aeval(A1,S1,N1), 
    N is N0+N1,S is S0+S1.

aeval(subt(A0,A1),S,N) :- aeval(A0,S0,N0), aeval(A1,S1,N1), 
    (N0 > N1 -> N is N0-N1; 
      N is 0), S is S0+S1.

aeval(prod(A0,A1),S,N) :- aeval(A0,S0,N0), aeval(A1,S1,N1),
    N is N0*N1, S is S0+S1.
