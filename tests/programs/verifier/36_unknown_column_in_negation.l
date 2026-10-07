# A column the predicate does not have, inside a negation.
# Expect: error Unknown column 'nope' for predicate 'Edge'
Node(x:) :- x in [1, 2];
Edge(a: 1, b: 2);
Sink(x:) :- Node(x:), ~Edge(nope: x);
