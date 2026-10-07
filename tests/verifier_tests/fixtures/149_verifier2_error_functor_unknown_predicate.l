# Verifier Test: Refused: functor unknown predicate.
# Expected Error: FunctorError.invalidFunctor
#
# (from tests/programs/verifier2/error_functor_unknown_predicate.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Src(n: 0);
Tot(t? += n) distinct :- Src(n:);
R := Tot(Src: Nope);
Q(t:) :- R(t:);
