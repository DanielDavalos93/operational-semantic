% Terms 
%:- dynamic succ/2.
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
