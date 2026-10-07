# Test: Sums joined to their group's weight: the null group meets no weight. (from tests/programs/joins3/group_join_sum.l)

E(id: 1, g: "a", v: 10);
E(id: 2, g: "a", v: 20);
E(id: 3, g: "b", v: null);
E(id: 4, g: null, v: 5);
F(g: "a", w: 1);
F(g: "b", w: 2);
F(g: null, w: 3);
S(g:, s? += v) distinct :- E(g:, v:);
@OrderBy(Q, "g");
Q(g:, s:, w:) :- S(g:, s:), F(g:, w:);
