# Test: Counting the groups over a threshold. (from tests/programs/aggregates/24_count_of_groups_above.l)

V(g: "a", x: 5);
V(g: "b", x: 1);
V(g: "c", x: 9);
S(g:, t? += x) distinct :- V(g:, x:);
A(n? += 1) distinct :- S(t:), t > 2;
