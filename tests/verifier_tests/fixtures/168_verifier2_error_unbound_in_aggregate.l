# Verifier Test: Refused: unbound in aggregate.
# Expected Error: SafetyError.unsafeAggregation
#
# (from tests/programs/verifier2/error_unbound_in_aggregate.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(t? += z) distinct :- N(n:);
