# Rows without a match on two columns.
# Expect: rows Q = [(2,)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
A(x: 1, y: 2, id: 1);
A(x: 1, y: 3, id: 2);
B(x: 1, y: 2);
Q(id:) :- A(x:, y:, id:), ~B(x:, y:);
