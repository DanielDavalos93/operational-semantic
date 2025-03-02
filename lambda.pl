% Untiped lambda calculus
% Lambda Terms
lterm(X) :- atom(X).
lterm(app(M,N)) :- lterm(M), lterm(N).
lterm(lam(X,M)) :- atom(X), lterm(M).

% Length: is the total number of occurrences of atoms in M 
len(X,1) :- atom(X).
len(app(M,N), L) :- len(M,L1), len(N,L2), L is L1 + L2.
len(lam(_,M), L) :- len(M,L1), L is 1 + L1.


% Free Variables
fv(X,[X]) :- atom(X).
fv(app(M,N), FV) :- fv(M,FVM), fv(N,FVN), append(FVM, FVN, FV).
fv(lam(X,M), FV) :- atom(X), fv(M,FVM), subtract(FVM,[X],FV).

% Substitution
% {x -> s}M = res as subst((x,s),M,res)
subst((X,S), X, S) :- atom(X), lterm(S).
subst((X,_),Y, Y) :- atom(X), lterm(Y), Y \= X.
subst((X,S),lam(Y,M), lam(Y,SM)) :- atom(X), 
    subst((X,S),M,SM), Y \= X, fv(M,FV), \+ member(Y,FV).
subst((X,S),app(M,N), app(SM, SN)) :- atom(X), lterm(M), lterm(N),
    subst((X,S),M,SM), subst((X,S),N,SN).
