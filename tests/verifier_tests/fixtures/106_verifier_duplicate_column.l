# Verifier Test: The same column twice in a head.
# Expected Error: ArityError.duplicateColumn
#
# (from tests/programs/verifier/26_duplicate_column.l)

V(x:, x:) :- x in [1];
