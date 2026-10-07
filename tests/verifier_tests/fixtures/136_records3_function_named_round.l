# Verifier Test: A function may not take a built-in function's name.
# Expected Error: ReservedError.reservedPredicate
#
# (from tests/programs/records3/function_named_round.l)

Round(x) = Floor(x + 0.5);
Q(v: Round(2.5));
