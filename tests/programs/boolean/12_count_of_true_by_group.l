# Counting true values per group.
# Expect: rows B = [("a", 1), ("b", 2)]
V(g: "a", x: 1);
V(g: "a", x: 5);
V(g: "b", x: 6);
V(g: "b", x: 7);
@OrderBy(B, "g");
B(g:, n? += (if x > 4 then 1 else 0)) distinct :- V(g:, x:);
