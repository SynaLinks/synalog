# A misspelt predicate inside a negation.
# Expect: error Undefined predicate 'Edeg'
Node(x:) :- x in [1, 2];
Edge(a: 1, b: 2);
Sink(x:) :- Node(x:), ~Edeg(a: x);
