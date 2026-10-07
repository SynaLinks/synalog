# Verifier Test: an undefined predicate inside a negation
# Expected Error: UndefinedError.undefinedPredicate
#
# ~Edeg(...) is compiled as a subquery; the typo must still be reported.

Node(x:) :- x in [1, 2];
Edge(a: 1, b: 2);

# ERROR: Edeg is a typo for Edge
Sink(x:) :- Node(x:), ~Edeg(a: x);
