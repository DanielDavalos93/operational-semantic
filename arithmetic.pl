natural(zero).
natural(succ(N)) :- natural(N).

% Evaluation of numbers
eval(zero,0,0).
eval(succ(N),N1,N1) :- eval(N,N2,N2), N1 is N2+1.

% Evaluation of sums
eval(add(A0,A1),S,N) :- eval(A0,S0,N0), eval(A1,S1,N1), 
    N is N0+N1,S is S0+S1.

eval(subt(A0,A1),S,N) :- eval(A0,S0,N0), eval(A1,S1,N1), 
    (N0 > N1 -> N is N0-N1; 
      N is 0), S is S0+S1.

eval(prod(A0,A1),S,N) :- eval(A0,S0,N0), eval(A1,S1,N1),
    N is N0*N1, S is S0+S1.
