# Verifier Test: Refused: recursion without base.
# Expected Error: RecursionError.unboundedRecursion
#
# (from tests/programs/verifier2/error_recursion_without_base.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
R(x: b) distinct :- R(x: a), E(a:, b:);
Q(x:) :- R(x:);
