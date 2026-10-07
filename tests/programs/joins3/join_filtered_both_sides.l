# Conditions on both sides of a join.
# Expect: rows Q = [(2, 1)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
Q(id:, w:) :- E(id:, g:, v:), F(g:, w:), v > 15, w < 2;
