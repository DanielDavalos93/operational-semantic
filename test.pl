% Terms 
% Arithmetics
uno(suc(zero)).
dos(X) :- uno(Y), X = suc(Y).
tres(X) :- dos(Y), X = suc(Y).
cuatro(X) :- tres(Y), X = suc(Y).
cinco(X) :- cuatro(Y), X = suc(Y).
seis(X) :- cinco(Y), X = suc(Y).
siete(X) :- seis(Y), X = suc(Y).
ocho(X) :- siete(Y), X = suc(Y).
nueve(X) :- ocho(Y), X = suc(Y).
diez(X) :- nueve(Y), X = suc(Y).

%%% lambda calculo %%%
% Booleans
tru(lam(t, lam(f, t))).
fls(lam(t, lam(f, f))).
ite(lam(l, lam(m, lam(n, app(app(l,m),n))))).
and(lam(b,lam(m, app(app(b,m), lam(t, lam(f,f)))))).
or(lam(b,lam(m, app(app(b, lam(t, lam(f,t))), m)))).

% pairs
pair(lam(f,lam(s,lam(b, app(app(b,f),s))))).
fst(lam(p,app(p,T))) :- tru(T).
snd(lam(p,app(p,F))) :- fls(F).

% Church numerals
s(0,z).
s(N, app(s, S)) :- s(N1, S), N is N1+1. 

c(N, lam(s, lam(z, S))) :- s(N, S), !.

% Arithmetic 
%plus(lam(m,lam(n, lam(s, lam(z, app(m,app(s, app(app(n, s), z)))))))).
%times(lam(m, lam(n, app(app(m, app(Plus, n), C0))))) :- plus(Plus), c(0,C0).


%%% tests %%%
%1) and tru fls -> fls
test1(R) :- and(A), tru(T), fls(F), beta(app(app(A, T), F), _, R),!. 
% R = lam(t, lam(f,f)).

%2) or tru fls -> tru
test2(R) :- or(O), tru(T), fls(F), beta(app(app(O,T), F), _, R),!.
% R = lam(t, lam(f, t)).

%3) fst (pair m n) ->* m 
test3(L,R) :- pair(P), fst(X), beta(app(X, app(app(P, m), n)), L, R).

%4) (plus c2 c1) ->* c3
%test4(R) :- plus(Plus), c(1,C1), c(2,C2), beta(app(app(Plus, C2),C1), _, R).
