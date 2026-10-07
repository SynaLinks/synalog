# Test: Weights of groups without rows: none, the null group's included. (from tests/programs/joins3/weights_unused.l)

E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
Used(g:) distinct :- E(g:), g is not null;
Q(w:) :- F(g:, w:), ~Used(g:);
