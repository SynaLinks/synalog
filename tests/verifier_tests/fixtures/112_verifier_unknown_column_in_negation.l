# Verifier Test: A column the predicate does not have, inside a negation.
# Expected Error: ArityError.unknownColumn
#
# (from tests/programs/verifier/36_unknown_column_in_negation.l)

Node(x:) :- x in [1, 2];
Edge(a: 1, b: 2);
Sink(x:) :- Node(x:), ~Edge(nope: x);
