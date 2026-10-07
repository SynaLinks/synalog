# A disjunction of join conditions.
# Expect: rows Q = [(1,), (2,), (3,)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
@OrderBy(Q, "id");
Q(id:) distinct :- E(id:, g:), F(g: h), (g == h | id == 3);
