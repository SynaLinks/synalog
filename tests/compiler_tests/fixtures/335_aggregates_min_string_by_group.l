# Test: The smallest string per group. (from tests/programs/aggregates/06_min_string_by_group.l)

V(g: 1, s: "cat");
V(g: 1, s: "ant");
V(g: 2, s: "bee");
@OrderBy(A, "g");
A(g:, m? Min= s) distinct :- V(g:, s:);
