# A search over a number and a text column.
# Expect: search S 7 = [(7, "x"), (8, "a7")]
V(n: 7, t: "x");
V(n: 8, t: "a7");
V(n: 9, t: "b");
@OrderBy(S, "n");
S(n:, t:) :- V(n:, t:);
