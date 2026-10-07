# A predicate name holds no dollar.
# Expect: error Could not parse
A${x}(y: 1);
Q(y:) :- A${x}(y:);
