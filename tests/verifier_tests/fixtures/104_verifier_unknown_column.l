# Verifier Test: A column the predicate does not have.
# Expected Error: ArityError.unknownColumn
#
# (from tests/programs/verifier/22_unknown_column.l)

Item(x:) :- x in [1, 2];
Total(y:) :- Item(y:);
