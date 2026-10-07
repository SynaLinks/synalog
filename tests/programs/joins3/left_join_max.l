# The largest value per group, null for none.
# Expect: rows Q = [("a", 20), ("b", None), ("c", None)]
E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
G(g: "a");
G(g: "b");
G(g: "c");
@OrderBy(Q, "g");
Q(g:, m: (combine Max= v :- E(g:, v:))) :- G(g:);
