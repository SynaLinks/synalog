# Keys of text and number are compared as written.
# Expect: rows Q = [("x",)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
A(k: "1", t: "x");
B(k: "1");
B(k: "01");
Q(t:) distinct :- A(k:, t:), B(k:);
