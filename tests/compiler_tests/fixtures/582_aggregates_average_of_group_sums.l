# Test: The average of per-group sums. (from tests/programs/aggregates/23_average_of_group_sums.l)

V(g: "a", x: 1);
V(g: "a", x: 3);
V(g: "b", x: 6);
S(g:, t? += x) distinct :- V(g:, x:);
A(a? Avg= t) distinct :- S(t:);
