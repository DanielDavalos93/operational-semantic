% Truth values
bexp(true).
bexp(false).  
bexp(not(B)) :- bexp(B).
bexp(eq(A1,A2))   :- aexp(A1), aexp(A2).
bexp(leq(A1,A2))  :- aexp(A1), aexp(A2).
bexp(and(B1,B2))  :- bexp(B1), bexp(B2).
bexp(or(B1,B2))   :- bexp(B1), bexp(B2).

% Evaluate boolean expressions
beval(true,0,true).
beval(false,0,false).

beval(eq(A1,A2),S,T) :- 
    aexp(A1), aexp(A2), aeval(A1,S1,N1), aeval(A2,S2,N2), S is S1+S2, 
    (N1 == N2 -> T = true ; T = false).

beval(leq(A1,A2),S,T) :-
    aexp(A1), aexp(A2), aeval(A1,S1,N1), aeval(A2,S2,N2), S is S1+S2,
    (N1 =< N2 -> T = true ; T = false).

beval(not(B),S,false) :- bexp(B), beval(B,S1,true), S is S1+1, !.
beval(not(B),S,true) :- bexp(B), beval(B,S1,false), S is S1+1, !.

beval(and(B1,B2),S,T) :- bexp(B1), bexp(B2), 
    beval(B1,S1,T1), beval(B2,S2,T2), S is S1+S2,
    (T1 == true, T2 == true -> T = true; 
      T = false).

beval(or(B1,B2),S,T) :- bexp(B1), bexp(B2), 
    beval(B1,S1,T1), beval(B2,S2,T2), S is S1+S2,
    (T1 == false, T2 == false -> T = false; 
      T = true).
