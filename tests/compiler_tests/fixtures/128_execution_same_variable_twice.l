# Test: One variable in two columns requires them equal. (from tests/programs/execution/45_same_variable_twice.l)

Edge(x: 1, y: 2);
Edge(x: 2, y: 2);
Loop(x:) :- Edge(x:, y: x);
