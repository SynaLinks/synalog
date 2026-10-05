# Reachable nodes per source, as a set size.
# Expect: rows C = [("a", 2), ("b", 1)]
E(a: "a", b: "b");
E(a: "b", b: "c");
@Recursive(P, 5);
P(s:, t:) distinct :- E(a: s, b: t);
P(s:, t: c) distinct :- P(s:, t:), E(a: t, b: c);
L(s:, l? Set= t) distinct :- P(s:, t:);
@OrderBy(C, "s");
C(s:, n: Size(l)) :- L(s:, l:);
