# Verifier Test: Refused: functor unused argument.
# Expected Error: FunctorError.invalidFunctor
#
# (from tests/programs/verifier2/error_functor_unused_argument.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Src(n: 0);
Tot(t? += n) distinct :- Src(n:);
R := Tot(Other: N);
Q(t:) :- R(t:);
