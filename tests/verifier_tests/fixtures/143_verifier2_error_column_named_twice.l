# Verifier Test: Refused: column named twice.
# Expected Error: ArityError.duplicateColumn
#
# (from tests/programs/verifier2/error_column_named_twice.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:, n: 2) :- N(n:);
