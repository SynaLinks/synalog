# A null value passes through a join on another column.
# Expect: rows Q = [(3, None, 2)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
Q(id:, v:, w:) :- E(id:, g: "b", v:), F(g: "b", w:);
