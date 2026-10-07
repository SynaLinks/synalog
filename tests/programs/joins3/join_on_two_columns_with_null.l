# A null in one of two join columns: no match.
# Expect: rows Q = []
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
A(x: 1, y: null, id: 1);
B(x: 1, y: null);
Q(id:) :- A(x:, y:, id:), B(x:, y:);
