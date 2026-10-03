# Verifier Test: Arguments are named.
# Expected Error: PositionalError.positionalArguments
#
# (from tests/programs/verifier/11_positional_arguments.l)

Item(x:) :- x in [1, 2];
Total(x:) :- Item(x);
