# Verifier Test: A function may not take a built-in function's name.
# Expected Error: ReservedError.reservedPredicate
#
# (from tests/programs/records3/function_named_pow.l)

Pow(x) = {sq: x * x};
Q(v: Pow(3).sq);
