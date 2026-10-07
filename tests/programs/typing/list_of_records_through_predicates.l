# A list of records collected, passed on and unnested.
# Expect: rows Q = [("a", 1), ("b", 2)]
V(n: "a", v: 1);
V(n: "b", v: 2);
L(l? List= {n:, v:}) distinct :- V(n:, v:);
M(l:) :- L(l:);
@OrderBy(Q, "n");
Q(n: e.n, v: e.v) :- M(l:), e in l;
