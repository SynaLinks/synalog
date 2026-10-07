# Test: Pairs of rows that agree on one column and differ on another. (from tests/programs/joins/20_self_join_on_two_columns.l)

V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
J(g:, x1:, x2:) :- V(g:, x: x1), V(g:, x: x2), x1 < x2;
