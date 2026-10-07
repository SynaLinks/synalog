# Test: Counting true values per group. (from tests/programs/boolean/12_count_of_true_by_group.l)

V(g: "a", x: 1);
V(g: "a", x: 5);
V(g: "b", x: 6);
V(g: "b", x: 7);
@OrderBy(B, "g");
B(g:, n? += (if x > 4 then 1 else 0)) distinct :- V(g:, x:);
