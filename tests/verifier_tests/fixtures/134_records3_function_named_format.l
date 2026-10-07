# Verifier Test: A function may not take a built-in function's name.
# Expected Error: ReservedError.reservedPredicate
#
# (from tests/programs/records3/function_named_format.l)

Format(s) = s;
Q(v: Format("a"));
