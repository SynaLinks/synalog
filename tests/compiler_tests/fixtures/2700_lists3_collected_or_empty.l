# Test: A collected list, or an empty one for a group without rows. (from tests/programs/lists3/collected_or_empty.l)

G(g: "a");
G(g: "b");
V(g: "a", x: 1);
V(g: "a", x: 2);
C(g:, l? List= x) distinct :- V(g:, x:);
L(g:, l:) :- C(g:, l:);
L(g:, l: []) :- G(g:), ~C(g:);
@OrderBy(Q, "g");
Q(g:, n: Size(l)) :- L(g:, l:);
