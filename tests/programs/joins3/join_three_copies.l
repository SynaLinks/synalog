# A predicate joined with itself three times.
# Expect: rows Q = [(3,)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
N(n: 1);
N(n: 2);
N(n: 3);
Q(k? += 1) distinct :- N(n: a), N(n: b), N(n: c), a + b == c;
