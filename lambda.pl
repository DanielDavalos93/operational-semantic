% Untiped lambda calculus Lambda Terms 
lexp(X) :- atom(X). 
lexp(app(M,N)) :- lexp(M), lexp(N). 
lexp(lam(X,M)) :- atom(X), lexp(M). 

% Length (or size): is the total number of occurrences of atoms in M 
len(X,1) :- atom(X).
len(app(M,N), L) :- lexp(M), lexp(N), len(M,L1), len(N,L2), L is L1 + L2.
len(lam(_,M), L) :- lexp(M), len(M,L1), L is 1 + L1.

% Free Variables
fv(X,[X]) :- atom(X).
fv(app(M,N), FV) :- lexp(M), lexp(N), fv(M,FVM), fv(N,FVN), append(FVM, FVN, FV).
fv(lam(X,M), FV) :- atom(X), lexp(M), fv(M,FVM), subtract(FVM,[X],FV).

% Substitution
% {x -> s}M = res as subst((x,s),M,res)
subst((X,S), X, S) :- atom(X), lexp(S), !.
subst((X,_),Y, Y) :- atom(X), atom(Y), Y \= X, !. 
subst((X,_), lam(X,M), lam(X,M)) :- atom(X), lexp(M), !.
subst((X,S),lam(Y,M), lam(Y,SM)) :- atom(X), atom(Y), lexp(S), lexp(M),
    fv(S,FV), \+ member(Y,FV), 
    Y \= X, subst((X,S),M,SM), !.
subst((X,S),app(M,N), app(SM, SN)) :- atom(X), lexp(M), lexp(N),
    subst((X,S),M,SM), subst((X,S),N,SN).

% values
value(X) :- atom(X).
value(lam(X,M)) :- atom(X), lexp(M), !.
%value(app(M,N)) :- value(M), value(N), !.
% beta reduction
beta_reduction(app(lam(X,M), N), Reduct) :- 
    atom(X), lexp(M), lexp(N), subst((X,N),M, Reduct).
beta_reduction(app(M1,V), app(M2,V)) :- lexp(M1), lexp(V),
    beta_reduction(M1,M2), !.
beta_reduction(app(M,N1), app(M,N2)) :- lexp(M), lexp(N1), 
    beta_reduction(N1, N2), !.
beta_reduction(M,M) :- value(M), !.


beta(M, [], M) :- value(M).
beta(M1, L, M2) :- 
  beta_reduction(M1,H), append([H], T, L), beta(H, T, M2), !.


