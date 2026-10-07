# An ordered list of records, its first element read two predicates later.
# Expect: rows Q = [("b",)]
V(k: 2, n: "a");
V(k: 1, n: "b");
L(l? Array= k -> {n:}) distinct :- V(k:, n:);
M(l:) :- L(l:);
Q(n: Element(l, 0).n) :- M(l:);
