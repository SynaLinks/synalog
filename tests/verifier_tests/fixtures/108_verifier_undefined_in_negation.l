# Verifier Test: A misspelt predicate inside a negation.
# Expected Error: UndefinedError.undefinedPredicate
#
# (from tests/programs/verifier/28_undefined_in_negation.l)

Node(x:) :- x in [1, 2];
Edge(a: 1, b: 2);
Sink(x:) :- Node(x:), ~Edeg(a: x);
