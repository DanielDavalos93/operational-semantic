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
pair(lam(f,lam(s,lam(b, app(b,app(f,s)))))).
fst(lam(p,app(p,T))) :- tru(T).
snd(lam(p,app(p,F))) :- fls(F).

% Church numerals


% tests
% and tru fls -> fls
test1(R) :- and(A), tru(T), fls(F), beta*(app(app(A, T), F), _, R),!. 
% R = lam(t, lam(f,f)).

% or tru fls -> tru
test2(R) :- or(O), tru(T), fls(F), beta*(app(app(O,T), F), _, R),!.
% R = lam(t, lam(f, t)).

% fst (pair m n) -> m 
test3(L,R) :- pair(P), fst(X), beta*(app(X, app(app(P, m), n)), L, R).



