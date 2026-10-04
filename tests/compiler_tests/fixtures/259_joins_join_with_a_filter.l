# Test: A join restricted by a comparison. (from tests/programs/joins/02_join_with_a_filter.l)

A(id:) :- id in [1, 2];
B(id: 1, v: "a");
B(id: 2, v: "b");
J(id:, v:) :- A(id:), B(id:, v:), id > 1;
