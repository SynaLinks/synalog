# Rows per group that has a weight.
# Expect: rows Q = [("a", 2), ("b", 1)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
@OrderBy(Q, "g");
Q(g:, n? += 1) distinct :- E(g:), F(g:);
