# Verifier Test: Refused: undefined predicate.
# Expected Error: UndefinedError.undefinedPredicate
#
# (from tests/programs/verifier2/error_undefined_predicate.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- Nn(n:);
