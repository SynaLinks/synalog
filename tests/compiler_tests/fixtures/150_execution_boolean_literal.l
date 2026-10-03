# Test: Boolean literals. (from tests/programs/execution/67_boolean_literal.l)

F(x: 1, ok: true);
F(x: 2, ok: false);
B(x:) :- F(x:, ok: true);
