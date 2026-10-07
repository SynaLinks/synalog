# Test: A null value passes through a join on another column. (from tests/programs/joins3/null_value_in_join_output.l)

E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
Q(id:, v:, w:) :- E(id:, g: "b", v:), F(g: "b", w:);
