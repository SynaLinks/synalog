# Verifier Test: the same column twice in a head
# Expected Error: ArityError.duplicateColumn
#
# V(x:, x:) would silently produce one column.

# ERROR: x appears twice
V(x:, x:) :- x in [1];
