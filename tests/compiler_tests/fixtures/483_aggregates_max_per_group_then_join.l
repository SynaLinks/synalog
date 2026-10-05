# Test: The rows that hold their group's maximum. (from tests/programs/aggregates/20_max_per_group_then_join.l)

V(g: "a", n: "p", x: 1);
V(g: "a", n: "q", x: 5);
V(g: "b", n: "r", x: 2);
M(g:, m? Max= x) distinct :- V(g:, x:);
@OrderBy(A, "g");
A(g:, n:) :- V(g:, n:, x:), M(g:, m: x);
