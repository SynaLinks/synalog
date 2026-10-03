# Verifier Test: y appears only inside the negation: refused, as in Datalog; ~Edge(a: x) says it.
# Expected Error: SafetyError.unsafeNegation
#
# (from tests/programs/verifier/27_free_variable_in_negation.l)

Node(x:) :- x in [1, 2, 3];
Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
@OrderBy(Sink, "x");
Sink(x:) :- Node(x:), ~Edge(a: x, b: y);
