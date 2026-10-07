# Verifier Test: Refused: builtin function name.
# Expected Error: ReservedError.reservedPredicate
#
# (from tests/programs/verifier2/error_builtin_function_name.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Upper(s) = s;
Q(v: Upper(s)) :- N(s:);
