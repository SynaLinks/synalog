# Verifier Test: an unknown column inside a negation
# Expected Error: ArityError.unknownColumn
#
# Edge has columns a and b, not nope.

Node(x:) :- x in [1, 2];
Edge(a: 1, b: 2);

# ERROR: Edge has no column nope
Sink(x:) :- Node(x:), ~Edge(nope: x);
