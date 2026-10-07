# Test: Nothing is in an empty list. (from tests/programs/lists4/in_empty_literal.l)

V(x: 1);
Q(x:) :- V(x:), x in [];
