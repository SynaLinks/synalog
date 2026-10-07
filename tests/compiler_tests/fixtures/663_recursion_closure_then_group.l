# Test: Reachable nodes per source, as a set size. (from tests/programs/recursion/48_closure_then_group.l)

E(a: "a", b: "b");
E(a: "b", b: "c");
@Recursive(P, 5);
P(s:, t:) distinct :- E(a: s, b: t);
P(s:, t: c) distinct :- P(s:, t:), E(a: t, b: c);
L(s:, l? Set= t) distinct :- P(s:, t:);
@OrderBy(C, "s");
C(s:, n: Size(l)) :- L(s:, l:);
