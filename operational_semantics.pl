:- module(operational_semantics,
  [aexp/1, aeval/3, bexp/1, beval/3, uno/1, dos/1, tres/1, cuatro/1, cinco/1,
  seis/1, siete/1, ocho/1, nueve/1, diez/1, 
  lexp/1, len/2, fv/2, subst/3, tru/1, fls/1, ite/1, and/1, or/1,
  s/2, c/2, %plus/1, times/1,
  value/1, beta_reduction/2, beta/3,
  test1/1, test2/1, test3/2, test4/1]).
:- ['arithmetic.pl','boolean.pl','test.pl', 'lambda.pl'].

