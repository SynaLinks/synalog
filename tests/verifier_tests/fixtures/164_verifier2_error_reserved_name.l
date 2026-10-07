# Verifier Test: Refused: reserved name.
# Expected Error: ReservedError.reservedPredicate
#
# (from tests/programs/verifier2/error_reserved_name.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Num(x: 1);
Q(x:) :- Num(x:);
