# Verifier Test: A function may not take a built-in function's name.
# Expected Error: ReservedError.reservedPredicate
#
# (from tests/programs/records3/function_named_size.l)

Size(l) = 0;
Q(v: Size([1]));
