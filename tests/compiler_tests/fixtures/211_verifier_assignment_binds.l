# Test: == binds a variable from bound ones. (from tests/programs/verifier/33_assignment_binds.l)

@OrderBy(V, "x");
V(x:, y:) :- x in [1, 2], y == x * 2;
