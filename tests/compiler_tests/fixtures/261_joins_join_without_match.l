# Test: A join that matches nothing. (from tests/programs/joins/04_join_without_match.l)

A(id: 1);
B(id: 2);
J(id:) :- A(id:), B(id:);
