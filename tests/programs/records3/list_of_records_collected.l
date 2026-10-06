# Records collected into a list, then unnested again.
# Expect: rows Q = [("x", 2), ("y", 1)]
V(g: "x", n: 1);
V(g: "x", n: 2);
V(g: "y", n: 3);
C(g:, l? List= {n:}) distinct :- V(g:, n:);
@OrderBy(Q, "g");
Q(g:, c? += 1) distinct :- C(g:, l:), e in l, e.n > 0;
